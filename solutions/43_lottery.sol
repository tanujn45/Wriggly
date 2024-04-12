pragma solidity ^0.8.4;

contract Lottery {
    struct Ticket {
        uint id;
        address owner;
    }

    Ticket[100] public tickets;
    uint public ticketCount;
    address payable winner;

    constructor(uint _ticketCount) {
        ticketCount = _ticketCount;
    }

    function buyTicket(uint id) public payable {
        require(msg.value == 1 ether, "Ticket price is 1 ether.");
        require(ticketCount < tickets.length, "No more tickets available");
        tickets[ticketCount] = Ticket(id, msg.sender);
        ticketCount++;
        payable(address(this)).transfer(msg.value);
    }

    function drawWinner() public {
        require(ticketCount > 0, "No tickets sold.");
        uint winnerIndex = uint(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    block.prevrandao,
                    tickets.length
                )
            )
        ) % tickets.length;
        winner = payable(tickets[winnerIndex].owner);
        payable(winner).transfer(address(this).balance);
    }

    function getWinner() public view returns (address) {
        require(winner != address(0), "Please implement drawWinner");
        return winner;
    }
}
