From: qais.yousef at arm.com (Qais Yousef)
Date: Tue, 9 Apr 2019 16:00:34 +0100
Subject: [PATCH v6 1/2] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <20190408212855.233198-1-joel@joelfernandes.org>
References: <20190408212855.233198-1-joel@joelfernandes.org>
Message-ID: <20190409150034.qkeceveap4tblk25@e107158-lin.cambridge.arm.com>

On 04/08/19 17:28, Joel Fernandes (Google) wrote:
> Introduce in-kernel headers which are made available as an archive
> through proc (/proc/kheaders.tar.xz file). This archive makes it
> possible to run eBPF and other tracing programs tracing programs that
> need to extend the kernel for tracing purposes without any dependency on
> the file system having headers.
> 
> On Android and embedded systems, it is common to switch kernels but not
> have kernel headers available on the file system. Further once a
> different kernel is booted, any headers stored on the file system will
> no longer be useful. By storing the headers as a compressed archive
> within the kernel, we can avoid these issues that have been a hindrance
> for a long time.
> 
> The best way to use this feature is by building it in. Several users
> have a need for this, when they switch debug kernels, they donot want to
> update the filesystem or worry about it where to store the headers on
> it. However, the feature is also buildable as a module in case the user
> desires it not being part of the kernel image. This makes it possible to
> load and unload the headers from memory on demand. A tracing program, or
> a kernel module builder can load the module, do its operations, and then
> unload the module to save kernel memory. The total memory needed is 3.8MB.
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
> IKHD_ST and IKHD_ED markers as is to facilitate future patches that
> would extract the headers from a kernel or module image.
> 
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

I applied both patches on 5.1-rc2 and managed to compile and run several
eBPF programs using the untarred headers from /proc/kheaders.tar.xz on my juno.

Tested-by: Qais Yousef <qais.yousef at arm.com>

> ---
> 
>     v5 -> v6: (Masahiro Yamada suggestions mostly)
>     - Dropped support for module building.
>     - Rebuild archive if script changes.
>     - Move archive file list to script.
>     - Move build script to kernel directory.
> 
>     v4 -> v5:
>     (v4 was Tested-by the following folks)
>         Tested-by: qais.yousef at arm.com
>         Tested-by: dietmar.eggemann at arm.com
>         Tested-by: linux at manojrajarao.com

Thanks!

--
Qais Yousef
