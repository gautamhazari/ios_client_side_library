//
//  Scope11ViewController.swift
//  ClientSideLib
//
//  Created by user on 6/10/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class Scope11ViewController: BaseSwitchViewController {
    @IBOutlet weak var openid: UISwitch!
    @IBOutlet weak var profile: UISwitch!
    @IBOutlet weak var email: UISwitch!
    @IBOutlet weak var address: UISwitch!
    @IBOutlet weak var phone: UISwitch!
    @IBOutlet weak var offlineAccess: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setSwitches(switchOn: openid, switchArray: getSwitches());        
    }
    
    override func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]) {
        super.setSwitches(switchOn: switchOn, switchArray: switchArray)
        scope = getSwitchedOption()
    }
    
    func getSwitches() -> [UISwitch] {
        return [openid, profile, email, address, phone, offlineAccess];
    }
    
    func getSwitchOn(switchArray: [UISwitch]) -> UISwitch {
        for switchElement in switchArray {
            if (switchElement.isOn) {
                return switchElement;
            }
        }
        return openid;
    }
    
    override func getSwitchedOption() -> String {
        switch getSwitchOn(switchArray: getSwitches()) {
        case openid:
            return OPENID;
        case profile:
            return PROFILE;
        case email:
            return EMAIL;
        case address:
            return ADDRESS;
        case phone:
            return PHONE;
        case offlineAccess:
            return OFFLINE_ACCESS;
        default:
            return OPENID;
        }
    }
    
    @IBAction func openid(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: openid, switchArray: getSwitches());
    }
    
    @IBAction func profile(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: profile, switchArray: getSwitches());
    }
    
    @IBAction func email(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: email, switchArray: getSwitches());
    }
    
    @IBAction func address(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: address, switchArray: getSwitches());
    }
    
    @IBAction func phone(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: phone, switchArray: getSwitches());
    }
    
    @IBAction func offlineAccess(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: offlineAccess, switchArray: getSwitches());
    }
}
