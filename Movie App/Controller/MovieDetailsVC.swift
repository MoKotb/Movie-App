import UIKit

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleText: UILabel!
    @IBOutlet weak var movieReleaseDateText: UILabel!
    @IBOutlet weak var movieAverageText: UILabel!
    @IBOutlet weak var movieOverviewText: UILabel!
    
    var movieDetails:Movie!
    
    func initData(movie:Movie){
        self.movieDetails = movie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieData()
    }
    
    private func setMovieData(){
        navigationController?.topViewController?.title = movieDetails.title
        movieTitleText.text = movieDetails.title
        movieReleaseDateText.text = "Release Date: \(movieDetails.releaseDate ?? "")"
        movieAverageText.text = "Average: \(movieDetails.average ?? 0)"
        movieOverviewText.text = movieDetails.overview
        movieImage.image = movieDetails.getMovieImage()
    }
    
    @IBAction func onClosePressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
