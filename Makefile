# Lectures

## Keep track of lecture progress
Sources += lecture.txt

######################################################################

target = Makefile
-include target.mk
target: $(target)

##################################################################

imageDrop = ~/Dropbox/courses/1M

now:
	@echo $(imageDrop)

Sources += Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/perl.def
-include $(ms)/newtalk.def
-include $(ms)/repos.def

##################################################################

## Local makefiles
Ignore += local.mk

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

#### Speciation (P26 ⇒ P24)
speciation.draft.pdf: speciation.txt
speciation.final.pdf: speciation.txt
speciation.handouts.pdf: speciation.txt
speciation.complete.pdf: speciation.txt
speciation.outline.pdf: speciation.txt

#### Phylogeny and the history of life (P27 ⇒ P25)
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
## Moving towards makestuff one-level
Sources += $(wildcard *.step)

## Update imageDrop in local.mk if necessary
## webpix.mk use this automatically for my_images and webpix
Ignore += webpix Pearson norton jdpix
Pearson norton jdpix: dir = $(imageDrop)
Pearson norton jdpix: 
	$(linkdir)

######################################################################

## Pages

## mdirs += Bio1M.github.io images
Bio1M += images
dfiles: $(mdirs:%=%/Makefile)
Sources += $(mdirs)

clonedirs += web
web:
	git clone https://github.com/Bio1M/Bio1M.github.io.git $@

### Would like to make my own push rules here (like 3SS), so that I can push different kinds of products to different places. But here they seem to be over-ridden by the rules from unix.mk!
pushdir = web/materials/

######################################################################

## make postscript

-include $(ms)/webpix.mk
-include $(ms)/git.mk
-include $(ms)/visual.mk

## Is this good to phase out? Do we lose hotmake? Do we need it here?
## -include $(ms)/modules.mk

-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk
