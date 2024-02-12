# Graded-Assignment-on-CI-CD-Pipeline
Graded-Assignment-on-CI-CD-Pipeline

-----------------------------------------------

Created two branches

GitHub-Actions and the other one - main-for-github

--------------------

Checkout to GitHub-Actions

Created .github\workflows

and main.yml file

We can start creating a actions workflow here

-------------------

I have run the entire workflow on ubuntu-latest

Divided the workflow in two parts - Installing dependencies and testing , second part - deploy to EC2

------------------------

Using Workflow_disptach for the trigger - as this is the staging branch

Job 1: Testing
```
step 1: Checkout the code

step2: setup python  - latest version 3.10

step 3: install the pip - requriements file

step 4: run the test cases
```

Job 2: Deploy to Ec2 -> This depends on Testing - job, if this fails then Deploy will not run

First create the secrets - for aws access key id and key
```
Step 1: Configure aws on the runner

Configuring aws should have installed aws cli

Step 2: Testing the aws configuration

Step 3: using truemark/aws-ec2-run-instance-action@v5 - found on marketplace to launch the ec2 instance

Using user data verified that the deployment was successful
```

Now once verified that install, test and deploy is tested

Raise a pull request to main