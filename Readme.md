# Gitlab check self merged

A simple ruby script that checks where a user accept and merge its own merge request.

## Usage
There are two scenarios of use. The first one is direct execution from console and the second case (more useful) is from a docker container.

Running this script from a container will allow you to call it from gitlab-ci pipelines and therefore to check if a user has merged its own merge-request.

Gitlab Enterprise allows you to create approval rules for the merge-request in your project but this feature is not available in the community edition. In this case, this script could be useful.

### From console

You may run the following command:

``` 
ruby check-self-merged.rb <project_id> <commit_id>
```

Where `project_id` is your numeric gitlab project id and `commit_id` is the merge-commit hash in the master branch committed when a merge occurs.

The script will return SUCCESS if the commit was not generated from a self merged merge-request or FAILURE otherwise.

### Using docker

Under construction

### Prerequisites

An access token with `read_repository` scope is required in order to access your Gitlab project.

Ruby and `gitlab` gem are required if the script is run from console.
