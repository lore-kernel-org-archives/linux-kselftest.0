From: catalin.marinas@arm.com (Catalin Marinas)
Date: Thu, 29 Nov 2018 18:22:18 +0000
Subject: [PATCH v8 1/8] arm64: add type casts to untagged_addr macro
In-Reply-To: <4a4063a3e074608b99cf22ab447fecc36d056251.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
 <4a4063a3e074608b99cf22ab447fecc36d056251.1541687720.git.andreyknvl@google.com>
Message-ID: <20181129182218.GH22027@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181129182218.vm5KTygLRTTU8a-DFeo0Q8i9xGaeUJPCJebyG8ZMZs0@z>

On Thu, Nov 08, 2018@03:36:08PM +0100, Andrey Konovalov wrote:
> This patch makes the untagged_addr macro accept all kinds of address types
> (void *, unsigned long, etc.) and allows not to specify type casts in each
> place where it is used. This is done by using __typeof__.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>  arch/arm64/include/asm/uaccess.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 07c34087bd5e..c1325271e368 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -101,7 +101,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
>   * up with a tagged userland pointer. Clear the tag to get a sane pointer to
>   * pass on to access_ok(), for instance.
>   */
> -#define untagged_addr(addr)		sign_extend64(addr, 55)
> +#define untagged_addr(addr)		\
> +	((__typeof__(addr))sign_extend64((__u64)(addr), 55))

Nitpick: same comment as here (use u64):

http://lkml.kernel.org/r/20181123173739.osgvnnhmptdgtlnl at lakrids.cambridge.arm.com

Acked-by: Catalin Marinas <catalin.marinas at arm.com>

(not acking the whole series just yet, only specific patches to remember
what I reviewed)
