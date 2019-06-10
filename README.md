# MSSnappingSlider

MSSnappingSlider is a subclass of `UISlider` that will give you access to 2 attributes, `step` and `threshold` where you can define exactly how the snapping should work.

![Snapping Slider](https://user-images.githubusercontent.com/24646608/59196589-6d05cb00-8bd2-11e9-99f9-8e398f08c7ce.gif)

## Specifications
### `step`
`step` defines the value of the displacement. 
For example, if the `step` is `1`, the slider will only snap to integer value (1.0, 2.0, -1.0 ...) 

### `threshold`
`threshold` is the maximum magnitude that the value can reach before snapping to the adjacent value. 
For example, if the `step` is `1` and the `threshold` is `0.5`, as soon as the slider value passes `0.5`, it will snap to `1`

### `MSSnappingSliderDelegate`
Handles all events emitted from the snapping slider. It has only one function:

```swift
func snappingSlider(_ snappingSlider: MSSnappingSlider, didChangeValueTo newValue: Float)
```

This function will be called whenever the slider snaps to a value, or the user lifts their hand from the slider. Note: This delegate function will sometimes be called multiple times for the same value. This happens when users drag to a new value and lift their finger up.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

XCode 10.2

## Installation

### Cocoapods
MSSnappingSlider is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MSSnappingSlider'
```

### Carthage

```ruby
github "MSSnappingSlider"
```

## Author

MaherKSantina, maher.santina90@gmail.com

## License

MSSnappingSlider is available under the MIT license. See the LICENSE file for more info.
