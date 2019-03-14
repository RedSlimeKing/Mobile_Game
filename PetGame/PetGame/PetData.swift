//
//  PetData.swift
//
//  Created by Rennick Carter M. on 2019-01-31.
//  Copyright © 2019. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

class PetData{
    var lastFed : NSDate
    var lastWashed : NSDate
    var lastWalked : NSDate
    var lastPlayedWith : NSDate
    
    let hungerDuration : Double = 600.0 //Time to zero hunger in seconds
    let washDuration : Double = 600.0   //Time to zero clean in seconds
    let walkDuration : Double = 600.0   //Time to zero tired in seconds
    let playDuration : Double = 600.0   //Time to zero play in seconds
    
    init(){
        //Set all our values to the current date and time initially
        lastFed = NSDate()
        lastWashed = NSDate()
        lastWalked = NSDate()
        lastPlayedWith = NSDate()
        
        let lf = UserDefaults.standard.object(forKey: "LastFed")
        let lws = UserDefaults.standard.object(forKey: "LastWashed")
        let lwl = UserDefaults.standard.object(forKey: "LastWalked")
        let lpw = UserDefaults.standard.object(forKey: "LastPlayedWith")
        
        if let date = lf as? NSDate{
            lastFed = date
        }
        
        if let date = lws as? NSDate{
            lastWashed = date
        }
        
        if let date = lwl as? NSDate{
            lastWalked = date
        }
        
        if let date = lpw as? NSDate{
            lastPlayedWith = date
        }
    }
    
    deinit{
        StoreData()
    }
    
    func StoreData() -> Void{
        let defaults = UserDefaults.standard
        defaults.set(lastFed, forKey: "LastFed")
        defaults.set(lastWashed, forKey: "LastWashed")
        defaults.set(lastWalked, forKey: "LastWalked")
        defaults.set(lastPlayedWith, forKey: "LastPlayedWith")
    }
    
    func GetHappiness() -> Double{
        return (GetHunger() + GetCleanliness() + GetWalked() + GetLoneliness()) / 4.0
    }
    
    func GetHunger() -> Double{
        return GetValue(initialTime: lastFed, duration: hungerDuration)
    }
    
    func GetCleanliness() -> Double{
        return GetValue(initialTime: lastWashed, duration: washDuration)
    }
    
    func GetWalked() -> Double{
        return GetValue(initialTime: lastWalked, duration: walkDuration)
    }
    
    func GetLoneliness() -> Double{
        return GetValue(initialTime: lastPlayedWith, duration: playDuration)
    }
    
    func GetValue(initialTime : NSDate, duration : Double) -> Double{
        let timeSince = initialTime.timeIntervalSinceNow
        
        if(timeSince >= duration){
            return 0.0
        }
        
        return 1.0 - (timeSince / duration)
    }
}
