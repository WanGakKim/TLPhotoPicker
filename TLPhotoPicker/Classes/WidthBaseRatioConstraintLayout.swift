//
//  WidthBaseRatioConstraintLayout.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/07/21.
//

import UIKit

internal class WidthBaseRatioConstraintLayout: NSLayoutConstraint {
    
    private var screenSize: (width: CGFloat, height: CGFloat) {
        return (UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutDidChange()
    }
    
    /**
     Re-calculate constant based on orientation and percentage.
     */
    @objc func layoutDidChange() {
        switch firstAttribute {
        case .top, .topMargin, .bottom, .bottomMargin:
            constant = constant * screenSize.height / 768
        case .leading, .leadingMargin, .trailing, .trailingMargin:
            constant = constant * screenSize.width / 1024
        case .centerY:
            constant = constant * screenSize.height / 768
        case .centerX:
            constant = constant * screenSize.width / 1024
        default: break
        }
    }
}
