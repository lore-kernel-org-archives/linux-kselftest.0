From: joel@joelfernandes.org (Joel Fernandes)
Date: Sat, 11 May 2019 12:17:14 -0400
Subject: [PATCH 3/3] kheaders: Make it depend on sysfs
In-Reply-To: <20190511060203.GA18650@kroah.com>
References: <20190510210243.152808-1-joel@joelfernandes.org>
 <20190510210243.152808-4-joel@joelfernandes.org>
 <CAK7LNATeJqmE29M=Y1Vexg8nnRdr3qUDkq1BejN7t2_106PgVg@mail.gmail.com>
 <20190511060203.GA18650@kroah.com>
Message-ID: <20190511161714.GA179270@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190511161714._4-vbDp4kHFl6qgodcDE-qHN4chjqETWOQb5_IIA37I@z>

On Sat, May 11, 2019@08:02:03AM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 11, 2019@09:52:04AM +0900, Masahiro Yamada wrote:
> > On Sat, May 11, 2019 at 6:05 AM Joel Fernandes (Google)
> > <joel@joelfernandes.org> wrote:
> > >
> > > The kheaders archive is exposed through SYSFS in /sys/kernel/. Make it
> > > depend on SYSFS as it makes no sense to enable this feature without it.
> > 
> > 
> > And, it also makes no sense to break the feature by 1/3,
> > then fix it by 3/3.
> > 
> > 
> > Why don't you squash this?
> 
> I agree, this belongs in patch 1/3.

Fine with me. The reason I split it this way is I already had posted 1/3
recently for the driver tree [1], and I did not want to confuse Greg since he
was in the process of picking it up [2].

Anyway, I can resend the series soon with 1/3 and 3/3 squashed unless anyone
applying this is Ok with squashing it in their trees. thanks!

[1] https://lore.kernel.org/patchwork/patch/1070005/
[2] https://lore.kernel.org/patchwork/patch/1070005/#1267273

thanks,

 - Joel
