//
//  UILabel+Extension.swift
//  
//
//  Created by WangakKim on 2022/06/13.
//

import UIKit

// MARK: - UILabel

@IBDesignable
extension UILabel {
    
    @IBInspectable
    var letterSpacing: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            
            attributedString.addAttribute(.kern,
                                          value: newValue.autoScaled,
                                          range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
        
        get {
            
            guard let attributedText = attributedText else {
                return 0
            }
            var effectiveRange = NSMakeRange(0, attributedText.length)
            
            if let currentLetterSpace = attributedText.attribute(.kern,
                                                                 at: 0,
                                                                 effectiveRange: &effectiveRange) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
    
    @IBInspectable
    var lineHeight: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            var effectiveRange = NSMakeRange(0, attributedString.length)
            self.attributedText?.attributes(at: 0, effectiveRange: &effectiveRange)
                .filter{ (key, vaule) in
                    key == .paragraphStyle
                }.forEach({ (key, value) in
                    
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.setParagraphStyle(value as! NSParagraphStyle)
                    
                    paragraphStyle.minimumLineHeight = newValue
                    paragraphStyle.maximumLineHeight = newValue
                    
                    
                    attributedString.addAttribute(.paragraphStyle,
                                                  value: paragraphStyle,
                                                  range: NSRange(location: 0, length: attributedString.length))
                    attributedText = attributedString
                })
            
            
           
        }
        
        get {
            var effectiveRange = NSMakeRange(0, self.text?.count ?? 0)
            let currentParagraphStyle = attributedText?.attribute(.paragraphStyle,
                                                                  at: 0,
                                                                  effectiveRange: &effectiveRange) as? NSParagraphStyle
            return currentParagraphStyle?.lineSpacing ?? 0
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

// MARK: - CALayer

extension CALayer {
    func applySketchShadow(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat) {
            masksToBounds = false
            shadowColor = color.cgColor
            shadowOpacity = alpha
            shadowOffset = CGSize(width: x, height: y)
            shadowRadius = blur / UIScreen.main.scale
            if spread == 0 {
                shadowPath = nil
            } else {
                let rect = bounds.insetBy(dx: -spread, dy: -spread)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    
}
