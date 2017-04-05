# Title
Intro to GitLab: DevOps tools on a shell script budget

# Abstract
An overview of GitLab, an open source, self-hosted GitHub alternative. GitLab is an attractive option for smaller or non-tech industry organizations without dedicated code development infrastructure. Features include git repository hosting, permissions management, an in-browser editor, git-lfs support, continuous integration and deployment, issue tracking, a container registry, and even a Slack clone. Includes a demo of Imagr and Munki workflows. 

# Long Description

Git is an extremely popular and powerful tool for source code management and collaboration. But if you work outside of the tech industry, or for a smaller organziation, you might not have infrastructure in place to reap the benefits of a git-based workflow. This talk aims to show how GitLab can help smaller organizations get access to DevOps-style workflows for increased communication, change auditing, and improved productivity.

GitLab is a free web application you can host yourself. With GitLab, you get a nice web UI for managing git repositories, very similar to GitHub. You can use GitLab to host anything you would normally put into a git repo, whether it's your grab bag of scripts, configuration profiles, or even a full Munki repo. Once your stuff lives in GitLab, you also have access to a whole load of other features to help you collaborate with your team and automate repetitive tasks.

## Topics covered:
- Installation and Configuration
- Authentication and Authorization (LDAP, AD)
- Group and Project organization
    - Issue Tracking
    - Wikis
- Git LFS: Large File Support 
- GitLab CI: Continuous Integration and Deployment
- Container Registry
- Workflow demonstrations
    - Imagr
    - Munki