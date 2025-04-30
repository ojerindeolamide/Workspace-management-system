# Workspace Management Smart Contracts

This repository contains a set of Clarity smart contracts for a workspace management system on the Stacks blockchain. The system allows users to register, manage workspaces (spaces), and earn incentives through various activities.

![Stacks Blockchain](https://assets.website-files.com/618b0aafa4afde9048fe3926/618b0aafa4afde7a5afe3c10_icon-stacks-gradient.svg)

## Table of Contents
- [Overview](#overview)
- [Smart Contracts](#smart-contracts)
- [Data Structures](#data-structures)
- [Usage](#usage)
- [Security Considerations](#security-considerations)
- [Contributing](#contributing)
- [License](#license)

## Overview

The workspace management system consists of several smart contracts that work together to provide a comprehensive solution for managing workspaces and users. The system includes features such as:

- User registration and management
- Space registration and management
- Premium space features
- User activity incentives
- Space recommendations

## Smart Contracts

### 1. Workspace Management (`workspace_management.clar`)

The main contract that ties everything together. It includes functions for:
- Registering spaces
- Recommending spaces based on user location and premium status
- Setting premium status for spaces
- Adding users
- Earning STX tokens through activities
- Retrieving user and space information

### 2. Space Registration (`space_registration.clar`)

Handles the registration and management of workspaces (spaces). Features include:
- Registering new spaces with details like name, location, premium status
- Retrieving space information
- Getting the owner of a space
- Listing all available spaces

### 3. User Registration (`user_registration.clar`)

Manages user accounts and profiles. Functions include:
- Adding new users with name and location
- Retrieving user information
- Getting user activity points
- Updating user location
- Listing all registered users

### 4. Premium Management (`premium_management.clar`)

Handles premium features for spaces. Includes:
- Setting premium status for spaces
- Promoting spaces to premium
- Demoting spaces from premium
- Listing all premium spaces

### 5. User Activity Incentives (`user_activity_incentives.clar`)

Manages incentives for user activities. Features:
- Earning STX tokens based on activity points
- Increasing user activity points
- Decreasing user activity points
- Checking user STX balance

### 6. Space Query Info (`space_query_info.clar`)

Provides query functions for spaces and users:
- Getting all spaces
- Getting space information by ID
- Getting space owner
- Getting all users
- Getting user information

### 7. Space Recommendation (`space_recommendation.clar`)

Recommends spaces to users based on various criteria:
- Recommending spaces based on user location and premium status
- Getting premium spaces
- Getting non-premium spaces
- Getting spaces by location

### 8. Helper Functions (`helper_function.clar`)

Contains utility functions used by other contracts:
- Hashing space information
- Increasing user STX balance
- Decreasing user STX balance

## Data Structures

### Spaces

Spaces are stored in a map with the following structure:
```
{
  space_name: (string-utf8 20),
  location: (string-utf8 20),
  is_premium: bool,
  asset_id: uint,
  stx_balance: int
}
```

### Users

Users are stored in a map with the following structure:
```
{
  name: (string-utf8 20),
  location: (string-utf8 20),
  active_points: int,
  stx_balance: int
}
```

## Usage

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - A Clarity development tool
- [Stacks Wallet](https://www.hiro.so/wallet) - For interacting with the contracts on the Stacks blockchain
- [Node.js](https://nodejs.org/) - For running tests and scripts

### Development

1. Clone the repository:
   ```bash
   git clone https://github.com/ojerindeolamide/Workspace-management-system.git
   cd Workspace-management-system
   ```

2. Install Clarinet by following the [official installation guide](https://github.com/hirosystems/clarinet#installation).

3. Install dependencies:
   ```bash
   npm install
   ```

4. Run Clarinet checks to verify the contracts:
   ```bash
   clarinet check
   ```

5. Run tests:
   ```bash
   clarinet test
   ```

### Deployment

1. Deploy the contracts to the Stacks blockchain using Clarinet:
   ```bash
   clarinet deploy --network testnet
   ```

2. Interact with the contracts using the Stacks Wallet or API.

### Example Usage

Here's a simple example of how to interact with the contracts using the Stacks.js library:

```javascript
const { makeContractCall } = require('@stacks/transactions');
const { StacksTestnet } = require('@stacks/network');

// Create a new user
async function addUser(name, location) {
  const txOptions = {
    contractAddress: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM',
    contractName: 'user_registration',
    functionName: 'add-user',
    functionArgs: [
      stringUtf8CV(name),
      stringUtf8CV(location)
    ],
    senderKey: 'your-private-key',
    validateWithAbi: true,
    network: new StacksTestnet(),
    anchorMode: AnchorMode.Any,
  };

  const transaction = await makeContractCall(txOptions);
  const result = await broadcastTransaction(transaction, network);
  return result;
}
```

## Security Considerations

- The contracts include warnings about potentially unchecked data, which should be addressed in a production environment
- Input validation should be added for all public functions
- Access control mechanisms should be implemented for sensitive operations

## Contributing

Contributions are welcome! Here's how you can contribute to this project:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Run tests to ensure everything works (`clarinet check` and `clarinet test`)
5. Commit your changes (`git commit -m 'Add some feature'`)
6. Push to the branch (`git push origin feature/your-feature-name`)
7. Create a new Pull Request

Please make sure your code follows the existing style and includes appropriate tests.

### Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
