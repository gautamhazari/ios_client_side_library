//
//  Scope2ViewController.swift
//  ClientSideLib
//
//  Created by user on 6/10/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class Scope2ViewController: BaseSwitchViewController {
    @IBOutlet weak var mcAuthn: UISwitch!
    @IBOutlet weak var mcAuthz: UISwitch!
    @IBOutlet weak var mcSignup: UISwitch!
    @IBOutlet weak var mcPhonenumber: UISwitch!
    @IBOutlet weak var mcNationalid: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setSwitches(switchOn: mcAuthn, switchArray: getSwitches());
        
    }
    
    override func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]) {
        super.setSwitches(switchOn: switchOn, switchArray: switchArray)
        scope = getSwitchedOption()
    }
    
    func getSwitches() -> [UISwitch] {
        return [mcAuthn, mcAuthz, mcSignup, mcPhonenumber, mcNationalid];
    }
    
    func getSwitchOn(switchArray: [UISwitch]) -> UISwitch {
        for switchElement in switchArray {
            if (switchElement.isOn) {
                return switchElement;
            }
        }
        return mcAuthn;
    }
    
    override func getSwitchedOption() -> String {
        switch getSwitchOn(switchArray: getSwitches()) {
        case mcAuthn:
            return AUTHN;
        case mcAuthz:
            return AUTHZ;
        case mcSignup:
            return IDENTITY_SIGNUP;
        case mcNationalid:
            return IDENTITY_NATIONALID;
        case mcPhonenumber:
            return IDENTITY_PHONE;
        default:
            return AUTHN;
        }
    }
    
    @IBAction func mcAuthn(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcAuthn, switchArray: getSwitches());
    }
    
    @IBAction func mcAuthz(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcAuthz, switchArray: getSwitches());
        
    }
    
    @IBAction func mcSignup(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcSignup, switchArray: getSwitches());
        
    }
    @IBAction func mcPhonenumber(_ sender: Any, forEvent event: UIEvent) {setSwitches(switchOn: mcPhonenumber, switchArray: getSwitches());}
    
    @IBAction func mcNationalid(_ sender: Any, forEvent event: UIEvent) {setSwitches(switchOn: mcNationalid, switchArray: getSwitches());    }
}
