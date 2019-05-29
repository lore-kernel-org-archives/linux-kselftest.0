From: khalid.aziz@oracle.com (Khalid Aziz)
Date: Wed, 29 May 2019 08:49:09 -0600
Subject: [PATCH v15 01/17] uaccess: add untagged_addr definition for
 other arches
In-Reply-To: <67ae3bd92e590d42af22ef2de0ad37b730a13837.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <67ae3bd92e590d42af22ef2de0ad37b730a13837.1557160186.git.andreyknvl@google.com>
Message-ID: <3ade20696cc772772f5362fea02ede81c4a0fad3.camel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190529144909.rhivOA4J4OQx1bqavLugR1JP2RSUnOun5owvpBKYi14@z>

On Mon, 2019-05-06@18:30 +0200, Andrey Konovalov wrote:
> To allow arm64 syscalls to accept tagged pointers from userspace, we
> must
> untag them when they are passed to the kernel. Since untagging is
> done in
> generic parts of the kernel, the untagged_addr macro needs to be
> defined
> for all architectures.
> 
> Define it as a noop for architectures other than arm64.
> 
> Acked-by: Catalin Marinas <catalin.marinas at arm.com>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>  include/linux/mm.h | 4 ++++
>  1 file changed, 4 insertions(+)

As discussed in the other thread Chris started, there is a generic need
to untag addresses in kernel and this patch gets us ready for that.

Reviewed-by: Khalid Aziz <khalid.aziz at oracle.com>

> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6b10c21630f5..44041df804a6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
>  
> +#ifndef untagged_addr
> +#define untagged_addr(addr) (addr)
> +#endif
> +
>  #ifndef __pa_symbol
>  #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
>  #endif
