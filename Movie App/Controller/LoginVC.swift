import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        onViewTapped()
        indicator.isHidden = true
    }
    
    private func onViewTapped(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func handleKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        guard let username = usernameTextField.text , usernameTextField.text != "" else { return }
        guard let password = passwordTextField.text , passwordTextField.text != "" else { return }
        prepareToConnect()
        userLogin(username: username, password: password)
    }
    
    private func userLogin(username:String,password:String){
        AuthService.instance.createRequestToken { (success) in
            if success {
                AuthService.instance.userLogin(username: username, password: password, completion: { (success) in
                    if success {
                        self.createUserSession()
                    }else{
                        self.showMessage(title: "Try Again", message: "Invalid username and/or password")
                    }
                })
            }else{
                self.showMessage(title: "Oops", message: "Please Try Again Later")
            }
            self.endConnection()
        }
    }
    
    private func createUserSession(){
        AuthService.instance.createSession { (success) in
            if success {
                self.presentMain()
            }else{
                self.showMessage(title: "Oops", message: "Can't Create Session")
            }
        }
    }
    
    private func presentMain(){
        guard let tabbar = storyboard?.instantiateViewController(withIdentifier: MAIN_TAB_BAR_IDENTIFIER) else { return }
        presentDetails(tabbar)
    }
    
    private func prepareToConnect(){
        indicator.isHidden = false
        indicator.startAnimating()
        loginButton.isEnabled = false
    }
    
    private func endConnection(){
        self.indicator.isHidden = true
        self.indicator.stopAnimating()
        self.loginButton.isEnabled = true
    }
    
    private func showMessage(title:String,message:String){
        let messageAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        messageAlert.addAction(closeAction)
        present(messageAlert, animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField{
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField{
            view.endEditing(true)
        }
        return true
    }
}
