//
//  AchievementHandler.swift
//  PetGame
//
//  Created by Ly Devon A. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation

struct Achievement {
    var title : String
    var currentValue : Int
    var requiredValue : Int
}

class AchievementHandler {
    static let instance = AchievementHandler()
    
    var Achievements : [String : Achievement]
    
    init(){
        Achievements = [:]
        Achievements["Feed 1"] = Achievement(title: "Feed your pet for the first time", currentValue: 0,requiredValue: 1)
        Achievements["Feed 7"] = Achievement(title: "Feed your pet for a week straight", currentValue: 0,requiredValue: 7)
        Achievements["Feed 30"] = Achievement(title: "Feed your pet for a month straight", currentValue: 0,requiredValue: 30)
        Achievements["Walk 1"] = Achievement(title: "Walked your pet for the first time", currentValue: 0,requiredValue: 1)
        Achievements["Walk 7"] = Achievement(title: "Walked your pet for a week straight", currentValue: 0,requiredValue: 7)
        Achievements["Walk 30"] = Achievement(title: "Walked your pet for a month straight", currentValue: 0,requiredValue: 30)
        Achievements["Wash 1"] = Achievement(title: "Washed your pet for the first time", currentValue: 0,requiredValue: 1)
        Achievements["Wash 7"] = Achievement(title: "Washed your pet for a week straight", currentValue: 0,requiredValue: 7)
        Achievements["Wash 30"] = Achievement(title: "Washed your pet for a month straight", currentValue: 0,requiredValue: 30)
        Achievements["Rock"] = Achievement(title: "Achieved Rock pet status", currentValue: 0,requiredValue: 9)
        
        for (key, a) in Achievements{
            PostAchievement(key_ : key, currentValue_: a.currentValue)
        }
    }
    
    func PostAchievement(key_: String, currentValue_: Int) -> Void{
        if Achievements[key_] != nil{
            Achievements[key_]?.currentValue = currentValue_
            
            let defaults = UserDefaults.standard
            defaults.set(currentValue_, forKey: key_)
        }
    }
    
    func GetAchievementName(key_: String) -> String{
        if let ach = Achievements[key_]{
            return ach.title
        }
        
        return ""
    }
    
    func GetAchievement(key_: String) -> Bool{
        if let ach = Achievements[key_]{
            return ach.currentValue == ach.requiredValue
        }
        
        return false
    }
}
