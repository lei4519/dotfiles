# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os
import re
import subprocess
from os import path as fs
from collections import deque

from ranger.api.commands import Command
from ranger.ext.shell_escape import shell_quote


class goto_git_dir(Command):
    """
    goto recent parent .git dir
    """

    def execute(self):
        import subprocess
        s = subprocess.run(['git', 'rev-parse', '--show-toplevel'],
                           stdout=subprocess.PIPE, text=True)

        if s.returncode == 0:
            self.fm.cd(s.stdout.strip())
        else:
            self.fm.notify('Could not find recent .git dir', bad=True)


class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument to select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os
        from ranger.ext.get_executables import get_executables

        if 'fzf' not in get_executables():
            self.fm.notify('Could not find fzf in the PATH.', bad=True)
            return

        fd = None
        if 'fdfind' in get_executables():
            fd = 'fdfind'
        elif 'fd' in get_executables():
            fd = 'fd'

        if fd is not None:
            hidden = ('--hidden' if self.fm.settings.show_hidden else '')
            exclude = "--no-ignore-vcs --exclude '.git' --exclude '*.py[co]' --exclude '__pycache__'"
            only_directories = ('--type directory' if self.quantifier else '')
            fzf_default_command = '{} --follow {} {} {} --color=always'.format(
                fd, hidden, exclude, only_directories
            )
        else:
            hidden = (
                '-false' if self.fm.settings.show_hidden else r"-path '*/\.*' -prune")
            exclude = r"\( -name '\.git' -o -iname '\.*py[co]' -o -fstype 'dev' -o -fstype 'proc' \) -prune"
            only_directories = ('-type d' if self.quantifier else '')
            fzf_default_command = 'find -L . -mindepth 1 {} -o {} -o {} -print | cut -b3-'.format(
                hidden, exclude, only_directories
            )

        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = fzf_default_command
        env['FZF_DEFAULT_OPTS'] = '--height=40% --layout=reverse --ansi --preview="{}"'.format('''
            (
                batcat --color=always {} ||
                bat --color=always {} ||
                cat {} ||
                tree -ahpCL 3 -I '.git' -I '*.py[co]' -I '__pycache__' {}
            ) 2>/dev/null | head -n 100
        ''')

        fzf = self.fm.execute_command('fzf --no-multi', env=env,
                                      universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)


def show_error_in_console(msg, fm):
    fm.notify(msg, bad=True)


def navigate_path(fm, selected):
    if not selected:
        return

    selected = os.path.abspath(selected)
    if os.path.isdir(selected):
        fm.cd(selected)
    elif os.path.isfile(selected):
        fm.select_file(selected)
    else:
        show_error_in_console(f"Neither directory nor file: {selected}", fm)
        return


def select_with_fzf(fzf_cmd, input, fm):
    fm.ui.suspend()
    try:
        # stderr is used to open to attach to /dev/tty
        proc = subprocess.Popen(
            fzf_cmd, stdout=subprocess.PIPE, stdin=subprocess.PIPE, text=True)
        stdout, _ = proc.communicate(input=input)

        # ESC gives 130
        if proc.returncode not in [0, 130]:
            raise Exception(
                f"Bad process exit code: {proc.returncode}, stdout={stdout}")
    finally:
        fm.ui.initialize()
    return stdout.strip()


class dir_history_navigate(Command):
    def execute(self):
        lst = []
        for d in reversed(self.fm.tabs[self.fm.current_tab].history.history):
            lst.append(d.path)

        fm = self.fm
        selected = select_with_fzf(["fzf"], "\n".join(lst), fm)

        navigate_path(fm, selected)


class create_file_or_dir(Command):
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dir_or_file = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        is_file = dir_or_file[-1] != '/'

        dirname = dir_or_file[0:dir_or_file.rfind('/')]

        dir_exist = lexists(dirname)
        if dir_exist and is_file == False:
            self.fm.notify("file/directory exists!", bad=True)
            return

        if dir_exist == False:
            makedirs(dirname)

        if is_file:
            open(dir_or_file, 'w')

        match = re.search('^/|^~[^/]*/', dirname)

        if match:
            self.fm.cd(match.group(0))
            dirname = dirname[match.end(0):]

        for m in re.finditer('[^/]+', dirname):
            s = m.group(0)
            if s == '..' or (s.startswith('.') and not self.fm.settings['show_hidden']):
                self.fm.cd(s)
            else:
                # We force ranger to load content before calling `scout`.
                self.fm.thisdir.load_content(schedule=False)
                self.fm.execute_console('scout -ae ^{}$'.format(s))

