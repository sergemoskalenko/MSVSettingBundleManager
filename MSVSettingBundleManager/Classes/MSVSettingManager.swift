//
//  MSVSettingManager.swift
//  MSVSettingManager
//
//  Created by Serge Moskalenko on 11/1/19.
//  Copyright © 2019 MSVSettingManager. All rights reserved.
//

import UIKit

open class MSVSettingManager {
    var actions: [String:(Any?)->()] = [String:(Any?)->()]()
    var values: [String:Any] = [String:Any]()
    static var keys: [String] = [String]()
    
    public subscript(index: Int) -> Any? {
        get {
            return index < 0 || index >= MSVSettingManager.keys.count ? nil : MSVSettingManager.get(forKey: MSVSettingManager.keys[index])
        }
        set(newValue) {
            if index >= 0 && index < MSVSettingManager.keys.count {
                MSVSettingManager.set(newValue, forKey: MSVSettingManager.keys[index])
            }
        }
    }
    
    public subscript(index: String) -> Any? {
        get {
            return MSVSettingManager.get(forKey: index)
        }
        set(newValue) {
                MSVSettingManager.set(newValue, forKey: index)
        }
    }
    
    public init(keys: [String]) {
        MSVSettingManager.register()
        MSVSettingManager.keys = keys
        NotificationCenter.default.addObserver(self, selector: #selector(MSVSettingManager.changed), name: UserDefaults.didChangeNotification, object: nil)
        changed()
    }

    @objc func changed() {
        MSVSettingManager.keys.forEach { key in
            let value = values[key]
            let newValue = MSVSettingManager.get(forKey: key)
            if let v = value, let v2 = newValue {
                if !isEqual(v, v2) {
                    values[key] = newValue
                    if let f = actions[key] {
                        f(newValue)
                    }
                }
            } else if value == nil && newValue != nil || value != nil && newValue == nil {
                if newValue != nil {
                    values[key] = newValue
                } else {
                    values.removeValue(forKey: key)
                }
                
                if let f = actions[key] {
                    f(newValue)
                }
            }
        }
    }
    
    public func action(key: String, action:@escaping (Any?)->()) {
        actions[key] = action
    }

    class func register() {
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    class func set(_ value: Any?, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    class func get(forKey: String) -> Any? {
        return UserDefaults.standard.object(forKey: forKey)
    }
    
    class func string(forKey: String) -> Any? {
        if let str = get(forKey: forKey) {
            return str
        } else {
            return nil
        }
    }
    
    enum SwiftDataType
    {
        case String
        case Int
        case Int64
        case Double
        case Bool
        case Undefined
    }

    func getType( of : Any ) -> SwiftDataType {
        if of is String
        {
            return SwiftDataType.String
        }
        else if of is Int
        {
            return SwiftDataType.Int
        }
        else if of is Int64
        {
            return SwiftDataType.Int64
        }
        else if of is Double
        {
            return SwiftDataType.Double
        }
        else if of is Bool
        {
            return SwiftDataType.Bool
        }
        else
        {
            return SwiftDataType.Undefined
        }
    }

    func isEqual(_ a : Any, _ b : Any ) -> Bool
    {
        let aType : SwiftDataType = getType( of : a )
        let bType : SwiftDataType = getType( of : b )
        if aType != bType
        {
            print("Type is not Equal -> \(aType)")
            return false
        }
        else
        {
            switch aType  {
            case SwiftDataType.String :
                guard let aValue = a as? String, let bValue = b as? String else
                {
                    return false
                }
                return aValue == bValue

            case SwiftDataType.Int :
                guard let aValue = a as? Int, let bValue = b as? Int else
                {
                    return false
                }
                return aValue == bValue

            case SwiftDataType.Int64 :
                guard let aValue = a as? Int64, let bValue = b as? Int64 else
                {
                    return false
                }
                return aValue == bValue

            case SwiftDataType.Double :
                guard let aValue = a as? Double, let bValue = b as? Double else
                {
                    return false
                }
                return aValue == bValue

            case SwiftDataType.Bool :
                guard let aValue = a as?  Bool, let bValue = b as? Bool else
                {
                    return false
                }
                return aValue == bValue

            default:
                return false
            }
        }
    }
}

extension String {
    public var intDef: Int {
        return MSVSettingManager.keys.firstIndex(of: self) ?? -1
    }
}
