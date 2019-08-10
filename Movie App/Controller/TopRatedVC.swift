import UIKit

class TopRatedVC: UIViewController {

    @IBOutlet weak var noMovies: UIStackView!
    @IBOutlet weak var moviesCollection: UICollectionView!
    
    var moviesList = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        downloadMovies()
    }
    
    private func setupView(){
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        noMovies.isHidden = true
    }
    
    private func downloadMovies(){
        DataService.instance.getTopRatedMovies { (list, error) in
            if error == nil {
                if list.count > 0 {
                    self.moviesCollection.isHidden = false
                    self.moviesList = list
                    self.moviesCollection.reloadData()
                }else{
                    self.moviesIsEmpty()
                }
            }else{
                self.moviesIsEmpty()
            }
        }
    }
    
    private func moviesIsEmpty(){
        moviesCollection.isHidden = true
        noMovies.isHidden = false
    }
}

extension TopRatedVC: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TOP_RATED_CELL, for: indexPath) as? TopRatedCell{
            let movie = moviesList[indexPath.row]
            DataService.instance.downloadImages(imageURl: movie.poster) { (image, success) in
                if success {
                    cell.configureCell(image: image!)
                }
            }
            return cell
        }else{
            return TopRatedCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieDetailsVC = storyboard?.instantiateViewController(withIdentifier: MOVIE_DETAILS_VC_IDENTIFIER) as? MovieDetailsVC else { return }
        let movie = moviesList[indexPath.row]
        movieDetailsVC.initData(movie: movie)
        present(movieDetailsVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns : CGFloat = 2
        let cellWidthDimension = moviesCollection.bounds.width / numberOfColumns
        let cellHeightDimension : CGFloat = 300
        return CGSize(width: cellWidthDimension, height: cellHeightDimension)
    }
}
