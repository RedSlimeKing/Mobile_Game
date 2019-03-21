//
//  WashScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2019-02-14.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//


import SpriteKit
import GameplayKit

class WashScene: BaseScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "washscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let testButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        testButton.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(testButton)
        
//        let buttonLobbyScene = UIButton(type: UIButtonType.system) as UIButton
//        buttonLobbyScene.frame = CGRect(x:size.width / 2 + 150, y:size.height/2 + 300, width:50, height:50)
//        buttonLobbyScene.backgroundColor = UIColor.lightGray
//        buttonLobbyScene.setTitle("->", for:.normal)
//        buttonLobbyScene.tintColor = UIColor.black
//        buttonLobbyScene.addTarget(self, action: #selector(movetoLobbyScene(_:)), for: .touchUpInside)
        
        //self.view?.addSubview(buttonLobbyScene)

    }
}
