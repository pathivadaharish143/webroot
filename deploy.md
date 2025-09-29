# How to deploy changes

Update and make commits often (at least hourly).
Append nopr" or "No PR" if you are not yet ready to send a Pull Request.

Run "pull" hourly to safely pull updates to the modelearth repos residing in your webroot

When making any change, run "push" to send a PR. 
"push" updates the webroot, submodules and forks. It does a "pull" automatically first.

	push

If you find "push" is asking for mulitple approvals, Claude may not have read the claude.md instructions.
For the first usage, include extra guidance:

	push using claude.md with git.sh  

Addtional deployment commands:

	push [folder name]  # Deploy a specific submodule or fork
	push submodules  # Deploy changes in all submodules
	push forks  # Deploy the extra forks added


## Alternative to using Claude Code CLI

You can also use Github Desktop to choose a repo in the webroot using "File > Add Local Repository". 
Then submit a PR through the Github.com website. (The "push" with Claude will send a PR automatically.)


You can refresh all your local submodule by running:

	git submodule foreach 'git pull origin main || git pull origin master'