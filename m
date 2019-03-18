From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon, 18 Mar 2019 14:16:54 +0100
Subject: [PATCH v11 08/14] net,
 arm64: untag user pointers in tcp_zerocopy_receive
In-Reply-To: <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
 <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com>
 <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
Message-ID:
 <CAAeHK+yxcG=KBjG0A5BicBA7Zwu6LR6t=g5b-9EAPXA8_Dfm2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318131654.2xSc7tdjVwUqzRpquYMLHwd7r8JBbjiqyTmrJcTQgTc@z>

On Mon, Mar 18, 2019@2:14 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Mar 15, 2019@9:03 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:
> >
> >
> >
> > On 03/15/2019 12:51 PM, Andrey Konovalov wrote:
> > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > pass tagged user pointers (with the top byte set to something else other
> > > than 0x00) as syscall arguments.
> > >
> > > tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
> > > can only by done with untagged pointers.
> > >
> > > Untag user pointers in this function.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> > > ---
> > >  net/ipv4/tcp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > > index 6baa6dc1b13b..89db3b4fc753 100644
> > > --- a/net/ipv4/tcp.c
> > > +++ b/net/ipv4/tcp.c
> > > @@ -1758,6 +1758,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
> > >       int inq;
> > >       int ret;
> > >
> > > +     address = untagged_addr(address);
> > > +
> > >       if (address & (PAGE_SIZE - 1) || address != zc->address)
> >
> > The second test will fail, if the top bits are changed in address but not in zc->address
>
> Will fix in v12, thanks Eric!

Looking at the code, what's the point of this address != zc->address
check? Should I just remove it?

>
> >
> > >               return -EINVAL;
> > >
> > >
> >
