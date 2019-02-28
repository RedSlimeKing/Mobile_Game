//
//  PettingScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2/28/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class PettingScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "pettingscenebackground")
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
        disableButtons()
        let transition:SKTransition = SKTransition.fade(withDuration: 1)
        let scene:SKScene = LobbyScene(size: self.size)
        self.view?.presentScene(scene, transition: transition)
    }

    
    
    
}
