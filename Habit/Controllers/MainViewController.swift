//
//  MainViewController.swift
//  Habit
//
//  Created by Lovina on 1/2/20.
//  Copyright © 2020 Buildschool. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var habits: [Habit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Habit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))

        let nib = UINib(nibName: "HabitTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 63
    }

    @objc func addButtonPressed() {
        let vc = IconPickerViewController()
        vc.newHabitVC.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HabitTableViewCell
        cell.iconImageView.image = habits[indexPath.row].icon
        cell.habitLabel.text = habits[indexPath.row].text
        cell.countLabel.text = String(habits[indexPath.row].count)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let complete = UIContextualAction(style: .normal, title: "Complete") { (action, view, completionHandler) in
            self.habits[indexPath.row].count += 1
            let cell = tableView.cellForRow(at: indexPath) as! HabitTableViewCell
            cell.countLabel.text = String(self.habits[indexPath.row].count)
            completionHandler(true)
        }
        complete.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [complete])
        return configuration
    }
}

extension MainViewController: NewHabitVCDelegate {
    func newHabitVCDidCreate(habit: Habit, _ vc: NewHabitVC) {
        habits.append(habit)
        tableView.reloadData()
    }
}
