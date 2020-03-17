//
//  PreferenceManager.swift
//  wyh-ios-absl
//
//  Created by WYH_MAC001 on 25/07/19.
//  Copyright © 2019 WYH_MAC001. All rights reserved.
//

import Foundation

class PreferenceManager {
    
    static let shared = PreferenceManager();
    
    //Login Preference Keys
    public static let KEY_LOGIN_TOKEN : String = "KEY_LOGIN_TOKEN"
    private init() {
        
    }
    
    
    public func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }

    
    
    public func writeString(key: String, value: String) {
        let preferences = UserDefaults.standard
        preferences.set(value, forKey: key);
        preferences.synchronize()
    }
    
    public func readString(key: String) -> String  {
        let preferences = UserDefaults.standard
        return preferences.string(forKey: key) ?? ""
    }
    
    public func tokenExist()->Bool {
        var exist = false;
        if PreferenceManager.shared.readString(key: PreferenceManager.KEY_LOGIN_TOKEN).count != 0{
            exist = true
        }
        return exist;
    }
}
