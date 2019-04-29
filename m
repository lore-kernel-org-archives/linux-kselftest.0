From: oleg at redhat.com (Oleg Nesterov)
Date: Mon, 29 Apr 2019 16:25:55 +0200
Subject: [PATCH v1 1/2] Add polling support to pidfd
In-Reply-To: <20190429140743.GB173743@google.com>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425222359.sqhboc4x4daznr6r@brauner.io>
 <20190428162405.GA6757@redhat.com>
 <20190429140245.GB233442@google.com>
 <20190429140743.GB173743@google.com>
Message-ID: <20190429142555.GB17715@redhat.com>

On 04/29, Joel Fernandes wrote:
>
> On Mon, Apr 29, 2019 at 10:02:45AM -0400, Joel Fernandes wrote:
> > On Sun, Apr 28, 2019 at 06:24:06PM +0200, Oleg Nesterov wrote:
> [snip]
> > > > > +{
> > > > > +	struct pid *pid;
> > > > > +
> > > > > +	lockdep_assert_held(&tasklist_lock);
> > > > > +
> > > > > +	pid = get_task_pid(task, PIDTYPE_PID);
> > > > > +	wake_up_all(&pid->wait_pidfd);
> > > > > +	put_pid(pid);
> > >
> > > Why get/put?
> >
> > Yes, pid_task() should do it. Will update it. Thanks!
>
> I spoke too soon. We need the task's pid of type PIDTYPE_PID. How else can we
> get it? This does an atomic_inc on the pid->count, so we need to put_pid()
> after we are done with it. Did I miss something?

Just use task_pid(task);

Oleg.
