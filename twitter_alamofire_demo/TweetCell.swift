//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            dateLabel.text = tweet.createdAtString
            nameLabel.text = tweet.user.name
            handleLabel.text = "@" + tweet.user.screenName
            
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
            profileImage.layer.borderWidth = 1
            profileImage.layer.borderColor = UIColor.black.cgColor
            profileImage.clipsToBounds = true
        }
    }
    

    @IBAction func OnReply(_ sender: Any) {
        
    }
    
    @IBAction func OnRetweet(_ sender: Any) {
        
    }
    
    @IBAction func OnLike(_ sender: Any) {
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
