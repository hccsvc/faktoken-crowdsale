pragma solidity ^0.4.18;

import "./erc223TokenInterface.sol";
import "./safemath.sol";
import "./receivingContract.sol";

contract FakToken is ERC223 {
    using safeMath for uint;
    string public constant name = "FakToken";
    string public constant symbol = "FAK";
    uint8 public constant decimals = 18; 
    address owner;
    uint public totalSupply = 0;
    uint public constant FAKRATE = 200;
    mapping(address => uint256) private balances;
    
    function FakToken() public {
        owner = msg.sender;
    }
    
    function () public payable {
        createToken();
    }
    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }
    
    function isContract(address _to) private returns (bool is_contract) {
        uint length;
        assembly {
            length := extcodesize(_to)
        }
        if (length > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    function createToken() public payable {
        require(msg.value > 0);
        uint tokens = msg.value.mul(FAKRATE);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        totalSupply = totalSupply.add(tokens);
        owner.transfer(msg.value);
    }
    
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value);
        balances[_to] = balances[_to].add(_value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        if (isContract(_to)) {
            ReceivingContract receiver = ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, "empty");
        }
        emit Transfer(msg.sender, _to, _value, "empty");
    }
    
    function transfer(address _to, uint256 _value, bytes _data) public {
        require(balances[msg.sender] >= _value);
        balances[_to] = balances[_to].add(_value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        if (isContract(_to)) {
             ReceivingContract receiver = ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
        emit Transfer(msg.sender, _to, _value, _data);
    }
    
}
