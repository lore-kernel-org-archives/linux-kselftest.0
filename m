From: gregkh at linuxfoundation.org (Greg KH)
Date: Sat, 4 May 2019 14:21:58 +0200
Subject: [PATCH v2] kheaders: Move from proc to sysfs
In-Reply-To: <20190504121213.183203-1-joel@joelfernandes.org>
References: <20190504121213.183203-1-joel@joelfernandes.org>
Message-ID: <20190504122158.GA23535@kroah.com>

On Sat, May 04, 2019 at 08:12:13AM -0400, Joel Fernandes (Google) wrote:
> The kheaders archive consisting of the kernel headers used for compiling
> bpf programs is in /proc. However there is concern that moving it here
> will make it permanent. Let us move it to /sys/kernel as discussed [1].
> 
> [1] https://lore.kernel.org/patchwork/patch/1067310/#1265969
> 
> Suggested-by: Steven Rostedt <rostedt at goodmis.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
> This patch applies on top of the previous patch that was applied to the
> driver tree:
> https://lore.kernel.org/patchwork/patch/1067310/
> 
> v1->v2: Fixed some kconfig nits (Masami).
> 
>  init/Kconfig                                | 16 ++++-----
>  kernel/Makefile                             |  4 +--
>  kernel/{gen_ikh_data.sh => gen_kheaders.sh} |  2 +-
>  kernel/kheaders.c                           | 40 +++++++++------------
>  4 files changed, 26 insertions(+), 36 deletions(-)
>  rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (98%)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 26a364a95b57..c3661991b089 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -579,15 +579,13 @@ config IKCONFIG_PROC
>  	  This option enables access to the kernel configuration file
>  	  through /proc/config.gz.
>  
> -config IKHEADERS_PROC
> -	tristate "Enable kernel header artifacts through /proc/kheaders.tar.xz"
> -	depends on PROC_FS
> -	help
> -	  This option enables access to the kernel header and other artifacts that
> -	  are generated during the build process. These can be used to build eBPF
> -	  tracing programs, or similar programs.  If you build the headers as a
> -	  module, a module called kheaders.ko is built which can be loaded on-demand
> -	  to get access to the headers.
> +config IKHEADERS
> +	tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
> +	help
> +	  This option enables access to the in-kernel headers that are generated during
> +	  the build process. These can be used to build eBPF tracing programs,
> +	  or similar programs.  If you build the headers as a module, a module called
> +	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>  
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 12399614c350..b32a558fae2f 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -70,7 +70,7 @@ obj-$(CONFIG_UTS_NS) += utsname.o
>  obj-$(CONFIG_USER_NS) += user_namespace.o
>  obj-$(CONFIG_PID_NS) += pid_namespace.o
>  obj-$(CONFIG_IKCONFIG) += configs.o
> -obj-$(CONFIG_IKHEADERS_PROC) += kheaders.o
> +obj-$(CONFIG_IKHEADERS) += kheaders.o

Good in changing the config name, I hadn't thought of that.

> diff --git a/kernel/gen_ikh_data.sh b/kernel/gen_kheaders.sh
> similarity index 98%
> rename from kernel/gen_ikh_data.sh
> rename to kernel/gen_kheaders.sh

Same here, nice.

> -static const struct file_operations ikheaders_file_ops = {
> -	.read = ikheaders_read_current,
> -	.llseek = default_llseek,
> +static struct bin_attribute kheaders_attr __ro_after_init = {

Minor nit, are you sure about __ro_after_init for an attribute
structure?  Is it even needed?

> +	.attr = {
> +		.name = "kheaders.tar.xz",
> +		.mode = S_IRUGO,
> +	},
> +	.read = &ikheaders_read,
>  };

BIN_ATTR_RO?  Ah, no, that will not work with the name of the file,
nevermind.

But, you should change S_IRUGO to the correct octal number, checkpatch
should have barfed on this change.

thanks,

greg k-h
