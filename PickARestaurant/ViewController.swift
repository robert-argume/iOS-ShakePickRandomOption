

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    // shake device (or simulator), watch console for response
    // note that this does not disable Undo by shaking in text field
    
    // List of restaurant to pick from
    private let restaurants = ["Azyun Restaurant", "Canbe Foods", "Kingsmen Pub & Grill", "Roll N Bowl", "Scarborough Buffet", "Scaddabush Italian Kitchen", "Fat Ninja Bite", "100 Percent Korean", "The Real McCoy Burgers", "Hibachi Grill", "Babu Catering", "Chris Caribbean Bistro", "The Dumpling King", "Kub Khao Thai Eatery", "Bihari Kabab House", "Ten Ichi Japanese Restaurant" ]
    
    private let descriptions = ["Chinese, Asian Fusion, Tapas Bar", "Indian, Sri Lanka", "American Traditional , Pubs, Sports Bar", "Japanese, Korean", "Buffets, Turkish", "Italian, Pizza, Bars", "Japanese Burger, Korean", "Korean, Traditional, Fusion", "Grill, Burgers", "Japanese Grill, Bars", "Indian Traditional", "Caribbean, Latinamerican", "Chinese, Singapour", "Thailand, Filipino, Traditional", "Indian, Halai, Pakistani", "Japanese, desserts" ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    // Methods for managing first responder
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    // Capture shake event
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if self.isFirstResponder {
            print("hey, you shook me!")
            let alert = UIAlertController(title: "Hey", message: "You shook me!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        } else {
            super.motionEnded(motion, with: event)
        }
    }
    
    func textFieldDidEndEditing (_ textField:UITextField) {
        print("end editing")
        self.becomeFirstResponder()
    }
    
    
    
    // Methods for table view
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let movieSelected = restaurants[indexPath.row]
        let message = "You selected \(movieSelected)"
        
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        return indexPath.row % 4
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if( cell == nil) {
            cell = UITableViewCell(
                //style: UITableViewCellStyle.default,
                style: UITableViewCellStyle.subtitle,
                //style: UITableViewCellStyle.value1,
                //style: UITableViewCellStyle.value2,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
//        if( indexPath.row < 2) {
//            cell?.detailTextLabel?.text = "Super heroes"
//        }
//        else {
//            cell?.detailTextLabel?.text = "Sci-Fi"
//        }
        cell?.detailTextLabel?.text = descriptions[indexPath.row]
        
        cell?.textLabel?.text = restaurants[indexPath.row]
        return cell!
    }
    
    
}

