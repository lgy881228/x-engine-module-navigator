import hello from '../src/hello.js'
import Benchmark from 'benchmark'
var suite = new Benchmark.Suite;

// add tests
suite.add('hello', function() {
  hello();
})
// add listeners
.on('cycle', function(event) {
  console.log(String(event.target));
})
.on('complete', function() {
  console.log('Fastest is ' + this.filter('fastest').map('name'));
})
// run async
.run({ 'async': true });
