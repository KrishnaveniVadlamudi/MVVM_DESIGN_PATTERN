//
//  InputViewController.swift
//  APIParser
//
//  Created by Sunkara on 4/17/23.
//

import UIKit

class InputViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var parseBtn : UIButton!
    @IBOutlet weak var todoListTableView : UITableView!
    var todoListArray: [Todo] = []
    var todoViewmodel : TodoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchProdctListData()
    }
    

    func setupUI() {
        self.title = "TO DO"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        todoListTableView.dataSource = self
        todoListTableView.delegate = self
        todoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc func addTapped() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddTodoViewController") as? AddTodoViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    func fetchProdctListData() {
        // intialize api
        self.todoViewmodel = TodoViewModel()
        self.todoViewmodel.url = "https://dummyjson.com/todddos/"
        self.todoViewmodel.bindTodoViewModelToController = {
            self.todoListArray = self.todoViewmodel.toDodata.todos
            self.updateTableView()
        }
        self.todoViewmodel.callGetAllTodoList()

    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.todoListTableView.reloadData()
        }
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for:indexPath)
        let todoItem = todoListArray[indexPath.row]
        cell.textLabel?.text = todoItem.todo!
        if todoItem.completed! {
            cell.backgroundColor = .gray  }
        else {
            cell.backgroundColor = .green }
    
        return cell
    }
}
