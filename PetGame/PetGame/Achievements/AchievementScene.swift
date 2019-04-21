//
//  AchievementScene.swift
//  PetGame
//
//  Created by Rennick Carter M. on 4/21/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class AchievementScene: BaseScene{
    override func didMove(to view: SKView){
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "lobbybackground")
        background.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        background.zPosition = -1.0
        addChild(background)
        
        var counter : CGFloat = 0
        for (key, _) in AchievementHandler.instance.Achievements{
            var targetX : CGFloat = -100.0
            var targetY : CGFloat = 200.0 - (100.0 * counter)
            
            if(targetY < -200.0){
                targetX += 200.0
                targetY += 500.0
            }
            
            let achievement = AchievementIcon(achievementLabel: key)
            achievement.position = CGPoint(x: targetX, y: targetY)
            background.addChild(achievement)
            
            counter += 1.0
        }
        
        let backButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        backButton.position = CGPoint(x: 100, y: -300 )
        background.addChild(backButton)
    }
}
