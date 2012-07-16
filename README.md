
    A simple bash prompt that can recognize version control


### What ###

Adds an green **(hg|git|svn|bzr)** to your bash prompt if you are inside
a directory which is under version control, i.e.

    user@host:dir$

is turned into
    
    user@host:dir (git) $

if your prompt is below a .git directory,
`git` would be replaced with `hg` for mercurial and so on.



### Howto ###

Source the file `ps1.bash` (perhaps in some startup script)

    source /path/to/ps1.bash


### Why ###

I'm generally only interested in knowing if I'm working with files under
version control or not, running all sorts of commands to figure out if
I'm on this or that branch etc. for each prompt takes away the *carriage
return speed*.


    time __git_ps1      # the official PS1 prompt from git
    (master)
    real    0m0.027s
    user    0m0.008s
    sys     0m0.000s


    time in_repository  # the one found in this script
    (git) 
    real    0m0.001s
    user    0m0.000s
    sys     0m0.000s


**NOTE** This example was pretty bad as the function `__git_ps1` is
actually pretty fast on my machine, but still :-)
