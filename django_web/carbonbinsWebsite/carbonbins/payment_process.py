import braintree

gateway = braintree.BraintreeGateway(
    braintree.Configuration(
        braintree.Environment.Sandbox,
        merchant_id="mwpffq4vznpywc5q",
        public_key="hy6t5jqzbfdd58n9",
        private_key="506df2c60e6f92cc051fed77d8cd73d3"
    )
)


def get_token():
    return gateway.client_token.generate({})


def process_payment(nonce, amount):
    result = gateway.transaction.sale({
        "amount": amount,
        "payment_method_nonce": nonce,
        "options": {
            "submit_for_settlement": True
        }
    })
    return result
