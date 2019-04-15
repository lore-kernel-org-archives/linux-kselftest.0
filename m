From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 15 Apr 2019 10:41:09 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
Message-ID: <20190415104109.64d914f3@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415144109.j9xGJsTCNKrz-NYYJjl4IcDrgRDL9rhhUKU5oCIcdSM@z>

On Sun, 14 Apr 2019 12:38:34 -0700
Olof Johansson <olof@lixom.net> wrote:

> >From my perspective, this is where we're at:  
> 
> This patch seems to have been met with a lot of responses in the tone
> of "this is not an appealing solution". Meanwhile, some of the
> suggested alternative solutions have not worked out, and we are now at
> a point where there's less interest in exploring alternatives and
> arguments to merge as-is with only minor adjustments.

Another consideration to make is difficulty of support. Having a
tarball compressed headers may not be an appealing solution, but it
isn't one that would be too much of an issue to support. Having a
better interface would be difficult to get right, and if you get it
wrong, you are now stuck with supporting something that may become a
big pain to do so in the future.

> I'd be a *lot* less hesitant if this went into debugfs or another
> location than /proc, which is one of the most regression-sensitive
> interfaces we have in the kernel.
> 

I agree with this assessment. We shouldn't use config.gz as precedence
for this solution. config.gz should have been in debugfs to begin with,
but I don't believe debugfs was around when config.gz was introduced.
(Don't have time to look into the history of the two).

-- Steve
