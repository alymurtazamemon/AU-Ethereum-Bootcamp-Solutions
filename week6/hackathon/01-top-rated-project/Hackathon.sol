// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }

    Project[] projects;

    function findWinner() external view returns (Project memory) {
        Project[] memory projectsCopy = projects;
        uint highestRatings = 0;
        uint highRatedProjectIndex = 0;

        for (uint i = 1; i < projectsCopy.length; i++) {
            Project memory project = projectsCopy[i];

            uint sum = 0;
            for (uint j = 0; j < project.ratings.length; j++) {
                sum += project.ratings[j];
            }

            uint average = sum / project.ratings.length;

            if (average > highestRatings) {
                highestRatings = average;
                highRatedProjectIndex = i;
            }
        }

        return projectsCopy[highRatedProjectIndex];
    }

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}
