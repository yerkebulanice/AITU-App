//
//  APIManager.swift
//  Social Media App (Endterm Project)
//
//  Created by malika abdrakhmanova on 24.02.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    
    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(id: String, imageID: String, completion: @escaping (Post?) -> Void) {
        let db = configureFB()
        db.collection("posts").document(id).getDocument() { (document, error) in
            guard error == nil else {completion(nil); return}
            self.getImage(id: imageID, completion: {image in
                let post = Post(name: document?.get("name") as! String, date: document?.get("date") as! String, text: document?.get("text") as! String, image: image)
                completion(post)
            })
        }
    }
    
    func getImage(id: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("pictures")
        var image: UIImage = UIImage(named: "logo")!
        let fileRef = pathRef.child(id + ".jpg")
        fileRef.getData(maxSize: 1024*1024, completion: {data, error in
            guard error == nil else {completion(image); return}
            image = UIImage(data: data!)!
            completion(image)
        })
    }
    
}

struct Post {
    let name: String
    let date: String
    let text: String
    let image: UIImage
}
