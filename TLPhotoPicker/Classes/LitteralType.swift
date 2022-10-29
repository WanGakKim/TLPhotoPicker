//
//  LiteralType.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/07/25.
//

import UIKit

fileprivate var scale: CGFloat {
    if UIScreen.main.bounds.height/UIScreen.main.bounds.width < 0.75 {
        return UIScreen.main.bounds.width / 1024
    } else {
        return UIScreen.main.bounds.height / 768
    }
}

internal extension IntegerLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
    
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}

internal extension FloatLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
    
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}

internal extension CGFloat {
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}
