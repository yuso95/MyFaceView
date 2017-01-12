//
//  EmotionsVC.swift
//  MyFaceView
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class EmotionsVC: UIViewController {
    
    var emotions = [
    
        "Show Shocked": FacialExpression(eyes: .Open, mouth: .Open),
        "Show Simple": FacialExpression(eyes: .Open, mouth: .Close),
        "Show Sleeping": FacialExpression(eyes: .Close, mouth: .Close),
    ]
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destionationVC = segue.destination as? FaceViewController {
         
            if let identifier = segue.identifier {
                
                if let expression = emotions[identifier] {
                    
                    destionationVC.expression = expression
                }
            }
        }
    }

}
