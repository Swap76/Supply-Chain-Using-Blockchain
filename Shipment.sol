pragma solidity ^0.4.19;
import "./Manager.sol";

contract ShipmentTracking is main{
   
    event DepartedFromOnePort(uint shipmentId);
    event ArrivedAtAnotherPort(uint shipmentId);
    
    uint shipmentId;
    uint orderId;
    
    function stateRequiredTimeToNextEntity(uint _orderId, uint _requiredTime){ // Give Estimate;
    
        statsMap[_orderId].timeToNextEntity = _requiredTime;
    } 
    
    function arrived(uint shipmentId) public 
    {            
        require(msg.sender==flowOfObject[orderId].Addresses[currentaddress[orderId]]);
        statsMap[orderId].checkPoint="ArrivedAtNearestPort"; // Updates currentStatusOfOrder.
        statsMap[orderId].timeTheEventCalled=now;
        transferPossesion(orderId);
        ArrivedAtAnotherPort(shipmentId);
    }
    
    function departured(uint shipmentId, string shipagentname) public 
    {   
        statsMap[orderId].checkPoint="DepartedFromThePort"; // Updates currentStatusOfOrder.
        statsMap[orderId].timeTheEventCalled=now;
        DepartedFromOnePort(shipmentId);
    }
}
