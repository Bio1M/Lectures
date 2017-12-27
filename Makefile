# Lectures

## Keep track of lecture progress
Sources += lecture.txt

######################################################################

target = Makefile
-include testdir.mk
-include target.mk
target: $(target)

##################################################################

imagelinks = ~/Dropbox/1M

Sources += Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/perl.def
-include $(ms)/newtalk.def
-include $(ms)/repos.def

##################################################################

## Local makefiles
Sources += jd.local

jd.lmk: jd.local
%.lmk:
	$(CP) $*.local local.mk

## Formatting
## Script is makestuff/newtalk/lect.pl
## Format rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

#####################################################################

## Content
## Old content is called .lect.
## To import a unit, change the name to .txt (git mv it to lose the old index value)

Sources += *.txt

#### Combined file (maybe older, seems to have more references to (some version of) the book)
Sources += course.lect

##### 2017 units
Sources += 2017.overview

##

# Large format is not implemented here. To do it, copy extarticle from a .tmp file in 3SS_content, and look for make rules.

#### Introduction
intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt

#### Natural selection (P24)
ns.draft.pdf: ns.txt
ns.final.pdf: ns.txt
ns.handouts.pdf: ns.txt
ns.complete.pdf: ns.txt
ns.outline.pdf: ns.txt

#### Evolutionary processes (P25)
processes.draft.pdf: processes.txt
processes.final.pdf: processes.txt
processes.handouts.pdf: processes.txt
processes.complete.pdf: processes.txt
processes.outline.pdf: processes.txt

#### Speciation (P26)
speciation.draft.pdf: speciation.txt
speciation.final.pdf: speciation.txt
speciation.handouts.pdf: speciation.txt
speciation.complete.pdf: speciation.txt
speciation.outline.pdf: speciation.txt

#### Phylogeny and the history of life (P27)
phylogeny.draft.pdf: phylogeny.txt
phylogeny.final.pdf: phylogeny.txt
phylogeny.handouts.pdf: phylogeny.txt
phylogeny.complete.pdf: phylogeny.txt
phylogeny.outline.pdf: phylogeny.txt

### Human evolution (maybe break into units later)

apes.draft.pdf: apes.txt
apes.final.pdf: apes.txt
apes.handouts.pdf: apes.txt
apes.complete.pdf: apes.txt
apes.outline.pdf: apes.txt

## A special file to make complete notes for the test
midterm1.txt: apes.txt Makefile
	perl -npe "last if /Challenges/" $< | perl -npe "s/CHAPTER.*/CHAPTER Midterm 1 extra notes/" > $@

midterm1.complete.pdf: apes.txt

homo.draft.pdf: homo.txt
homo.final.pdf: homo.txt
homo.handouts.pdf: homo.txt
homo.complete.pdf: homo.txt
homo.outline.pdf: homo.txt

## Patchwork of review stuff
final.complete.pdf: final.txt
final.draft.pdf: final.txt
final.final.pdf: final.txt

######################################################################

## Not used since importation

#### Behavior (P51?)
Sources += behavior.lect

#### The evolution of modern humans
Sources += modern.lect

#### Human diversity (no notes found!)

#### Human behavior (seems to be Lovaye's part of the course)
Sources += hb.lect

######################################################################

%.pages: %

######################################################################

## Images
## Sort of between styles for making new images …

## Update location in local.mk if necessary
webpix Pearson norton jdpix: dir = $(imagelinks)
webpix Pearson norton jdpix: 
	$(linkdir)

# Old webpix directory
# Sources += images
# webpix/%: webpix
#	cd images && $(MAKE) files/$*

######################################################################

## Pages

mdirs += Bio1M.github.io images
Bio1M += images
dfiles: $(mdirs:%=%/Makefile)
Sources += $(mdirs)

### Would like to make my own push rules here (like 3SS), so that I can push different kinds of produts to different places. But here they seem to be over-ridden by the rules from unix.mk!
pushdir = Bio1M.github.io/materials/

######################################################################

## make postscript

-include $(ms)/git.mk
-include $(ms)/modules.mk
-include $(ms)/visual.mk

-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk

######################################################################

## Testing only

exportdir: $(Sources)
	$(MAKE) push
	-/bin/rm -rf $@
	git clone `git remote get-url origin` $@
	-cp target.mk $@
	-$(CP) local.mk $@

%.dirmake: %
	cd $< && $(MAKE) Makefile && $(MAKE) makestuff && $(MAKE) imagelinks && $(MAKE) && $(MAKE) vtarget
