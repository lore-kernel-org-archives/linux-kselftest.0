From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 16 Apr 2019 08:33:06 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
Message-ID: <20190416083306.5646a687@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416123306.4kJsY8ud7cx_hsmeaN60YF7L8RVDswRL_BBYWe_VKBk@z>

On Mon, 15 Apr 2019 22:50:10 -0500
Kees Cook <keescook@chromium.org> wrote:

> On Mon, Apr 15, 2019@9:41 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > I agree with this assessment. We shouldn't use config.gz as precedence
> > for this solution. config.gz should have been in debugfs to begin with,
> > but I don't believe debugfs was around when config.gz was introduced.
> > (Don't have time to look into the history of the two).  
> 
> I don't agree with this: /proc/config.gz is used by a lot of tools
> that do sanity-check of running systems. This isn't _debugging_...
> it's verifying correct kernel builds. It's a fancy version of checking
> /proc/version.
> 

Then we should perhaps make a new file system call tarballs ;-)

 /sys/kernel/tarballs/

and place everything there. That way it removes it from /proc (which is
the worse place for that) and also makes it something other than debug.
That's what I did for tracefs.

-- Steve
