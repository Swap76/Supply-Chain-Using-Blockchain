pragma solidity 0.4.24;
import "./Manager.sol";
 contract LandTransport is main {
     
event OrderLoaded(uint _orderId);          // Defined Events.
event OrderInTranssit(uint _orderId);
event OrderUnloaded(uint _orderId);
 
function orderLoaded(uint _orderId){
     
    require(msg.sender==flowOfObject[_orderId].Addresses[currentaddress[_orderId]]);
    statsMap[_orderId].checkPoint="OrderLoadedByLandTransport"; // Updates currentStatusOfOrder.
    statsMap[_orderId].timeTheEventCalled=now;
    OrderLoaded(_orderId);  // Event OrderLoaded.
 }

function stateRequiredTimeToNextEntity(uint _orderId, uint _requiredTime){  // Give Estimate;
  statsMap[_orderId].timeToNextEntity = _requiredTime;
 } 
 

function orderUnloaded(uint _orderId){
  
    statsMap[_orderId].checkPoint="OrderUnloadedByLandTransport"; // Updates currentStatusOfOrder.
    statsMap[_orderId].timeTheEventCalled=now;
    OrderUnloaded(_orderId);
    transferPossesion(_orderId);
 }
}





