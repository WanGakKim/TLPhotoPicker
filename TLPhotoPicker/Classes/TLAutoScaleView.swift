//
//  AutoScaleView.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/08/10.
//

import UIKit

class TLAutoScaleView: UIView {
    
    private var isUpdatedCornerRadius = false
    
    @IBInspectable var isRounded: Bool = false {
        didSet{
            if isRounded {
                self.layer.cornerRadius = self.frame.height.autoScaled/2
            }
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius.autoScaled
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    internal func initUI(){
        //        self.adjustsFontSizeToFitWidth = true
        //        self.minimumScaleFactor = 0.5
        
        if self.layer.borderWidth != 0 {
            self.layer.borderWidth = self.layer.borderWidth.autoScaled
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !isUpdatedCornerRadius else {
            return
        }
        
        if isRounded {
            self.layer.cornerRadius = self.frame.height/2
        }else {
            if self.layer.cornerRadius != 0 && cornerRadius == 0{
                self.layer.cornerRadius = self.layer.cornerRadius.autoScaled
            }
            
        }
        isUpdatedCornerRadius = true
    }
}

class TLBorderView: TLAutoScaleView, UITextFieldDelegate {
    
    @IBInspectable var radius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius.autoScaled
        }
    }
    
    @IBInspectable var width : CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = width
        }
    }
    
    @IBInspectable var color : UIColor = .clear {
        didSet {
            self.layer.borderColor = self.color.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
