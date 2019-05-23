//
//  VersionViewController.swift
//  ClientSideLib
//
//  Created by user on 5/20/19.
//  Copyright © 2019 a1qa. All rights reserved.
//

import Foundation
import UIKit
class VersionViewController: BaseViewController {
    var discoveryUrl = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let baseController = segue.destination as? BaseSwitchViewController
            else {
                return
        }
        baseController.discoveryUrl = discoveryUrl
    }
}
