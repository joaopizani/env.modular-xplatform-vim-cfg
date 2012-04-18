A self-contained, cross-platform and nicely organized VIM setup :)
------------------------------------------------------------------

TODO README.


Quick install: git clone the repo into a directory of your liking and create a link from your HOME directory named "_vimrc" pointing to the "_vimrc" file inside the repo. The little "drawing" bellow illustrated the link:

$HOME/_vimrc  --->  <where-you-cloned-the-repo>/_vimrc

Note - that's what $HOME (usually) means:

Linux: $HOME = /home/<your-username>
Windows: $HOME = C:\Documents and Settings\<your-username>
MacOS X: $HOME = /Users/<your-username>


After creating the link, open vim for the first time and type:  ":BundleInstall!". After the process completes, you have everything in order and should be happy!

VOILÀ!
