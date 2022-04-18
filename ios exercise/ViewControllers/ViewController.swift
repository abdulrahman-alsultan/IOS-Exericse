//
//  ViewController.swift
//  ios exercise
//
//  Created by user220264 on 4/16/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    
    var viewModel = ArticlesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        setup()
        
    }
    
    func setup(){
        viewModel.getArticles()
        viewModel.reloadList = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.title = self?.viewModel.apiTitle
            }
            
        }
    }
    @IBAction func refresh(_ sender: Any) {
        setup()
    }
    

}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        
        let article = viewModel.articles[indexPath.row]
        
        cell.configure(title: article.title, describe: article.content, img: article.imageURL)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DisplayDetails", sender: viewModel.articles[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        let details = sender as! Article
        destination.imageURL = details.imageURL
        destination.describe = details.content
        destination.titleTxt = details.title
    }
    
}

