// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DecentralizedFundingContract {
    
    enum StateFun {Opened, Closed}
    
    struct Contribution {
        address author;
        uint monto;
    }

    struct Crowfunding {
        string id;
        string  name;
        string description;
        address payable owner;
        StateFun state;
        uint fund;
        uint fundrasingGoal;
    }
    
    Crowfunding[] public crowfundings;
    mapping (string => Contribution[]) public contributions;

    event ProjectCreated(string ProjectId, string name, string description, uint fundrasingGoal);

    event FProject(string ProjectId, uint valor);
    event CProject(string Id, StateFun Estado);
    

    modifier onlyOwner(uint projectIndex) {
        require(crowfundings[projectIndex].owner == msg.sender, "Only owner can change the state");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    modifier NoOwnerFund(uint projectIndex) {
        require(crowfundings[projectIndex].owner != msg.sender , "As Owner can't fund ur account");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    function createProject(string calldata id, string calldata name, string calldata description, uint fundraisingGoal) public{
        require(fundraisingGoal > 0, "fundraising goal must be greater than 0");
        Crowfunding memory crowfunding = Crowfunding(id,name,description,payable(msg.sender),StateFun.Opened,0,fundraisingGoal);
        crowfundings.push(crowfunding);
        emit ProjectCreated(id,name,description,fundraisingGoal);
    }

    function FundProject(uint projectIndex) public payable NoOwnerFund(projectIndex){
        Crowfunding memory crowfunding = crowfundings[projectIndex];
        require (crowfunding.state != StateFun.Closed, "Te project cant recive funds");
        require (msg.value > 0, "Fund value must be more than 0");
        crowfunding.owner.transfer(msg.value);
        crowfunding.fund += msg.value;
        crowfundings[projectIndex] = crowfunding;

        contributions[crowfunding.id].push(Contribution(msg.sender,msg.value));

        emit FProject(crowfunding.id, msg.value);
    }

    function changeProjectState(StateFun newState, uint projectIndex) public onlyOwner(projectIndex){
        Crowfunding memory crowfunding = crowfundings[projectIndex];
        require (crowfunding.state != newState, "New state must be different");
        crowfunding.state = newState;

        crowfundings[projectIndex] = crowfunding;

        emit CProject(crowfunding.id, newState);
    }


}