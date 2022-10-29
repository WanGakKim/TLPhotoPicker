//
//  AutoScaleLabel.swift
//  lkhtestprj
//
//  Created by Kim WanGak on 2022/07/25.
//

import UIKit

class TLAutoScaleLabel: UILabel {
    
    private var isUpdatedCornerRadius = false
    
    @IBInspectable
    var insetLeft: CGFloat = 0
    @IBInspectable
    var insetTop: CGFloat = 0
    @IBInspectable
    var insetRight: CGFloat = 0
    @IBInspectable
    var insetBottom: CGFloat = 0
    
    @IBInspectable var isRounded: Bool = false {
        didSet{
            if isRounded {
                self.clipsToBounds = true
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = .init(top: insetTop.autoScaled,
                                         left: insetLeft.autoScaled,
                                         bottom: insetBottom.autoScaled,
                                         right: insetRight.autoScaled)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += insetTop.autoScaled + insetBottom.autoScaled
        size.width += insetLeft.autoScaled + insetRight.autoScaled
        
        
        if self.layer.borderWidth != 0 {
            size.height += self.layer.borderWidth.autoScaled * 2
            size.width +=  self.layer.borderWidth.autoScaled * 2
        }
        
      
      
        return size
    }
    
    override var letterSpacing: CGFloat {
        set {
            super.letterSpacing = newValue.autoScaled
        }
        
        get {
            super.letterSpacing
        }
    }
    
    
    override var lineHeight: CGFloat {
        set {
            super.lineHeight = newValue.autoScaled
        }
        
        get {
            super.lineHeight
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    internal func initUI(){
        let originFont = self.font
        guard let originFont = originFont else {
            return
        }
        
        self.font = UIFont(name: originFont.fontName, size: originFont.pointSize.autoScaled)
        
//        self.adjustsFontSizeToFitWidth = true
//        self.minimumScaleFactor = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !isUpdatedCornerRadius else{
            return
        }
        
        if isRounded {
            self.layer.cornerRadius = self.frame.height / 2
        }else {
            if self.layer.cornerRadius != 0 {
                self.layer.cornerRadius = self.layer.cornerRadius.autoScaled
                self.clipsToBounds = true
            }
        }
        
        isUpdatedCornerRadius = true
    }
}
