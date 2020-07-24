import xengine from "@zk4/xengine";
xengine._dubug = xengine._dubug || {};
xengine._dubug.print= function(args){
  //xengine.bridge.call()
  console.log(args);
}

export default xengine._debug;
