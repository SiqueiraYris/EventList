//
//  EventDetailViewController.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var eventMap: MKMapView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    lazy var shareButton: UIBarButtonItem = {
        var image = UIImage(named: "share")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        button.action = #selector(didTapShareButton)
        return button
    }()
    
    var event: Event!
    
    var viewModel: EventDetailViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EventDetailViewModel()
        navigationItem.setRightBarButton(shareButton, animated: true)
        setupUI()
        setupMap()
        hideKeyboard()
    }
    
    @IBAction func didTapCheckInButton(_ sender: UIButton) {
        viewModel.checkIn(eventID: event.id, userName: userName.text ?? "", userEmail: userEmail.text ?? "")
    }
    
    func setupUI() {
        eventPrice.text = String(event.price)
        eventTitle.text = event.title
        eventDescription.text = event.description
        date.text = Date().createDateFromTimestamp(timestamp: event.date)
        if let imageURL = URL(string: event.image) {
            eventImage.kf.setImage(with: imageURL, placeholder: UIImage(named: "emptyImage"))
        }
    }
    
    func setupMap() {
        let center = CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        eventMap.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        eventMap.addAnnotation(annotation)
    }
    
    @objc func didTapShareButton() {
        var img = UIImage(named: "emptyImage")
        if let image = eventImage.image {
            img = image
        }
        
        let message = "Confira o evento: \(event.title)"
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [img as Any, message],
                                                                                       applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.copyToPasteboard,
                                                        UIActivity.ActivityType.postToVimeo]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension EventDetailViewController: EventDetailViewModelDelegate {
    
    func success(message: String) {
        self.showAlert(title: "Sucesso", message: message)
    }
    
    func hasError(error: Error) {
        var msg = "Erro desconhecido. Contatar o administrador."
        switch error {
        case CustomErrors.serverError:
            msg = "Erro de servidor. Contatar o administrador"
        default:
            msg = "Erro desconhecido. Contatar o administrador."
        }
        self.showAlert(title: "Erro", message: msg)
    }
    
}
