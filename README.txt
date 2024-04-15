Project Description
This project is a decentralized funding platform on the Ethereum blockchain. It allows users to create projects and receive funding from other users interested in supporting their initiatives.

Implemented Functionalities
Creation of contracts with state variables.
fundProject function to allow users to send ether to a project.
changeProjectState function to change the state of a project.
Use of modifiers to restrict certain actions.
Use of events to log important actions.
Validations to ensure system integrity and security.
Storage of project information in a struct.
Use of an enum to define the possible states of a project.
Storage of multiple projects using an array and a mapping.
Implementation Details
State Variables
projects: Array to store the created projects.
contributions: Mapping to store the contributions made to each project.
Main Functions
createProject: Function to initialize the data of a new project.
fundProject: Function for users to send ether to a project.
changeProjectState: Function to change the state of a project.
Modifiers
onlyAuthor: Modifier to restrict certain actions only to the author of the project.
notAuthor: Modifier to prevent the author of the project from making contributions to their own project.
Events
ProjectFunded: Logged when a contribution is made to a project.
ProjectStateChanged: Logged when the state of a project is changed.
Development Environment Requirements
Solidity >=0.7.0 <0.9.0
Truffle (optional for testing and development)
Usage Guide
Create a Project: Use the createProject function to initialize a new project with the required information.
Fund a Project: Users can send ether to the project using the fundProject function.
Change Project State: The project author can change the state using the changeProjectState function.
Contributions
Contributions are welcome. If you want to contribute to this project, follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature/feature-name).
Make your changes and commit (git commit -am 'Add new feature').
Push the branch (git push origin feature/feature-name).
Open a Pull Request.
