//
//  AppDelegate.swift
//  Link It
//
//  Created by Charles Kenney on 10/5/17.
//  Copyright © 2017 Charles Kenney. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        item.image = #imageLiteral(resourceName: "link")
        return item
    }()

    let statusMenu: NSMenu = {
        let menu = NSMenu()
        menu.addItem(withTitle: "Link It", action: #selector(makeLink), keyEquivalent: "l")
        menu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "q")
        return menu
    }()
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // setup application
        statusItem.menu = statusMenu
    }
    
    // MARK: - Makes link and posts to user's pasteboard
    @objc func makeLink() {
        
        // get pasteboard items
        guard let items = NSPasteboard.general.pasteboardItems else {
            // notify the user pasteboard is empty
            NSUserNotificationCenter.default.deliver(.EmptyPasteboard)
            return print("Pasteboard is empty")
        }
        // convert top item to string
        let topItem = items[0].string(forType: .string) ?? ""
        if (!topItem.isValidURL) {
            // notify the user top item is not a valid URL
            NSUserNotificationCenter.default.deliver(.InvalidURL)
            return print("Top item was not a valid URL")
        }
        // set top item to link
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: self)
        pasteboard.setString(linkify(topItem), forType: .string)
        NSUserNotificationCenter.default.deliver(.MadeLink)
    }
    
    // MARK: - Quits application
    @objc func quit() {
        
        NSApplication.shared.terminate(self)
    }
    
    
    // MARK: - Formats the string to an HTML anchor tag
    func linkify(_ link: String) -> String {
        
        return "<a href=\"\(link)\">Link Label</a>"
    }

}

