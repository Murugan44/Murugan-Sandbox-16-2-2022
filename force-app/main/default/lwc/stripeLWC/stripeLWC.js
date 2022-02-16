import {
	LightningElement
} from 'lwc';
import {
	loadScript,loadStyle
} from 'lightning/platformResourceLoader';
import stripeJS from '@salesforce/resourceUrl/stripe';
// import stripeJS from 'https://js.stripe.com/v3/';
export default class StripeLWC extends LightningElement {
	stripe;
	paymentElement

	connectedCallback() {
		loadScript(this, stripeJS).then(() => {
				console.log('stripeJS loaded succesfully')
				this.loadstripeJS()
			})
			.catch(error => {
				console.error({
					message: 'Not Loading StripeJS',
					error
				});
			})
	}

	async loadstripeJS() {
    const payment = this.template.querySelector("div[ishtmlcontainer=true]");
	// var paymentId = this.template.querySelector('.paymentcheck').id
	// alert(paymentId)
	
    this.stripe = await Stripe('pk_test_51K8kUbSB8m4RhRyhoVG2aXpxn8GVn08IDiWoEqkOD0dLzaSWBme9mvmAfiENxTTtOPr0zlT8HxZv1uOlhQrJ8TAp00nBofCou8',{
		apiVersion: "2020-08-27",
	  });

   
    const elements = this.stripe.elements({
		clientSecret:'pi_3KEUB8SB8m4RhRyh0JRXjwWc_secret_j5f5QsJFWN0A7tQXXRoT2oifi',
	});

    // this.paymentElement = elements.create('card');
	const element = elements.create('card', {
		style: {
		  base: {
			iconColor: 'Blue',
			// color: '#fff',
			fontWeight: '500',
			fontFamily: 'Roboto, Open Sans, Segoe UI, sans-serif',
			fontSize: '16px',
			fontSmoothing: 'antialiased',
			// ':-webkit-autofill': {
			//   color: '#fce883',
			// },
			'::placeholder': {
			  color: 'black',
			},
		  },
		  invalid: {
			iconColor: '#F51720',
			color: '#F51720',
		  },
		},
	  });
    // console.log('stripe pe::', this.paymentElement)
    element.mount(payment);

	// var paymentRequest = this.stripe.paymentRequest({
	// 	country: 'US',
	// 	currency: 'usd',
	// 	total: {
	// 	  label: 'Demo total',
	// 	  amount: 1099,
	// 	},
	// 	requestPayerName: true,
	// 	requestPayerEmail: true,
	//   });
	//   const btn = this.template.querySelector("div.payment-request-button");
	// 	var prButton = elements.create('paymentRequestButton', {
	// 		paymentRequest: paymentRequest,
	// 	});
	// 	paymentRequest.canMakePayment().then(function(result) {
	// 		if (result) {
	// 			alert(result)
	// 		  prButton.mount(btn);
	// 		} else {
	// 		  alert('else')
	// 		}
	// 	  });
  }

}