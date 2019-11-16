## This is the Bio 1M Lectures directory
## It is a project directory whose current home is screens/1M/Lectures
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Session

vim_session:
	bash -cl "vmt lecture.txt tutorial.txt"

pullup: web.pull
 
Sources += Makefile README.md

######################################################################

## Updating 2019 Sep 03 (Tue)

Sources += content.mk

######################################################################

## Image location
Ignore += local.mk
imageDrop = ~/Dropbox/courses/1M
## Update imageDrop in local.mk if necessary
-include local.mk

Sources += $(wildcard *.step)

Ignore += webpix Pearson norton jdpix freeman sharp
Pearson norton jdpix freeman sharp: dir = $(imageDrop)
Pearson norton jdpix freeman sharp: 
	$(linkdir)

######################################################################

## Talk machinery

-include makestuff/perl.def
-include makestuff/newtalk.def
-include makestuff/repos.def

Ignore += beamer.tmp

## Formatting
## Script is makestuff/newtalk/lect.pl
## Format rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

#####################################################################


## Content
Sources += *.txt

### Look out for RSLIDE; ADD; CHANGE
#### Introduction (P1)
intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt
intro.html: intro.step

#### Natural selection (P24 => P22)
ns.draft.pdf: ns.txt
ns.final.pdf: ns.txt
ns.handouts.pdf: ns.txt
ns.complete.pdf: ns.txt
ns.outline.pdf: ns.txt

#### Evolutionary processes (P25 ⇒ P23)
processes.draft.pdf: processes.txt
processes.final.pdf: processes.txt
processes.handouts.pdf: processes.txt
processes.complete.pdf: processes.txt
processes.outline.pdf: processes.txt

## Flopped sickle looks like Taiwan; don't worry about it
Ignore += sickle.jpg
sickle.jpg: webpix/sickle.jpg 
	convert -flop $< $@

#### Speciation (P26 ⇒ P24)
# speciation.2nd: speciation.txt
speciation.draft.pdf: speciation.txt
speciation.final.pdf: speciation.txt
speciation.handouts.pdf: speciation.txt
speciation.complete.pdf: speciation.txt
speciation.outline.pdf: speciation.txt

## Very little seems testable beyond section 1!
#### Phylogeny and the history of life (P27 ⇒ P25)
phylogeny.draft.pdf: phylogeny.txt
phylogeny.final.pdf: phylogeny.txt
phylogeny.handouts.pdf: phylogeny.txt
phylogeny.complete.pdf: phylogeny.txt
phylogeny.outline.pdf: phylogeny.txt

### Ready to drop this 2019 Oct 07 (Mon)
phenetics.draft.pdf: phenetics.txt
phenetics.final.pdf: phenetics.txt
phenetics.handouts.pdf: phenetics.txt
phenetics.complete.pdf: phenetics.txt
phenetics.outline.pdf: phenetics.txt

## New content
## Same as the old content!
## diff ~/Dropbox/courses/1M/he_supp/pearson_humans.pdf Pearson/hesc.pdf ##

## Short version (how did I run out of so much time in 2019?)
## cat primates.txt hominins.txt > humans.txt ##
## and then shorten
## Probably don't need to shorten much; these are lightweight chapters
humans.draft.pdf: humans.txt
humans.final.pdf: humans.txt
humans.handouts.pdf: humans.txt
humans.complete.pdf: humans.txt
humans.outline.pdf: humans.txt

## Primates 
primates.draft.pdf: primates.txt
primates.final.pdf: primates.txt
primates.handouts.pdf: primates.txt
primates.complete.pdf: primates.txt
primates.outline.pdf: primates.txt

## Hominins

hominins.draft.pdf: hominins.txt
hominins.final.pdf: hominins.txt
hominins.handouts.pdf: hominins.txt
hominins.complete.pdf: hominins.txt
hominins.outline.pdf: hominins.txt

## Culture
## Selection

######################################################################

## Old content

## Old content is called .lect.
## To import a unit, change the name to .txt (git mv it to lose the old index value)

#### Combined file (maybe older, seems to have more references to (some version of) the book)
Sources += course.lect

##### 2017 units
Sources += 2017.overview

##

## Not used since importation 
## Noticed this note 2019 Sep 03 (Tue)

#### Behavior (P51?)
Sources += behavior.lect

#### The evolution of modern humans
Sources += modern.lect

#### Human diversity (no notes found!)

#### Human behavior (seems to be Lovaye's part of the course)
Sources += hb.lect

# Large format is not implemented here. To do it, copy extarticle from a .tmp file in 3SS_content, and look for make rules.

### Human evolution HHE based content
apes.draft.pdf: apes.txt
apes.final.pdf: apes.txt
apes.handouts.pdf: apes.txt
apes.complete.pdf: apes.txt
apes.outline.pdf: apes.txt

homo.draft.pdf: homo.txt
homo.final.pdf: homo.txt
homo.handouts.pdf: homo.txt
homo.complete.pdf: homo.txt
homo.outline.pdf: homo.txt
homo.html: homo.step

## Patchwork of review stuff
final.complete.pdf: final.txt
final.draft.pdf: final.txt
final.final.pdf: final.txt

######################################################################

## Note chopping

## A special file to make complete notes for the test
m1notes.txt: phylogeny.txt Makefile
	perl -npe "last if /The history/" $< | perl -npe "s/CHAPTER.*/CHAPTER Midterm 1 extra notes/" > $@
m1notes.complete.pdf: phylogeny.txt

######################################################################

## Obsolete?

## Add second edition marker (too geeky!)
Sources += 2nd.pl
%.2nd: %.txt 2nd.pl
	$(PIPUSH)

## Scratchwork here?

Sources += $(wildcard *.R)
mn.Rout: mn.R

######################################################################

## What is images/ ??

## Pages

pardirs += web

pushdir = web/materials/

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
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/projdir.mk

