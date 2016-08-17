build-lists: true
autoscale: true

# GitLab

---

# [fit] Introductions

---

# Mac Justice
- Yes, it's my real name!
- Seattle native
- First IT job: Corporate PC mines of Mukilteo
- Started at Synapse 4 years ago as "IT Blackbelt"

^ West Seattle, to be specific.

^ I studied history and anthropology in college, I stumbled into IT.

^ It was a pretty cool title in 2012.


---
![fit](http://www.cambridgeconsultants.com/sites/default/files/synapse_logo_and_products.jpg)

^ We're a engineering consulting company specializing in product development. We primarily specialize in mechanical, electrical, and firmware engineering. Clients come to us with products they would like to bring to market, and we help turn ideas into a manufacturable product.

---
## The Tools

---
# Git

![right fit](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1024px-Git_icon.svg.png)

- Source Code Management
- Tracks changes to text files
- Designed for collaboration


^ Git is a popular source code management tool. If you work with text files like scripts on a regular basis, you should absolutely check it out. It allows you to track changes and to make branches to your code so you can experiment and increment without risking your production code. You can see who made what changes when, which makes it a lot easier to track down mistakes.

^ Get a taste at [try.github.io](try.github.io).
Dig in deeper with [Pro Git](https://git-scm.com/book/en/v2).

---
# Git LFS
## Large File Storage

Git + Big Files = :cold_sweat:
Git + Git LFS + Big Files = :heart_eyes:

^ Because Git is designed for text files, it chokes on big binary files, such as packages or disk images. Tools like Git Annex and Git Fat have been developed to address this, but they're unwieldy and not widely supported. GitHub created Git LFS to make it easy, and it's supported by the major Git server products, like GitHub, GitLab, and BitBucket.

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

^ A quick example. Install git-lfs, open an existing git repo, use `git lfs install` to initialize lfs in that repo, then specify the file types you would like to track. From here, you can use standard git commands to stage files, commit your changes, then push them to a remote server.

---
![left](https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/wordmark/stacked_wm_no_bg.png)

- Open Source
- Self-hosted or gitlab.com
- Freemium: Free and paid editions


^ GitLab is an open source competitor to GitHub. It's very easy to set up, just a package install on most Linux distros. From there, you can integrate with LDAP, SAML, or another identity provider for authentication, or just use the built-in user management. It has lots of cool features, like the already-mentioned Git LFS support, an issue tracker, wiki hosting, a container registry, and more, but I'm gong to focus on my favorite feature...

---
# Gitlab CI

---
# What is CI?

## Continuous Integration
- Push code :arrow_forward: Test and Build

# Continuous Deployment
- Push code :arrow_forward: Test, Build, Deploy

^ CI stands for Continuous Integration. In the software development world, this usually means your code is automatically tested every time you push it, to reduce the likelihood of bugs cropping up. However, the tools that enable this can also be used to automate all kinds of things. Check out Tim Sutton's talk on Jenkins, another CI tool, from MacDevOps:YVR 2016, which was a huge influence on this talk.

---
# CI Runners

![inline 40%](https://ssl.apple.com/osx/images/og.jpg?201606301611)![inline 40%](http://betanews.com/wp-content/uploads/2015/06/win10-logo.jpg)
![inline 60%](https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png)![inline 60%](https://alexisduque.github.io/docker-presentation/images/logo-docker.png)

^ CI copies your code to a runner, which can run on Linux, Mac, or Windows, virtual or physical. There it executes a job, which is the CI term for a task. Jobs can be run in sequence or parallel, and can be essentially anything you can script. CI even supports Docker, so you even create temporary containers that execute the job, return the result, and are discarded.

---
# .gitlab-ci.yml

```yaml
job1:
  script: "job1-script.sh"

job2:
  script:
    - job2-script.py
    - echo "Great success!"
```

^ My favorite part about GitLab CI is that the file that defines your CI jobs is included in your git repo, and so is tracked along with the rest of your files. You can call out scripts, run inline commands, specify stage order, set variables, limit which runners should run the job, and lots more.

---
# GitLab at Synapse
## Client Work
- Easy (and free) to include clients
- Issue tracker for feedback and milestone planning
- Build and test environments are documented, fewer "snowflakes"
- Runner + physical computer = hardware testing! :computer: :calling:
- Doxygen for auto-generated code documentation! (Planned)

---
# GitLab at Synapse
## IT
- Munki
  - Automatic deployment to S3
- Imagr
  - runs `validateplist` as a simple test
  - Changes rsynced to site imaging servers
- AutoPkg (Planned)
- AutoDMG (Planned)

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
# Thanks!
### Twitter: @macjustice
### MacAdmins Slack: macjustice
### GitHub: macjustice
### basically wherever: macjustice
