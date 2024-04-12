contract Payroll {
    address public employer;
    mapping(address => uint) public employeeSalaries;
    uint public totalFunds;

    constructor() {
        employer = msg.sender;
    }

    function addFunds() public payable {
        require(msg.sender == employer, "Only employer can add funds");
        totalFunds += msg.value;
    }

    function getTotalFunds() public view returns (uint) {
        return totalFunds;
    }

    function payEmployee(address payable employee) public {
        require(msg.sender == employer, "Only employer can pay employee");
        require(employeeSalaries[employee] > 0, "Employee salary is not set");
        require(
            totalFunds >= employeeSalaries[employee],
            "Not enough funds to pay employee."
        );
        employee.transfer(employeeSalaries[employee]);
        totalFunds -= employeeSalaries[employee];
    }

    function setEmployeeSalary(address employee, uint salary) public {
        require(msg.sender == employer, "Only employer can set salary");
        employeeSalaries[employee] = salary;
    }
}
