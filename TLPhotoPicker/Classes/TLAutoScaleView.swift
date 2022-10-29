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

class MainContentView: TLAutoScaleView {
    
    override func initUI() {
        self.layer.cornerRadius = 12.5
        super.initUI()
    }
    
    func setupShadow() {
        let mainContentView = MainContentView()
        mainContentView.backgroundColor = .init(white: 0, alpha: 0)
        self.addSubview(mainContentView)
        mainContentView.setShadows()
        //using SnapKit here, you can use NSLayoutConstraint in a similar way to constraint the containerShadow behind your View
        NSLayoutConstraint.activate([
            .init(item: mainContentView, attribute: .left,
                  relatedBy: .equal,
                  toItem: self, attribute: .left,
                  multiplier: 1, constant: 0),
            .init(item: mainContentView, attribute: .right,
                  relatedBy: .equal,
                  toItem: self, attribute: .right,
                  multiplier: 1, constant: 0),
            .init(item: mainContentView, attribute: .top,
                  relatedBy: .equal,
                  toItem: self, attribute: .top,
                  multiplier: 1, constant: 0),
            .init(item: mainContentView, attribute: .bottom,
                  relatedBy: .equal,
                  toItem: self, attribute: .bottom,
                  multiplier: 1, constant: 0),
        ])
    }
    
    private func setShadows(){
        self.layer.applySketchShadow(color: .init(white: 0, alpha: 0.1),
                                     alpha: 1,
                                     x: 0, y: 1.5,
                                     blur: 2.5, spread: 0)
    }
}

class AllStudyTitleView: TLAutoScaleView {
    
    override func initUI() {
        
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = 12.5
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        super.initUI()
    }
}

@IBDesignable
class StudyManagementHeaderView: TLAutoScaleView {
    
    override func initUI() {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = 12.5
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        super.initUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
