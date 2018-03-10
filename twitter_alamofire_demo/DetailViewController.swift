//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Regie Daquioag on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    @IBAction func onReply(_ sender: Any) {
    }
    
    @IBAction func onRetweet(_ sender: Any) {
    }
    
    
    @IBAction func onLike(_ sender: Any) {
    }
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tweet = tweet{
            tweetLabel.text = tweet.text
            usernameLabel.text = tweet.user.name
            handleLabel.text = "@" + tweet.user.screenName
            dateLabel.text = tweet.createdAtString
            likeCountLabel.text = String(tweet.retweetCount)
            retweetCountLabel.text = String(tweet.retweetCount)
            profileImage.af_setImage(withURL: URL(string: tweet.user.profileImageURL)!)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
