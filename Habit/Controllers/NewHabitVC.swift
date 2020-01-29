//
//  NewHabitVC.swift
//  Habit
//
//  Created by Lovina on 1/3/20.
//  Copyright © 2020 Buildschool. All rights reserved.
//

import UIKit

protocol NewHabitVCDelegate: class {
    func newHabitVCDidCreate(habit: Habit, _ vc: NewHabitVC)
}

class NewHabitVC: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameHabitLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var createButton: UIButton!

    var selectedIcon: UIImage?
    weak var delegate: NewHabitVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Habit"
        iconImageView.image = selectedIcon
        nameHabitLabel.text = "Name of the New Habit"
        textField.delegate = self
        textField.placeholder = "Name of Habit"
        textField.returnKeyType = .done
        createButton.setTitle("Create Habit", for: .normal)
        createButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func createButtonPressed() {
        let newHabit = Habit(text: textField.text ?? "", count: 0, icon: selectedIcon!)
        delegate?.newHabitVCDidCreate(habit: newHabit, self)
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        view.frame.origin.y = -(keyboardRect.height) / 3

    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
        print(view.safeAreaLayoutGuide.layoutFrame)
    }
}

extension NewHabitVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
