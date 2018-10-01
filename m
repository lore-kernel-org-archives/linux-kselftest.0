From: luto@amacapital.net (Andy Lutomirski)
Date: Mon, 1 Oct 2018 07:28:34 -0700
Subject: [PATCH 2/3] namei: implement AT_THIS_ROOT chroot-like path
 resolution
In-Reply-To: <20181001054246.gfinmx3api7kjhmc@ryuk>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929131534.24472-1-cyphar@cyphar.com>
 <CAG48ez30WJhbsro2HOc_DR7V91M+hNFzBP5ogRMZaxbAORvqzg@mail.gmail.com>
 <20181001054246.gfinmx3api7kjhmc@ryuk>
Message-ID: <C89D720F-3CC4-4FA9-9CBB-E41A67360A6B@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181001142834.PbDwHI_CTRLS3XBISgSH7cyuIpq-IUjXC21bAOwLQ2Q@z>


>>> Currently most container runtimes try to do this resolution in
>>> userspace[1], causing many potential race conditions. In addition, the
>>> "obvious" alternative (actually performing a {ch,pivot_}root(2))
>>> requires a fork+exec which is *very* costly if necessary for every
>>> filesystem operation involving a container.
>> 
>> Wait. fork() I understand, but why exec? And actually, you don't need
>> a full fork() either, clone() lets you do this with some process parts
>> shared. And then you also shouldn't need to use SCM_RIGHTS, just keep
>> the file descriptor table shared. And why chroot()/pivot_root(),
>> wouldn't you want to use setns()?
> 
> You're right about this -- for C runtimes. In Go we cannot do a raw
> clone() or fork() (if you do it manually with RawSyscall you'll end with
> broken runtime state). So you're forced to do fork+exec (which then
> means that you can't use CLONE_FILES and must use SCM_RIGHTS). Same goes
> for CLONE_VFORK.

I must admit that I’m not very sympathetic to the argument that “Go’s runtime model is incompatible with the simpler solution.”

Anyway, it occurs to me that the real problem is that setns() and chroot() are both overkill for this use case. What’s needed is to start your walk from /proc/pid-in-container/root, with two twists:

1. Do the walk as though rooted at a directory. This is basically just your AT_THIS_ROOT, but the footgun is avoided because the dirfd you use is from a foreign namespace, and, except for symlinks to absolute paths, no amount of .. racing is going to escape the *namespace*.

2. Avoid /proc. It’s not just the *links* — you really don’t want to walk into /proc/self. *Maybe* procfs is already careful enough when mounted in a namespace?
