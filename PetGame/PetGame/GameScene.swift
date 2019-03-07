//
//  GameScene.swift
//  PetGame
//
//  Created by Rennick Carter M. on 2/7/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var screenDelegate: ScreenSwitchable?
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let player : SKSpriteNode = Zombie()
        
        addChild(player)
        
        player.zPosition = 1
        player.position = CGPoint(x: 400, y: 400)
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
    
    func disableButtons(){
        guard let subviews = self.view?.subviews else {
            return
        }
        for view in subviews as [UIView] {
            if let button = view as? UIButton {
                button.isHidden = true
                button.isEnabled = false
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
