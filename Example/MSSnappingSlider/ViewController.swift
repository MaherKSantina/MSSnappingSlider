//
//  ViewController.swift
//  MSSnappingSlider
//
//  Created by MaherKSantina on 06/10/2019.
//  Copyright (c) 2019 MaherKSantina. All rights reserved.
//

import UIKit
import MSSnappingSlider

class ViewController: UIViewController {
    
    @IBOutlet weak var mySlider: MSSnappingSlider!

    override func viewDidLoad() {
        super.viewDidLoad()
//        mySlider.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MSSnappingSliderDelegate {
    func snappingSlider(_ snappingSlider: MSSnappingSlider, didChangeValueTo newValue: Float) {
        print(newValue)
    }
}

