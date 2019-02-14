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

class LobbyScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "lobbybackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        //Button to go to GameScene
        let buttonGameScene = UIButton(type: UIButtonType.system) as UIButton
        buttonGameScene.frame = CGRect(x:size.width / 2 - 20, y:size.height/2, width:100, height:50)
        buttonGameScene.backgroundColor = UIColor.lightGray
        buttonGameScene.setTitle("Walk your pet!", for:.normal)
        buttonGameScene.tintColor = UIColor.black
        buttonGameScene.addTarget(self, action: #selector(movetoGameScene(_:)), for: .touchUpInside)
        //Button to go to GameScene
       
        let buttonWashScene = UIButton(type: UIButtonType.system) as UIButton
        buttonWashScene.frame = CGRect(x:size.width / 2 - 20, y:size.height/2 - 100, width:100, height:50)
        buttonWashScene.backgroundColor = UIColor.lightGray
        buttonWashScene.setTitle("Wash your pet!", for:.normal)
        buttonWashScene.tintColor = UIColor.black
        buttonWashScene.addTarget(self, action: #selector(movetoWashScene(_:)), for: .touchUpInside)
        self.view?.addSubview(buttonGameScene)
        self.view?.addSubview(buttonWashScene)
        
        
    }
    
    @objc func movetoGameScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
      
         let transition:SKTransition = SKTransition.fade(withDuration: 1)
         let scene:SKScene = GameScene(size: self.size)
         self.view?.presentScene(scene, transition: transition)
    }
    @objc func movetoWashScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
        
        let transition:SKTransition = SKTransition.fade(withDuration: 1)
        let scene:SKScene = WashScene(size: self.size)
        self.view?.presentScene(scene, transition: transition)
    }
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        self.children.forEach { (child) in
            if let updatable = child as? Updatable{
                updatable.update(currentTime)
            }
        }
    }
}
