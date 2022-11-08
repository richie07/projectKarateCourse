function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'local') {
        config.URL = "http://localhost.booking"
  } else if (env == 'dev') {
    config.URL = "http://localhost.booking.dev.com"
  }else if (env == 'qa'){
    config.URL = "https://restful-booker.herokuapp.com"
  }
  return config;
}