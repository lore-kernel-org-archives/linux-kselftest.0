From: yamada.masahiro at socionext.com (Masahiro Yamada)
Date: Sat, 13 Apr 2019 10:30:10 +0900
Subject: [PATCH v7 1/2] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190412195125.3891-1-joel@joelfernandes.org>
References: <20190412195125.3891-1-joel@joelfernandes.org>
Message-ID: <CAK7LNAR=KN3gnJT5w1HgrZ5UyeiNZy_rn1Z1wWwgwy3eGF4RgQ@mail.gmail.com>

On Sat, Apr 13, 2019 at 4:54 AM Joel Fernandes (Google)
<joel at joelfernandes.org> wrote:
>
> Introduce in-kernel headers which are made available as an archive
> through proc (/proc/kheaders.tar.xz file). This archive makes it
> possible to run eBPF and other tracing programs that need to extend the
> kernel for tracing purposes without any dependency on the file system
> having headers.
>
> A github PR is sent for the corresponding BCC patch at:
> https://github.com/iovisor/bcc/pull/2312
>
> On Android and embedded systems, it is common to switch kernels but not
> have kernel headers available on the file system. Further once a
> different kernel is booted, any headers stored on the file system will
> no longer be useful. This is an issue even well known to distros.
> By storing the headers as a compressed archive within the kernel, we can
> avoid these issues that have been a hindrance for a long time.
>
> The best way to use this feature is by building it in. Several users
> have a need for this, when they switch debug kernels, they do not want to
> update the filesystem or worry about it where to store the headers on
> it. However, the feature is also buildable as a module in case the user
> desires it not being part of the kernel image. This makes it possible to
> load and unload the headers from memory on demand. A tracing program can
> load the module, do its operations, and then unload the module to save
> kernel memory. The total memory needed is 3.3MB.
>
> By having the archive available at a fixed location independent of
> filesystem dependencies and conventions, all debugging tools can
> directly refer to the fixed location for the archive, without concerning
> with where the headers on a typical filesystem which significantly
> simplifies tooling that needs kernel headers.
>
> The code to read the headers is based on /proc/config.gz code and uses
> the same technique to embed the headers.
>
> Other approaches were discussed such as having an in-memory mountable
> filesystem, but that has drawbacks such as requiring an in-kernel xz
> decompressor which we don't have today, and requiring usage of 42 MB of
> kernel memory to host the decompressed headers at anytime. Also this
> approach is simpler than such approaches.
>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---


I just noticed minor typos in comment lines (see below).

Anyway, I have no more comment from the build system of view.
So,

Reviewed-by: Masahiro Yamada <yamada.masahiro at socionext.com>



> diff --git a/kernel/kheaders.c b/kernel/kheaders.c
> new file mode 100644
> index 000000000000..19526294a4e8
> --- /dev/null
> +++ b/kernel/kheaders.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Provide kernel headers useful to build tracing programs
> + * such as for running eBPF tracing tools.
> + *
> + * (Borrowed code from kernel/configs.c)
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/proc_fs.h>
> +#include <linux/init.h>
> +#include <linux/uaccess.h>
> +
> +/*
> + * Define kernel_headers_data and kernel_headers_data_end, within which the the
> + * compressed kernel headers are stpred. The file is first compressed with xz.
> + */


"the the" -> "the"     ?
"stpred"  -> "stored"  ?


It is up to you if you want to send v8.




-- 
Best Regards
Masahiro Yamada
