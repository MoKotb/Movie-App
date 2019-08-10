import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    func getTopRatedMovies(completion:@escaping (_ moviesList:[Movie],_ error:Error?)->()){
        var moviesList = [Movie]()
        let movie = Movie()
        Alamofire.request(TOP_RATED_URL).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                moviesList = movie.parseTopRatedMovies(data: data)
                completion(moviesList,nil)
            }else{
                debugPrint("DataService.getTopRatedMovies() \(response.result.error as Any)")
                completion(moviesList,response.result.error)
            }
        }
    }
    
    func downloadImages(imageURl:String,completion:@escaping (_ image:UIImage?,_ status:Bool)->()){
        let url = "\(IMAGE_URL)\(imageURl)"
        Alamofire.request(url).responseImage { (response) in
            guard let image = response.result.value else {
                completion(nil,false)
                return
            }
            completion(image,true)
        }
    }
}
