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
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    func refreshData(){
        if let tweet = tweet{
            tweetLabel.text = tweet.text
            usernameLabel.text = tweet.user.name
            handleLabel.text = "@" + tweet.user.screenName
            dateLabel.text = tweet.createdAtString
            likeCountLabel.text = String(tweet.favoriteCount)
            retweetCountLabel.text = String(tweet.retweetCount)
            profileImage.af_setImage(withURL: URL(string: tweet.user.profileImageURL)!)
            
            if(tweet.retweeted == true){
                retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: [])
            }else{
                retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: [])
            }
            
            if(tweet.favorited == true){
                likeButton.setImage(UIImage(named: "favor-icon-red.png"), for: [])
            }else{
                likeButton.setImage(UIImage(named: "favor-icon.png"), for: [])
            }
        }
    }
    
    @IBAction func onReply(_ sender: Any) {
        // Todo: when clicked on user can add a comment to the post (Maybe??)
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        if(tweet.retweeted == true){
            tweet.retweetCount = tweet.retweetCount - 1
            retweetCountLabel.text = String(tweet.retweetCount)
            tweet.retweeted = false
            retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: [])
            
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }else{
            tweet.retweetCount = tweet.retweetCount + 1
            retweetCountLabel.text = String(tweet.retweetCount)
            tweet.retweeted = true
            retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: [])
            
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    
    
    @IBAction func onLike(_ sender: Any) {
        if(tweet.favorited == true){
            tweet.favoriteCount = tweet.favoriteCount - 1
            likeCountLabel.text = String(tweet.favoriteCount)
            tweet.favorited = false
            likeButton.setImage(UIImage(named: "favor-icon.png"), for: [])
            
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
        }else{
            tweet.favoriteCount = tweet.favoriteCount + 1
            likeCountLabel.text = String(tweet.favoriteCount)
            tweet.favorited = true
            likeButton.setImage(UIImage(named: "favor-icon-red.png"), for: [])
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
