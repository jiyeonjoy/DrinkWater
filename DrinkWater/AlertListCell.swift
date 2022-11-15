//
//  AlertListCell.swift
//  DrinkWater
//
//  Created by Jiyeon Choi on 2022. 11. 15..
//

import UIKit

class AlertListCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
    }
}
