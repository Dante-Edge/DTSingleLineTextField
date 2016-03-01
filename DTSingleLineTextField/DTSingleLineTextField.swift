//
//  UISingleLineTextField.swift
//  SingleLineTextFieldTest
//
//  Created by Dante on 16/2/27.
//  Copyright © 2016年 Dante. All rights reserved.
//

import UIKit

@IBDesignable
public class DTSingleLineTextField: UITextField {
    var leftEndpointLayer: CALayer!
    var rightEndpointLayer: CALayer!
    var bottomLineLayer: CALayer!
    
    @IBInspectable
    public var leftEndpoint: Bool = true {
        didSet {
            leftEndpointLayer.hidden = !self.leftEndpoint
        }
    }
    @IBInspectable
    public var rightEndpoint: Bool = true {
        didSet {
            rightEndpointLayer.hidden = !self.rightEndpoint
        }
    }
    @IBInspectable
    public var borderColor: UIColor = UIColor.redColor() {
        didSet {
            self.setBorderColor()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayer()
    }
    
    override public func layoutSublayersOfLayer(layer: CALayer) {
        super.layoutSublayersOfLayer(layer)
        let onePoint = 1.0 / UIScreen.mainScreen().scale
        let endPointHeight = 4 * onePoint
        if layer == self.layer {
            bottomLineLayer.frame = CGRect(
                origin: CGPoint(x: 0.0, y: self.layer.frame.height - onePoint),
                size: CGSize(width: layer.frame.size.width, height: onePoint))
            leftEndpointLayer.frame = CGRect(
                origin: CGPoint(x: 0.0, y: self.layer.frame.height - endPointHeight),
                size: CGSize(width: onePoint, height: endPointHeight)
            )
            rightEndpointLayer.frame = CGRect(
                origin: CGPoint(x: self.layer.frame.width - onePoint, y: self.layer.frame.height - endPointHeight),
                size: CGSize(width: onePoint, height: endPointHeight)
            )
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.borderStyle = .None
    }
    
    func setBorderColor() {
        bottomLineLayer.backgroundColor = self.borderColor.CGColor
        leftEndpointLayer.backgroundColor = self.borderColor.CGColor
        rightEndpointLayer.backgroundColor = self.borderColor.CGColor
    }
    
    func setLayer() {
        super.borderStyle = .None
        
        bottomLineLayer = CALayer()
        leftEndpointLayer = CALayer()
        rightEndpointLayer = CALayer()
        
        self.setBorderColor()
        
        self.layer.addSublayer(bottomLineLayer)
        self.layer.addSublayer(leftEndpointLayer)
        self.layer.addSublayer(rightEndpointLayer)
        
    }
    
}