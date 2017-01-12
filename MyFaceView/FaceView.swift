//
//  FaceView.swift
//  MyFaceView
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {

    @IBInspectable var scale: CGFloat = 0.9 { didSet { setNeedsLayout()}}
    @IBInspectable var lineWidth: CGFloat = 5.0 { didSet { setNeedsLayout()}}
    @IBInspectable var eyeOpen: Bool = true { didSet { setNeedsLayout()}}
    @IBInspectable var mouthOpen: Bool = true { didSet { setNeedsLayout()}}
    
    // Circle
    var circleCenter: CGPoint {
        
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    var circleRadius: CGFloat {
        
        return min(bounds.size.height / 2, bounds.size.width / 2) * scale
    }
    
    // Useful Structure
    private struct Ratios {
        
        static let EyeRadiusToCircle: CGFloat = 10
        static let EyeToCircleOffsetUP: CGFloat = 30
        static let EyeToCircleOffsetHorizontal: CGFloat = 50
    }
    
    // Drawing Method
    override func draw(_ rect: CGRect) {

        // Circle
        let circle = pathForCircle(circleCenter: circleCenter, circleRadius: circleRadius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: true)
        circle.stroke()
        
        // Eyes
        let leftEye = pathForEye(whichEye: .Left)
        leftEye.stroke()
        
        let rightEye = pathForEye(whichEye: .Right)
        rightEye.stroke()
        
        // Mouth
        
        let mouth = pathForMouth(x: bounds.midX - 50, y: bounds.midY + 70, width: 100, height: 20)
        mouth.stroke()
        
    }
    
    // Circle
    private func pathForCircle(circleCenter: CGPoint, circleRadius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) -> UIBezierPath {
        
        let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        UIColor.blue.set()
        path.lineWidth = lineWidth
        
        return path
    }
    
    // Eyes
    
    private enum Eyes {
        
        case Left
        case Right
    }
    
    
    private func getEyeCenter(eye: Eyes) -> CGPoint {
        
        var eyeCenter = circleCenter

        eyeCenter.y -= Ratios.EyeToCircleOffsetUP
        
        switch eye {
        case .Left:
            
            eyeCenter.x -= Ratios.EyeToCircleOffsetHorizontal
        case .Right:
            
            eyeCenter.x += Ratios.EyeToCircleOffsetHorizontal
        }
        
        return eyeCenter
    }
    
    private func pathForEye(whichEye: Eyes) -> UIBezierPath {
        
        let eyeRadius = circleRadius / Ratios.EyeRadiusToCircle
        
        let eyeCenter = getEyeCenter(eye: whichEye)
        
        var path: UIBezierPath!
        
        if eyeOpen {
            
            path = pathForCircle(circleCenter: eyeCenter, circleRadius: eyeRadius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: true)
            path.lineWidth = lineWidth
            UIColor.blue.set()
        } else {
            
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
            path.lineWidth = lineWidth
        }
        
        
        return path
    }
    
    // Mouth
    private func pathForMouth(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIBezierPath {
        
        var path: UIBezierPath!
        
        if mouthOpen {
            
            let openMouthRect = CGRect(x: x, y: y, width: width, height: height)
            path = UIBezierPath(rect: openMouthRect)
            UIColor.blue.set()
            path.lineWidth = lineWidth
        } else {
            
            let closeMouthRect = CGRect(x: x, y: y, width: width, height: height / 2)
            path = UIBezierPath(rect: closeMouthRect)
            UIColor.blue.set()
            path.fill()
        }
        
        return path
    }

}
