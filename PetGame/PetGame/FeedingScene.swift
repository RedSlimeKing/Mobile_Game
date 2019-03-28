//
//  FeedingScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2/28/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit
import GameplayKit

class FeedingScene: BaseScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var steakButton : SceneButton!
    private var iceCreamButton : SceneButton!
    private var dogFoodButton :SceneButton!
    private var dog : SKSpriteNode?
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "feedingscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        
     
        let testButton = SceneButton(text: "Back to Menu") {
            self.MoveToScene(newScene: Scenes.lobby)
        }
        
        steakButton = SceneButton(text: "Steak") {
            print("dog really likes steak")
            self.MoveButton()
           
        }
        iceCreamButton = SceneButton(text: "Ice Cream") {
            print("dog is sick now")
            self.MoveButton()
        }
        dogFoodButton = SceneButton(text: "Dog food") {
            print("dog eats dog food and enjoys it")
            self.MoveButton()
        }
        
        
        testButton.position = CGPoint(x: 100, y: -300 )
        background.addChild(testButton)
        
        dogFoodButton.position = CGPoint(x: 0, y: 300 )
        steakButton.position = CGPoint(x: 0, y: 200 )
        iceCreamButton.position = CGPoint(x: 0, y: 100 )
        
        background.addChild(steakButton)
        background.addChild(iceCreamButton)
        background.addChild(dogFoodButton)
    }
    
    
    func MoveButton(){
        
        dogFoodButton.position = CGPoint(x: -50000000, y: -50000000 )
        steakButton.position = CGPoint(x: -50000000, y: -50000000 )
        iceCreamButton.position = CGPoint(x: -50000000, y: -50000000 )
        
    
    }
    
    
}
