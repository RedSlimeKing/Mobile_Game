//
//  WashScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2019-02-14.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//


import SpriteKit
import GameplayKit

class WashScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var screenDelegate: ScreenSwitchable?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "washscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let buttonLobbyScene = UIButton(type: UIButtonType.system) as UIButton
        buttonLobbyScene.frame = CGRect(x:size.width / 2 + 150, y:size.height/2 + 300, width:50, height:50)
        buttonLobbyScene.backgroundColor = UIColor.lightGray
        buttonLobbyScene.setTitle("->", for:.normal)
        buttonLobbyScene.tintColor = UIColor.black
        buttonLobbyScene.addTarget(self, action: #selector(movetoLobbyScene(_:)), for: .touchUpInside)
        
        self.view?.addSubview(buttonLobbyScene)

    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        self.children.forEach { (child) in
            if let updatable = child as? Updatable{
                updatable.update(currentTime)
            }
        }
    }
    

    
    @objc func movetoLobbyScene(_ sender:UIButton!)
    {
        
        //SKView.presentScene(GameScene)
        NotificationCenter.default.post(name: Notification.Name.didRecieveButtonInput, object:nil)
        screenDelegate?.SwitchScreens(string: "LobbyScene")
    }

    
    
    
    
    
    
}
