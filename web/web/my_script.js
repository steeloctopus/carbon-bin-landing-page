


function initBraintree(auth){
    //error Module name "braintree-web-drop-in" has not been loaded yet for context: _. Use require([])
    //here
    braintree.dropin.create({
    authorization: auth,
      container: '#dropin-container',
      paypal: {
        flow: 'vault'
      }
    });
}

function payment(auth){
    var button = document.querySelector('submit-button');
    console.log(auth);
    console.log(button);
    braintree.dropin.create({
      authorization: auth,
      container: 'dropin-container'
    }, function (createErr, instance) {
        console.log(createErr);
        console.log(instance);
         button.addEventListener('click', function () {
            instance.requestPaymentMethod(function (requestPaymentMethodErr, payload) {
              // Submit payload.nonce to your server
              return payload.nonce
            });
         });
    });
}