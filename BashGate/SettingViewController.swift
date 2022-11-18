//
//  SettingViewController.swift
//  BashGate
//
//  Created by Jiang, Wenxuan on 11/17/22.
//

import UIKit

struct Section {
    let title: String
    let option: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)

        return table
    }()
    
    var models = [Section]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        title = "Settings"
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func configure() {
        models.append(Section(title: "General", option: [
            .switchCell(model: SettingsSwitchOption(title: "Dark Mode", icon: UIImage(systemName: "moon"), iconBackgroundColor: .black, isOn: true, handler: {
                print("hello")
            }))
        ]))
        
        models.append(Section(title: "General", option: [
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
        ]))
        
        models.append(Section(title: "General", option: [
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "Wift", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
        ]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: model)

            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: model)

            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
