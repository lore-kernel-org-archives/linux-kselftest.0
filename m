From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Thu, 18 Apr 2019 12:14:58 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZueu=5aNf+oDFBM56TbqZwKpB6q1y81V1cbL+k4DTyV53+A@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com> <20190416192051.GA184889@google.com>
 <CAGLj2rELsr0PUgu41uZX_TKCpT-Q00X+cvgBhJ-U7RU3EBo5tA@mail.gmail.com>
 <CAKOZueu=5aNf+oDFBM56TbqZwKpB6q1y81V1cbL+k4DTyV53+A@mail.gmail.com>
Message-ID:
 <CAHk-=wi79KTxCYZgMZNapULR-ratPiZVt+fgh=DhgtYR_gYPAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418191458.R6V5P7C2DxSvMpoHGwG3t9XbvIlUX_PWb6Qa3O5N4X8@z>

On Thu, Apr 18, 2019@11:58 AM Daniel Colascione <dancol@google.com> wrote:
>
> On Thu, Apr 18, 2019@11:44 AM Jonathan Kowalski <bl0pbl33p@gmail.com> wrote:
> >
> > Would using something other than POLLIN be an option (maybe POLLPRI)?
> > The convention is to use it to indicate readability on the descriptor,
> > and also possibly POLLHUP instead of POLLERR (the latter is less of a
> > problem, but FreeBSD also does the same, so it'd help with some
> > consistency for libraries wanting to use this, which aren't interested
> > in other sub states).
>
> Existing event loop libraries generally support checking only for
> readability and writability. Not setting POLLIN would make these FDs
> more difficult to use with existing event loop libraries. What
> advantage would compensate for this difficulty?

Right.

Usually you'd set POLLIN in _addition_ to any other more specialized poll flag.

For example, when a socket has shut down the read side, we do

        if (sk->sk_shutdown & RCV_SHUTDOWN)
                mask |= EPOLLRDHUP | EPOLLIN | EPOLLRDNORM;

because while it's true that EPOLLRDHUP is the most _specific_ poll
bit, it's _also_ true that a read shutdown means that the read() will
return immediately.

So generally a HUP condition should mean that POLLIN and POLLOUT also
get set. Not because there's any actual _data_ to be read, but simply
because the read will not block.

                   Linus
