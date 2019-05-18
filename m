From: christian at brauner.io (Christian Brauner)
Date: Sat, 18 May 2019 12:04:46 +0200
Subject: [PATCH v1 1/2] pid: add pidfd_open()
In-Reply-To: <20190516224949.GA15401@localhost>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516224949.GA15401@localhost>
Message-ID: <20190518100435.c5bqpcnra53dsr6p@brauner.io>

On Sat, May 18, 2019 at 05:48:03AM -0400, Joel Fernandes wrote:
> Hi Christian,
> 
> For next revision, could you also CC surenb at google.com as well? He is also
> working on the low memory killer. And also suggest CC to
> kernel-team at android.com. And mentioned some comments below, thanks.

Yip, totally. Just added them both to my Cc list. :)
(I saw you added Suren manually. I added the Android kernel team now too.)

> 
> On Thu, May 16, 2019 at 03:59:42PM +0200, Christian Brauner wrote:
> [snip]  
> > diff --git a/kernel/pid.c b/kernel/pid.c
> > index 20881598bdfa..4afca3d6dcb8 100644
> > --- a/kernel/pid.c
> > +++ b/kernel/pid.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/syscalls.h>
> >  #include <linux/proc_ns.h>
> >  #include <linux/proc_fs.h>
> > +#include <linux/sched/signal.h>
> >  #include <linux/sched/task.h>
> >  #include <linux/idr.h>
> >  
> > @@ -451,6 +452,55 @@ struct pid *find_ge_pid(int nr, struct pid_namespace *ns)
> >  	return idr_get_next(&ns->idr, &nr);
> >  }
> >  
> > +/**
> > + * pidfd_open() - Open new pid file descriptor.
> > + *
> > + * @pid:   pid for which to retrieve a pidfd
> > + * @flags: flags to pass
> > + *
> > + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> > + * the process identified by @pid. Currently, the process identified by
> > + * @pid must be a thread-group leader. This restriction currently exists
> > + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> > + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> > + * leaders).
> > + *
> > + * Return: On success, a cloexec pidfd is returned.
> > + *         On error, a negative errno number will be returned.
> > + */
> > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > +{
> > +	int fd, ret;
> > +	struct pid *p;
> > +	struct task_struct *tsk;
> > +
> > +	if (flags)
> > +		return -EINVAL;
> > +
> > +	if (pid <= 0)
> > +		return -EINVAL;
> > +
> > +	p = find_get_pid(pid);
> > +	if (!p)
> > +		return -ESRCH;
> > +
> > +	ret = 0;
> > +	rcu_read_lock();
> > +	/*
> > +	 * If this returns non-NULL the pid was used as a thread-group
> > +	 * leader. Note, we race with exec here: If it changes the
> > +	 * thread-group leader we might return the old leader.
> > +	 */
> > +	tsk = pid_task(p, PIDTYPE_TGID);
> 
> Just trying to understand the comment here. The issue is that we might either
> return the new leader, or the old leader depending on the overlap with
> concurrent de_thread right? In either case, we don't care though.
> 
> I suggest to remove the "Note..." part of the comment since it doesn't seem the
> race is relevant here unless we are doing something else with tsk in the
> function, but if you want to keep it that's also fine. Comment text should
> probably should be 'return the new leader' though.

Nah, I actually removed the comment already independently (cf. see [1]).

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=pidfd_open&id=dcfc98c2d957bf3ac14b06414cb2cf4c673fc297
> 
> > +	if (!tsk)
> > +		ret = -ESRCH;
> 
> Perhaps -EINVAL?  AFAICS, this can only happen if a CLONE_THREAD pid was
> passed as argument to pidfd_open which is invalid. But let me know what you
> had in mind..

Hm, from the kernel's perspective ESRCH is correct but I guess EINVAL is
nicer for userspace. So I don't have objections to using EINVAL. My
first version did too I think.

Thanks!
Christian
