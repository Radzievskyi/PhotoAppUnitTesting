//
//  ViewController.swift
//  PhotoApp
//
//  Created by Sergey Kargopolov on 2020-02-11.
//  Copyright © 2020 Sergey Kargopolov. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webService = SignupWebService(urlString: SignupConstants.signupURLString)
            
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webService: webService, delegate: self)
        }
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successFullSignup() {
        let alert = UIAlertController(title: "Success", message: "The signup was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    
}
