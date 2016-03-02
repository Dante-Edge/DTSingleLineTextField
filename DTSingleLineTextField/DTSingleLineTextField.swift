//
// The MIT License (MIT)
// 
// Copyright (c) 2016 https://github.com/Dante-Edge/DTSingleLineTextField
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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
