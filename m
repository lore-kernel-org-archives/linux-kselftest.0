From: oleg at redhat.com (Oleg Nesterov)
Date: Thu, 16 May 2019 17:06:12 +0200
Subject: [PATCH v1 1/2] pid: add pidfd_open()
In-Reply-To: <20190516145607.j43xyj26k6l5vmbd@yavin>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516142659.GB22564@redhat.com>
 <20190516145607.j43xyj26k6l5vmbd@yavin>
Message-ID: <20190516150611.GC22564@redhat.com>

On 05/17, Aleksa Sarai wrote:
>
> On 2019-05-16, Oleg Nesterov <oleg at redhat.com> wrote:
> > On 05/16, Christian Brauner wrote:
> > >
> > > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > > created pidfds at process creation time.
> >
> > Now I am wondering why do we need CLONE_PIDFD, you can just do
> >
> > 	pid = fork();
> > 	pidfd_open(pid);
>
> While the race window would be exceptionally short, there is the
> possibility that the child will die

Yes,

> and their pid will be recycled
> before you do pidfd_open().

No.

Unless the caller's sub-thread does wait() before pidfd_open(), of course.
Or unless you do signal(SIGCHILD, SIG_IGN).

Oleg.
