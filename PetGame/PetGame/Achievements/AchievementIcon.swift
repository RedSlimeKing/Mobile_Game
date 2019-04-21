//
//  AchievementIcon.swift
//  PetGame
//
//  Created by Rennick Carter M. on 4/21/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation
import SpriteKit

class AchievementIcon : SceneButton{
    init(achievementLabel : String){
        super.init(text: AchievementHandler.instance.GetAchievementName(key_: achievementLabel)){}
        
        label.fontSize = 10.0
        if AchievementHandler.instance.GetAchievement(key_: achievementLabel){
            colorBlendFactor = 0.0
        }else{
            color = UIColor.darkGray
            colorBlendFactor = 1.0
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
