//Hellooo
//  ViewController.swift
//  Brain Break Project
//testtt
//  Created by Jayline Febles on 6/16/21.


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    var songs = [Song]()

    
    override func viewDidLoad() {
     super.viewDidLoad()
     configureSongs()
        table?.delegate = self
        table?.dataSource = self
   
    }
    
    func configureSongs() {
        
        songs.append(Song(name: "Brutal",
                          albumName: "Sour",
                          artistName: "Olivia Rodrigo",
                          imageName: "cover1",
                          trackName: "brutal"))
        songs.append(Song(name: "Stockholm Syndrome",
                          albumName: "Four",
                          artistName: "One Direction",
                          imageName: "cover2",
                          trackName: "stockholm"))
        songs.append(Song(name: "Night Changes",
                          albumName: "Four",
                          artistName: "One Direction",
                          imageName: "cover2",
                          trackName: "nightchanges"))
        songs.append(Song(name: "8TEEN",
                          albumName: "American Teen",
                          artistName: "Khalid",
                          imageName: "cover3",
                          trackName: "8TEEN"))
        songs.append(Song(name: "Golden",
                          albumName: "Fine Line",
                          artistName: "Harry Styles",
                          imageName: "cover4",
                          trackName: "Harry"))
        songs.append(Song(name: "traitor",
                          albumName: "Sour",
                          artistName: "Olivia Rodrigo",
                          imageName: "cover1",
                          trackName: "traitor"))
        songs.append(Song(name: "You belong with Me",
                          albumName: "Fearless",
                          artistName: "Taylor Swift",
                          imageName: "cover8",
                          trackName: "taylor"))
        songs.append(Song(name: "Rock your body",
                          albumName: "Justified",
                          artistName: "Justin Timberlake",
                          imageName: "cover9",
                          trackName: "justin"))
        songs.append(Song(name: "Super Bass",
                          albumName: "Pink Friday",
                          artistName: "Nicki Minaj",
                          imageName: "cover6",
                          trackName: "bass"))
        songs.append(Song(name: "The weekend (funk wav remix)",
                          albumName: "Ctrl",
                          artistName: "SZA x Calvin Harris",
                          imageName: "cover10",
                          trackName: "weeknd"))
        songs.append(Song(name: "What makes you beautiful",
                          albumName: "Up all night",
                          artistName: "One Direction",
                          imageName: "cover11",
                          trackName: "direction"))
        songs.append(Song(name: "She's kinda hot",
                          albumName: "Sounds Good Feels Good",
                          artistName: "5 SOS",
                          imageName: "cover12",
                          trackName: "sos"))
        songs.append(Song(name: "Determinate",
                          albumName: "Lemonade Mouth",
                          artistName: "Lemonade Mouth",
                          imageName: "cover7",
                          trackName: "mouth"))
        songs.append(Song(name: "Dancing in the Dark",
                          albumName: "Home",
                          artistName: "Rihanna",
                          imageName: "cover13",
                          trackName: "dark"))
        
        
        
        
        

        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
        return
    }
        vc.songs = songs
        vc.position = position
    present(vc, animated: true)
  }
        
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

