// eslint-disable-next-line require-await
const handler = async () => ({
  body: 'hello world!',
  statusCode: 200
});

module.exports = {
  handler
};
