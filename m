From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Sat, 11 May 2019 08:02:03 +0200
Subject: [PATCH 3/3] kheaders: Make it depend on sysfs
In-Reply-To: <CAK7LNATeJqmE29M=Y1Vexg8nnRdr3qUDkq1BejN7t2_106PgVg@mail.gmail.com>
References: <20190510210243.152808-1-joel@joelfernandes.org>
 <20190510210243.152808-4-joel@joelfernandes.org>
 <CAK7LNATeJqmE29M=Y1Vexg8nnRdr3qUDkq1BejN7t2_106PgVg@mail.gmail.com>
Message-ID: <20190511060203.GA18650@kroah.com>

On Sat, May 11, 2019 at 09:52:04AM +0900, Masahiro Yamada wrote:
> On Sat, May 11, 2019 at 6:05 AM Joel Fernandes (Google)
> <joel at joelfernandes.org> wrote:
> >
> > The kheaders archive is exposed through SYSFS in /sys/kernel/. Make it
> > depend on SYSFS as it makes no sense to enable this feature without it.
> 
> 
> And, it also makes no sense to break the feature by 1/3,
> then fix it by 3/3.
> 
> 
> Why don't you squash this?

I agree, this belongs in patch 1/3.
