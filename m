From: olof at lixom.net (Olof Johansson)
Date: Tue, 16 Apr 2019 09:42:51 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190416104346.10cca21f@gandalf.local.home>
References: <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home> <20190416124939.GB6027@kroah.com>
 <20190416130440.GA7944@localhost>
 <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
 <20190416094509.1af6326b@gandalf.local.home>
 <20190416142240.GA31920@kroah.com>
 <20190416104346.10cca21f@gandalf.local.home>
Message-ID: <CAOesGMjRPoy4JO24rNZHORpSN0Hg53ajHKZNM15YDCkDah=+6A@mail.gmail.com>

On Tue, Apr 16, 2019 at 7:43 AM Steven Rostedt <rostedt at goodmis.org> wrote:
>
> On Tue, 16 Apr 2019 16:22:40 +0200
> Greg Kroah-Hartman <gregkh at linuxfoundation.org> wrote:
>
> > If I make /sys/kernel/config.gz be the same thing as /proc/config.gz
> > will you fix up 'make localmodconfig' to use it?  :)
>
> Sure.

Doing a link to the new location is probably best, just like
/proc/device-tree is today.


-Olof
