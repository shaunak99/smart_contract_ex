const Voting = artifacts.require("Voting");
const truffleAssert = require('truffle-assertions');

contract("Voting", () => {

  it("should return Candidate Won", async () => {
    const instance = await Voting.deployed();
    
    for(var i=0; i<10;i++){
      await instance.upVote();
    }

    const status = await instance.getStatus();

    assert.equal(status,"Candidate Won");
  });

  it("should return Candidate Removed", async () => {
    const instance = await Voting.deployed();
    
    for(var i=0; i<20;i++){
      await instance.downVote();
    }

    const status = await instance.getStatus();

    assert.equal(status,"Candidate Removed");
  });
});
