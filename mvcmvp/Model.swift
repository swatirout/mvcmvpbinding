//
//  Model.swift
//  mvcmvp
//
//  Created by Swati Rout on 26/06/20.
//  Copyright © 2020 Swati Rout. All rights reserved.
//

import Foundation

struct  Model <T>{
    private var objects = [ T ]( )
    mutating func  insert (element:T){
        objects.insert(element, at: 0)
    }
    mutating func remove(at index:Int){
        guard objects.indices.contains(index) else{
            return
        }
        objects.remove(at: index)
    }
    var count:Int{
        return objects.count
    }
    subscript(index:Int) -> T?{
        return objects.indices.contains(index) ?objects[index]:nil
    }
}
