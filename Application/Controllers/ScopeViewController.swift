//
//  ScopeViewController.swift
//  ClientSideLib
//
//  Created by user on 5/3/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class ScopeViewController: BaseScopeViewController {
    // The sample values
    
    @IBOutlet weak var openid: UISwitch!
    @IBOutlet weak var mcAttrVmShare: UISwitch!
    @IBOutlet weak var mcAttrVmShareHash: UISwitch!
    @IBOutlet weak var scopeLabel: UILabel!
    @IBOutlet weak var mcMnvValidate: UISwitch!
    @IBOutlet weak var mcMnvValidatePlus: UISwitch!
    @IBOutlet weak var mcIndiaTc: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setSwitches(switchOn: openid, switchArray: getSwitches());
    }
    
    func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]){
        for switchElement in switchArray {
            switchElement.isOn = false;
        }
        switchOn.isOn = true;
    }
    
    func getSwitches() -> [UISwitch] {
        return [openid, mcAttrVmShareHash, mcAttrVmShare, mcMnvValidate, mcMnvValidatePlus, mcIndiaTc];
    }
    
    func getSwitchOn(switchArray: [UISwitch]) -> UISwitch {
        for switchElement in switchArray {
            if (switchElement.isOn) {
                return switchElement;
            }
        }
        return openid;
    }
    
    override func getSwitchedScope() -> String {
        switch getSwitchOn(switchArray: getSwitches()) {
        case openid:
            return OPENID;
        case mcAttrVmShare:
            return MC_ATTR_VM_SHARE;
        case mcAttrVmShareHash:
            return MC_ATTR_VM_HASH;
        case mcMnvValidate:
            return MC_MMV_VALIDATE;
        case mcMnvValidatePlus:
            return MC_MMV_VALIDATE_PLUS;
        case mcIndiaTc:
            return MC_INDIA_TC;
        default:
            return OPENID;
        }
    }
    
    @IBAction func openid(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: openid, switchArray: getSwitches());
    }
    
    @IBAction func mcAttrVmShare(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcAttrVmShare, switchArray: getSwitches());
    }
    
    @IBAction func mcAttrVmShareHash(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcAttrVmShareHash, switchArray: getSwitches())
    }
    
    @IBAction func mcMnvValidate(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcMnvValidate, switchArray: getSwitches())
    }
    
    @IBAction func mcMnvValidatePlus(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcMnvValidatePlus, switchArray: getSwitches())
    }
    
    @IBAction func mcIndiaTc(_ sender: Any, forEvent event: UIEvent) {
        setSwitches(switchOn: mcIndiaTc, switchArray: getSwitches())
    }
}
