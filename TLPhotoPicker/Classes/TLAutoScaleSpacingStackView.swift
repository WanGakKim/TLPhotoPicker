//
//  AutoScaleSpacingStackView.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/08/17.
//

import UIKit

class TLAutoScaleSpacingStackView: UIStackView {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    internal func initUI(){
        if self.spacing != 0 {
            self.spacing = self.spacing.autoScaled
        }
    }
}

class AutoScaleBorderStackView: UIStackView {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    internal func initUI(){
        if self.layer.borderWidth > 0 {
            self.layer.borderWidth = self.layer.borderWidth.autoScaled
        }
        
        if self.layer.cornerRadius != 0 {
            self.layer.cornerRadius = self.layer.cornerRadius.autoScaled
            self.clipsToBounds = true
        }
    }
}
