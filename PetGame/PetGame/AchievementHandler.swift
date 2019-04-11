//
//  AchievementHandler.swift
//  PetGame
//
//  Created by Ly Devon A. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation

struct Achievement {
    let title : String
    let currentValue : Int
    let requiredValue : Int
}

class AchievementHandler {
    static let instance = AchievementHandler()
    
    let Achievements: [Achievement] = Array()
    
    init(){
        self.Achievements.insert(Achievement("Feed your pet for the first time", 0, 1), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Feed your pet for a week straight", 0, 7), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Feed your pet for a month straight", 0, 30), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Walked your pet for the first time", 0, 1), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Walked your pet for a week straight", 0, 7), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Walked your pet for a month straight", 0, 30), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Washed your pet for the first time", 0, 1), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Washed your pet for a week straight", 0, 7), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Washed your pet for a month straight", 0, 30), at: self.Achievements.count)
        self.Achievements.insert(Achievement("Achieved Rock pet status", 0, 9), at: self.Achievements.count)
        
        for a in Achievements{
            PostAchievement(key_: a.title, currentValue_: a.currentValue, requiredValue_: a.requiredValue)
        }
    }
    
    func PostAchievement(key_: String, currentValue_: Int, requiredValue_: Int ) -> Void{
        let defaults = UserDefaults.standard
        let ach = Achievement(title: key_, currentValue: currentValue_, requiredValue: requiredValue_)
        defaults.set(ach, forKey: key_)
    }
    
    func GetAchievement(key_: String) -> bool{
        let ach = UserDefaults.standard.object(forKey: key_) as? Achievement
        let didGet = ach.currentValue == ach.requiredValue as? Bool
        return didGet
    }
    
}
