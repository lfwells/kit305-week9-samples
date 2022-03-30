//
//  ViewController.swift
//  CoreAnimationExample
//
//  Created by Lindsay Wells on 15/3/18.
//  Copyright © 2018 Lindsay Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationLayer: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        //animationLayer.layer.cornerRadius = 50;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func animateButtonPressed(_ sender: Any)
    {
        let layer = animationLayer.layer
        
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 1.0
        fadeAnim.toValue = 0.5
        fadeAnim.duration = 1.0
        layer.add(fadeAnim, forKey: "opacity")
        
        // Change the actual data value in the layer to the final value.
        layer.opacity = 0.5//fadeAnim.toValue is of type Any? so we could do messy cast here, but didn't
    }
    
    @IBAction func animateButtonPressed2(_ sender: Any)
    {
        let layer = animationLayer.layer
        
        //first some linear paths
        let straightPath = CGMutablePath();
        straightPath.move(to: CGPoint(x:75.0, y:75.0))
        straightPath.addLine(to:CGPoint(x:300,y:300))
        straightPath.addLine(to:CGPoint(x:300,y:75.0))
        
        // create a CGPath that implements two arcs (a bounce)
        let curvedPath = CGMutablePath();
        curvedPath.move(to: CGPoint(x:300.0, y:75.0))
        
        curvedPath.addCurve(
            to: CGPoint(x:75.0,y:300.0),
            control1: CGPoint(x:300.0,y:300.0),
            control2: CGPoint(x:300.0,y:75.0))
        
        curvedPath.addCurve(
            to: CGPoint(x:300,y:300),
            control1: CGPoint(x:300.0,y:300.0),
            control2: CGPoint(x:300.0,y:75.0))
        
        //you can also add paths to each other
        //(think about what happens to duration of clip here...)
        straightPath.addPath(curvedPath)
        
        // Create the animation object, specifying the position property as the key path.

        let theAnimation = CAKeyframeAnimation(keyPath:"position")
        theAnimation.path=straightPath;
        theAnimation.duration=5.0;
        
        // Add the animation to the layer.
        layer.add(theAnimation, forKey: "position")
    }
    @IBAction func rotatePressed(_ sender: Any)
    {
        let layer = animationLayer.layer
        
        // Animation 1
        let widthAnim = CAKeyframeAnimation(keyPath:"borderWidth")
        let widthValues = [1.0, 10.0, 5.0, 30.0, 0.5, 15.0, 2.0, 50.0, 0.0, ];
        widthAnim.values = widthValues;
        widthAnim.calculationMode = CAAnimationCalculationMode.paced;
        
        // Animation 2
        let rotateAnim = CAKeyframeAnimation(keyPath:"transform.rotation")
        let rotateValues = [0, 45 * .pi / 180.0, 0]
        rotateAnim.values = rotateValues
        widthAnim.calculationMode = CAAnimationCalculationMode.paced;
        
        // Animation group
        let group = CAAnimationGroup()
        group.animations = [widthAnim, rotateAnim]
        group.duration = 5.0;
        
        layer.add(group, forKey: "CoolAnimation")
    }
}

