From: olof@lixom.net (Olof Johansson)
Date: Tue, 16 Apr 2019 09:57:08 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190416164642.krptlz32zusr4pgn@ast-mbp.dhcp.thefacebook.com>
References: <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home> <20190416124939.GB6027@kroah.com>
 <20190416130440.GA7944@localhost>
 <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
 <20190416094509.1af6326b@gandalf.local.home>
 <20190416142240.GA31920@kroah.com>
 <20190416164642.krptlz32zusr4pgn@ast-mbp.dhcp.thefacebook.com>
Message-ID:
 <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416165708.Ce7JpM_ZbgsDLzj_vXpnB5vRamzJvvxYP_2Db9DzDyU@z>

On Tue, Apr 16, 2019 at 9:46 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Apr 16, 2019@04:22:40PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 16, 2019@09:45:09AM -0400, Steven Rostedt wrote:
> > > On Tue, 16 Apr 2019 09:32:37 -0400
> > > Karim Yaghmour <karim.yaghmour@opersys.com> wrote:
> > >
> > > > >>> Then we should perhaps make a new file system call tarballs ;-)
> > > > >>>
> > > > >>>   /sys/kernel/tarballs/
> > > > >>>
> > > > >>> and place everything there. That way it removes it from /proc (which is
> > > > >>> the worse place for that) and also makes it something other than debug.
> > > > >>> That's what I did for tracefs.
> > > > >>
> > > > >> As horrible as that suggestion is, it does kind of make sense :)
> > > > >>
> > > > >> We can't put this in debugfs as that's only for debugging and systems
> > > > >> should never have that mounted for normal operations (users want to
> > > > >> build ebpf programs), and /proc really should be for processes but that
> > > > >> horse is long left the barn.
> > > > >>
> > > > >> But, I'm willing to consider putting this either in a system-fs-like
> > > > >> filesystem, or just in sysfs itself, we do have /sys/kernel/ to play
> > > > >> around in if the main objection is that we should not be cluttering up
> > > > >> /proc with stuff like this.
> > > > >>
> > > > >
> > > > > I am ok with the suggestion of /sys/kernel for the archive. That also seems
> > > > > to fit well with the idea that the headers are kernel related and probably
> > > > > belong here more strictly speaking, than /proc.
> > > >
> > > > This makes sense. And if it alleviates concerns regarding extending
> > > > /proc ABIs then might as well switch to this.
> > > >
> > > > Olof, what do you think of this?
> > >
> > > BTW, the name "tarballs" was kind of a joke. Probably should come up
> > > with a better name. Although, I'm fine with tarballsfs ;-)
> >
> > No need to have this be a separate filesystem, we can use a binary sysfs
> > file in /sys/kernel/ for this as the kernel is not doing any "parsing"
> > of the data, it is just dumping it out to userspace.
>
> What folks keep saying that an fs of header files is easier to use
> than tarball from bcc and cleaner from architectural pov.
> That's not the case.
> From bcc side I'd rather have a single precompiled headers blob
> that I can feed into clang and improve bpf program compilation time.
> Having a set of headers is a step to generate such .pch file,
> but once generated the headers can be removed from fs and kheaders
> module unloaded.
> The sequence is: bcc checks standard /lib/module location,
> if not there loads kheader mod, extracts into known location, and unloads.

May I suggest keeping the bcc-populated headers somewhere else?
Ideally something cleaned out on every reboot in case kernel changes
without version string doing it.

That way you can by default prefer the module-exported tarball, and
fall back to /lib/module/$(uname -r)/ if not available, instead of the
other way around and instead of having to check creation times on the
dir vs boot time of the kernel, etc.

Anyway, that's just an implementation detail. But it's the kind of
detail that all tools that use this would need to get right, instead
of doing it right once by exporting it in a way that it can be
directly used.

> The extraced headers are in plain fs cache and will be evicted from memory
> when bcc is done compiling progs.
> imo much cleaner than kernel maintaining headers-fs and wasting memory.

So, in my original proposal I recommended unmounting when not needing
it, which would remove the memory usage as well.

> Where kheaders.tar.xz is placed doesn't really matter.
> /proc or /sys/kernel makes no real difference.

If done in a location that isn't a perpetual ABI commitment, a tarball
solution is something we can work with.


-Olof
