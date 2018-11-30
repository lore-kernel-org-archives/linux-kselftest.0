From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:46:23 -0800
Subject: [RFC v3 16/19] arch: um: make UML unflatten device tree when
 testing
In-Reply-To: <20181128193636.254378-17-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-17-brendanhiggins@google.com>
Message-ID: <20181130034623.GQ18410@garbanzo.do-not-panic.com>

On Wed, Nov 28, 2018 at 11:36:33AM -0800, Brendan Higgins wrote:
> Make UML unflatten any present device trees when running KUnit tests.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  arch/um/kernel/um_arch.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
> index a818ccef30ca2..bd58ae3bf4148 100644
> --- a/arch/um/kernel/um_arch.c
> +++ b/arch/um/kernel/um_arch.c
> @@ -13,6 +13,7 @@
>  #include <linux/sched.h>
>  #include <linux/sched/task.h>
>  #include <linux/kmsg_dump.h>
> +#include <linux/of_fdt.h>
>  
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
> @@ -347,6 +348,9 @@ void __init setup_arch(char **cmdline_p)
>  	read_initrd();
>  
>  	paging_init();
> +#if IS_ENABLED(CONFIG_OF_UNITTEST)
> +	unflatten_device_tree();
> +#endif

*Why?*

  Luis
