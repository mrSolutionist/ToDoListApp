

import Foundation

class GetloginData {
    
    static let instance = GetloginData()
    private var loggedInUser : UserData?
    
    func getLoginData () -> UserData? {
        return loggedInUser
    }
    
    func resetLoginData() {
        loggedInUser = nil
    }
    
   
}



