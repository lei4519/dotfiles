const url = ''

const camelize = (k) => k.replace(/_(\w)/g, (_, $1) => $1.toUpperCase())

const { exec } = require('node:child_process');

exec(`curl -sfL "${url}" -b "$(extract-chrome-cookies '${url}' -n Profile\\ 1)"`, (error, stdout, stderr) => {
  if (error) {
    console.error(error);
    return;
  }
  if (stderr) {
    console.error(stderr)
    return
  }

  const data = JSON.parse(stdout)

  const { req_query, req_body_other, res_body } = data.data

  const tsType = `export namespace TODO {\n${resolveQueryType(req_query)}${resolveSchemeType('Params', req_body_other)}${resolveSchemeType('Response', res_body)}}`

  console.log(tsType)
});

const resolveSchemeType = (name, json) => {
  let data

  try {
    data = JSON.parse(json)
  } catch (e) { }

  if (typeof data === 'object' && data !== null && Object.keys(data).length) {
    const resolveType = (data = {}, required = [], depth = 0) => {
      let props = ''
      const isRequired = (k) => required?.includes(k) ? ':' : '?:'
      const indent = ''.padStart(depth * 2, ' ')

      const typeMap = (type) => {
        const map = {
          integer: 'number'
        }
        return map[type] || type || 'any'
      }

      const transformArray = (info) => {
        if (info.type === 'array') {
          if (info.items?.type === 'object') {
            ;[info.type, info.isArr, info.properties, info.required] = [
              'object',
              true,
              info.items.properties,
              info.items.required,
            ]
          } else {
            info.type = `${typeMap(info.items?.type)}[]`
          }
        }
      }

      Object.entries(data).forEach(([key, info]) => {
        transformArray(info)

        if (info.description) {
          props += `${indent}/** ${info.description} */\n`
        }

        let type = ''
        if (info.type === 'object') {
          type = `{\n${resolveType(info.properties, info.required, depth + 1)}${indent}}`
          info.isArr && (type += '[]')
        } else {
          type = typeMap(info.type)
        }
        props += `${indent}${camelize(key)}${isRequired(key)} ${type}\n`
      })
      return props
    }

    return resolveType({ [name]: data }, [], 1).replace(new RegExp(`^(\\s*)${name}.*?{`, 'i'), `$1export interface ${name} {`)
  }
  return ''
}

const resolveQueryType = (query = []) => query.length === 0
  ? ''
  : `  export interface Query {\n${query.reduce((type, { name, desc, required }) => {
    const req = Boolean(Number(required) || 0) ? ':' : '?:'
    desc.trim() && (type += `    /** ${desc} */\n`)
    type += `    ${name}${req} string\n`
    return type
  }, '')}  }\n`

