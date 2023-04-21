//
//  AddTodoViewController.swift
//  APIParserMVVM
//
//  Created by Sunkara on 4/19/23.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var enterTodoTitleField :UITextField!
    @IBOutlet weak var addButton : UIButton!
    
    var todoViewmodel : TodoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonTapped(_ sender : UIButton) {
        
        addTodoItemToServer()
  
    }
    
    func addTodoItemToServer() {
        // intialize api
        self.todoViewmodel = TodoViewModel()
        self.todoViewmodel.url = "https://dummyjson.com/todos/add"
        self.todoViewmodel.bindTodoViewModelToController = {
            print("Response got")
////            self.todoListArray = self.todoViewmodel.toDodata.todos
   //         self.updateTableView()
        }
        self.todoViewmodel.callAddToDoListItem()

    }

}
