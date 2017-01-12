//
//  FacialExpression.swift
//  MyFaceView
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

struct FacialExpression {
    
    enum Eyes {
        
        case Open
        case Close
    }
    
    enum Mouth {
        
        case Open
        case Close
    }
    
    var eyes: Eyes
    var mouth: Mouth
}
