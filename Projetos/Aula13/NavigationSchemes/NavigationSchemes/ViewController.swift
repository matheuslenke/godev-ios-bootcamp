//
//  ViewController.swift
//  NavigationSchemes
//
//  Created by Matheus Lenke on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App 2"
        
        view.backgroundColor = .systemIndigo
    }

    @IBAction func getFacebook(_ sender: UIButton) {
        let schemes = "fb://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    @IBAction func getWhatsapp(_ sender: Any) {
        let schemes = "whatsapp://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getMaps(_ sender: Any) {
        let schemes = "maps://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
    @IBAction func getNumberPhone(_ sender: Any) {
        let schemes = "tel://+55(27)999405527"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getSMS(_ sender: Any) {
        let schemes = "sms://+55(27)999405527"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    @IBAction func getEmail(_ sender: Any) {
        let recipientEmail = "matheuslenke@gmail.com"
        let subject = "Title Subject"
        let body = "Email de teste!"
        

        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
    }
    
    @IBAction func getEmailGmail(_ sender: Any) {
        print("Abrir gmail")
        let recipientEmail = "matheuslenke@gmail.com"
        let subject = "Title Subject"
        let body = "Email de teste!"
        
        createEmail(to: recipientEmail, subject: subject, body: body)
    }
    
    
    private func createEmail(to: String, subject: String, body: String) {
        
        var schemes = ""
        
        if let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            schemes = "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)"
            
        }
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .sent:
            print("Enviado")
        case .saved:
            print("Salvou")
        case .cancelled:
            print("Cancelou")
        case .failed:
            print("Falhou")
        @unknown default:
            print("Default")
        }
    }
}
