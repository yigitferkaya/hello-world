// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NBATeamSelector {
    // 30 NBA teams (ASCII-only)
    string[] private teams = [
        "Atlanta Hawks", "Boston Celtics", "Brooklyn Nets", "Charlotte Hornets",
        "Chicago Bulls", "Cleveland Cavaliers", "Dallas Mavericks", "Denver Nuggets",
        "Detroit Pistons", "Golden State Warriors", "Houston Rockets", "Indiana Pacers",
        "Los Angeles Clippers", "Los Angeles Lakers", "Memphis Grizzlies", "Miami Heat",
        "Milwaukee Bucks", "Minnesota Timberwolves", "New Orleans Pelicans", "New York Knicks",
        "Oklahoma City Thunder", "Orlando Magic", "Philadelphia 76ers", "Phoenix Suns",
        "Portland Trail Blazers", "Sacramento Kings", "San Antonio Spurs", "Toronto Raptors",
        "Utah Jazz", "Washington Wizards"
    ];

    mapping(address => string) public userTeam;
    mapping(address => bool) private hasTeam;

    // Selects a team based on block.timestamp
    function write() external {
        require(!hasTeam[msg.sender], "You already have a team!");

        uint256 teamIndex = block.timestamp % teams.length;
        userTeam[msg.sender] = teams[teamIndex];
        hasTeam[msg.sender] = true;
    }

    // Returns the user's selected team
    function getMyTeam() external view returns (string memory) {
        require(hasTeam[msg.sender], "You haven't selected a team yet!");
        return userTeam[msg.sender];
    }
}