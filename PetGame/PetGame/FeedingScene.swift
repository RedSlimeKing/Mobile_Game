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
            let dogSteak = SKSpriteNode(imageNamed: "dogsteak")
            dogSteak.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 200 )
            dogSteak.size = CGSize(width:200,height:200)
            dogSteak.zPosition = 0.5
            self.addChild(dogSteak)
        }
        iceCreamButton = SceneButton(text: "Ice Cream") {
            print("dog is sick now")
            self.MoveButton()
            let dogIceCream = SKSpriteNode(imageNamed: "dogicecream")
            dogIceCream.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 200)
            dogIceCream.size = CGSize(width:200,height:200)
            dogIceCream.zPosition = 0.5
            self.addChild(dogIceCream)
            
        }
        dogFoodButton = SceneButton(text: "Dog food") {
            print("dog eats dog food and enjoys it")
            self.MoveButton()
            let dogNormalFood = SKSpriteNode(imageNamed: "dognormalfood")
            dogNormalFood.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 200 )
            dogNormalFood.size = CGSize(width:200,height:200)
            dogNormalFood.zPosition = 0.5
            
            self.addChild(dogNormalFood)
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
