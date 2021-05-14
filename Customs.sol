pragma solidity ^0.4.19;
import "./Manager.sol";
contract Customs is main {
   
    event passed(uint orderId);
    event unpassed(uint orderId);
    event underweight(uint orderId);
    event overweight(uint orderId);
    
    uint Weight;
    uint Idealweight=1500;
    
    //compares manager_quantity with manufacturer_quantity
    function CheckWeight(uint orderId, uint Weight) public {
         require(msg.sender==flowOfObject[orderId].Addresses[currentaddress[orderId]]);
        if(Weight == itemMap[orderId].weight) 
          { statsMap[orderId].checkPoint="Product is checked by Costoms"; // Updates currentStatusOfOrder.
            statsMap[orderId].timeTheEventCalled=now; 
            passed(orderId);}
        else 
            {   statsMap[orderId].checkPoint="Product Weight is not correct"; // Updates currentStatusOfOrder.
                statsMap[orderId].timeTheEventCalled=now;
                unpassed(orderId);
            }
    }
    
    
    //Checks wheather manufacturer_quantity is Under IdealWeight or Over IdealWeight
    function ApproveInCategory(uint orderId) public returns(string) {
        if(itemMap[orderId].weight <= Idealweight) 
        {   statsMap[orderId].checkPoint="Product is Approved by Costoms"; // Updates currentStatusOfOrder.
            statsMap[orderId].timeTheEventCalled=now; 
            underweight(orderId);
        }
        else
        {   statsMap[orderId].checkPoint="Product is Over Weight, Charges will be applied"; // Updates currentStatusOfOrder.
            statsMap[orderId].timeTheEventCalled=now; 
            overweight(orderId);
        }
        transferPossesion(orderId);
    }
}
