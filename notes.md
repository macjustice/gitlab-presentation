GitLab [blog post](https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/) on CI,CD

## Description
Mac Justice from Synapse Product Development, Inc. will show how Synapse uses GitLab to create a unified workflow to automate development, testing and deployment of Mac management tools like Munki and Imagr.

## Questions to answer
- What makes GL compelling for a small organization?

## Notes for updating for PSU/YVR
- Explain AWS integration in more detail
- Get AutoPKG involved
- Add makecatalogs info
- Get Cloud/DevOps capabilities on the cheap
- Give current cost averages for s3 service
- https://macadmins.slack.com/archives/macadminops_sea/p1484851760000091

## Resources
https://docs.gitlab.com/ce/university/README.html
https://docs.google.com/presentation/d/1RcZhFmn5VPvoFu6UMxhMOy7lAsToeBZRjLRn0LIdaNc/edit#slide=id.p5
https://about.gitlab.com/2015/05/18/simple-words-for-a-gitlab-newbie/

## Examples
Munki
Imagr
Profiles - sign and encrypt!
Packages - Autobuild?
Autopkg

## Presentation Outline
1. Who am I? What is Synapse?
2. What am I about to do?
1. What is Git?
	- What's it for?
4. What is Gitlab?
	- Why do you care?
	- Your organization's own private GitHub
	- Free and Open Source "Community Ediiton" (CE), or paid premium "Enterprise Edition" (EE)
	- Includes tools for bug tracking, code review, documentation,
6. git-lfs
	- What's that?
5. What is Gitlab CI?
	- Continuous Integration - whenever you make a change, tests, deployment, or other actions can happen automatically
  - Continuous Delivery/Deployment
	- test/build/deploy scripts included with the repo
			- Testing and building procedures also version controlled
		- Your whole process lives in one place, better context
	- Runners
			- gitlab-ci-multi-runner - agent that runs the CI jobs, runs on Linux, MacOS, Windows, Docker
			- shared vs specific
	- Variables - keeps sensitive data out of version control, but still available to CI
4. How does Synapse use it?
	- What problems are we trying to solve?
		- Developers needed a central tool for version control
		- Tool to collaborate with clients
		- Secret Client Work
		- Munki
			- Autopkg in the works
		- Imagr
	- Benefits
		- Visibility - all relevant information is contained in the repo
		- Auditable - "Why did x break? Oh, Mac did the last commit, looks like you misspelled Synapse again"
		- Automatic - Make changes and push to GitLab, and sit back while the gears turn
4. Demo Munki Workflow
	Goal: make change to a manifest, package appears in MSC
	Requirements:
		- Demo munki repo
			- hosted in GitLab (public GitLab?)
			- .gitlab-ci.yml for deployment
		- s3 bucket
			- IAM r/w user @done
			- IAM r user @done
			- bucket @done
			- bucket permissions @done
		- Mac Client, MSC configured with demo server, hostname for manifest
			- Mac OS @done
			- Demo User @done
			- Munkitools @done
			- middleware-s3.py @done
			- Middleware settings @done
			- ManagedInstalls.plist @done
