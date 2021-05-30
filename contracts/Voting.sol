// SPDX-License-Identifier: MIT
pragma solidity >=0.5.12<=0.8.4;

contract Voting
{
    int256 public votes=0;

    event Voted(string sign);
    event Count(int256 count);

    constructor() {
        votes = 0;
    }

    function upVote() public {
        votes++;
        emit Voted("+");
        emit Count(votes);
    } 

    function downVote() public {
        votes--;
        emit Voted("-");
        emit Count(votes);
    }

    //Voting Wins if 10 upVotes Received
    //Candidate removed if 10 downVotes Received (on account of lack of trust)
    function getStatus() public view returns (string memory) {
        if(votes >=10) return "Candidate Won";
        if(votes <=10) return "Candidate Removed";
    }

}