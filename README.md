
# Sweeten Challenge
Sweeten Challenege is a application for matching general contractors with homeowners to perform their renovation projects. Each homeowner gets 3 matches depending on their requirement, location and services so they can compare bids and choose the best contractor for the job.



### Installation
Install the dependencies and devDependencies and start the server.
```sh
$ git clone https://github.com/usmanasif/sweeten-challenge.git
$ cd sweeten-challenge
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```

You are good to go! Run the app.

    localhost:3000

### Implementation
 - Implemenetd GeneralContractorsController, RenovationProjectsController and ContractController with all the requirement.
 - Implemented GeneralContractor, RenovationProject and Contract Model with validation and also added validation at db level.
 - Implemented frontend views.
 - I also worked on the test coverage regarding Controllers.
 - Implemented the matching algorithm that allow the homeowners to get 3 contractors for their project. The algorithm first search the contractors based upon requirement, services and location they provides. Then algorithm rank them in High, Average and New Contractors based upon on their rating and jobs completed.

### Run Test cases
 ```sh
 $ rails test
 ```

