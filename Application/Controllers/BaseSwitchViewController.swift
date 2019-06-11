//
//  BaseSwitchViewController.swift
//  ClientSideLib
//
//  Created by user on 6/10/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class BaseSwitchViewController: BaseViewController {
    var discoveryUrl = COMMON_DISCOVERY
    var scope = ""
    var version = MC_V1_1
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]){
        for switchElement in switchArray {
            switchElement.isOn = false;
        }
        switchOn.isOn = true;
    }
    
    func getSwitchedOption() -> String {
        return ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let baseController = segue.destination as? ViewController
            else {
                return
        }
        baseController.discoveryUrl = discoveryUrl
        baseController.version = version
        baseController.scope = scope
    }
    
}
