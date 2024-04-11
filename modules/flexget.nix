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
            - 3 Body Problem
            - 1883
            - 1899
            - 1923
            - Ahsoka
            - American Ninja Warrior
            - Americas Funniest Home Videos
            - Andor
            - Battlebots
            - Big Nate
            - Britannia
            - Carmen Sandiego
            - Carnival Row
            - Citadel
            - Cloak And Dagger
            - Condor
            - Cosmos A Spacetime Odyssey
            - Echo
            - Expedition Unknown
            - Fallout
            - For All Mankind
            - Foundation
            - Hawkeye
            - House of the Dragon
            - I Am Groot
            - Is It Cake
            - Legion
            - Loki
            - Lost In Space
            - Manifest
            - Moon Knight
            - Next Level Chef
            - Obi-Wan Kenobi
            - Peanuts
            - Percy Jackson and the Olympians
            - Rabbit Hole
            - Raised By Wolves
            - Reacher
            - SEAL Team
            - Secret Invasion
            - Severance
            - Shadow and Bone
            - Shark Tank
            - She-Hulk Attorney At Law
            - Sherlock
            - Silo
            - Special Ops Lioness
            - Star Trek Picard
            - Stranger Things
            - Ted Lasso
            - The Book of Boba Fett
            - The Falcon and the Winter Soldier
            - The Last Of Us
            - The Lord of the Rings The Rings of Power
            - The Mandalorian
            - The Peripheral
            - The Price Is Right
            - The Snoopy Show
            - The Terminal List
            - The Umbrella Academy
            - The Voice (US)
            - The Wheel of Time
            - The Witcher
            - Tom Clancy's Jack Ryan
            - Treadstone
            - Warrior Nun
            - What If
            - Whiskey Cavalier
            - Wild Kratts
            - Willow
            - Wolf Pack
            - Yellowstone 2018
      
      tasks:
      
        TorrentDay:
          rss: https://www.torrentday.com/torrents/rss?download;2;7;u=2515415;tp=da8032ed1d8644cdc674ac0c392e6b61
          template:
            - tv
     ''; 
  };
}
