## This is the Bio 1M Lectures directory
## It is a project directory whose current home is screens/1M/Lectures
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Session

vim_session:
	bash -cl "vmt lecture.txt notes.txt tutorial.txt"

pullup: web.pull

## poll.txt is a slime-mold link and some Teams links from virtual delivery
Sources += Makefile README.md poll.txt
## Sources += content.mk

autopipeR = defined

######################################################################

## Web links
# https://avenue.mcmaster.ca/login.php?target=%2Fd2l%2Fhome%2F551736
# https://achieve.macmillanlearning.com/courses/g3zdfj/mycourse#
# https://teams.microsoft.com/_#/school/conversations/Lecture%20Content%20Questions?threadId=19:03abfa4d79324a05ab7a6df639a2f085@thread.tacv2&ctx=channel

######################################################################

## HLW sucks, use notes.txt

######################################################################

## Image location
Ignore += local.mk
imageDrop = ~/Dropbox/courses/1M
## Update imageDrop in local.mk if necessary
-include local.mk

Sources += $(wildcard *.step)

picdirs = Pearson norton jdpix freeman sharp hlw
Ignore += $(picdirs)
$(picdirs): dir = $(imageDrop)
$(picdirs): 
	$(alwayslinkdir)

######################################################################

## macmillan images MacMillan Macmillan (How Life Works – hlw)

## hlw/01Intro_images/
## hlw/20Evol_images/
## hlw/21Spec_images/
## hlw/22Phylo_images/
## hlw/23Humans.images/

## hlw/22Phylo_images.imagenames:
%.imagenames: %
	cd $* && rename 's/image(.)\./image0$$1./' *.jpg

## It's good to delimit these names
## but might have been better to try using / instead of adding characters
hlw/%_images: tmp_images.zipdir
	$(mkdir)
	$(MV) $</ppt/media/*.jpg $@
	$(RMR) $<

tmp_images.zipdir: tmp_images.zip
	mkdir $@
	$(copy)
	cd $@ && unzip $<
	$(RM) $<

tmp_images.zip:
	bash -cl "downcall $@"

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

## polllinks.draft.pdf: polllinks.txt

### Look out for RSLIDE; ADD; CHANGE
#### Introduction (P1)
intro.poll.csv: intro.txt pollcsv.pl
intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
## intro.handouts.pdf: intro.txt
## intro.handouts.tex.docx: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt
intro.html: intro.step

#### Natural selection (P24 => P22)
## ns.draft.pdf: ns.txt
## ns.poll.csv: ns.txt
## ns.final.pdf: ns.txt
## ns.handouts.pdf: ns.txt
## ns.complete.pdf: ns.txt
## ns.outline.pdf: ns.txt

#### Evolutionary processes (P25 ⇒ P23)
## processes.draft.pdf: processes.txt
## processes.poll.csv: processes.txt
## processes.final.pdf: processes.txt
## processes.handouts.pdf: processes.txt
## processes.complete.pdf: processes.txt
## processes.outline.pdf: processes.txt

Ignore += punnett.jpg
punnett.jpg: hlw/20Evol_images/image08.jpg
	convert -crop 1280x960+0+0 $< $@ 

Sources += mn.tsv

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
Sources += speciation.links

## Very little seems testable beyond section 1!
#### Phylogeny and the history of life (P27 ⇒ P25)
# phylogeny.draft.pdf: phylogeny.txt
# phylogeny.final.pdf: phylogeny.txt
# phylogeny.handouts.pdf: phylogeny.txt
# phylogeny.complete.pdf: phylogeny.txt
# phylogeny.outline.pdf: phylogeny.txt
Ignore += *.png
mammal_0.png: webpix/mammal_trees.png
	convert -crop 480x619+0+0 $< $@
mammal_1.png: webpix/mammal_trees.png
	convert -crop 480x619+480+0 $< $@

## 2023 humans
# origins.draft.pdf: origins.txt
# origins.final.pdf: origins.txt
# origins.handouts.pdf: origins.txt
# origins.complete.pdf: origins.txt
# origins.outline.pdf: origins.txt

## New content
## Same as the old content!
## diff ~/Dropbox/courses/1M/he_supp/pearson_humans.pdf Pearson/hesc.pdf ##
## diff ~/Downloads/Biological*.pdf Pearson/hesc.pdf ##

#### Outdated

## Short version (how did I run out of so much time in 2019?)
## Based primarily on Sharp, with some nods towards new-at-the-time Pearson content)
## cat primates.txt hominins.txt > humans.txt ##
## and then shorten
# humans.draft.pdf: humans.txt
# humans.final.pdf: humans.txt
# humans.handouts.pdf: humans.txt
# humans.complete.pdf: humans.txt
# humans.outline.pdf: humans.txt

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

## Tree stuff (replicated from bbTests)

Sources += $(wildcard *.R *.tre)

sixtrees.Rout: interchange.tre sixtrees.R

## interchange.tree.Rout: interchange.tre tree.R
%.tree.Rout: tree.R %.tre
	$(pipeR)

######################################################################

## Hands (assign people to respond based on student number (virtual)
## Newer hand stuff is for some reason in notebook (where it loops, so maybe that's good)

Sources += *.rmd

Ignore += chat.html
chat.html: chat.rmd HANDS
	Rscript -e 'library("rmarkdown"); render("$<", output_format="html_document", output_file="$@")'

Ignore += hands.html
hands.html: hands.rmd HANDS
	Rscript -e 'library("rmarkdown"); render("$<", output_format="html_document", output_file="$@")'

HANDS: ;

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
## m1notes.txt: phylogeny.txt Makefile

m1notes.txt:
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

## Direct crib from 3SS 2023 Sep 05 (Tue)

Sources += $(wildcard *.pl)

## Poll conversion
## Use semi-colons for MC
## | for separation (or ?; will that work for pdf outputs?)
Ignore += *.poll.csv
%.poll.csv: %.txt pollcsv.pl
	$(PUSH)

######################################################################


## Developing

## Makes a nice document, but sheds the answers spaces?
## Use some sort of explicit character?
## Actually, it seems like a big disaster ... maybe better to go through html, but that seems like a lot of work
## Wait for demand? Yes. 2023 Sep 03 (Sun)
%.tex.docx: %.tex
	pandoc -o $@ $<

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
-include makestuff/pipeR.mk
-include makestuff/webpix.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/newtalk.mk
-include makestuff/texi.mk
-include makestuff/projdir.mk

