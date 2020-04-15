//
//  ViewController.swift
//  RazorpayPod Sample App
//
//  Created by Harsha Marri on 21/03/19.
//  Copyright © 2019 Harsha Marri. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController , RazorpayPaymentCompletionProtocolWithData {
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        print("Error!");
    }
    
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        print(response ?? "null");
    }

    private var razorpay: Razorpay!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        razorpay = Razorpay.initWithKey("rzp_test_IFMmoKlMshyTeL", andDelegateWithData: self)
        
    }
    
    private func openCheckout() {
        let options: [String: Any] = [
            "amount" : "10000",
            "description": "Test",
            "name": "Test",
            "currency" : "INR",
            "prefill": [
             "contact": "9999999999",
             "email": "test@test.com"
             ],
            "notes": [
                "key1":"value1"
            ]

//            "theme": ["close_button": false]
        ]
        razorpay.open(options, display: self)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        openCheckout()
        }
    
}

