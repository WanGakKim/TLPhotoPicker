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

public extension IntegerLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
    
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}

public extension FloatLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
    
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}

public extension CGFloat {
    var autoScaled: CGFloat {
        return CGFloat(self) * scale
    }
}
