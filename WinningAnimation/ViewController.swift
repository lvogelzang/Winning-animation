//
//  ViewController.swift
//  WinningAnimation
//
//  Created by Lodewijck on 07/12/2018.
//  Copyright © 2018 Lodewijck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapped(_ sender: Any) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let minPathLength = max(screenWidth, screenHeight)
        let maxPathLength = minPathLength * 2
        
        let center = CGPoint(x: screenWidth / 2.0, y: screenHeight / 2.0)
        for _ in 0 ... 20 {
            let particle = Draw(frame: CGRect(origin: center, size: CGSize(width: 50, height: 50)))
            view.addSubview(particle)
        }
        
        UIView.setAnimationCurve(UIView.AnimationCurve.easeOut)
        UIView.animate(withDuration: 1.5, animations: {
            for particle in self.view.subviews {
                let directionAngle = CGFloat.random(in: 0 ..< CGFloat.pi * 2)
                let pathLength = CGFloat.random(in: minPathLength ... maxPathLength)
                
                let x = sin(directionAngle) * pathLength
                let y = cos(directionAngle) * pathLength
                
                particle.transform = CGAffineTransform(rotationAngle: directionAngle)
                particle.frame.origin = CGPoint(x: x, y: y)
                particle.alpha = 0.5
            }
        }, completion: { _ in
            for particle in self.view.subviews {
                particle.removeFromSuperview()
            }
        })
    }
    
}
