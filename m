From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 16 Apr 2019 10:21:16 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <20190416094509.1af6326b@gandalf.local.home>
References: <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home>
 <20190416124939.GB6027@kroah.com> <20190416130440.GA7944@localhost>
 <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
 <20190416094509.1af6326b@gandalf.local.home>
Message-ID: <20190416142116.GA183794@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416142116.ID2HU_K28m6ESrCbzAHI6TGPzmOMWb1w5YjOFiCoT-8@z>

On Tue, Apr 16, 2019@09:45:09AM -0400, Steven Rostedt wrote:
> On Tue, 16 Apr 2019 09:32:37 -0400
> Karim Yaghmour <karim.yaghmour@opersys.com> wrote:
> 
> > >>> Then we should perhaps make a new file system call tarballs ;-)
> > >>>
> > >>>   /sys/kernel/tarballs/
> > >>>
> > >>> and place everything there. That way it removes it from /proc (which is
> > >>> the worse place for that) and also makes it something other than debug.
> > >>> That's what I did for tracefs.  
> > >>
> > >> As horrible as that suggestion is, it does kind of make sense :)
> > >>
> > >> We can't put this in debugfs as that's only for debugging and systems
> > >> should never have that mounted for normal operations (users want to
> > >> build ebpf programs), and /proc really should be for processes but that
> > >> horse is long left the barn.
> > >>
> > >> But, I'm willing to consider putting this either in a system-fs-like
> > >> filesystem, or just in sysfs itself, we do have /sys/kernel/ to play
> > >> around in if the main objection is that we should not be cluttering up
> > >> /proc with stuff like this.
> > >>  
> > > 
> > > I am ok with the suggestion of /sys/kernel for the archive. That also seems
> > > to fit well with the idea that the headers are kernel related and probably
> > > belong here more strictly speaking, than /proc.  
> > 
> > This makes sense. And if it alleviates concerns regarding extending 
> > /proc ABIs then might as well switch to this.
> > 
> > Olof, what do you think of this?
> 
> BTW, the name "tarballs" was kind of a joke. Probably should come up
> with a better name. Although, I'm fine with tarballsfs ;-)

:-)
In theory, the headers could also be hosted in tracefs since the scope of the
patch right now is to help tracing tools (BCC / eBPF). Although /sys/kernel
might be better in case the scope is expanded to other things.

thanks,

 - Joel
