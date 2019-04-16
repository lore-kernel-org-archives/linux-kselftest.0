From: keescook at chromium.org (Kees Cook)
Date: Mon, 15 Apr 2019 22:50:10 -0500
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190415104109.64d914f3@gandalf.local.home>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
Message-ID: <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>

On Mon, Apr 15, 2019 at 9:41 AM Steven Rostedt <rostedt at goodmis.org> wrote:
> I agree with this assessment. We shouldn't use config.gz as precedence
> for this solution. config.gz should have been in debugfs to begin with,
> but I don't believe debugfs was around when config.gz was introduced.
> (Don't have time to look into the history of the two).

I don't agree with this: /proc/config.gz is used by a lot of tools
that do sanity-check of running systems. This isn't _debugging_...
it's verifying correct kernel builds. It's a fancy version of checking
/proc/version.

-- 
Kees Cook
