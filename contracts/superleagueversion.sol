contract SuperLigTeamSelector {
    string[] private teams = [
        "Adana Demirspor", "Alanyaspor", "Antalyaspor", "Besiktas",
        "Fatih Karagumruk", "Fenerbahce", "Galatasaray", "Gaziantep FK",
        "Giresunspor", "Hatayspor", "Istanbul Basaksehir", "Istanbulspor",
        "Kasimpasa", "Kayserispor", "Konyaspor", "MKE Ankaragucu",
        "Sivasspor", "Trabzonspor"
    ];

    mapping(address => string) public userTeam;
    mapping(address => bool) public hasTeam; // New: Track if user has a team

    function write() external {
        uint256 teamIndex = block.timestamp % teams.length;
        userTeam[msg.sender] = teams[teamIndex];
        hasTeam[msg.sender] = true; // Mark as having a team
    }

    function getMyTeam() external view returns (string memory) {
        require(hasTeam[msg.sender], "You haven't selected a team yet!");
        return userTeam[msg.sender];
    }
}