# go_githubCI
This README simply mentions several ideas that should drive a company's CI/CD development.  
A selection of the ideas is implemented as POC following a <XXX> identifier referenced in the commit messages.  
Ideas for which more complex infrastructure is required(e.g. binary caches, databases,...) will be omitted, especially when the implementation requires closed-source software.  
This repository focuses on creating essential CI/CD tools that can be used locally first and then deployed remotely with minimal additional code. However, there's also the possibility of working in the opposite direction, using tools like [act](https://github.com/nektos/act).

## What to aim for with your pipelines
Your company's CI/CD environment has to answer to main questions.  
One: What is going on with our product? Whenever I build, test and deliver IT capabilities, spot progress and regressions. Have a feedback loop that makes sense in terms of your product and team.  
Two: How are different players interacting with each other and how are they consuming products originated by your continuous development stack?  
Get every role in your team the right version of your product fast. Pipeline A delivers arguments in the form of artifacts to pipeline B.

## Local CI/CD
Whenever possible, enable your team members to run pipeline subtasks locally in a comfortable manner. <001>  
This will not force them to commit every time they want to check whether a change passes tests and other criteria.  
Reduce the load your shared CI/CD infrastructure needs to handle.


## Isolation and security
Pipelines shouldn't be able to make a mess out of each other aka eliminate as much state in your CI as you possibly can.  
Digital signature or hash checks ensure that the pipeline is running on the building blocks it is supposed to.  
Check third-party libraries for vulnerabilities and malicious code aka point to a specific version of the third-party library.

## Limit unnecessary runs
It might not be necessary to trigger every capability of your CI/CD environment just because of some update in a feature branch.  
[Provide flags for skipping CI internals](https://docs.gitlab.com/ee/user/project/push_options.html) to relieve the infrastructure your CI is running on without enabling untrusted pushes to the trunk of your project.

## In case of an emergency
In a situation where one unspotted bug is breaking production, you need to be able to publish a fix immediately.  
For that matter, it is advisable to enable trusted users to bypass CI essentials IN SUCH SITUATIONS while using only the most necessary CD parts.  

## Team
CI/CD development needs to align with the work ethics of your team (e.g. branching strategy).  
The more natural and equal processes align, the more team members will understand the issues they face and what matters they need to communicate.

## Resources
Make use of the same test environment as often as possible.  
Cache all sorts of artifacts and avoid creating an artifact with the same meaning twice.  
Test by hand what is too unique, subject of change or too costly to implement.  
Run pipelines in a predetermined order where the most fragile steps come first to shorten feedback loops.  
Don't delay feedback.  
Clean up after you are done

## Documentation & testing
Your CI/CD environment needs documentation and it needs testing.  
Test results should be saved in a dedicated place e.g. under version control, in the same codebase they are derived from. <002>  
Tweak your team members' workflows gently so they have a really hard time avoiding doing both of these things.

## Outlook
The following image I found in ["Continuous Integration (CI) and Continuous Delivery (CD)"](https://link.springer.com/book/10.1007/978-1-4842-9228-0) by Henry van Merode.  
Whenever I look at it it provides me with the urge to make progress.
![A model how steps of maturity from the intelligence, planning, integration, testing, and deployment aspect of your CI/CD environment could look like](./img/model.png)
