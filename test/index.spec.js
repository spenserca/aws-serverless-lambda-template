const index = require('../src/index');

describe('src/index.handler', () => {
  let output;

  beforeEach(async () => {
    output = await index.handler();
  });

  test('should return an object with statusCode 200', () => {
    expect(output.statusCode).toEqual(200);
  });

  test('should return an object with body hello world!', () => {
    expect(output.body).toEqual('hello world!');
  });
});
