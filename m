From: christian at brauner.io (Christian Brauner)
Date: Thu, 16 May 2019 17:29:16 +0200
Subject: [PATCH v1 1/2] pid: add pidfd_open()
In-Reply-To: <20190516152252.GD22564@redhat.com>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516142659.GB22564@redhat.com>
 <20190516145607.j43xyj26k6l5vmbd@yavin>
 <20190516150611.GC22564@redhat.com>
 <20190516151202.hrawrx7hxllmz2di@yavin>
 <20190516152252.GD22564@redhat.com>
Message-ID: <20190516152915.3t2wofeu3xsyhfbd@brauner.io>

On Thu, May 16, 2019 at 05:22:53PM +0200, Oleg Nesterov wrote:
> On 05/17, Aleksa Sarai wrote:
> >
> > On 2019-05-16, Oleg Nesterov <oleg at redhat.com> wrote:
> > > On 05/17, Aleksa Sarai wrote:
> > > > On 2019-05-16, Oleg Nesterov <oleg at redhat.com> wrote:
> > > > > On 05/16, Christian Brauner wrote:
> > > > > > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > > > > > created pidfds at process creation time.
> > > > >
> > > > > Now I am wondering why do we need CLONE_PIDFD, you can just do
> > > > >
> > > > > 	pid = fork();
> > > > > 	pidfd_open(pid);
> > > >
> > > > While the race window would be exceptionally short, there is the
> > > > possibility that the child will die
> > >
> > > Yes,
> > >
> > > > and their pid will be recycled
> > > > before you do pidfd_open().
> > >
> > > No.
> > >
> > > Unless the caller's sub-thread does wait() before pidfd_open(), of course.
> > > Or unless you do signal(SIGCHILD, SIG_IGN).
> >
> > What about CLONE_PARENT?
> 
> I should have mentioned CLONE_PARENT ;)
> 
> Of course in this case the child can be reaped before pidfd_open(). But how often
> do you or other people use clone(CLONE_PARENT) ? not to mention you can trivially
> eliminate/detect this race if you really need this.
> 
> Don't get me wrong, I am not trying to say that CLONE_PIDFD is a bad idea.
> 
> But to me pidfd_open() is much more useful. Say, as a perl programmer I can easily
> use pidfd_open(), but not CLONE_PIDFD.

Right, but for a libc, service- or container manager CLONE_PIDFD is much
nicer when spawning processes quickly. :) I think both are very good to
have.

Thanks, Oleg. As always super helpful reviews. :)
Christian
