//
//  LocalState.swift
//  Bankey
//
//  Created by Chou visalroth on 26/12/23.
//

import Foundation

public class LocalState{
    
    private enum keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool{
        get{
            return UserDefaults.standard.bool(forKey: keys.hasOnboarded.rawValue) //store user defualt in boolean type
        }
        set(newValue){
            UserDefaults.standard.setValue(newValue, forKey: keys.hasOnboarded.rawValue) // set new value of user defualts
            UserDefaults.standard.synchronize()
        }
    }
}



