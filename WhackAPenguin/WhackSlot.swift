//
//  WhackSlot.swift
//  WhackAPenguin
//
//  Created by Justin Hold on 1/21/24.
//

import UIKit
import SpriteKit

class WhackSlot: SKNode {
	
	var charNode: SKSpriteNode!
	
	var isVisible: Bool = false
	var isHit: Bool = false
	
	
	/// Assigns sprite hole to rows on screen
	/// - Parameter position: CGPoint position on screen
	func configure(at position: CGPoint) {
		
		self.position = position
		let sprite = SKSpriteNode(imageNamed: "whackHole")
		addChild(sprite)
		
		let cropNode = SKCropNode()
		cropNode.position = CGPoint(x: 0, y: 15)
		cropNode.zPosition = 1
		cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
		
		charNode = SKSpriteNode(imageNamed: "penguinGood")
		charNode.position = CGPoint(x: 0, y: -90)
		charNode.name = "character"
		cropNode.addChild(charNode)
		addChild(cropNode)
	}
	
	
	/// Sets whether sprite character is showing and is good / evil
	/// - Parameter hideTime: length of time visible / hidden
	func show(hideTime: Double) {
		if isVisible { return }
		
		charNode.run(SKAction.moveBy(
			x: 0,
			y: 80,
			duration: 0.05)
		)
		isVisible = true
		isHit = false
		
		if Int.random(in: 0...2) == 0 {
			charNode.texture = SKTexture(imageNamed: "penguinGood")
			charNode.name = "charFriend"
		} else {
			charNode.texture = SKTexture(imageNamed: "penguinEvil")
			charNode.name = "charEnemy"
		}
	}
}
