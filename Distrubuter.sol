pragma solidity ^0.4.19;
import"./Manager.sol";
import"./Escrow.sol"; 
 contract Distrubuter is main ,Escrow  {
     
    event OrderRecievedAndAccepted(uint orderId);
     
    function OrderRecievedandAccepted (uint orderId){
            
        require(msg.sender==flowOfObject[orderId].Addresses[currentaddress[orderId]]);
        statsMap[orderId].checkPoint="OrderReceivedByDistrubuter"; // Updates currentStatusOfOrder.
        statsMap[orderId].timeTheEventCalled=now;
        payBalance(orderId);
        OrderRecievedAndAccepted(orderId);
    } 
 }
