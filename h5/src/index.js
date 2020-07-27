import xengine from "@zk4/xengine";
xengine._debug = xengine._debug || {};
xengine._debug.print= function(args){
  //xengine.bridge.call()
  console.log(args);
}


export default xengine._debug;
