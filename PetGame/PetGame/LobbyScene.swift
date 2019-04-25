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
    var debugLabel1 : Label?
    var debugLabel2 : Label?
    var debugLabel3 : Label?
    var debugLabel4 : Label?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "lobbybackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -1.0
        addChild(background)
        
        let debugTextBackground = SKSpriteNode(imageNamed: "button")
        debugTextBackground.position = CGPoint(x: -300.0, y: 750.0)
        addChild(debugTextBackground)
        
        debugLabel1 = Label(labelText: "Fed: " + String(1.0), color: UIColor.white)
        debugLabel1?.position = CGPoint(x: -130, y: 325)
        background.addChild(debugLabel1!)
        
        debugLabel2 = Label(labelText: "Clean: " + String(1.0), color: UIColor.white)
        debugLabel2?.position = CGPoint(x: -130, y: 300)
        background.addChild(debugLabel2!)
        
        debugLabel3 = Label(labelText: "Walk: " + String(1.0), color: UIColor.white)
        debugLabel3?.position = CGPoint(x: -130, y: 275)
        background.addChild(debugLabel3!)
        
        debugLabel4 = Label(labelText: "Pet: " + String(1.0), color: UIColor.white)
        debugLabel4?.position = CGPoint(x: -130, y: 250)
        background.addChild(debugLabel4!)
        
        let buttonAchivementScene = SceneButton(text: "Achivements!") {
            self.MoveToScene(newScene: Scenes.achivement)
        }
        buttonAchivementScene.position = CGPoint(x: 0, y: 100)
        background.addChild(buttonAchivementScene)
        
        let buttonGameScene = SceneButton(text: "Walk your dog") {
            self.MoveToScene(newScene: Scenes.walking)
        }
        buttonGameScene.position = CGPoint(x: 0, y: 0)
        background.addChild(buttonGameScene)
        
        let buttonWashScene = SceneButton(text: "Wash your dog") {
            self.MoveToScene(newScene: Scenes.wash)
        }
        buttonWashScene.position = CGPoint(x: 0, y: -100)
        background.addChild(buttonWashScene)
        
        let buttonFeedingScene = SceneButton(text: "Feed your dog") {
            self.MoveToScene(newScene: Scenes.feeding)
        }
        buttonFeedingScene.position = CGPoint(x: 0, y: -200)
        background.addChild(buttonFeedingScene)
        
        let buttonPettingScene = SceneButton(text: "Pet your dog") {
            self.MoveToScene(newScene: Scenes.petting)
        }
        buttonPettingScene.position = CGPoint(x: 0, y: -300)
        background.addChild(buttonPettingScene)
    }
    
    override func update(_ currentTime: TimeInterval){
        super.update(currentTime)
        
        let hungerString = String(format:"%f", PetData.instance.GetHunger())
        let cleanString = String(format:"%f", PetData.instance.GetCleanliness())
        let walkString = String(format:"%f", PetData.instance.GetWalked())
        let lonelyString = String(format:"%f", PetData.instance.GetLoneliness())
        
        debugLabel1?.text = "Fed: " + hungerString
        debugLabel2?.text = "Clean: " + cleanString
        debugLabel3?.text = "Walk: " + walkString
        debugLabel4?.text = "Pet: " + lonelyString
    }
}
