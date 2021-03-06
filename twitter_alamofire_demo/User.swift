//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var screenName: String
    var profileImageURL: String
    var coverImageURL: URL
    
    var numFollowers: String
    var numFollowing: String
    var numTweets: String
    
    var dictionary: [String: Any]?
    var description: String
    
    private static var _current: User?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        screenName = "@" + (dictionary["screen_name"] as! String)
        profileImageURL = (dictionary["profile_image_url_https"] as? String)!
        
        if dictionary["profile_banner_url"] != nil  {
            coverImageURL = URL(string:dictionary["profile_banner_url"] as! String)!
        }else{
            coverImageURL = URL(string:"nil")!
        }
        numTweets = String(dictionary["statuses_count"] as! Int)
        numFollowers = String(dictionary["followers_count"] as! Int)
        numFollowing = String(dictionary["friends_count"] as! Int)
        description = dictionary["description"] as! String
        self.dictionary = dictionary
    }
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
}
