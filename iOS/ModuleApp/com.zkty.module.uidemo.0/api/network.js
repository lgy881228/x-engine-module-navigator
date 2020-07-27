const dsBridge = window.dsBridge

const network = {
  config: {
    url: '',
    method: 'GET',
  },
  request(args) {
    return new Promise((resolve, reject) => {
      try {
        const str = { ...this.config, ...args };
        dsBridge.call("_network.requestNetwork", JSON.stringify(str), function (res) {
          resolve(res)
        })
      } catch (error) {
        reject(error)
      }
    })
  }
}
