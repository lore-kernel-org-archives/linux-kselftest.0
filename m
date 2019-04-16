From: olof at lixom.net (Olof Johansson)
Date: Tue, 16 Apr 2019 09:47:16 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
References: <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home> <20190416124939.GB6027@kroah.com>
 <20190416130440.GA7944@localhost>
 <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
Message-ID: <CAOesGMj=BKcfa4A321y43m0qTaeQeM1M8btQmGCVM1idc9_5GA@mail.gmail.com>

On Tue, Apr 16, 2019 at 6:32 AM Karim Yaghmour
<karim.yaghmour at opersys.com> wrote:
>
>
> On 4/16/19 9:04 AM, Joel Fernandes wrote:
> > On Tue, Apr 16, 2019 at 02:49:39PM +0200, Greg Kroah-Hartman wrote:
> >> On Tue, Apr 16, 2019 at 08:33:06AM -0400, Steven Rostedt wrote:
> >>> On Mon, 15 Apr 2019 22:50:10 -0500
> >>> Kees Cook <keescook at chromium.org> wrote:
> >>>
> >>>> On Mon, Apr 15, 2019 at 9:41 AM Steven Rostedt <rostedt at goodmis.org> wrote:
> >>>>> I agree with this assessment. We shouldn't use config.gz as precedence
> >>>>> for this solution. config.gz should have been in debugfs to begin with,
> >>>>> but I don't believe debugfs was around when config.gz was introduced.
> >>>>> (Don't have time to look into the history of the two).
> >>>>
> >>>> I don't agree with this: /proc/config.gz is used by a lot of tools
> >>>> that do sanity-check of running systems. This isn't _debugging_...
> >>>> it's verifying correct kernel builds. It's a fancy version of checking
> >>>> /proc/version.
> >>>>
> >>>
> >>> Then we should perhaps make a new file system call tarballs ;-)
> >>>
> >>>   /sys/kernel/tarballs/
> >>>
> >>> and place everything there. That way it removes it from /proc (which is
> >>> the worse place for that) and also makes it something other than debug.
> >>> That's what I did for tracefs.
> >>
> >> As horrible as that suggestion is, it does kind of make sense :)
> >>
> >> We can't put this in debugfs as that's only for debugging and systems
> >> should never have that mounted for normal operations (users want to
> >> build ebpf programs), and /proc really should be for processes but that
> >> horse is long left the barn.
> >>
> >> But, I'm willing to consider putting this either in a system-fs-like
> >> filesystem, or just in sysfs itself, we do have /sys/kernel/ to play
> >> around in if the main objection is that we should not be cluttering up
> >> /proc with stuff like this.
> >>
> >
> > I am ok with the suggestion of /sys/kernel for the archive. That also seems
> > to fit well with the idea that the headers are kernel related and probably
> > belong here more strictly speaking, than /proc.
>
> This makes sense. And if it alleviates concerns regarding extending
> /proc ABIs then might as well switch to this.
>
> Olof, what do you think of this?

In practice we've been more lenient with changes to /sys over time, so
I think this might be a reasonable compromise.

I still think that a filesystem view is the cleanest way to do this,
but I won't push back from this going in. It does solve a real
problem, and if we want a different format later we can revisit it
then.


-Olof
