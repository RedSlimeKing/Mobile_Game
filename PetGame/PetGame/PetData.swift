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
    var lastFed : Date
    var lastWashed : Date
    var lastWalked : Date
    var lastPlayedWith : Date
    
    init(){
        
    }
    
    func GetHappiness() -> Float {
        return 1.0
    }
}
