import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var isoText: UILabel!
    @IBOutlet weak var adultText: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        downloadUserData()
    }
    
    private func downloadUserData(){
        startConnection()
        DataService.instance.getAccountData { (user, error) in
            if error == nil {
                self.setUserData(user: user)
            }
            self.endConnection()
        }
    }
    
    private func startConnection(){
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    private func endConnection(){
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    private func setUserData(user:User){
        usernameText.text = user.username
        nameText.text = user.name
        isoText.text = user.iso
        if user.adult {
            adultText.text = "Adult"
        }else{
            adultText.text = "Not Adult"
        }
    }
    
    @IBAction func onLogoutPressed(_ sender: Any) {
        prepareForLogin()
    }
    
    private func prepareForLogin(){
        AuthService.instance.clearUserData()
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: LOGIN_VC_IDENTIFIER) as? LoginVC else { return }
        presentDetails(loginVC)
    }
}
