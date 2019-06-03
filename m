From: andreyknvl at google.com (Andrey Konovalov)
Date: Mon, 3 Jun 2019 19:06:14 +0200
Subject: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
In-Reply-To: <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
Message-ID: <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>

On Mon, Jun 3, 2019 at 7:04 PM Khalid Aziz <khalid.aziz at oracle.com> wrote:
>
> On 6/3/19 10:55 AM, Andrey Konovalov wrote:
> > To allow arm64 syscalls to accept tagged pointers from userspace, we must
> > untag them when they are passed to the kernel. Since untagging is done in
> > generic parts of the kernel, the untagged_addr macro needs to be defined
> > for all architectures.
> >
> > Define it as a noop for architectures other than arm64.
> >
> > Acked-by: Catalin Marinas <catalin.marinas at arm.com>
> > Reviewed-by: Khalid Aziz <khalid.aziz at oracle.com>
> > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> > ---
> >  include/linux/mm.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 0e8834ac32b7..949d43e9c0b6 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
> >  #include <asm/pgtable.h>
> >  #include <asm/processor.h>
> >
> > +#ifndef untagged_addr
> > +#define untagged_addr(addr) (addr)
> > +#endif
> > +
> >  #ifndef __pa_symbol
> >  #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
> >  #endif
> >
>
> Andrey,
>
> This patch has now become part of the other patch series Chris Hellwig
> has sent out -
> <https://lore.kernel.org/lkml/20190601074959.14036-1-hch at lst.de/>. Can
> you coordinate with that patch series?

Hi!

Yes, I've seen it. How should I coordinate? Rebase this series on top
of that one?

Thanks!

>
> --
> Khalid
>
