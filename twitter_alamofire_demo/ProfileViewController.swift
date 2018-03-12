//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Regie Daquioag on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetsCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2;
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.clipsToBounds = true
        
        refreshData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshData(){
        coverImageView.af_setImage(withURL: (User.current?.coverImageURL)!)
        profileImageView.af_setImage(withURL: URL(string: (User.current?.profileImageURL)!)!)
        tweetsCount.text = User.current?.numTweets
        followingCount.text = User.current?.numFollowing
        followersCount.text = User.current?.numFollowers
        
        usernameLabel.text = User.current?.name
        handleLabel.text = User.current?.screenName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
