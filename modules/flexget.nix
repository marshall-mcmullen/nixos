{ config, ... }:

{
  services.flexget = {
    enable = true;
    user = config.services.rtorrent.user;
    homeDir = "/var/lib/flexget";
    config = ''
      templates:
        global:
          download: /var/lib/rtorrent/watch

        tv:
          series:
            - 1883
            - A Discovery Of Witches
            - Ahsoka
            - American Ninja Warrior
            - Americas Funniest Home Videos
            - Among The Stars
            - Battlebots
            - Big Nate
            - Britannia
            - Carmen Sandiego
            - Carnival Row
            - Condor
            - Cosmos A Spacetime Odyssey
            - Expedition Unknown
            - For All Mankind
            - Foundation
            - Hanna
            - Hawkeye
            - He-Man and the Masters of the Universe 2021
            - Holey Moley
            - House of the Dragon
            - Hunted
            - I Am Groot
            - Is It Cake
            - Legion
            - Locke and Key
            - Loki
            - Lost In Space
            - Manifest
            - Marvels Cloak And Dagger
            - Marvels Guardians Of The Galaxy
            - Marvels Spider-Man
            - Moon Knight
            - Ms Marvel
            - Ninjago Masters of Spinjitzu
            - Obi-Wan Kenobi
            - Patriot
            - Raised By Wolves
            - Reacher
            - Savage Builds
            - SEAL Team
            - Severance
            - Shadow and Bone
            - Shark Tank
            - She-Hulk Attorney At Law
            - Sherlock
            - Star Trek Picard
            - Stranger Things
            - Ted Lasso
            - The Book of Boba Fett
            - The Expanse
            - The Falcon and the Winter Soldier
            - The Flash
            - The Last Of Us
            - The Lord of the Rings The Rings of Power
            - The Mandalorian
            - The Nevers
            - The Orville
            - The Price Is Right
            - The Sandman
            - The Snoopy Show
            - The Terminal List
            - The Umbrella Academy
            - The Voice (US)
            - The Walking Dead
            - The Wheel of Time
            - The Witcher
            - Tom Clancy's Jack Ryan
            - Treadstone
            - Vikings Valhalla
            - WandaVision
            - Warrior Nun
            - What If
            - Whiskey Cavalier
            - Wild Kratts
            - Willow
            - Wizards Tales of Arcadia
            - Yellowstone 2018
      
      tasks:
      
        TorrentDay:
          rss: https://www.torrentday.com/torrents/rss?download;2;7;u=2515415;tp=da8032ed1d8644cdc674ac0c392e6b61
          template:
            - tv
     ''; 
  };
}
