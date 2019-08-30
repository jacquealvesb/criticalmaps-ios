//
//  TwitterViewController.swift
//  CriticalMaps
//
//  Created by Leonard Thomas on 1/28/19.
//

import UIKit

class TwitterViewController: UIViewController, ContentStatePresentable {
    private let messagesTableViewController = MessagesTableViewController<TweetTableViewCell>(style: .plain)
    private let twitterManager: TwitterManager

    var contentStateViewController: UIViewController? {
        willSet {
            if let controller = contentStateViewController {
                controller.remove()
            }
            guard let viewController = newValue else {
                return
            }
            addAndLayoutStateView(viewController, in: view)
        }
    }

    init(twitterManager: TwitterManager) {
        self.twitterManager = twitterManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMessagesTableViewController()
        twitterManager.getTweets()
    }

    private func configureMessagesTableViewController() {
        messagesTableViewController.noContentMessage = String.twitterNoData
        messagesTableViewController.pullToRefreshTrigger = twitterManager.loadTweets
        messagesTableViewController.selectMessageTrigger = { [weak self] selectedTweet in
            self?.openTweet(selectedTweet)
        }

        twitterManager.updateContentStateCallback = { [weak self] contentState in
            switch contentState {
            case let .results(tweets):
                self?.messagesTableViewController.update(messages: tweets)
                self?.contentStateViewController = nil
            case let .loading(loadingViewController):
                self?.contentStateViewController = loadingViewController
            case .error:
                self?.contentStateViewController = nil
            }
        }

        add(messagesTableViewController)
        messagesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            messagesTableViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            messagesTableViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            messagesTableViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messagesTableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        // inset tableView seperator
        messagesTableViewController.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 73.0, bottom: 0.0, right: 0.0)
    }
}

private extension TwitterViewController {
    func openTweet(_ tweet: Tweet) {
        if let webURL = tweet.webURL, UIApplication.shared.canOpenURL(webURL) {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        } else {
            //Do nothing
        }        
    }
}

private extension Tweet {
    var webURL: URL? {
        return URL(string: "https://twitter.com/\(user.screen_name)/status/\(id_str)")
    }
}
