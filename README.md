# go_githubCI
This README lists several ideas that should drive a company's CI/CD development.  
A selection of the ideas is implemented as a POC following a <XXX> identifier referenced in the commit messages.  
Ideas for which more complex infrastructure is required (e.g., binary caches, databases, etc.) will be omitted, especially when the implementation requires closed-source software.  
This repository focuses on creating essential CI/CD tools that can be used locally first and then deployed remotely with minimal additional code. However, there's also the possibility of working in the opposite direction, using tools like [act](https://github.com/nektos/act).

## What to Aim for with Your Pipelines
Your company's CI/CD environment must answer two main questions:  
1. **What is going on with our product?**  
Whenever I build, test, and deliver IT capabilities, I want to spot progress and regressions. Have a feedback loop that makes sense in terms of your product and team.  
2. **How are different players interacting with each other, and how are they consuming products originated from your continuous development stack?**  
Ensure that every role in your team gets the right version of your product quickly. Pipeline A delivers artifacts in the form of arguments to pipeline B.

## Local CI/CD
Whenever possible, enable your team members to run pipeline subtasks locally in a comfortable manner. <001>  
This will prevent them from needing to commit every time they want to check whether a change passes tests and other criteria.  
It will also reduce the load on your shared CI/CD infrastructure.

## Isolation and Security
Pipelines shouldn't be able to interfere with each other—i.e., eliminate as much state in your CI as you possibly can.  
Digital signatures or hash checks ensure that the pipeline is running on the building blocks it is supposed to.  
Check third-party libraries for vulnerabilities and malicious code, i.e., ensure you point to a specific version of the third-party library.

## Limit Unnecessary Runs
It might not be necessary to trigger every capability of your CI/CD environment just because of a small update in a feature branch.  
[Provide flags for skipping CI internals](https://docs.gitlab.com/ee/user/project/push_options.html) to relieve the infrastructure your CI is running on, without enabling untrusted pushes to the trunk of your project.

## In Case of an Emergency
In a situation where unexpected behaviour is breaking production, you need to be able to publish a fix immediately.  
For that matter, it is advisable to enable a trusted process to bypass CI essentials **in such situations** while using only the most necessary CD parts.  

## Team
CI/CD development needs to align with the work ethics of your team (e.g., branching strategy).  
The more natural and equal processes align, the more team members will understand the issues they face and the matters they need to communicate.

## Resources
Make use of [the same test environment](https://nix.dev/tutorials/nixos/integration-testing-using-virtual-machines) as often as possible.  
Check access to resources early in the process.  
At the end of each pipeline, check whether it belongs to the most recent commit—if not, triggering further pipelines will be unnecessary.  
Cache all sorts of artifacts and avoid creating an artifact with the same meaning twice.  
Test by hand what is too unique, subject to change, or too costly to implement.  
Run pipelines in a predetermined order, with the most fragile steps coming first, to shorten feedback loops.  
But also balance the load horizontally: unit and integration tests should run before, e.g., performance tests, and manual tests should be decoupled from the main pipeline.  

## Documentation & Testing
Testing a specific pipeline made for one project requires quite a bit of workforce.  
Your CI/CD environment needs documentation, and it needs testing.  
Test results should be saved in a dedicated place (e.g., under version control) in the same codebase they are derived from. <002>  
Gently tweak your team members' workflows so that they have a hard time avoiding both of these tasks.

## Outlook
The following image I found in ["Continuous Integration (CI) and Continuous Delivery (CD)"](https://link.springer.com/book/10.1007/978-1-4842-9228-0) by Henry van Merode.  
Whenever I look at it, it provides me with the urge to make progress.
![A model of how steps of maturity from the intelligence, planning, integration, testing, and deployment aspects of your CI/CD environment could look like](./img/model.png)

