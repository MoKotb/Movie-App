import UIKit

class MovieDetailsVC: UIViewController {

    var movieDetails:Movie!
    
    func initData(movie:Movie){
        self.movieDetails = movie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
