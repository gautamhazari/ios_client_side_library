//
//  DiscoveryViewController.swift
//  ClientSideLib
//
//  Created by user on 5/20/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class DiscoveryViewController: BaseSwitchViewController {
    @IBOutlet weak var common: UISwitch!
    @IBOutlet weak var dublin: UISwitch!
    @IBOutlet weak var singapore: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setSwitches(switchOn: common, switchArray: getSwitches());
    }
    
    func getSwitches() -> [UISwitch] {
        return [common, dublin, singapore];
    }
    
    func getSwitchOn(switchArray: [UISwitch]) -> UISwitch {
        for switchElement in switchArray {
            if (switchElement.isOn) {
                return switchElement;
            }
        }
        return common;
    }
    
    override func getSwitchedOption() -> String {
        switch getSwitchOn(switchArray: getSwitches()) {
        case common:
            return COMMON_DISCOVERY;
        case dublin:
            return DUBLIN_DISCOVERY;
        case singapore:
            return SINGAPORE_DISCOVERY;
        default:
            return COMMON_DISCOVERY;
        }
    }
    
    override func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]) {
        super.setSwitches(switchOn: switchOn, switchArray: switchArray)
        discoveryUrl = getSwitchedOption()
    }
    
    @IBAction func common(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: common, switchArray: getSwitches())
    }
    
    @IBAction func dublin(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: dublin, switchArray: getSwitches())
    }
    
    @IBAction func singapore(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: singapore, switchArray: getSwitches())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let baseController = segue.destination as? VersionViewController
            else {
                return
        }
        baseController.discoveryUrl = discoveryUrl
    }}
