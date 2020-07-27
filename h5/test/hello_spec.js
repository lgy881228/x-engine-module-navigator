import hello from "../src/hello.js"
describe('hello', function(){
  it('should say hello', function(){
    expect(hello()).toBe('hello world');
  });
});
