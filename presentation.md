autoscale: true

# GitLab

^ Welcome, and thanks everybody for coming out to this meeting of NorthWest Apple Admins. Before we get going, I'd like to thank Chris for organizing this, and to Mallory and Tableau for hosting.

---

# Mac Justice
## Senior Support Specialist
### Synapse Product Development

^ My name is Mac Justice, I'm the Senior Support Specialist at Synapse Product Development.


---
![fit](http://www.cambridgeconsultants.com/sites/default/files/synapse_logo_and_products.jpg)

^ Synapse is a engineering consulting company specializing in product development. We primarily specialize in mechanical, electrical, and firmware engineering. Clients come to us with products they would like to bring to market, and we help turn ideas into a manufacturable product.

---
## The Tools

^ I'll start with an overview of the tools involved, then give you a demonstration of a workflow I use in production.

---
# Git

![right fit](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1024px-Git_icon.svg.png)

- Source Code Management
- Tracks changes to text files
- Designed for collaboration


^ Git is a popular source code management tool. If you work with text files like scripts or config files on a regular basis, start using it. It allows you to track changes and to make branches to your code so you can experiment and increment safely. In a team environment, it also makes it easy for multiple people to contribute, and to track the source of any mistakes introduced.

---
# Git LFS
## Large File Storage

Git + Big Files = :cold_sweat:
Git + Git LFS + Big Files = :heart_eyes:

^ Because Git is designed for text files, it chokes on big binary files such as packages or disk images. Tools like Git Annex and Git Fat have been developed to address this, but they're unwieldy and not widely supported. GitHub created Git LFS to make it easy, and it's supported by major Git server products like GitHub, GitLab, and BitBucket.

---
# Example
```bash
brew install git-lfs
cd munki-repo
git lfs install
git lfs track "*.dmg"

git add pkgs/GoogleChrome.dmg
git commit -m "Added Chrome"
git push origin master
```

^ A quick example. Install git-lfs, open an existing git repo, use `git lfs install` to initialize lfs in that repo, then specify the file types you would like to track. From here on, you can use standard git commands to stage files, commit your changes, then push them to a remote server, just like you would with a standard git repo.

---
![left](https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/wordmark/stacked_wm_no_bg.png)

- Open Source
- Self-hosted or gitlab.com
- Freemium: Free and paid editions


^ GitLab is an open source competitor to GitHub. It's very easy to set up, just a package install on most Linux distros. The free edition is good enough for most environments, including ours, the paid version adds some nice bonus features and support. GitLab has lots of cool features, like the already-mentioned Git LFS support, as well as an issue tracker, wiki hosting, a container registry, and more, but I'm gong to focus on my favorite feature...

---
# Gitlab CI

---
# What is CI?

## Continuous Integration
- Push code :arrow_forward: Test and Build

## Continuous Deployment
- Push code :arrow_forward: Test, Build, Deploy

^ CI stands for Continuous Integration. In the software development world, this usually means your code is automatically tested and built every time you push it to the server, to reduce the likelihood of bugs cropping up. It has a sister concept, Continuous Deployment, which takes it one step further, using the same tools to then automatically put your code into production.

---
# CI Runners

![inline 40%](https://ssl.apple.com/osx/images/og.jpg?201606301611)![inline 40%](http://betanews.com/wp-content/uploads/2015/06/win10-logo.jpg)
![inline 60%](https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png)![inline 60%](https://alexisduque.github.io/docker-presentation/images/logo-docker.png)

^ CI copies your code to a runner client, which can run on Linux, Mac, or Windows; virtual or physical. There it executes one or more jobs. Jobs can be run in sequence or parallel, and can be anything you can script. GitLab CI even supports Docker, so you even create temporary containers that execute the job, return the result, and are discarded.

---
# .gitlab-ci.yml

```yaml
validate:
  stage: test
  script: check_for_typos.sh

deploy:
  stage: deploy
  image: python:2.7.10
  script:
    - reticulate_splines.py
    - rsync build/* user@remote_server:/deploy/path/
    - echo "here we goooo"
    - make_it_live.py
  when: manual
```

^ My favorite part about GitLab CI is that the file that defines your CI jobs is included in your git repo, and so is tracked along with the rest of your files. You can call out scripts, run inline commands, specify stage order, set variables, limit which runners should run the job, and lots more.

---
# GitLab at Synapse
## Client Work
- Easy (and free) to include clients
- Issue tracker for feedback and milestone planning
- Build and test environments are documented, fewer "snowflakes"
- Runner + physical computer = hardware testing! :computer: :calling:

^ We started using GitLab at Synapse 3 years ago for our engineers to host their project repos. It's easy to add accounts for our clients to access the code we write for them, and to get visibility into project progress through the issue tracker and milestone planning. Doing their testing using Gitlab CI means their build and test environments are better documented, resulting in fewer "snowflake" environments. Installing the runner client on physical computers also allows us to do automated hardware tested on connected devices.

---
# GitLab at Synapse
## IT
- Munki
  - Automatic upload to S3 host
- Imagr
  - Automatic `rsync`ing to site imaging servers
- Ansible
  - Configuration Management for Linux servers

^ In the IT department we try to store as much of our scripts and configurations in GitLab as we can. This includes Munki and Imagr, which using CI and LFS are automatically deployed whenever a commit to the master branch is made. We use Ansible for configuration management of our Linux servers, changes pushed to master are automatically deployed after review.


---
# [fit]Demo

^ Launch Mac Client VM. Prestaged with Managed Software Center, [s3-auth](https://github.com/waderobson/s3-auth) middleware script and settings, S3 bucket with R/W IAM user for CI and Read-Only user for Munki.

^ Open munki-repo in Munki Admin. Add package to site_default manifest as an optional install. Save.

^ `cd gitlab_preseentation`
`git add .`
`git commit -m "added pkg"`
`git push`

^ open https://gitlab.synapse.com/macj/gitlab_presentation
hit "pipelines" section
Open the log for the CI build

^ Once complete, check for updates in the Managed Software Center in client VM.
GREAT SUCCESS

---
# Q & A

---
Check out Tim Sutton's talk on Jenkins, another CI tool, from MacDevOps:YVR 2016, which was a huge influence on this talk.

---
# Thanks!
### Twitter: @macjustice
### MacAdmins Slack: macjustice
### GitHub: macjustice
###  wherever: macjustice
