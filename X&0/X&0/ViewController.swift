//
//  ViewController.swift
//  X&0
//
//  Created by Cristian Florin Ghinea on 10/29/16.
//  Copyright © 2016 Telacad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isX = true;
    
     override func viewDidLoad() {
        /*
         We do not use super in this case because there are no elements defined by us in UIViewController.
         We could use super.viewDidLoad() if we have ViewController2 that extends ViewController and if we do some of the design in ViewController.
         */
        //      super.viewDidLoad()
      
        self.view.backgroundColor = UIColor.red
        
        self .displayTopView();
        
        self.displayBottomView()
    }

    func displayTopView() {
        
        // Screen size
        let bounds = UIScreen.main.bounds
        
        let frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.size.width,
            height: 0.4 * bounds.size.height
        )
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = UIColor.yellow;
        
        self.view.addSubview(containerView)
        
        // Player 1
        let player1Frame = CGRect(x: 0,
                                  y: 0,
                                  width: containerView.bounds.size.width/2,
                                  height: containerView.bounds.size.height/3)
        let player1Label = UILabel(frame: player1Frame)
        player1Label.text = "Jucator1   0"
        player1Label.textAlignment = NSTextAlignment.center
        player1Label.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.addSubview(player1Label)
        
        // Vs
        let vsFrame = CGRect(x: 0,
                                  y: containerView.bounds.size.height/3,
                                  width: containerView.bounds.size.width/2,
                                  height: containerView.bounds.size.height/3)
        let vsLabel = UILabel(frame: vsFrame)
        vsLabel.text = "vs"
        vsLabel.textAlignment = NSTextAlignment.center
        vsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.addSubview(vsLabel)
        
        // Player 2
        let player2Frame = CGRect(x: 0,
                                  y: 2*(containerView.bounds.size.height/3),
                                  width: containerView.bounds.size.width/2,
                                  height: containerView.bounds.size.height/3)
        let player2Label = UILabel(frame: player2Frame)
        player2Label.text = "Jucator2   0"
        player2Label.textAlignment = NSTextAlignment.center
        player2Label.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.addSubview(player2Label)
        
        // Logo 
        let imageView = UIImageView(frame:
            CGRect(x: bounds.size.width - 192 - 20,
                   y: 40,
                   width: 192,
                   height: 128
            )
        )
        imageView.image = UIImage(named: "X&0_Icon.jpeg")
        self.view.addSubview(imageView)
        
        let resetButton = UIButton(frame:
            CGRect(x: bounds.size.width - 70 - 20,
                   y: imageView.frame.origin.y + imageView.frame.size.height + 20,
                   width: 70,
                   height: 70
            )
        )
        
        resetButton.setTitle("Reset", for: UIControlState.normal)
        resetButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        resetButton.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.cornerRadius = 35.0
        
        resetButton.addTarget(self,
                              action: #selector(ViewController.resetGame),
                              for: UIControlEvents.touchUpInside
        )
        
        self.view.addSubview(resetButton)
    }
    
    func displayBottomView () {
        
        // Screen size
        let bounds = UIScreen.main.bounds
        
        let frame = CGRect(
            x: 0,
            y: 0.4 * bounds.size.height,
            width: bounds.size.width,
            height: 0.6 * bounds.size.height
        )
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = UIColor(
            red: 1,
            green: 0.5,
            blue: 0,
            alpha: 0.8
        )
        
        // yellow 1 Red, 1 Green, 0 Blue
        self.view.addSubview(containerView)
        
        let buttonWidth = containerView.frame.size.width/3
        let buttonHeight = containerView.frame.size.height/3
        
        // vector (array unidimensional)
        let values = ["X", "0"]
        
        // array
//        let demoArray = [[0,1] , [7,8]]
        
        // 3 values on X
        for i in 0..<3 {
            
            // 3 values on Y
            for j in 0..<3 {
            
                let button = UIButton(
                    frame: CGRect(x: CGFloat(i) * buttonWidth,
                                  y: CGFloat(j) * buttonHeight,
                                  width: buttonWidth,
                                  height: buttonHeight
                    )
                )
                
                // Madang color
                button.backgroundColor = UIColor(
                    red: 0.73,
                    green: 0.94,
                    blue: 0.79,
                    alpha: 1
                )
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1.0
                containerView.addSubview(button)
                
                // Tag + target
                button.tag = i + j + 2*j
                button.addTarget(self,
                                 action: #selector(ViewController.buttonSelected(sender:)),
                                 for: UIControlEvents.touchUpInside
                )
                
            }
        }
    }
    
    func buttonSelected(sender: UIButton) {
        print("Selected button with tag: \(sender.tag)")
        
        if self.isX {
            sender.setTitle("X", for: UIControlState.normal)
            self.isX = false
        } else {
            sender.setTitle("0", for: UIControlState.normal)
            self.isX = true
        }
    }
    
    func resetGame() {
        print("Reset me")
    }
    
    
}

