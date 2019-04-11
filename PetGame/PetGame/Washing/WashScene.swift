//
//  WashScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2019-02-14.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class WashScene: BaseScene{
    var pet : WashPet? = nil
    var progressBar : ProgressBar? = nil
    let initialCleanValue : Double = 10.0
    var cleanValue : Double = 0.0
    var lastTime : Double = 0.0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "washscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let pbBackground = SKSpriteNode(imageNamed: "button")
        pbBackground.size = CGSize(width: pbBackground.size.width / 3.0, height: pbBackground.size.height / 6.0)
        pbBackground.position = CGPoint(x: 0.0, y: 200.0)
        pbBackground.zPosition = 5.0
        pbBackground.color = UIColor.darkGray
        pbBackground.colorBlendFactor = 1.0
        background.addChild(pbBackground)
        
        progressBar = ProgressBar(textureName: "button")
        progressBar?.position = CGPoint(x: 0, y: 200)
        progressBar?.SetFillValue(value: 0.0)
        background.addChild(progressBar!)
        
        let testButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        testButton.position = CGPoint(x: 100, y: -300 )
        background.addChild(testButton)
        
        if let petObj = WashPet(petTexture: "dognormalfood") as WashPet?{
            pet = petObj
            petObj.position = CGPoint(x: 0, y: 0)
            petObj.size = CGSize(width: petObj.size.width * 1.5, height: petObj.size.height * 1.5)
            background.addChild(petObj)
        }
        
        cleanValue = initialCleanValue
    }
    
    override func update(_ currentTime: TimeInterval){
        let deltaTime : Double = currentTime - lastTime
        lastTime = currentTime
        
        if(pet?.IsBeingTouched())!{
            cleanValue -= deltaTime
            progressBar?.SetFillValue(value: CGFloat(1.0 - (cleanValue / initialCleanValue)))
            if cleanValue <= 0.0 {
                MoveToScene(newScene: Scenes.lobby)
            }
            
        }
        
        pet?.update(currentTime)
        super.update(currentTime)
    }
}
