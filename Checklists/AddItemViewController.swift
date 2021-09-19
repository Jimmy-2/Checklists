//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Jimmy  on 9/18/21.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    //keybaord will automatically show up when this screen is opened
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    // MARK: - Actions
    
    @IBAction func cancel() {
        //tells navigation controller to close Add Item screen with an animation and go to back to the previous screen
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: = Table View Delegates
    
    //disable selections for row
    override func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    
    ) -> IndexPath? {
        return nil
    }
    
    // a UITextField delegate method, invoked everytime user changes the text, by tapping on keyboard of cut/paste
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    
    ) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(
            in: stringRange,
            with: string)
        doneBarButton.isEnabled = !newText.isEmpty
       
        return true
    }
    
    //enables done button to be disabled when pressing the clear button on the text field
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
