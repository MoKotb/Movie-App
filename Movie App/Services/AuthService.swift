import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    private let userDefaults = UserDefaults.standard
    
    var isLoggedIn: Bool{
        get{
            return userDefaults.bool(forKey: USER_LOGGED_IN_KEY)
        }
        set{
            userDefaults.set(newValue, forKey: USER_LOGGED_IN_KEY)
        }
    }
    
    var authToken: String{
        get{
            return userDefaults.value(forKey: USER_TOKEN_KEY) as! String
        }
        set{
            userDefaults.set(newValue, forKey: USER_TOKEN_KEY)
        }
    }
    
    func createRequestToken(completion:@escaping CompletionHandler){
        Alamofire.request(REQUEST_TOKEN_URL).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do{
                    let json = try JSON(data:data)
                    self.authToken = json[REQUEST_TOKEN_KEY].stringValue
                    completion(true)
                }catch let error {
                    debugPrint("AuthService.createRequestToken() \(error.localizedDescription)")
                    completion(false)
                }
            }else{
                debugPrint("AuthService.createRequestToken() \(response.result.error as Any)")
                completion(false)
            }
        }
    }
    
    func userLogin(username:String,password:String,completion:@escaping CompletionHandler){
        let header = ["Content-Type":"application/json"]
        let body:[String:Any] = [USERNAME_KEY:username,PASSWORD_KEY:password,REQUEST_TOKEN_KEY:self.authToken]
        Alamofire.request(USER_LOGIN_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do{
                    let json = try JSON(data:data)
                    if json["success"].boolValue {
                        self.isLoggedIn = true
                        completion(true)
                    }else{
                        completion(false)
                    }
                }catch let error {
                    debugPrint("AuthService.userLogin() \(error.localizedDescription)")
                    completion(false)
                }
            }else{
                debugPrint("AuthService.userLogin() \(response.result.error as Any)")
                completion(false)
            }
        }
    }
}
