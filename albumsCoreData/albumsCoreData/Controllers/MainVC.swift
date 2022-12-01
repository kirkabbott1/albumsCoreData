//
//  ViewController.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/25/22.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var albumTableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.prefetchDataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")

        return tableView
    }()
    
    var albumArr: Albums?
    let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json")
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.getFeed()
        setUpTableView()
        
    }
    
    func getFeed() {
        
        guard let url = url else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard error == nil else {
                print("errorrrrrr")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("invalid res")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("status code wrong")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Albums.self, from: data)
//                print(decodedData)
                DispatchQueue.main.async {
                    self.albumArr = decodedData //append(decodedData)
//                    print("albumArr: \(String(describing: self.albumArr))")
                    self.albumTableView.reloadData()
                }

            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func fetchRawData(url : URL, completion: @escaping(Data?) -> Void){
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            if let _ = error{
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }

        task.resume()
    }
    
    func setUpTableView(){
        self.albumTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.albumTableView.backgroundColor = .gray
        view.addSubview(self.albumTableView)
        
        self.albumTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8).isActive = true
        self.albumTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 8).isActive = true
        self.albumTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -8).isActive = true
        self.albumTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -8).isActive = true
        
    }
    
    
}



extension MainVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let albumResults = self.albumArr?.feed.results else {return 0}
        return albumResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.albumTableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as?
                AlbumTableViewCell else {
                return UITableViewCell()
            
        }
        guard let row = self.albumArr?.feed.results[indexPath.row] else {return UITableViewCell()}
        guard let pictureUrl = row.artworkUrl100 else{
            return UITableViewCell()
        }

        cell.nameLabel.text = row.name
        cell.artist.text = row.artistName
        
          
        self.fetchRawData(url: pictureUrl){
            picture in
            guard let picture = picture else{
                return
            }
            DispatchQueue.main.async {
                cell.albumImageView.image = UIImage(data: picture)
               
        }

    }
        return cell
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("anything")
        let detailVC = DetailVC()
//        detailVC.albumImageView = self.
        detailVC.nameLabel.text = self.albumArr?.feed.results[indexPath.row].name
        detailVC.artist.text = self.albumArr?.feed.results[indexPath.row].
        
        guard let cell: AlbumTableViewCell = tableView.cellForRow(at: indexPath) as? AlbumTableViewCell else{
            return
        }
//        detailVC.albumImageView = self.albumArr?feed.results[indexPath.row].
//        guard let row = self.albumArr?.feed.results[indexPath.row] else {
//            return UITableViewCell()
//
//        }
        guard let name = cell.nameLabel.text else {return}
        print("name is \(name)")
        
        guard name == self.albumArr?.feed.results[indexPath.row].name else {return}
        
        print("name is \(name)")
        
//        guard let AlbumURL = self.albumArr
        self.navigationController?.pushViewController(detailVC, animated: false)
    }
    
}
