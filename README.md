# MSVSettingBundleManager

[![CI Status](https://img.shields.io/travis/sergemoskalenko/MSVSettingBundleManager.svg?style=flat)](https://travis-ci.org/sergemoskalenko/MSVSettingBundleManager)
[![Version](https://img.shields.io/cocoapods/v/MSVSettingBundleManager.svg?style=flat)](https://cocoapods.org/pods/MSVSettingBundleManager)
[![License](https://img.shields.io/cocoapods/l/MSVSettingBundleManager.svg?style=flat)](https://cocoapods.org/pods/MSVSettingBundleManager)
[![Platform](https://img.shields.io/cocoapods/p/MSVSettingBundleManager.svg?style=flat)](https://cocoapods.org/pods/MSVSettingBundleManager)

MSVSettingBundleManager makes it easy to read / set settings in the Settings Bundle engine and handle event settings changes.



## Example

https://appetize.io/app/xd75be4jgh3469u67ug7ud72ym

[<img src="https://raw.githubusercontent.com/sergemoskalenko/MSVSettingBundleManager/master/MSVSettingBundleManager.gif" alt="Screen" width="244"/>](https://github.com/sergemoskalenko/MSVSettingBundleManager)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Init with keys:
```swift
    var settings = MSVSettingManager(keys:["shape", "switch"])
```
Set value:
```swift
    settings["shape".intDef] = "star"
```

Get value:
```swift
    var shape = settings["shape".intDef]
```
Events on changing:
```swift
    settings.action(key: "shape") { value in
        if value is String {
            let shape = value as! String
            ...
            ...
        }
    }
```


## Requirements

## Installation

MSVSettingBundleManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MSVSettingBundleManager'
```

## Author

Serge Moskalenko, https://github.com/sergemoskalenko

## License

MSVSettingBundleManager is available under the MIT license. See the LICENSE file for more info.
