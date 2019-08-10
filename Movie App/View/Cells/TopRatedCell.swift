import UIKit

class TopRatedCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    func configureCell(image:UIImage){
        movieImage.image = image
    }
}
