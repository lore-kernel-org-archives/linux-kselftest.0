From: catalin.marinas@arm.com (Catalin Marinas)
Date: Tue, 18 Dec 2018 17:59:38 +0000
Subject: [RFC][PATCH 0/3] arm64 relaxed ABI
In-Reply-To: <CAAeHK+zxYJDJ7DJuDAOuOMgGvckFwMAoVUTDJzb6MX3WsXhRTQ@mail.gmail.com>
References: <cover.1544445454.git.andreyknvl@google.com>
 <20181210143044.12714-1-vincenzo.frascino@arm.com>
 <CAAeHK+xPZ-Z9YUAq=3+hbjj4uyJk32qVaxZkhcSAHYC4mHAkvQ@mail.gmail.com>
 <20181212150230.GH65138@arrakis.emea.arm.com>
 <CAAeHK+zxYJDJ7DJuDAOuOMgGvckFwMAoVUTDJzb6MX3WsXhRTQ@mail.gmail.com>
Message-ID: <20181218175938.GD20197@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181218175938.piIAmPRH4r-Z-z1PPx4mpQDPiX-Dn7BXFGy1kcLkfyI@z>

On Tue, Dec 18, 2018@04:03:38PM +0100, Andrey Konovalov wrote:
> On Wed, Dec 12, 2018@4:02 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > The summary of our internal discussions (mostly between kernel
> > developers) is that we can't properly describe a user ABI that covers
> > future syscalls or syscall extensions while not all syscalls accept
> > tagged pointers. So we tweaked the requirements slightly to only allow
> > tagged pointers back into the kernel *if* the originating address is
> > from an anonymous mmap() or below sbrk(0). This should cover some of the
> > ioctls or getsockopt(TCP_ZEROCOPY_RECEIVE) where the user passes a
> > pointer to a buffer obtained via mmap() on the device operations.
> >
> > (sorry for not being clear on what Vincenzo's proposal implies)
> 
> OK, I see. So I need to make the following changes to my patchset AFAIU.
> 
> 1. Make sure that we only allow tagged user addresses that originate
> from an anonymous mmap() or below sbrk(0). How exactly should this
> check be performed?

I don't think we should perform such checks. That's rather stating that
the kernel only guarantees that the tagged pointers work if they
originated from these memory ranges.

> 2. Allow tagged addressed passed to memory syscalls (as long as (1) is
> satisfied). Do I understand correctly that this means that I need to
> locate all find_vma() callers outside of mm/ and fix them up as well?

Yes (unless anyone as a better idea or objections to this approach).

BTW, I'll be off until the new year, so won't be able to follow up.

-- 
Catalin
