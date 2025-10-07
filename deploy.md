# How to deploy changes

Update and make commits often. (At least hourly if you are editing code.)
Append "nopr" or "No PR" if you are not yet ready to send a Pull Request.

## Using git.sh (Recommended)

Run your git.sh commands from a separate terminal. (Otherwise Code CLIs tend to use their own "push" interpretations.)

Start a secure virtual session in your local webroot.

	python3 -m venv env
	source env/bin/activate
	chmod +x git.sh
	chmod +x team/git.sh

Navigate to the team directory and run git.sh commands. Your "push" with git.sh will automatically run a "pull" first.  
You can watch the webroot in Github Desktop to see if updates are deployed.

	cd team
	./git.sh push           # Push all repositories with changes
	./git.sh push all       # Same as above
	./git.sh pull           # Pull all repositories (webroot + submodules + extra repos)
	./git.sh push [name]    # Push specific repository (webroot, submodule, or extra repo)
	./git.sh pull [name]    # Pull specific repository

### Common git.sh commands:

	./git.sh push                    # Push all repos with changes (auto-pulls first)
	./git.sh push webroot           # Push webroot only
	./git.sh push localsite         # Push specific submodule
	./git.sh push submodules        # Push all submodules with changes
	./git.sh pull                   # Pull all repos (webroot + submodules + extra repos)
	./git.sh fix                    # Fix detached HEAD states
	./git.sh remotes                # Update remotes for current GitHub user

### Options:
- Add `nopr` to skip PR creation: `./git.sh push nopr`
- Add `overwrite-local` to let parent repository override your local commits: `./git.sh pull overwrite-local`

**⚠️ WARNING**: `overwrite-local` will delete uncommitted local work in submodules. To recover deleted work, you can use git's reflog in each affected submodule:

	cd [submodule_name]
	git reflog                    # Find your lost commit hash
	git checkout [commit_hash]    # Restore your work
	git checkout -b recovery      # Create new branch to save it

### Supported repositories:
- **Webroot**: webroot
- **Submodules**: Automatically detected from .gitmodules file
- **Extra Repos**: Automatically detected from extra-repos.txt file

## Using Github Desktop

You can also use Github Desktop to choose a repo in the webroot using "File > Add Local Repository". 
Then submit a PR through the Github.com website. (The "push" with Claude or git.sh will send a PR automatically.)

IMPORTANT: If you're using Github Desktop to push, you'll probably still need to send a PR in Github.com.


## Using Claude Code CLI (so so)


For the first usage, include extra guidance:

	push using claude.md with git.sh  


If you find "push" is asking for multiple approvals, Claude may not have read the claude.md instructions.

When Claude has digested claude.md, "push" uses the git.sh file to update the webroot, submodules and forks. 

"push" also does a "pull" automatically first.  (Same as ./git.sh push above.)

	push

Additional deployment commands:

	push [folder name]  # Deploy a specific submodule or fork
	push submodules  # Deploy changes in all submodules
	push forks  # Deploy the extra forks added

"push" sends a Pull Request (PR) unless you include "nopr" 






## Manual submodule refresh

You can refresh all your local submodules by running:

	git submodule foreach 'git pull origin main || git pull origin master'