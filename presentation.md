autoscale: true
theme: Next, 5

# Intro to GitLab
## DevOps on a Shell Script Budget
![filtered](https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/logo/logo-extra-whitespace.png)

^ Welcome, and thanks everybody for coming out to this meeting of Apple Admins of the Pacific NorthWest. Before we get going, I'd like to thank Chris for organizing this, and to Mallory and Tableau for hosting.

---

# Mac Justice

## Sr. Support Specialist
## Synapse Product Development

### @macjustice


^ My name is Mac Justice, I'm the Senior Support Specialist at Synapse Product Development.


---
![fit](http://www.cambridgeconsultants.com/sites/default/files/synapse_logo_and_products.jpg)

^ #TODO Update image, talk w/ Jackie or Morgan

^ Synapse is a engineering consulting company specializing in product development. **We primarily specialize in mechanical, electrical, and firmware engineering,** Clients come to us with products they would like to bring to market, and we help turn ideas into a manufacturable product.

---
# [fit] WANTED:
# Git Repository Host

<!-- ---
# Wait, what's git?

---
# [fit] Git

![right fit 50%](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1024px-Git_icon.svg.png)

- Source Code Management
- Tracks changes to text files
- Designed for collaboration


^ Git is a popular source code management tool. If you work with plain text files like scripts or config files on a regular basis, it's a great tool to learn. It allows you to track changes and to make branches to your code so you can experiment and increment safely. In a team environment it also makes it easy for multiple people to work on the same project simultaneously. -->

---
# [fit] Must Have:
1. Lots of projects!
2. Sharable!
3. Self-hosted!

^ Synapse isn't a large company, but projects are our business. This means that though we have around 170 employees, we also have up to 50 projects going at any time, ranging in length from weeks to years. Not all need firmware development, but those that do need version control and storage, and as a company that does a lot of work with embedded Linux we moved to git early on.

^ We also need to be able to share our git repositories with our clients. A big part of our consulting offering is working closely with clients and enabling them to engage with our development process.

^ Finally, our clients require confidentiality. The exact definition varies from client to client, but the limitations can range from "Wait until release day, be cool" to "this never sees the light of day, and don't ever let it touch a single piece of silicon you don't own."

---

# [fit] Bonus Points:
- Nice web UI
- Bug tracking
- Continuous Integration
- IT can play too

^ So, git is one thing, but it would be nice to get some context too, right? Not everyone is a terminal jockey, so a good web UI is important for keeping interested parties involved. We also wanted to get the ability for our developers and clients to file bug reports. Our deveopers were also interested in adding continous integration to their workflow, which can improve code quality and shorten development time. Finally, we in IT were looking at putting more of our work in version control, to get all those same benefits the deveopers were getting, so we wanted to have access to the tool too.

---

![fit](https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/wordmark/stacked_wm_no_bg.png)

^ After considering some alternatives, such as GitHub Enterprise and Atlassian's BitBucket/JIRA/Bamboo stack, we settled on GitLab, largely because it was free and the employee doing the selection was a Ruby guy, and GL is built on Rails. Not the most rigorous of selection criteria, but it's been a great choice for us. We run GitLab Enterprise Edition on a VM in our VMware cluster, only recently upgrading from the free Community Edition

---
# General Info
- Open Source
- Gitlab.com
  - Personal public and private repos
  - "Free forever"
  - Where the sausage gets made

---
# General Info
## Self Hosted Pricing Tiers
- Community Edition (CE) - Free, community support, fully featured
- Enterprise Edition Starter (EES) - $40/user/year, next business day support, extra features
- Enterprise Edition Premium (EEP) - $200/user/year, 4 hour support, training, advanced features

^ GitLab has three pricing tiers. We used Community Edition until just this past year when we decided support and a few of the more advanced features were worth it to us, but 95% of what we use GitLab for is in CE.

---
# General Info
## Set Up

- "Omnibus" package
- Docker Container
- Pre-built VMs (Amazon EC2/LightSail, Digital Ocean)
- Many other methods

^ GitLab has a standard "Omnibus" package that is very easy to install on several common flavors of Linux. There's also Docker containers if you're a cool kid, and pre-built VMs available on Amazon Web Services or Digital Ocean.

^ I absolutely reccomend trying AWS or Digital Ocean if you want a running Gitlab instance set up in just a minute or two. You can do this for cents per hour, it's a great way to kick the tires on a live system.

^ You can also install from source, there's a Chef cookbook, some kind of Kubernetes setup, and all sorts of other options as well.

---
![](https://media.giphy.com/media/26DOs997h6fgsCthu/giphy.gif?response_id=5925261e8c00051b4993c8e9)

---
# My Uses
- Munki
- Imagr

---

#[fit]Git + Big Files = :cold_sweat:

^ Because Git is designed for text files, it chokes on big binary files such as packages or disk images.

---
#[fit]Git + Git LFS + Big Files = :heart_eyes:

###(LFS = Large File Storage)

^Tools like Git Annex and Git Fat have been developed to address this, but they're unwieldy and not widely supported. GitHub created Git LFS to make it easy, and it's supported by major Git server products like GitHub, GitLab, and BitBucket.

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
# [fit] GitLab CI

---
# What is CI?

## Continuous Integration
- Push code :arrow_right: Build and Test :arrow_right: :no_entry: :white_check_mark:

## Continuous Deployment
- Push code :arrow_right: Build, Test, Deploy :arrow_right: :no_entry: :white_check_mark:

^ CI stands for Continuous Integration. In the software development world, this usually means your code is automatically tested and built every time you push it to the server, to reduce the likelihood of bugs cropping up. It has a sister concept, Continuous Deployment, which takes it one step further, using the same tools to then automatically put your code into production.

---
# CI Runners

![inline 10%](https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/OS_X_El_Capitan_logo.svg/2000px-OS_X_El_Capitan_logo.svg.png)![inline 10%](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Windows_logo_-_2012.svg/2000px-Windows_logo_-_2012.svg.png)
![inline 75%](https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png)![inline fit](http://static.techfieldday.com/wp-content/uploads/2016/06/docker-logo-300.png)

^ CI copies your code to a runner client, which can run on Linux, Mac, or Windows; virtual or physical. There it executes one or more jobs. Jobs can be run in sequence or parallel, and can be anything you can script. GitLab CI even supports Docker, so you even create temporary containers that execute the job, return the result, and are discarded.

---
# .gitlab-ci.yml

```yaml
validate:
  stage: test
  script: check_for_typos.sh

roll_out:
  stage: deploy
  when: manual
  only: master
  script:
    - ./reticulate_splines.py
    - rsync build/* user@remote_server:/deploy/path/
```

^ My favorite part about GitLab CI is that the file that defines your CI jobs is included in your git repo, and so is tracked along with the rest of your files. You just add a file named `.gitlab-ci.yml` to your repo, and GitLab will try to start building your project. You can call out scripts, run inline commands, specify stage order, set variables, limit which runners should run the job, and lots more. So, lets take a look at a CI yml file.

---
# .gitlab-ci.yml, annotated

```yaml
validate: # first job name
  stage: test # All 'test' stage jobs run before 'deploy' stage
  script: check_for_typos.sh # Run this script

roll_out: # second job name
  stage: deploy # Start only when all 'test' stage jobs complete
  when: manual # Require user interaction to start
  only: master # Only run on Master branch
  script:
    - ./reticulate_splines.py # Call script in repo
    - rsync build/* user@remote_server:/deploy/path/ # inline command
```

^ In this example, I have two jobs, validate and roll-out. Validate is in the test stage, so it goes first, and it just runs the "check for typos" script. It will run any time someone pushes to GitLab.
Roll-out is marked as a deploy stage, so it starts when all test jobs complete. I've set `when` to manual, so roll-out won't start until I click go on the GitLab project page. I also specify to only run this job when there are updates to the master branch, because I don't want to push development branches to production. Finally, it runs a script, and an inline command. If everything suceeds, GitLab CI reports success.

---
# Result
![inline fit](https://dl.dropboxusercontent.com/s/h83v91vms6qp0d1/2016-08-18%20at%201.13%20PM.png)

^ As you can see in this screenshot, the build passed. The test step completed successfully, and the deploy step wasn't run because this wasn't the master branch. For illustration purposes I enabled the manual option for Deploy, which can be started in the menu to the right of the build.

---
# [fit] GitLab at Synapse

---
# GitLab at Synapse
## Client Work
- Easy (and free) to include clients :free:
- Issue tracker for feedback and milestone planning :bar_chart:
- Build and test environments are documented :no_good: :snowflake:
- Runner + physical computer = hardware testing! :computer::calling:

^ We started using GitLab at Synapse 3 years ago for our engineers to host their project repos. It's easy to add accounts for our clients to access the code we write for them, and to get visibility into project progress through the issue tracker and milestone planning. Doing testing using Gitlab CI means  build and test environments are better documented, resulting in fewer "snowflakes". Installing the runner client on physical computers also allows us to do automated hardware testing on connected devices.

---
# GitLab at Synapse
## IT
- Munki ![inline](http://munki.phys.ethz.ch/img/munki_logo.png)
  - Automatic upload to S3 host
- Imagr :computer:
  - Automatic `rsync`ing to site imaging servers
- Ansible :satellite:
  - Configuration Management for Linux servers

^ In the IT department we try to store as much of our scripts and configurations in GitLab as we can. This includes Munki and Imagr, which using CI and LFS are automatically deployed whenever a commit to the master branch is made. We use Ansible for configuration management of our Linux servers, changes pushed to master are automatically deployed after review.

---
# Infrastructure
![inline 80%](GitLab-S3-Munki.png)

---
# [fit]Demo

^ Open .gitlab-ci.yml and s3-deploy.sh. Walk through the yml, the deploy script, and show how variables are set in the GitLab project outside of version control that can be passed into CI

^ Launch Mac Client VM. Prestaged with Managed Software Center, [s3-auth](https://github.com/waderobson/s3-auth) middleware script and settings, S3 bucket with R/W IAM user for CI and Read-Only user for Munki.

^ Open munki-repo in Munki Admin. Add package to site_default manifest. Save.

^ `cd gitlab_presentation`
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

# More Information
- This presentation: github.com/macjustice/gitlab-presentation
- [GitLab](www.gitlab.com)
- [GitLab CI](https://about.gitlab.com/gitlab-ci/)
- [Git LFS](https://git-lfs.github.com/)
- MacDevOps:YVR 2016
  - [Tim Sutton on Jenkins CI](http://macdevops.ca/MDO2016/jenkins/Default.html)
  - [Wade Robson on Munki & S3](http://matx.ca/mdoyvr/2016/day2/munkimiddleware/Default.html)

---
# Thanks!
### Twitter: @macjustice
### MacAdmins Slack: macjustice
### GitHub: macjustice
### Wherever: macjustice
