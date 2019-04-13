From: yamada.masahiro at socionext.com (Masahiro Yamada)
Date: Sat, 13 Apr 2019 10:48:21 +0900
Subject: [PATCH v6 1/2] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190412180014.GA175945@google.com>
References: <20190408212855.233198-1-joel@joelfernandes.org>
 <CAK7LNAQgvhozubW9b2yqnxHAVE17VHHZiq6N4Py_TzFCHN0YUQ@mail.gmail.com>
 <20190412180014.GA175945@google.com>
Message-ID: <CAK7LNAT83SijpivFJA8GS=bOsgfnV03fo+-QJFgO1SgmLBOiQw@mail.gmail.com>

On Sat, Apr 13, 2019 at 3:02 AM Joel Fernandes <joel at joelfernandes.org> wrote:

>
> > > +extern char kernel_headers_data;
> > > +extern char kernel_headers_data_end;
> > > +
> > > +static ssize_t
> > > +ikheaders_read_current(struct file *file, char __user *buf,
> >
> > Could you stretch this line ?
> > It will still fit in 80-cols.
> >
> > (This is a coding style error in kernel/configs.c)
>
> It takes 87 cols if I expand, so I'll leave it as is.
>


Sorry if what I said was unclear.

Since I just did not a good reason to put
"static ssize_t" in the previous line,
I meant like follows:


[Before]
static ssize_t
ikheaders_read_current(struct file *file, char __user *buf,
                       size_t len, loff_t *offset)



[After]
static ssize_t ikheaders_read_current(struct file *file, char __user *buf,
                                      size_t len, loff_t *offset)


(takes 74-cols.)


(I am sending this from Gmail, so I am not sure
how it will look like from you...)


Anyway, it is super-bikeshedding stuff.
It is OK as-is.



--
Best Regards
Masahiro Yamada
