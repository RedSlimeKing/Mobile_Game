//
//  GameScene.swift
//  PetGame
//
//  Created by Rennick Carter M. on 2/7/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class WalkScene: BaseScene{
    
    var distance : Double = 0.0
    var lastTime : Double = 0.0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let dogButton = SpriteButton(spriteName: "dognormalfood.png"){
            
        }
        dogButton.position = CGPoint(x: 0, y: 0)
        dogButton.size = CGSize(width: dogButton.size.width * 2.0, height: dogButton.size.height * 2.0)
        background.addChild(dogButton)
        
        
        let backToMenuButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        backToMenuButton.position = CGPoint(x: 100, y: -300)
        background.addChild(backToMenuButton)
        
        GPSHandler.instance.enableLocationServices()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        let deltaTime : Double = currentTime - lastTime
        lastTime = currentTime
        
        distance += GPSHandler.instance.speed * deltaTime
        if(distance > 0.009 ){
            PetData.instance.Walk()
        }
        print(distance)
    }
}
