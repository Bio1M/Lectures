
Installation
============

* Clone or fork [this repo](https://github.com/Bio1M/Lectures)
* Install the 1M images Dropbox folder somewhere:
	* (Default is ~/Dropbox/1M/)
	* Otherwise, create a file called `local.mk` and say `imagefiles = <dirpath>`
* execute:
```
make Makefile
make makestuff
make imagelinks
```

Operation
=========

The idea is to edit .txt files, which can then be made into various products:
* `draft.pdf` files for preparing lectures.
* `outline.pdf` files just show outline information. Sometimes useful when preparing lectures, but I rarely use them.
* `handouts.pdf` files are for the kids to print and take notes on
* `final.pdf` files have lots of automatic pauses for final lectures; people who like to wander and teach may not like them.
* `pause.pdf` is an alternative, with only minimal pauses (for example, when you want to ask a question for students to answer). _It does not exist in any form,_ but would be a good idea.
* `complete.pdf` is the handouts with answers and comments filled in. It's meant for student reference after the unit is completed.

The `txt` files are writing in dmu (dumb markup). This is a legacy holdover, poorly documented, but very useful for those (me) who are used to it. I will work on documentation if requested. The dmu engine is controlled by `.fmt` files which are in turn made automatically (in this project) from `.format` files. The format file txt.format is possibly a little useful for figuring out the .txt files, should that be desired. Happy to talk more about this.

The other main things I do from here are to push products automatically either to git_push (so I can download and show them in class) or to the associated github-pages repo.

It may also be worth talking about whether you would find the image getting and recording machinery worth using: right now it's set up for you to use images I've already put in dropbox, but it should be easy to enable automatic downloading to dropbox. Or maybe that's stupid…

Next year
=========

* Look for activities in each section

* More about scaling?

