From: christian@brauner.io (Christian Brauner)
Date: Tue, 21 May 2019 16:32:22 +0200
Subject: [PATCH v3 1/2] pid: add pidfd_open()
In-Reply-To: <20190520155630.21684-1-christian@brauner.io>
References: <20190520155630.21684-1-christian@brauner.io>
Message-ID: <20190521143220.crb2zyvdov3fl4g7@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190521143222.7WOvdtYBUOjSZmyFRJhOJoJFGdWklyQrNWVaRkl1Uxo@z>

On Mon, May 20, 2019@05:56:29PM +0200, Christian Brauner wrote:
> This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> process that is created via traditional fork()/clone() calls that is only
> referenced by a PID:
> 
> int pidfd = pidfd_open(1234, 0);
> ret = pidfd_send_signal(pidfd, SIGSTOP, NULL, 0);
> 
> With the introduction of pidfds through CLONE_PIDFD it is possible to
> created pidfds at process creation time.
> However, a lot of processes get created with traditional PID-based calls
> such as fork() or clone() (without CLONE_PIDFD). For these processes a
> caller can currently not create a pollable pidfd. This is a problem for
> Android's low memory killer (LMK) and service managers such as systemd.
> Both are examples of tools that want to make use of pidfds to get reliable
> notification of process exit for non-parents (pidfd polling) and race-free
> signal sending (pidfd_send_signal()). They intend to switch to this API for
> process supervision/management as soon as possible. Having no way to get
> pollable pidfds from PID-only processes is one of the biggest blockers for
> them in adopting this api. With pidfd_open() making it possible to retrieve
> pidfds for PID-based processes we enable them to adopt this api.
> 
> In line with Arnd's recent changes to consolidate syscall numbers across
> architectures, I have added the pidfd_open() syscall to all architectures
> at the same time.
> 
> Signed-off-by: Christian Brauner <christian at brauner.io>
> Reviewed-by: Oleg Nesterov <oleg at redhat.com>

This now also carries a Reviewed-by from David.

> Acked-by: Arnd Bergmann <arnd at arndb.de>
> Cc: "Eric W. Biederman" <ebiederm at xmission.com>
> Cc: Kees Cook <keescook at chromium.org>
> Cc: Joel Fernandes (Google) <joel at joelfernandes.org>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Jann Horn <jannh at google.com>
> Cc: David Howells <dhowells at redhat.com>
> Cc: Andy Lutomirsky <luto at kernel.org>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: Aleksa Sarai <cyphar at cyphar.com>
> Cc: Linus Torvalds <torvalds at linux-foundation.org>
> Cc: Al Viro <viro at zeniv.linux.org.uk>
> Cc: linux-api at vger.kernel.org

I've moved pidfd_open() into my for-next branch together with Joel's
pidfd polling changes. Everything is based on v5.2-rc1.

The chosen syscall number for now is 434. David is going to send out
another pile of mount api related syscalls. I'll coordinate with him
accordingly prior to the 5.3 merge window.

Thanks!
Christian
