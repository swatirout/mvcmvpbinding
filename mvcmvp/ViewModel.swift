//
//  Presenter.swift
//  mvcmvp
//
//  Created by Swati Rout on 27/06/20.
//  Copyright © 2020 Swati Rout. All rights reserved.
//

import Foundation

class ViewModel{
    private var myModel = Model<Observable<Date>>()
    
    func addEntry(){
        let dateObservable = Observable(_value: Date())
        myModel.insert(element: dateObservable)
        dateObservable.bind =  {  _  in
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "UpdateUI")))
            
        }
        DispatchQueue.main.asyncAfter( deadline:  DispatchTime.now()  + .seconds(5)) {
            dateObservable.value = Date()
        }
    }
    var count:Int{
        return myModel.count
    }
    func removeAt( at index:Int){
        myModel.remove(at: index)
    }
    subscript(index:Int)-> String?{
        guard let date = myModel[index] else{
            return nil
        }
        return date.value.description
        
    }
}
