//
//  CreateEventViewController.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 6/17/21.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    @IBOutlet private var eventTitleTextField: UITextField!
    @IBOutlet private var locationTextField: UITextField!
    @IBOutlet private var datePicker: UIDatePicker!
    @IBOutlet private var imageNamePicker: UIPickerView!
    @IBOutlet private var createButton: UIButton!
    @IBOutlet private var notesTextField: UITextField!
    
    let selectableBackgrounds = ["bg0", "bg1", "bg2", "bg3", "bg4", "bg5", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNamePicker.dataSource = self
        imageNamePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventTitleTextField.becomeFirstResponder()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let event = Event(title: eventTitleTextField.text ?? eventTitleTextField.placeholder ?? "", date: datePicker.date, imageURL: nil, imageName: selectableBackgrounds[imageNamePicker.selectedRow(inComponent: 0)], location: locationTextField.text ?? "No location provided")
        event.saveToUserDefaults()
        dismiss(animated: true)
    }
}

extension CreateEventViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        selectableBackgrounds.count
    }

}

extension CreateEventViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        50.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        let image = UIImage(named: "\(selectableBackgrounds[row]).png")
        view.image = image
        return view
    }
    
}
