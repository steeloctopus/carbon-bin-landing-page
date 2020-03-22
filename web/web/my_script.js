
function initBraintree(auth){
    var dropin = require('braintree-web-drop-in', );
    dropin.create({
    authorization: auth,
      container: '#dropin-container',
      paypal: {
        flow: 'vault'
      }
    });
}

function payment(auth){
    var button = document.querySelector('#submit-button');
    var braintree = require('braintree-web-drop-in');
    braintree.dropin.create({
      authorization: auth,
      container: '#dropin-container'
    }, function (createErr, instance) {
      button.addEventListener('click', function () {
        instance.requestPaymentMethod(function (requestPaymentMethodErr, payload) {
          // Submit payload.nonce to your server
          return payload.nonce
        });
      });
    });
}