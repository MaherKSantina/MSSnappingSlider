//
//  MSSnappingSlider.swift
//  MSSnappingSlider
//
//  Created by Maher Santina on 6/10/19.
//

import UIKit

public protocol MSSnappingSliderDelegate: AnyObject {
    func snappingSlider(_ snappingSlider: MSSnappingSlider, didChangeValueTo newValue: Float)
}

public extension MSSnappingSliderDelegate {
    func snappingSlider(_ snappingSlider: MSSnappingSlider, didChangeValueTo newValue: Float) {}
}

/**
 Subclass of UISlider which snaps to specific values based on the step value provided
 */
public class MSSnappingSlider: UISlider {
    
    public weak var delegate: MSSnappingSliderDelegate?
    
    /// The step that the slider change based on. By default the slider will move 1 value at a time
    @IBInspectable public var step: Float = 1
    
    /// The threshold at which past that, the slider should change the snapped value
    @IBInspectable public lazy var threshold: Float = step / 2
    
    /// The current snapped value of the slider
    public var snappedValue: Float = 0 {
        didSet {
            value = snappedValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView() {
        // When the user drags the slider, snap it to specific values and call the delegate function
        addTarget(self, action: #selector(handleValueChange(sender:)), for: .valueChanged)
        
        // When the user removes their finger, call the delegate function with the current value
        addTarget(self, action: #selector(handleTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    @objc func handleTouchUp() {
        
        // Notify the delegate
        delegate?.snappingSlider(self, didChangeValueTo: snappedValue)
    }
    
    @objc func handleValueChange(sender: UISlider) {
        
        // Get the displacement between the current snapped value and the slider's unsnapped value
        let displacementValue = value - snappedValue
        
        // Get the displacement magnitude
        switch abs(displacementValue) {
            
        // If the displacement magnitude is greater than the threshold, move to the next/previous step
        case let x where x > threshold:
            // Get the sign of the displacement to detect whether to go forwards or backwards
            let sign = Sign(float: displacementValue)
            
            // Get the new value by getting the sign of the displacement and multiplying it with the step
            let newValue = sign.normalizedValue * step
            
            // Add the value to the current value (If the next value is negative, the slider will move backwards)
            snappedValue += newValue
            
            // Notify the delegate
            delegate?.snappingSlider(self, didChangeValueTo: snappedValue)
            
        // Otherwise, keep the slider's unsnapped value equal to the current snapped value which keeps the seek at the same place
        default:
            value = snappedValue
        }
    }
}

extension MSSnappingSlider {
    
    /// A way to represent the sign of a number
    enum Sign {
        case negative
        case positive
        case zero
        
        init(float: Float) {
            switch float {
            case let x where x > 0:
                self = .positive
            case let x where x < 0:
                self = .negative
            default:
                self = .zero
            }
        }
        
        /// gets the normalized value for the sign
        var normalizedValue: Float {
            switch self {
            case .positive:
                return 1
            case .negative:
                return -1
            case .zero:
                return 0
            }
        }
    }
}

