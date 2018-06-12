pragma solidity ^0.4.0;
import "./ownable.sol";
contract Portfolio is Ownable {

    struct MyPortfolio {
        string [] jobs_url;
        string [] diplomas_url;
        string tel;
        uint fee;
    }
    
    mapping (address => MyPortfolio) portfolios;
    
    event JobAdded();
    event DiplomaAdded();
    event TelAdded();
    event FeeAdded();
    
    function addJob(string _job_url) onlyOwner external {
        MyPortfolio storage myport = portfolios[msg.sender];
        myport.jobs_url.push(_job_url);
        emit JobAdded();
    }
    
    function addDiploma(string _diploma_url) onlyOwner external {
        MyPortfolio storage myport = portfolios[msg.sender];
        myport.diplomas_url.push(_diploma_url);
        emit DiplomaAdded();
    }
    
    function getJobCount(address a) view external returns(uint) {
        MyPortfolio memory myport = portfolios[a];
        return (myport.jobs_url.length);
    }
    
    function getDiplomaCount(address a) view external returns(uint) {
        MyPortfolio memory myport = portfolios[a];
        return (myport.diplomas_url.length);
    }
    
    function getJob(address a, uint i) view external returns(string) {
        MyPortfolio memory myport = portfolios[a];
        // my port null
        string[] memory jobs = myport.jobs_url;
        return (jobs[i]);
    }
    
    function getDiploma(address a, uint i) view external returns(string) {
        MyPortfolio memory myport = portfolios[a];
        // my port null
        string[] memory diplomas = myport.diplomas_url;
        return (diplomas[i]);
    }
    
    function setTel(string _tel) external {
        MyPortfolio storage myport = portfolios[msg.sender];
        myport.tel = _tel;
        emit TelAdded();
    }
    
    function setFee(uint _fee) external {
        MyPortfolio storage myport = portfolios[msg.sender];
        myport.fee = _fee;
        emit FeeAdded();
    }
    
    function getTel(address a) external payable returns (string) {
        MyPortfolio memory myport = portfolios[a];
        require(msg.value == myport.fee);
        return (myport.tel);
    }
    
}
