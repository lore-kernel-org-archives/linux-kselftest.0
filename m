From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 11 Apr 2019 16:20:06 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <DA36DE02-73C2-4C9E-9761-27B3EBC6FED2@brauner.io>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190411200059.GA75190@google.com>
 <DA36DE02-73C2-4C9E-9761-27B3EBC6FED2@brauner.io>
Message-ID: <20190411202006.GA130334@google.com>

On Thu, Apr 11, 2019 at 10:02:32PM +0200, Christian Brauner wrote:
> On April 11, 2019 10:00:59 PM GMT+02:00, Joel Fernandes <joel at joelfernandes.org> wrote:
> >On Thu, Apr 11, 2019 at 01:50:42PM -0400, Joel Fernandes (Google)
> >wrote:
> >> pidfd are /proc/pid directory file descriptors referring to a task
> >group
> >> leader. Android low memory killer (LMK) needs pidfd polling support
> >to
> >> replace code that currently checks for existence of /proc/pid for
> >> knowing a process that is signalled to be killed has died, which is
> >both
> >> racy and slow. The pidfd poll approach is race-free, and also allows
> >the
> >> LMK to do other things (such as by polling on other fds) while
> >awaiting
> >> the process being killed to die.
> >
> >It appears to me that the "pidfd" now will be an anon inode fd, and not
> >based
> >on /proc/, based on discussions with Linus. So I'll rework the patches
> >accordingly. However that is relatively independent of this patch so
> >this
> >version can also be reviewed before I send out the reworked version.
> 
> Thank you very much, Joel.
> I'm off this week and traveling but I'll try to give it a look asap.
> 
> Christian

Sounds great to me, thanks a lot Christian.

 - Joel
