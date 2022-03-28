//
//  ViewController.swift
//  WhatsappClone
//
//  Created by Matheus Lenke on 25/03/22.
//

import UIKit

class ChatViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    // MARK: Properties
    var messages: [Message] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: UI Elements
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemBackground
        return stack
    }()
    
    lazy var broadcastListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Broadcasts List", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newGroupButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Group", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var appearence: UINavigationBarAppearance! = {
        var appearence = UINavigationBarAppearance()
        
        appearence.shadowColor = .clear
        appearence.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        
        return appearence
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let appearance = UINavigationBarAppearance()
        let newChatButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callNewChatView))
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = newChatButton
        navigationItem.leftBarButtonItem = editButton
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        registerCell()
        delegates()
        loadData()
    }
    
    private func configUI() {
        safeArea = view.layoutMarginsGuide
        title = "Chats"
        
        configNavigationBar()
        
        view.backgroundColor = .white
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(broadcastListButton)
        horizontalStackView.addArrangedSubview(newGroupButton)
        view.addSubview(tableView)

        setupConstraints()
    }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Stack View
            horizontalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 40),
            
            // Table View
            tableView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            broadcastListButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func loadData() {
        
        ApiService.shared.getMessages { result in
            switch result {
            case .success(let messagesResult):
                self.messages = messagesResult
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    @objc private func callNewChatView() {
        let secondViewController = SecondViewController()
        
        navigationController?.present(secondViewController, animated: true)
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Message!")
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        let message = messages[indexPath.row]
        cell.setup(message)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
