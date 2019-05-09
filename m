From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 9 May 2019 18:47:43 -0400
Subject: [PATCH v3] kheaders: Move from proc to sysfs
In-Reply-To: <CAK7LNAQesyT-vspoGKdgRqycZfhtJm5Upx2T6ij-yB5i4Nx5nw@mail.gmail.com>
References: <20190506013456.86061-1-joel@joelfernandes.org>
 <CAK7LNAQesyT-vspoGKdgRqycZfhtJm5Upx2T6ij-yB5i4Nx5nw@mail.gmail.com>
Message-ID: <20190509224743.GA29215@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509224743.0w--zBZFNlapl5YNl3COelewsoiY-TIMArUp3BZFr10@z>

On Wed, May 08, 2019@12:43:34PM +0900, Masahiro Yamada wrote:
> On Mon, May 6, 2019 at 10:37 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > The kheaders archive consisting of the kernel headers used for compiling
> > bpf programs is in /proc. However there is concern that moving it here
> > will make it permanent. Let us move it to /sys/kernel as discussed [1].
> >
> > [1] https://lore.kernel.org/patchwork/patch/1067310/#1265969
> >
> > Suggested-by: Steven Rostedt <rostedt at goodmis.org>
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > ---
> > This patch applies on top of the previous patch that was applied to the
> > driver tree:
> > https://lore.kernel.org/patchwork/patch/1067310/
> >
> > v2->v3: Fixed sysfs file mode nit (Greg).
> > v1->v2: Fixed some kconfig nits.
> >
> >  init/Kconfig                                | 16 ++++-----
> >  kernel/Makefile                             |  4 +--
> >  kernel/{gen_ikh_data.sh => gen_kheaders.sh} |  2 +-
> >  kernel/kheaders.c                           | 40 +++++++++------------
> >  4 files changed, 26 insertions(+), 36 deletions(-)
> >  rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (98%)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 26a364a95b57..c3661991b089 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -579,15 +579,13 @@ config IKCONFIG_PROC
> >           This option enables access to the kernel configuration file
> >           through /proc/config.gz.
> >
> > -config IKHEADERS_PROC
> > -       tristate "Enable kernel header artifacts through /proc/kheaders.tar.xz"
> > -       depends on PROC_FS
> > -       help
> > -         This option enables access to the kernel header and other artifacts that
> > -         are generated during the build process. These can be used to build eBPF
> > -         tracing programs, or similar programs.  If you build the headers as a
> > -         module, a module called kheaders.ko is built which can be loaded on-demand
> > -         to get access to the headers.
> > +config IKHEADERS
> > +       tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
> 
> 
> I suggested "depends on SYSFS" twice, both in v1 and v2.
> 
> https://lore.kernel.org/patchwork/patch/1069806/#1266147
> https://lore.kernel.org/patchwork/patch/1070005/#1266279

Sorry about missing that. I have made a note of this, and can address it in a
later patch. There is a more pressing issue with allmodconfig regression
times so I will look into that first. Also a vacation is taking up some of my
time.

Needless to say I will get to it soon and the point has been duly noted!

thanks,

 - Joel
