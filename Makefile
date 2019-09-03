## This is the Bio 1M Lectures directory
## It is a project directory whose current home is screens/1M/Lectures
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Session

vim_session:
	bash -cl "vmt"

######################################################################

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
