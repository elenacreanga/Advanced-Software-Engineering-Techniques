//
//  AddPhotoViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 1/3/17.
//  Copyright © 2017 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class AddPhotoViewController: BaseViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(savePhoto))
        descriptionTextView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func savePhoto(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        titleTextField.resignFirstResponder()
        tagsTextField.resignFirstResponder()
        descriptionTextView.resignFirstResponder()
    }
}
