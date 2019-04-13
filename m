From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Sat, 13 Apr 2019 11:58:53 +0900
Subject: [PATCH v6 1/2] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAKOZueuf8qM1O7c+m7zRHv1b6-YsZmWoTBfErBLY+yV1pyESmQ@mail.gmail.com>
References: <20190408212855.233198-1-joel@joelfernandes.org>
 <CAK7LNAQgvhozubW9b2yqnxHAVE17VHHZiq6N4Py_TzFCHN0YUQ@mail.gmail.com>
 <20190412180014.GA175945@google.com>
 <CAK7LNAT83SijpivFJA8GS=bOsgfnV03fo+-QJFgO1SgmLBOiQw@mail.gmail.com>
 <CAKOZueuf8qM1O7c+m7zRHv1b6-YsZmWoTBfErBLY+yV1pyESmQ@mail.gmail.com>
Message-ID:
 <CAK7LNATW0EQ+uYqGgEbzp1pzajs2CBOWT937JOCNnepP3AAD1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413025853.NzyqsiB48hkc4Y76k2TlsvgS9L1fErejoYCzXst6YJc@z>

On Sat, Apr 13, 2019@10:53 AM Daniel Colascione <dancol@google.com> wrote:
>
> On Fri, Apr 12, 2019 at 6:49 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, Apr 13, 2019@3:02 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > >
> > > > > +extern char kernel_headers_data;
> > > > > +extern char kernel_headers_data_end;
> > > > > +
> > > > > +static ssize_t
> > > > > +ikheaders_read_current(struct file *file, char __user *buf,
> > > >
> > > > Could you stretch this line ?
> > > > It will still fit in 80-cols.
> > > >
> > > > (This is a coding style error in kernel/configs.c)
> > >
> > > It takes 87 cols if I expand, so I'll leave it as is.
> > >
> >
> >
> > Sorry if what I said was unclear.
> >
> > Since I just did not a good reason to put
> > "static ssize_t" in the previous line,
> > I meant like follows:
> >
> >
> > [Before]
> > static ssize_t
> > ikheaders_read_current(struct file *file, char __user *buf,
> >                        size_t len, loff_t *offset)
> >
> >
> >
> > [After]
> > static ssize_t ikheaders_read_current(struct file *file, char __user *buf,
> >                                       size_t len, loff_t *offset)
> >
> >
> > (takes 74-cols.)
> >
> >
> > (I am sending this from Gmail, so I am not sure
> > how it will look like from you...)
> >
> >
> > Anyway, it is super-bikeshedding stuff.
> > It is OK as-is.
> >
>
> What about sorting the files for determinism?


Do you mean the order of files in the tar archive?
I think it is a good idea for reproducible build.



It looks like the tar command supports --sort=name option,
but I did not test it at all.



Perhaps, the sorting policy could be affected by locale.
We saw it for the 'find' command.
I am not sure about the tar command though.



commit f55f2328bb28a8517620518c5d124f5194673309
Author: Andrzej Pietrasiewicz <andrzej.p at samsung.com>
Date:   Fri Aug 17 14:03:19 2018 +0200

    kbuild: make sorting initramfs contents independent of locale








--
Best Regards
Masahiro Yamada
