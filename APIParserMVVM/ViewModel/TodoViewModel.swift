//
//  TodoViewModel.swift
//  APIParserMVVM
//
//  Created by Sunkara on 4/19/23.
//

import Foundation

class TodoViewModel : NSObject {
    var url :String?
    private var apiManager : APIManager!
    
    
    private(set) var toDodata : ToDoResponse! {
        didSet {
            self.bindTodoViewModelToController()
        }
    }
    
    var bindTodoViewModelToController:(()->()) = {}
    
    override init() {
        super.init()
        self.apiManager = APIManager()
    }
    
    
    func callGetAllTodoList(){
        self.apiManager.getAllTodos(urlStr: url!) { result in
            
            switch result {
            case .success(let data):
                if let todoResponse = try? JSONDecoder().decode(ToDoResponse.self, from: data) {
                    self.toDodata = todoResponse
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

            }
          
        
        
    }
    
    func callAddToDoListItem() {
        self.apiManager.addTodoItemToServie(urlStr: url!) { result in
            switch result {
            case .success(let data): print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
}
