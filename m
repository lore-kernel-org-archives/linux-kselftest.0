From: cyphar at cyphar.com (Aleksa Sarai)
Date: Tue, 2 Oct 2018 17:32:20 +1000
Subject: [PATCH 2/3] namei: implement AT_THIS_ROOT chroot-like path
 resolution
In-Reply-To: <C89D720F-3CC4-4FA9-9CBB-E41A67360A6B@amacapital.net>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929131534.24472-1-cyphar@cyphar.com>
 <CAG48ez30WJhbsro2HOc_DR7V91M+hNFzBP5ogRMZaxbAORvqzg@mail.gmail.com>
 <20181001054246.gfinmx3api7kjhmc@ryuk>
 <C89D720F-3CC4-4FA9-9CBB-E41A67360A6B@amacapital.net>
Message-ID: <20181002073220.7mzndna4tdnxdvdt@ryuk>

On 2018-10-01, Andy Lutomirski <luto at amacapital.net> wrote:
> >>> Currently most container runtimes try to do this resolution in
> >>> userspace[1], causing many potential race conditions. In addition, the
> >>> "obvious" alternative (actually performing a {ch,pivot_}root(2))
> >>> requires a fork+exec which is *very* costly if necessary for every
> >>> filesystem operation involving a container.
> >> 
> >> Wait. fork() I understand, but why exec? And actually, you don't need
> >> a full fork() either, clone() lets you do this with some process parts
> >> shared. And then you also shouldn't need to use SCM_RIGHTS, just keep
> >> the file descriptor table shared. And why chroot()/pivot_root(),
> >> wouldn't you want to use setns()?
> > 
> > You're right about this -- for C runtimes. In Go we cannot do a raw
> > clone() or fork() (if you do it manually with RawSyscall you'll end with
> > broken runtime state). So you're forced to do fork+exec (which then
> > means that you can't use CLONE_FILES and must use SCM_RIGHTS). Same goes
> > for CLONE_VFORK.
> 
> I must admit that I’m not very sympathetic to the argument that “Go’s
> runtime model is incompatible with the simpler solution.”

Multi-threaded programs have a similar issue (though with Go it's much
worse). If you fork a multi-threaded C program then you can only safely
use AS-Safe glibc functions (those that are safe within a signal
handler). But if you're just doing three syscalls this shouldn't be as
big of a problem as Go where you can't even do said syscalls.

> Anyway, it occurs to me that the real problem is that setns() and
> chroot() are both overkill for this use case.

I agree. My diversion to Go was to explain why it was particularly bad
for cri-o/rkt/runc/Docker/etc.

> What’s needed is to start your walk from /proc/pid-in-container/root,
> with two twists:
> 
> 1. Do the walk as though rooted at a directory. This is basically just
> your AT_THIS_ROOT, but the footgun is avoided because the dirfd you
> use is from a foreign namespace, and, except for symlinks to absolute
> paths, no amount of .. racing is going to escape the *namespace*.

This is quite clever and I'll admit I hadn't thought of this. This
definitely fixes the ".." issue, but as you've said it won't handle
absolute symlinks (which means userspace has the same races that we
currently have even if you assume that you have a container process
already running -- CVE-2018-15664 is one of many examples of this).

(AT_THIS_ROOT using /proc/$container/root would in principle fix all of
the mentioned issues -- but as I said before I'd like to see whether
hardening ".." would be enough to solve the escape problem.)

> 2. Avoid /proc. It’s not just the *links* — you really don’t want to
> walk into /proc/self. *Maybe* procfs is already careful enough when
> mounted in a namespace?

I just tried it and /proc/self gives you -ENOENT. I believe this is
because it does a check against the pid namespace that the procfs mount
has pinned.

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181002/5a858c93/attachment.sig>
