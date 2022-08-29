//
//  Utils.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 26.08.2022.
//

import Foundation

class Prefs
{
    private let defaults = UserDefaults.standard
  
    private let keyToken = "access_token"
    private let keyUserId = "user_id"
    private let keyAPIDomain = "instance"
  
    var token: String? {
        get {
            return defaults.string(forKey: keyToken)
        }
        set {
            defaults.set(newValue, forKey: keyToken)
        }
    }
    
    var userId: Int? {
        get {
            return defaults.integer(forKey: keyUserId)
        }
        set {
            defaults.set(newValue, forKey: keyUserId)
        }
    }
    
    var APIDomain: String? {
        get {
            return defaults.string(forKey: keyAPIDomain)
        }
        set {
            defaults.set(newValue, forKey: keyAPIDomain)
        }
    }
    
    func logout() {
        defaults.removeObject(forKey: keyToken)
        defaults.removeObject(forKey: keyUserId)
        defaults.removeObject(forKey: keyAPIDomain)
    }
  
    class var shared: Prefs {
        struct Static {
            static let instance = Prefs()
        }
      
        return Static.instance
    }
}
