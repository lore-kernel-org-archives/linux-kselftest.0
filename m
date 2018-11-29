From: catalin.marinas at arm.com (Catalin Marinas)
Date: Thu, 29 Nov 2018 18:23:24 +0000
Subject: [PATCH v8 2/8] uaccess: add untagged_addr definition for other
 arches
In-Reply-To: <c9028422854fb5bfb79d798397b30d4701207062.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
 <c9028422854fb5bfb79d798397b30d4701207062.1541687720.git.andreyknvl@google.com>
Message-ID: <20181129182323.GI22027@arrakis.emea.arm.com>

On Thu, Nov 08, 2018 at 03:36:09PM +0100, Andrey Konovalov wrote:
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index efe79c1cdd47..c045b4eff95e 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -13,6 +13,10 @@
>  
>  #include <asm/uaccess.h>
>  
> +#ifndef untagged_addr
> +#define untagged_addr(addr) addr
> +#endif

Nitpick: add braces around (addr). Otherwise:

Acked-by: Catalin Marinas <catalin.marinas at arm.com>
