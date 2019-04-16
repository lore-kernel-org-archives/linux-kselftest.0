From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 16 Apr 2019 13:22:38 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
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
 <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
Message-ID:
 <CAEXW_YS=C8FkC1h4ZQ6_jX8jY==Xe66c+q9cgM=Ci+N7SyNz6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416172238.weW45pL-2HCQCjG2UZKQDRRzNZjqLRi8_uPw1OF3d_0@z>

On Tue, Apr 16, 2019@12:57 PM Olof Johansson <olof@lixom.net> wrote:
[snip]
> > Where kheaders.tar.xz is placed doesn't really matter.
> > /proc or /sys/kernel makes no real difference.
>
> If done in a location that isn't a perpetual ABI commitment, a tarball
> solution is something we can work with.

This is the part I don't get, Olof. It has to be an ABI commitment so
that the tools always work. Why are we so interested in breaking
userspace tools? We want a robust solution, not a fragile one.

thanks,

 - Joel
