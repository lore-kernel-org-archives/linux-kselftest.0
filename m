From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Apr 2019 15:02:47 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
Message-ID: <20190419190247.GB251571@google.com>

On Thu, Apr 18, 2019 at 07:26:44PM +0200, Christian Brauner wrote:
> On April 18, 2019 7:23:38 PM GMT+02:00, Jann Horn <jannh at google.com> wrote:
> >On Wed, Apr 17, 2019 at 3:09 PM Oleg Nesterov <oleg at redhat.com> wrote:
> >> On 04/16, Joel Fernandes wrote:
> >> > On Tue, Apr 16, 2019 at 02:04:31PM +0200, Oleg Nesterov wrote:
> >> > >
> >> > > Could you explain when it should return POLLIN? When the whole
> >process exits?
> >> >
> >> > It returns POLLIN when the task is dead or doesn't exist anymore,
> >or when it
> >> > is in a zombie state and there's no other thread in the thread
> >group.
> >>
> >> IOW, when the whole thread group exits, so it can't be used to
> >monitor sub-threads.
> >>
> >> just in case... speaking of this patch it doesn't modify
> >proc_tid_base_operations,
> >> so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are
> >going to use
> >> the anonymous file returned by CLONE_PIDFD ?
> >
> >I don't think procfs works that way. /proc/sub-thread-tid has
> >proc_tgid_base_operations despite not being a thread group leader.
> >(Yes, that's kinda weird.) AFAICS the WARN_ON_ONCE() in this code can
> >be hit trivially, and then the code will misbehave.
> >
> >@Joel: I think you'll have to either rewrite this to explicitly bail
> >out if you're dealing with a thread group leader, or make the code
> >work for threads, too.
> 
> The latter case probably being preferred if this API is supposed to be
> useable for thread management in userspace.

At the moment, we are not planning to use this for sub-thread management. I
am reworking this patch to only work on clone(2) pidfds which makes the above
discussion about /proc a bit unnecessary I think. Per the latest CLONE_PIDFD
patches, CLONE_THREAD with pidfd is not supported.

Also we wanted to make the polling of pidfd quite close to the wait(2) family
semantics which, as I understand correctly, is not something that works for
sub-threads. In the future, we could bail in poll(2) or return an error, if
clone(2) starts supporting thread pidfds, but at the moment I will like to
keep the WARN_ON just in case. Please let me know if I missed something.

thanks!

 - Joel
