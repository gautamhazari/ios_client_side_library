//
//  ScopeViewController.swift
//  ClientSideLib
//
//  Created by user on 5/3/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class ScopeViewController: BaseViewController {
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
    
    func getSwitchedScope() -> String {
        switch getSwitchOn(switchArray: getSwitches()) {
        case openid:
            return "openid";
        case mcAttrVmShare:
            return "openid mc_attr_vm_share";
        case mcAttrVmShareHash:
            return "openid mc_attr_vm_share_hash";
        case mcMnvValidate:
            return "openid mc_mnv_validate";
        case mcMnvValidatePlus:
            return "openid mc_mnv_validate_plus";
        case mcIndiaTc:
            return "openid mc_india_tc";
        default:
            return "openid";
        }
    }
    
    func setSwitches(switchOn: UISwitch, switchArray: [UISwitch]){
        for switchElement in switchArray {
            switchElement.isOn = false;
        }
        switchOn.isOn = true;
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController
            else {
                return
        }
        viewController.scope = getSwitchedScope()
    }
}
