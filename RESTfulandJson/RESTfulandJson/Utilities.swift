//
//  Utilities.swift
//  RESTfulandJson
//
//  Created by Macbook Air on 3/11/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import Foundation

class Utilities {
    func getStorage() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func setSkinType (value: String) {
        let defaults = getStorage()
        defaults.setValue(value, forKey:defaultsKeys.skinType)
        defaults.synchronize()
    }
    
    func getSkinType() -> String {
        let defaults = getStorage()
        if let result = defaults.string(forKey: defaultsKeys.skinType){
            return result
        }
        return SkinType().type1
        
    }
    
}

struct SkinType {
    let type1 = "Type 1 - pale / Light"
    let type2 = "Type 2 - white / Fair"
    let type3 = "Type 3 - Mrdium"
    let type4 = "Type 4 - Olive Brown"
    let type5 = "Type 5 - Dark Brown"
    let type6 = "Type 6 - Very Dark / Black"
    
}

struct defaultsKeys {
    static let skinType = "skinType"
}
    
