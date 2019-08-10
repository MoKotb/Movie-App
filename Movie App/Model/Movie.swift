import Foundation
import SwiftyJSON

class Movie{
    
    public private(set) var id:Int!
    public private(set) var title:String!
    public private(set) var poster:String!
    public private(set) var overview:String!
    public private(set) var releaseDate:String!
    public private(set) var average:Float!
    private var image:UIImage!
    
    init(){}
    
    init(id:Int,title:String,poster:String,overview:String,releaseDate:String,average:Float) {
        self.id = id
        self.title = title
        self.poster = poster
        self.overview = overview
        self.releaseDate = releaseDate
        self.average = average
    }
    
    func parseTopRatedMovies(data:Data) -> [Movie] {
        var moviesList = [Movie]()
        do{
            let json = try JSON(data: data)
            if let results = json["results"].array {
                for item in results {
                    let id = item["id"].intValue
                    let title = item["title"].stringValue
                    let poster = item["poster_path"].stringValue
                    let overview = item["overview"].stringValue
                    let releaseDate = item["release_date"].stringValue
                    let average = item["vote_average"].floatValue
                    let movie = Movie(id: id, title: title, poster: poster, overview: overview, releaseDate: releaseDate, average: average)
                    moviesList.append(movie)
                }
            }
        }catch let error{
            debugPrint("Movie.parseTopRatedMovies() \(error.localizedDescription)")
        }
        return moviesList
    }
    
    func setMovieImage(image:UIImage){
        self.image = image
    }
    
    func getMovieImage() -> UIImage{
        return image
    }
}
