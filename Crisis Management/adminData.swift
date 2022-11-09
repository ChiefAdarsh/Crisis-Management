//
//  adminData.swift
//  Crisis Management
//
//  Created by Ashwin Indurti on 11/7/22.
//

import Foundation

var number = "214-496-"

var adminList: [Admin] = []

enum AdminType {
    case Principal
    case Counselor
}

class Admin {
    
    var adminType: AdminType
    var adminTypeDetailed: String
    var lastName: String
    var firstName: String
    var username: String
    var callExt: Int
    var imgStr: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var number: String {
        return number + String(callExt)
    }
    
    var email: String {
        return username + "@coppellisd.com"
    }
    
    var callLink: String {
        return "https://teams.microsoft.com/l/chat/0/0?users=\(email)"
    }
    
    init(imgStr: String, adminType: AdminType, lastName: String, firstName: String, username: String, callExt: Int, adminTypeDetailed: String) {
        self.adminType = adminType
        self.lastName = lastName
        self.firstName = firstName
        self.username = username
        self.callExt = callExt
        self.adminTypeDetailed = adminTypeDetailed
        self.imgStr = imgStr
    }
    
}

func createAdmins() {
    
    // PRINCIPALS

    var admin = Admin(imgStr: "Springer_crop", adminType: AdminType.Principal, lastName: "Springer", firstName: "Laura", username: "lspringer", callExt: 6104, adminTypeDetailed: "Principal")
    adminList.append(admin)

    admin = Admin(imgStr: "Arnold_crop", adminType: AdminType.Principal, lastName: "Arnold", firstName: "Melissa", username: "marnold", callExt: 6122, adminTypeDetailed: "Associate Principal")
    adminList.append(admin)

    admin = Admin(imgStr: "Rix_crop", adminType: AdminType.Principal, lastName: "Rix", firstName: "Aylor", username: "arix", callExt: 6124, adminTypeDetailed: "Assistant Principal (A-C)")
    adminList.append(admin)

    admin = Admin(imgStr: "Osborne_crop", adminType: AdminType.Principal, lastName: "Osborne", firstName: "Cindi", username: "cosborne", callExt: 6126, adminTypeDetailed: "Assistant Principal (D-J)")
    adminList.append(admin)

    admin = Admin(imgStr: "Gollner_crop", adminType: AdminType.Principal, lastName: "Gollner", firstName: "Chris", username: "cgollner", callExt: 6123, adminTypeDetailed: "Assistant Principal (K-M)")
    adminList.append(admin)

    admin = Admin(imgStr: "Porter_crop", adminType: AdminType.Principal, lastName: "Porter", firstName: "Zane", username: "zporter", callExt: 0, adminTypeDetailed: "Assistant Principal (N-Sf)")
    adminList.append(admin)

    admin = Admin(imgStr: "Girard_crop", adminType: AdminType.Principal, lastName: "Girard", firstName: "Brandon", username: "bgirard", callExt: 0, adminTypeDetailed: "Assistant Principal (Sg-Z)")
    adminList.append(admin)

    // COUNSELORS

    admin = Admin(imgStr: "Cinelli_crop", adminType: AdminType.Counselor, lastName: "Cinelli", firstName: "Ann", username: "acinelli", callExt: 6112, adminTypeDetailed: "Lead Counselor (Rod-Som)")
    adminList.append(admin)

    admin = Admin(imgStr: "Abreu_crop", adminType: AdminType.Counselor, lastName: "Abreu", firstName: "Cheryl", username: "cabreu", callExt: 6132, adminTypeDetailed: "Counselor (A-Cham)")
    adminList.append(admin)

    admin = Admin(imgStr: "McMillin_crop", adminType: AdminType.Counselor, lastName: "McMillin", firstName: "Laura", username: "lmcmillin", callExt: 6106, adminTypeDetailed: "Counselor (Chan-Gox)")
    adminList.append(admin)

    admin = Admin(imgStr: "Kennington_crop", adminType: AdminType.Counselor, lastName: "Kennington", firstName: "Michael", username: "mkennington", callExt: 6133, adminTypeDetailed: "Counselor (Goy-Kiv)")
    adminList.append(admin)

    admin = Admin(imgStr: "Oh_crop", adminType: AdminType.Counselor, lastName: "Oh", firstName: "Lindsey", username: "loh", callExt: 6136, adminTypeDetailed: "Counselor (Nal-Roc)")
    adminList.append(admin)

    admin = Admin(imgStr: "Tremethick_crop", adminType: AdminType.Counselor, lastName: "Tremethick", firstName: "Keith", username: "ktremethick", callExt: 6131, adminTypeDetailed: "Counselor (Son-Z)")
    adminList.append(admin)

    admin = Admin(imgStr: "Crumpton_crop", adminType: AdminType.Counselor, lastName: "Crumpton", firstName: "Heather", username: "hcrumpton", callExt: 6135, adminTypeDetailed: "Counselor (Kiw-Nah)")
    adminList.append(admin)

    // Sort

}

func findAdmin(username: String) -> Admin {
    createAdmins()
    for admin in adminList {
        if admin.username == username {
            return admin
        }
    }
    return Admin(imgStr: "AA", adminType: AdminType.Counselor, lastName: "NA", firstName: "NA", username: "NA", callExt: 0, adminTypeDetailed: "NA")
}


