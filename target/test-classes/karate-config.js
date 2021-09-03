function fn() {
  var env = karate.env; 
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://conduit.productionready.io/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'jackbuzzhealy1996@gmail.com'
    config.userPassword = 'password'
  } 
  if (env == 'qa') {
    config.userEmail = 'jackbuzzhealy001@gmail.com'
    config.userPassword = 'pwd1234'
  }
  return config;
}