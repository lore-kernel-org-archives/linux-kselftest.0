From: dancol@google.com (Daniel Colascione)
Date: Fri, 12 Apr 2019 20:18:49 -0700
Subject: [PATCH v6 1/2] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAK7LNAS8LroP_N76ZS2OLZKaxSMA3UubdE1r7QzkqCt-TFmnWA@mail.gmail.com>
References: <20190408212855.233198-1-joel@joelfernandes.org>
 <CAK7LNAQgvhozubW9b2yqnxHAVE17VHHZiq6N4Py_TzFCHN0YUQ@mail.gmail.com>
 <20190412180014.GA175945@google.com>
 <CAK7LNAT83SijpivFJA8GS=bOsgfnV03fo+-QJFgO1SgmLBOiQw@mail.gmail.com>
 <CAKOZueuf8qM1O7c+m7zRHv1b6-YsZmWoTBfErBLY+yV1pyESmQ@mail.gmail.com>
 <CAK7LNATW0EQ+uYqGgEbzp1pzajs2CBOWT937JOCNnepP3AAD1g@mail.gmail.com>
 <CAK7LNAS8LroP_N76ZS2OLZKaxSMA3UubdE1r7QzkqCt-TFmnWA@mail.gmail.com>
Message-ID:
 <CAKOZuetDdtGoN8aNm6KF2N3Oz-QGO3PeTex=7VLoem_jDeaknw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413031849.ppasBEmk1iu-drsd80Iy0sYr9OP71QLSOq19Qzgs1QM@z>

On Fri, Apr 12, 2019 at 8:10 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Apr 13, 2019 at 11:58 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, Apr 13, 2019@10:53 AM Daniel Colascione <dancol@google.com> wrote:
> > >
> > > On Fri, Apr 12, 2019 at 6:49 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > On Sat, Apr 13, 2019@3:02 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> > > >
> > > > >
> > > > > > > +extern char kernel_headers_data;
> > > > > > > +extern char kernel_headers_data_end;
> > > > > > > +
> > > > > > > +static ssize_t
> > > > > > > +ikheaders_read_current(struct file *file, char __user *buf,
> > > > > >
> > > > > > Could you stretch this line ?
> > > > > > It will still fit in 80-cols.
> > > > > >
> > > > > > (This is a coding style error in kernel/configs.c)
> > > > >
> > > > > It takes 87 cols if I expand, so I'll leave it as is.
> > > > >
> > > >
> > > >
> > > > Sorry if what I said was unclear.
> > > >
> > > > Since I just did not a good reason to put
> > > > "static ssize_t" in the previous line,
> > > > I meant like follows:
> > > >
> > > >
> > > > [Before]
> > > > static ssize_t
> > > > ikheaders_read_current(struct file *file, char __user *buf,
> > > >                        size_t len, loff_t *offset)
> > > >
> > > >
> > > >
> > > > [After]
> > > > static ssize_t ikheaders_read_current(struct file *file, char __user *buf,
> > > >                                       size_t len, loff_t *offset)
> > > >
> > > >
> > > > (takes 74-cols.)
> > > >
> > > >
> > > > (I am sending this from Gmail, so I am not sure
> > > > how it will look like from you...)
> > > >
> > > >
> > > > Anyway, it is super-bikeshedding stuff.
> > > > It is OK as-is.
> > > >
> > >
> > > What about sorting the files for determinism?
> >
> >
> > Do you mean the order of files in the tar archive?

Yes.

> > I think it is a good idea for reproducible build.
> >
> >
> >
> > It looks like the tar command supports --sort=name option,
> > but I did not test it at all.
> >
> >
> >
> > Perhaps, the sorting policy could be affected by locale.
> > We saw it for the 'find' command.
>
>
> 'sort' command is affected by locale.

It should be independent of locale if you set LC_ALL=C in the
environment while running it.
