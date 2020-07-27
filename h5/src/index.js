import xengine from "@zk4/xengine";
window.xengine = window.xengine || {}

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
}
