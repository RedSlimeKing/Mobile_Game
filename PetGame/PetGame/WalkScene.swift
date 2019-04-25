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
    var progressBar : ProgressBar? = nil
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        distance = 0.0
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let pbBackground = SKSpriteNode(imageNamed: "button")
        pbBackground.size = CGSize(width: pbBackground.size.width / 3.0, height: pbBackground.size.height / 6.0)
        pbBackground.position = CGPoint(x: 0.0, y: 200.0)
        pbBackground.zPosition = 5.0
        pbBackground.color = UIColor.darkGray
        pbBackground.colorBlendFactor = 1.0
        background.addChild(pbBackground)
        
        progressBar = ProgressBar(textureName: "button", text: "Distance Walked: ")
        progressBar?.position = CGPoint(x: 0, y: 200)
        progressBar?.SetFillValue(value: 0.0)
        background.addChild(progressBar!)
        
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
        
        if(GPSHandler.instance.speed < 2.0){
            print("Moving too slow, ignoring movement")
            return
        }else if(GPSHandler.instance.speed > 15){
            print("Too Fast")
            return
        }
        if(deltaTime > 0.5){
            print("Illegal time")
            return
        }
        distance += GPSHandler.instance.speed * deltaTime
        if(distance > 500.0 ){
            PetData.instance.Walk()
        }
        progressBar?.label.text = "Distance Walked: " + String(distance) + " / " + String(500.0)
        progressBar?.SetFillValue(value: CGFloat(distance / 500.0))
        print(distance)
    }
}
