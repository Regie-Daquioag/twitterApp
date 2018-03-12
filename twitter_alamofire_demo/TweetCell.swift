//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    
    var tweet: Tweet! {
        didSet {
            refreshData()
        }
    }
    
    func refreshData(){
        tweetTextLabel.text = tweet.text
        dateLabel.text = tweet.createdAtString
        nameLabel.text = tweet.user.name
        handleLabel.text = tweet.user.screenName
        retweetLabel.text = String(tweet.retweetCount)
        likeLabel.text = String(tweet.favoriteCount)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.clipsToBounds = true
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
    

    @IBAction func OnReply(_ sender: Any) {
        // Todo: when clicked on user can add a comment to the post (Maybe??)
    }
    
    @IBAction func OnRetweet(_ sender: Any) {
        if(tweet.retweeted == true){
            tweet.retweetCount = tweet.retweetCount - 1
            retweetLabel.text = String(tweet.retweetCount)
            tweet.retweeted = false
            retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: [])
            
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }else{
            tweet.retweetCount = tweet.retweetCount + 1
            retweetLabel.text = String(tweet.retweetCount)
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
    
    @IBAction func OnLike(_ sender: Any) {
        if(tweet.favorited == true){
            tweet.favoriteCount = tweet.favoriteCount - 1
            likeLabel.text = String(tweet.favoriteCount)
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
            likeLabel.text = String(tweet.favoriteCount)
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
}
