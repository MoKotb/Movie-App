import Foundation

//Identifiers
let LOGIN_VC_IDENTIFIER = "LoginVC"

//URLs Keys
let API_KEY = "api_key"
let API_KEY_VALUE = "301781009a72c5f89aabf7df492e9426"
let USERNAME_KEY = "username"
let PASSWORD_KEY = "password"
let REQUEST_TOKEN_KEY = "request_token"

//URLs
let BASE_URL = "https://api.themoviedb.org/3/authentication/token/"
let REQUEST_TOKEN_URL = "\(BASE_URL)new?\(API_KEY)=\(API_KEY_VALUE)"
let USER_LOGIN_URL = "\(BASE_URL)validate_with_login?\(API_KEY)=\(API_KEY_VALUE)"

//User Defaults
let USER_TOKEN_KEY = "userToken"
let USER_LOGGED_IN_KEY = "userLogin"

//Typealias
typealias CompletionHandler = (_ Success:Bool) -> ()
