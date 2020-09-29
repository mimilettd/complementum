## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
```
Ruby 2.6.2
```

### Installing
Clone the app and change into the `complementum` directory:

```
$ git clone https://github.com/mimilettd/complementum.git
$ cd complementum
```

### Install the dependencies:

```
bundle install
```

Run the following commands in your terminal:

```
$ rake db:create db:migrate

# Import clients data
$ rails db:import_clients_table\[seed/Clients.csv\]

# Import carriers data
$ rails db:import_carriers_table\[seed/Carriers.csv\]

# Import policies data
$ rails db:import_policies_table\[seed/Policies.csv\]

# Start the server
$ rails s

```

To view basic information on `Clients`, visit http://localhost:3000/v1/clients?page=1
