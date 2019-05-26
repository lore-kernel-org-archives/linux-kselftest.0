From: nsz@port70.net (Szabolcs Nagy)
Date: Sun, 26 May 2019 22:20:42 +0200
Subject: [PATCH v2 1/2] open: add close_range()
In-Reply-To: <20190523154747.15162-2-christian@brauner.io>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-2-christian@brauner.io>
Message-ID: <20190526202041.GO16415@port70.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190526202042.aTdsFf4EYRZmvBYqWYMNKDz1Q9kXbO3gy1dbthP4WzM@z>

* Christian Brauner <christian at brauner.io> [2019-05-23 17:47:46 +0200]:
> This adds the close_range() syscall. It allows to efficiently close a range
> of file descriptors up to all file descriptors of a calling task.
> 
> The syscall came up in a recent discussion around the new mount API and
> making new file descriptor types cloexec by default. During this
> discussion, Al suggested the close_range() syscall (cf. [1]). Note, a
> syscall in this manner has been requested by various people over time.
> 
> First, it helps to close all file descriptors of an exec()ing task. This
> can be done safely via (quoting Al's example from [1] verbatim):
> 
>         /* that exec is sensitive */
>         unshare(CLONE_FILES);
>         /* we don't want anything past stderr here */
>         close_range(3, ~0U);
>         execve(....);

this does not work in a hosted c implementation unless the libc
guarantees not to use libc internal fds (e.g. in execve).
(the libc cannot easily abstract fds, so the syscall abi layer
fd semantics is necessarily visible to user code.)

i think this is a new constraint for userspace runtimes.
(not entirely unreasonable though)

> The code snippet above is one way of working around the problem that file
> descriptors are not cloexec by default. This is aggravated by the fact that
> we can't just switch them over without massively regressing userspace. For
> a whole class of programs having an in-kernel method of closing all file
> descriptors is very helpful (e.g. demons, service managers, programming
> language standard libraries, container managers etc.).

was cloexec_range(a,b) considered?

> (Please note, unshare(CLONE_FILES) should only be needed if the calling
>  task is multi-threaded and shares the file descriptor table with another
>  thread in which case two threads could race with one thread allocating
>  file descriptors and the other one closing them via close_range(). For the
>  general case close_range() before the execve() is sufficient.)

assuming there is no unblocked signal handler that may open fds.

a syscall that tramples on fds not owned by the caller is ugly
(not generally safe to use and may break things if it gets used),
i don't have a better solution for fd leaks or missing cloexec,
but i think it needs more analysis how it can be used.
