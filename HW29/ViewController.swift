//
//  ViewController.swift
//  HW29
//
//  Created by Максим Громов on 07.10.2024.
//

import UIKit
// MARK: - User
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

class ViewController: UIViewController {
    var users: [User] = []
    func fetchData() {
        print("fetching data...")
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                for u in self.users {
                    print("User: \(u.name), email: \(u.email), phone: \(u.phone), company: \(u.company.name)")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    


}

