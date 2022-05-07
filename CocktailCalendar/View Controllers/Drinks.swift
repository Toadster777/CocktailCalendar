
import Foundation



class Drinks{
    
    struct Returned: Codable{
        var drinks: [Drink]
    }
    struct Drink: Codable {
        var strDrink = ""
    }
    let urlString = "https://thecocktaildb.com/api/json/v1/1/search.php?f=A"
    var drinkArray: [Drink] = []
    
    func getData(completed: @escaping ()->()){
        let headers = [
            "X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com",
            "X-RapidAPI-Key": "81737263d1msh7ea7caa649e9041p1796d7jsn6f003525b668"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/popular.php")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
             //   print("-------------------------------------")
                do {
                let returned = try  JSONDecoder().decode(Returned.self, from: data!)
                    self.drinkArray = self.drinkArray + returned.drinks
                    
                } catch {
                  
                }
                completed()
            }
        })

        dataTask.resume()

    }
}
