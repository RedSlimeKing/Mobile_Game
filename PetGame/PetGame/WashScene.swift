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
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "washscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let testButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        testButton.position = CGPoint(x: 100, y: -300 )
        background.addChild(testButton)
        
        let block = SKSpriteNode(color: UIColor.black, size: CGSize(width: 100, height: 100)) //Temporary, replace with the actual pet
        block.position = CGPoint(x: 0, y: 0)
        block.zPosition = 100
        background.addChild(block)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
}
