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
        buttonGameScene.frame = CGRect(x:size.width / 2 - 100, y:size.height/2 - 300, width:200, height:100)
        buttonGameScene.backgroundColor = UIColor.lightGray
        buttonGameScene.setTitle("Walk your pet!", for:.normal)
        buttonGameScene.tintColor = UIColor.black
        buttonGameScene.addTarget(self, action: #selector(movetoGameScene(_:)), for: .touchUpInside)
        //Button to go to Wash Scene
       
        let buttonWashScene = UIButton(type: UIButtonType.system) as UIButton
        buttonWashScene.frame = CGRect(x:size.width / 2 - 100, y:size.height/2 - 150, width:200, height:100)
        buttonWashScene.backgroundColor = UIColor.lightGray
        buttonWashScene.setTitle("Wash your pet!", for:.normal)
        buttonWashScene.tintColor = UIColor.black
        buttonWashScene.addTarget(self, action: #selector(movetoWashScene(_:)), for: .touchUpInside)
        
        //Button to go to Feeding Scene
        
        let buttonFeedingScene = UIButton(type: UIButtonType.system) as UIButton
        buttonFeedingScene.frame = CGRect(x:size.width / 2 - 100, y:size.height/2, width:200, height:100)
        buttonFeedingScene.backgroundColor = UIColor.lightGray
        buttonFeedingScene.setTitle("Feed your pet!", for:.normal)
        buttonFeedingScene.tintColor = UIColor.black
        buttonFeedingScene.addTarget(self, action: #selector(movetoFeedingScene(_:)), for: .touchUpInside)
        
        //Button to go to Petting Scene
        
        let buttonPettingScene = UIButton(type: UIButtonType.system) as UIButton
        buttonPettingScene.frame = CGRect(x:size.width / 2 - 100, y:size.height/2 + 150, width:200, height:100)
        buttonPettingScene.backgroundColor = UIColor.lightGray
        buttonPettingScene.setTitle("Play with your pet!", for:.normal)
        buttonPettingScene.tintColor = UIColor.black
        buttonPettingScene.addTarget(self, action: #selector(movetoPettingScene(_:)), for: .touchUpInside)

        self.view?.addSubview(buttonGameScene)
        self.view?.addSubview(buttonWashScene)
        self.view?.addSubview(buttonFeedingScene)
        self.view?.addSubview(buttonPettingScene)
        
        
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
    
    @objc func movetoGameScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
         disableButtons()
         let transition:SKTransition = SKTransition.fade(withDuration: 1)
         let scene:SKScene = GameScene(size: self.size)
         self.view?.presentScene(scene, transition: transition)
    }

    
    @objc func movetoFeedingScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
        disableButtons()
        let transition:SKTransition = SKTransition.fade(withDuration: 1)
        let scene:SKScene = FeedingScene(size: self.size)
        self.view?.presentScene(scene, transition: transition)
    }
    @objc func movetoPettingScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
        disableButtons()
        let transition:SKTransition = SKTransition.fade(withDuration: 1)
        let scene:SKScene = PettingScene(size: self.size)
        self.view?.presentScene(scene, transition: transition)
    }
    
    @objc func movetoWashScene(_ sender:UIButton!)
    {
        //SKView.presentScene(GameScene)
        disableButtons()
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
