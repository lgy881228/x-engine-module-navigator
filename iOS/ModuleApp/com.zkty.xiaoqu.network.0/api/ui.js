const dsBridge = window.dsBridge
window.xengine = window.xengine || {}

// request
window.xengine.network = {
    requestConfig: {
        url: 'http://127.0.0.1:8000/data0.json',
        method: 'GET',
    },
    request: function (args) {
        return new Promise((resolve, reject) => {
            try {
                const str = { ...this.requestConfig, ...args };
                dsBridge.call("_network.requestNetwork", JSON.stringify(str), function (res) {
                    resolve(res)
                })
            } catch (error) {
                reject(error)
            }
        })
    }
}

// ui
window.xengine.ui = {
    /*
        Loading
    */
    showLoading() {
        dsBridge.call("_ui.showLoading", null, (res) => { });
    },
    hideLoading() {
        dsBridge.call("_ui.hiddenLoading", null, (res) => { });
    },

    /*
        Toast
    */
    toastConfig: {
        title: '',
        duration: 2000,
    },
    showToast: function (args) {
        const str = { ...this.toastConfig, ...args };
        dsBridge.call("_ui.showToast", JSON.stringify(str), (res) => { });
    },
    showSuccessToast: function (args) {
        const str = { ...this.toastConfig, ...args };
        dsBridge.call("_ui.showSuccessToast", JSON.stringify(str), (res) => { });
    },
    showFailToast: function (args) {
        const str = { ...this.toastConfig, ...args };
        dsBridge.call("_ui.showFailToast", JSON.stringify(str), (res) => { });
    },
    hiddenToast: function (args) {
        dsBridge.call("_ui.hiddenToast", '', (res) => { });
    },

    /*
        Modal
    */ 
    modalConfig: {
        title:''
    },
    showModal: function(args) {
        const str = { ...this.modalConfig, ...args };
        dsBridge.call("_ui.showModal", JSON.stringify(str), (res) => { });
    },

    // alert
    alertConfig: {
        itemList:['测试1','测试2','测试3','测试4','测试5']
    },
    showActionSheet: function (args) {
        const str = { ...this.alertConfig, ...args };
        dsBridge.call("_ui.showActionSheet", JSON.stringify(str), (res) => {});
    }
}; 