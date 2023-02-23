// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StudentManagement{

    struct Student{
        uint id;
        string name;
        uint age;
        bool isEnrolled;
        uint balance;
    }

    mapping(uint => Student) students;

    address public owner;
    uint public studentCount;
    uint enrollementFee;

    constructor(uint _enrollementFee){
        owner = msg.sender;
        studentCount = 0;
        enrollementFee = _enrollementFee;
    }

    modifier onlyOwner{
        require(msg.sender == owner, 'No access');
        _;
    }
    modifier enoughFee{
        require(msg.value == enrollementFee);
        _;
    }

    function addStudent(string memory _name, uint _age) public payable enoughFee{ // memory only for strings
        studentCount++;
        students[studentCount] = Student(studentCount, _name, _age, true, msg.value);
        }

    function getStudent(uint _id) public view returns(uint, string memory, uint, bool, uint){
        require(students[_id].isEnrolled, 'Not Enrolled');
        return(students[_id].id, students[_id].name, students[_id].age, students[_id].isEnrolled, students[_id].balance);

    }

    function deleteStudent(uint _id) public  onlyOwner {
        require(students[_id].isEnrolled, 'Not Enrolled');
        students[_id].isEnrolled = false;
        payable(msg.sender).transfer(students[_id].balance);
    }

    function updateStudent(uint _id, string memory _name, uint _age) public onlyOwner {
        require(students[_id].isEnrolled, 'Not Enrolled');
        students[_id].name = _name;
        students[_id].age = _age;
    }

}