//
//  LobbyScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2019-02-14.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LobbyScene: BaseScene{
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "lobbybackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        //Button to go to GameScene
        
        let buttonGameScene = SceneButton(text: "Walk your dog") {
            self.MoveToScene(newScene: Scenes.walking)
        }
        buttonGameScene.position = CGPoint(x: 0, y: 250)
        background.addChild(buttonGameScene)
        
        let buttonWashScene = SceneButton(text: "Wash your dog") {
            self.MoveToScene(newScene: Scenes.wash)
        }
        buttonWashScene.position = CGPoint(x: 0, y: 100)
        background.addChild(buttonWashScene)
        
        let buttonFeedingScene = SceneButton(text: "Feed your dog") {
            self.MoveToScene(newScene: Scenes.feeding)
        }
        buttonFeedingScene.position = CGPoint(x: 0, y: -50)
        background.addChild(buttonFeedingScene)
        
        let buttonPettingScene = SceneButton(text: "Pet your dog") {
            self.MoveToScene(newScene: Scenes.petting)
        }
        buttonPettingScene.position = CGPoint(x: 0, y: -200)
        background.addChild(buttonPettingScene)
    }
}
