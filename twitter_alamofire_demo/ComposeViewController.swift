//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Regie Daquioag on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import UITextView_Placeholder;

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.placeholder = "What's happening?"
        textView.placeholderColor = UIColor.lightGray
        //textView.layer.borderColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "CancelSegue", sender: nil)
    }
    
    
    @IBAction func OnTweet(_ sender: Any) {
        
    }
    

}
