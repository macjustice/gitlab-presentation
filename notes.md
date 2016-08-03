## Description
Mac Justice from Synapse Product Development, Inc. will show how Synapse uses GitLab with Mac management tools to track changes to scripts and configurations and automate testing and roll-out.

## Presentation Outline
1. Who am I? What is Synapse?
1. What is Git?
	- What's it for?
2. Git-LFS
	- What's that?
4. What is Gitlab?
	- Why do you care?
	- Your organization's own private GitHub
	- Free and Open Source "Community Ediiton" (CE), or paid premium "Enterprise Edition" (EE)
	- Includes tools for bug tracking, code review, documentation, 
5. What is Gitlab CI?
	- Continuous Integration - whenever you make a change, tests, deployment, or other actions can happen automatically
	- test/build/deploy scripts included with the repo
		- Testing & building procedures also version controlled
		- Your whole process lives in one place, better context
	- gitlab-ci-multi-runner - agent that runs the CI jobs, runs on Linux, MacOS, Windows, Docker
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
		- Web server, possibly Digital Ocean
		- Mac Client, MSC configured with demo server, hostname for manifest
