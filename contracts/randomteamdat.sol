// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PremierLeagueTeamSelector {
    // Premier Lig takımları (20 takım)
    string[] private teams = [
        "Arsenal", "Aston Villa", "Bournemouth", "Brentford", "Brighton & Hove Albion",
        "Chelsea", "Crystal Palace", "Everton", "Fulham", "Leeds United",
        "Leicester City", "Liverpool", "Manchester City", "Manchester United",
        "Newcastle United", "Nottingham Forest", "Southampton", "Tottenham Hotspur",
        "West Ham United", "Wolverhampton Wanderers"
    ];

    // Kullanıcının seçilen takımını saklamak için mapping
    mapping(address => string) public userTeam;

    // Kullanıcının takımını belirleyen fonksiyon
    function write() external {
        // Kullanıcının adresinin son 2 hanesini al
        uint256 lastTwoDigits = uint256(uint160(msg.sender)) % 100;

        // Takım sayısı (20) ile mod alarak indeksi belirle
        uint256 teamIndex = lastTwoDigits % teams.length;

        // Kullanıcının takımını kaydet
        userTeam[msg.sender] = teams[teamIndex];
    }

    // Kullanıcının takımını döndüren fonksiyon
    function getMyTeam() external view returns (string memory) {
        return userTeam[msg.sender];
    }
}