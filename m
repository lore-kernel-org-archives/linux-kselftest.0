From: kevin.brodsky@arm.com (Kevin Brodsky)
Date: Mon, 18 Mar 2019 11:33:14 +0000
Subject: [PATCH v11 03/14] lib, arm64: untag user pointers in strn*_user
In-Reply-To: <f7fa36ec55ed4b45f61d841f9b726772a04cc0a5.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <f7fa36ec55ed4b45f61d841f9b726772a04cc0a5.1552679409.git.andreyknvl@google.com>
Message-ID: <5de82e7d-6091-e694-8397-fbcfd59f9d0b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318113314.B9T8azrmdorAmlg-cDPlG14H65JWkL1xvTmhKBt3kas@z>

On 15/03/2019 19:51, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> strncpy_from_user and strnlen_user accept user addresses as arguments, and
> do not go through the same path as copy_from_user and others, so here we
> need to handle the case of tagged user addresses separately.
>
> Untag user pointers passed to these functions.
>
> Note, that this patch only temporarily untags the pointers to perform
> validity checks, but then uses them as is to perform user memory accesses.

Thank you for this new version, looks good to me.

To give a bit of context to the readers, I asked Andrey to make this change, because 
it makes a difference with hardware memory tagging. Indeed, in that situation, it is 
always preferable to access the memory using the user-provided tag, so that tag 
checking can take place; if there is a mismatch, a tag fault will occur (which is 
handled in a way similar to a page fault). It is also preferable not to assume that 
an untagged user pointer (tag 0x0) bypasses tag checks.

Kevin

>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>   lib/strncpy_from_user.c | 3 ++-
>   lib/strnlen_user.c      | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
> index 58eacd41526c..6209bb9507c7 100644
> --- a/lib/strncpy_from_user.c
> +++ b/lib/strncpy_from_user.c
> @@ -6,6 +6,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/kernel.h>
>   #include <linux/errno.h>
> +#include <linux/mm.h>
>   
>   #include <asm/byteorder.h>
>   #include <asm/word-at-a-time.h>
> @@ -107,7 +108,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
>   		return 0;
>   
>   	max_addr = user_addr_max();
> -	src_addr = (unsigned long)src;
> +	src_addr = (unsigned long)untagged_addr(src);
>   	if (likely(src_addr < max_addr)) {
>   		unsigned long max = max_addr - src_addr;
>   		long retval;
> diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
> index 1c1a1b0e38a5..8ca3d2ac32ec 100644
> --- a/lib/strnlen_user.c
> +++ b/lib/strnlen_user.c
> @@ -2,6 +2,7 @@
>   #include <linux/kernel.h>
>   #include <linux/export.h>
>   #include <linux/uaccess.h>
> +#include <linux/mm.h>
>   
>   #include <asm/word-at-a-time.h>
>   
> @@ -109,7 +110,7 @@ long strnlen_user(const char __user *str, long count)
>   		return 0;
>   
>   	max_addr = user_addr_max();
> -	src_addr = (unsigned long)str;
> +	src_addr = (unsigned long)untagged_addr(str);
>   	if (likely(src_addr < max_addr)) {
>   		unsigned long max = max_addr - src_addr;
>   		long retval;
