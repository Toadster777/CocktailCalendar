

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet var tableView: UITableView!
    
    var myData = Drinks()
    //let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        myData.getData{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.drinkArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = myData.drinkArray[indexPath.row].strDrink
        cell.textLabel?.textAlignment = .center
        //cell.myImageView.backgroundColor = .red
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Atoader70@yahoo.com
    
    // 	Asdert18@
    
  
    
}


