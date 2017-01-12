//
//  FaceViewController.swift
//  MyFaceView
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    var expression = FacialExpression(eyes: .Close, mouth: .Open) {
        didSet {
            
            updateUI()
        }
    }
    
    @IBOutlet private weak var faceView: FaceView! {
        didSet {
            
            updateUI()
        }
    }
    
    private func updateUI() {
    
        switch expression.eyes {
        case .Open: faceView.eyeOpen = true
        case .Close: faceView.eyeOpen = false
        }
        
        switch expression.mouth {
        case .Open: faceView.mouthOpen = true
        case .Close: faceView.mouthOpen = false
        }
    }

}

