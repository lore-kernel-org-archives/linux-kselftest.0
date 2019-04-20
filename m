From: oleg at redhat.com (Oleg Nesterov)
Date: Sat, 20 Apr 2019 13:51:26 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHrFyr6qqj-q9nSVuNhFL5WOcuQstAFvaDu2544OpeMe6jawQw@mail.gmail.com>
References: <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <20190419212002.GB44851@google.com>
 <CAHrFyr6qqj-q9nSVuNhFL5WOcuQstAFvaDu2544OpeMe6jawQw@mail.gmail.com>
Message-ID: <20190420115125.GC17468@redhat.com>

On 04/19, Christian Brauner wrote:
>
> > Just for the exit notification purposes, the states are:
> > if process has exit_state == 0, block.
> > if process is zombie/dead but not reaped, then return POLLIN
> > if process is reaped, then return POLLIN | POLLHUP
>
> Oleg was explicitly against EXIT_ZOMBIE/DEAD thing, no? He said so in a
> prior mail. Has this been addressed?

Yes, please don't use EXIT_XXX codes, nobody should ever use them except the
core kernel exit/wait paths. For example, EXIT_DEAD means that the task auto-
reaps or its parent had to temporary drop tasklist.

Just check ->exit_state != 0 && thread_group_empty(). Note that we need
thread_group_empty() only for the case when the task is traced, in this case
we have an extra notification for debugger which can confuse pidfd_poll().

And of course, everything will differ if/when we will need to monitor the
sub-threads.

And btw I don't think it needs tasklist_lock, but lets discuss this when we
have a new version based on pidfd.

Oleg.
