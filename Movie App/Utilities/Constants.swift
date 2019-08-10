import Foundation

//Identifiers
let LOGIN_VC_IDENTIFIER = "LoginVC"
let MAIN_TAB_BAR_IDENTIFIER = "MainTabbar"
let MOVIE_DETAILS_VC_IDENTIFIER = "MovieDetailsVC"

//Cells
let TOP_RATED_CELL = "TopRatedCell"

//URLs Keys
let API_KEY = "api_key"
let API_KEY_VALUE = "301781009a72c5f89aabf7df492e9426"
let USERNAME_KEY = "username"
let PASSWORD_KEY = "password"
let REQUEST_TOKEN_KEY = "request_token"

//URLs
let BASE_URL = "https://api.themoviedb.org/3/"
let REQUEST_TOKEN_URL = "\(BASE_URL)authentication/token/new?\(API_KEY)=\(API_KEY_VALUE)"
let USER_LOGIN_URL = "\(BASE_URL)authentication/token/validate_with_login?\(API_KEY)=\(API_KEY_VALUE)"
let TOP_RATED_URL = "\(BASE_URL)movie/top_rated?\(API_KEY)=\(API_KEY_VALUE)"
let IMAGE_URL = "http://image.tmdb.org/t/p/w342"

//User Defaults
let USER_TOKEN_KEY = "userToken"
let USER_LOGGED_IN_KEY = "userLogin"

//Typealias
typealias CompletionHandler = (_ Success:Bool) -> ()
