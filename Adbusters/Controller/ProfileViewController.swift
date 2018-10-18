import UIKit
import MessageUI
import SVProgressHUD

var menu : [String]?
var isLogged = false
var myIndex = 0

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor(red:0.31, green:0.13, blue:0.47, alpha:1.0)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Table View
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (isLogged) {
            menu = ["Рейтинг", "Інструкція", "Зворотній зв'язок", "Facebook", "Вийти"]
        } else {
            menu = ["Рейтинг", "Моя реклама", "Інструкція", "Зворотній зв'язок", "Facebook", "Увійти"]
        }
        
        return menu!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menu![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        if (menu![myIndex] == "Facebook") {
            let url = URL(string: "https://www.facebook.com/chesno.movement/")
            UIApplication.shared.open(url!)
        } else if (menu![myIndex] == "Зворотній зв'язок") {
            if let url = URL(string: "mailto:info.chesno@gmail.com") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if (menu![myIndex] == "Рейтинг") {
            performSegue(withIdentifier: "goToRate", sender: nil)
        } else if (menu![myIndex] == "Моя реклама") {
            performSegue(withIdentifier: "goToMyAds", sender: nil)
        } else if (menu![myIndex] == "Інструкція") {
            performSegue(withIdentifier: "goToInstructions", sender: nil)
        } else if (menu![myIndex] == "Вийти") {
            SVProgressHUD.showSuccess(withStatus: "Успішно вийшли")
            SVProgressHUD.dismiss(withDelay: 1.0) {
                self.performSegue(withIdentifier: "goToMain", sender: nil)
                isLogged = false
            }
        } else if (menu![myIndex] == "Увійти") {
            SVProgressHUD.showSuccess(withStatus: "Успішно увійшли")
            SVProgressHUD.dismiss(withDelay: 1.0) {
                isLogged = true
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}