//
//  AutoScaleButton.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/08/22.
//

import UIKit

class AutoScaleButton: UIButton {
    
    private var isUpdatedCornerRadius = false
    
    @IBInspectable var isRounded: Bool = false {
        didSet{
            if isRounded {
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius.autoScaled
        }
    }
    
    @IBInspectable var letterSpacing: CGFloat {
        set {
            self.titleLabel?.letterSpacing = newValue.autoScaled
        }
        
        get {
            self.titleLabel?.letterSpacing ?? 0
        }
    }
    
    
    @IBInspectable var lineHeight: CGFloat {
        set {
            self.titleLabel?.lineHeight = newValue.autoScaled
        }
        
        get {
            self.titleLabel?.lineHeight ?? 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    internal func initUI(){
        
        
        if let fontSize = titleLabel?.font.pointSize.autoScaled {
            self.titleLabel?.font = titleLabel?.font.withSize(fontSize)
        }
       
        //        self.adjustsFontSizeToFitWidth = true
        //        self.minimumScaleFactor = 0.5
        
        if imageEdgeInsets.bottom != 0 ||
            imageEdgeInsets.top != 0 ||
            imageEdgeInsets.left != 0 ||
            imageEdgeInsets.right != 0 {
            
            imageEdgeInsets.bottom = imageEdgeInsets.bottom.autoScaled
            imageEdgeInsets.top = imageEdgeInsets.top.autoScaled
            imageEdgeInsets.left = imageEdgeInsets.left.autoScaled
            imageEdgeInsets.right = imageEdgeInsets.right.autoScaled
            
        }
        
        if contentEdgeInsets.bottom != 0 ||
            contentEdgeInsets.top != 0 ||
            contentEdgeInsets.left != 0 ||
            contentEdgeInsets.right != 0 {
            
            contentEdgeInsets.bottom = contentEdgeInsets.bottom.autoScaled
            contentEdgeInsets.top = contentEdgeInsets.top.autoScaled
            contentEdgeInsets.left = contentEdgeInsets.left.autoScaled
            contentEdgeInsets.right = contentEdgeInsets.right.autoScaled
            
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !isUpdatedCornerRadius else {
            return
        }
        
        if isRounded {
            self.layer.cornerRadius = self.frame.height/2
            self.clipsToBounds = true
        }else {
            if self.layer.cornerRadius != 0 && cornerRadius == 0{
                self.layer.cornerRadius = self.layer.cornerRadius.autoScaled
                self.clipsToBounds = true
            }
        }
        
        isUpdatedCornerRadius = true
    }
}
