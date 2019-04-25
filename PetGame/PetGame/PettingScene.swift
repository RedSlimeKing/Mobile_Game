//
//  PettingScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2/28/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class PettingScene: BaseScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "pettingscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let petButton = SceneButton(text: "", imageName: "dognormalfood.png"){
            PetData.instance.Play()
        }
        petButton.position = CGPoint(x: 0, y: 0)
        petButton.size = CGSize(width: petButton.size.width * 2.0, height: petButton.size.height * 2.0)
        background.addChild(petButton)
        
        let testButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        testButton.position = CGPoint(x: 100, y: -300 )
        background.addChild(testButton)
    }
}
