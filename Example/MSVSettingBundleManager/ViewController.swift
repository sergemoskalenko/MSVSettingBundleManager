//
//  ViewController.swift
//  MSVSettingBundleManager
//
//  Created by Serge Moskalenko on 11/10/2019.
//  Copyright (c) 2019 Serge Moskalenko. All rights reserved.
//

import UIKit
import MSVSettingBundleManager

class ViewController: UIViewController {

    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var widthLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet var imageViewCollection: [UIImageView]!
    @IBOutlet weak var label: UILabel!
    
    var settings = MSVSettingManager(keys:["shape", "switch"])
    let images = ["triangle", "square", "circle", "star"]
    var _activeIndex = 0
    var activeIndex: Int {
        get {
            return _activeIndex
        }
        set {
            _activeIndex = newValue
            setActiveImage(_activeIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSettings()
        setShape()
    }

    func clean() {
        imageViewCollection.forEach{imageView in
            imageView.image = UIImage(named:  image(imageView.tag - 21))}
    }
    
    func image(_ index:Int, selected:Bool = false) -> String {
        return images[index] + (selected ? "_sel" : "")
    }
    
    func setActiveImage(_ index: Int) {
        clean()
        let imageView:UIImageView = view.viewWithTag(21 + index) as! UIImageView
        imageView.image = UIImage(named:  image(index, selected: true))
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        let tag = sender.tag
        activeIndex = tag - 31
        setShape()
    }
    
// Mark: - Settings Bundle connections
    
    func setShape() {
        settings["shape".intDef] = images[activeIndex]
    }
    
    func setUpSettings() {
        settings.action(key: "shape") { value in
            if value is String {
                let shape = value as! String
                if let index = self.images.firstIndex(of: shape) {
                    self.activeIndex = index
                }
                
            }
        }
        
        settings.action(key: "switch") { value in
            if value is Bool {
                let isOn = value as! Bool
                self.label.text = isOn ? "On" : "Off"
                
            }
        }
        
    }
}

