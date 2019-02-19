From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Tue, 19 Feb 2019 13:42:13 +0900
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNAThSm1n1B_Ss0gRDZ3H-DWj2bvpZ+6Ui2jEo4Pt9YynEA@mail.gmail.com>
References: <20190211143600.15021-1-joel@joelfernandes.org>
 <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
 <CAK7LNAThSm1n1B_Ss0gRDZ3H-DWj2bvpZ+6Ui2jEo4Pt9YynEA@mail.gmail.com>
Message-ID:
 <CAK7LNATf4adEEqWko2YO46wHHi-Vvc+_LBjQGNnM7rt8GSOgZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190219044213.5fO8yu2LUH68hJ5pVRuV_0Zt24M1svWwuZpiO9qZXE0@z>

On Tue, Feb 19, 2019 at 1:14 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Feb 15, 2019 at 11:48 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Feb 11, 2019@09:35:59AM -0500, Joel Fernandes (Google) wrote:
> > > Introduce in-kernel headers and other artifacts which are made available
> > > as an archive through proc (/proc/kheaders.txz file).
>
>
> The extension '.txz' is not used in kernel code.
>
>
> '.tar.xz' is used for 'tarxz-pkg', 'perf-tarxz-src-pkg' etc.
>
>
> $ git grep  '\.txz'
> $ git grep  '\.tar\.xz'
> Documentation/admin-guide/README.rst:     xz -cd linux-4.X.tar.xz | tar xvf -
> arch/x86/crypto/camellia-aesni-avx-asm_64.S: *
> http://koti.mbnet.fi/axh/crypto/camellia-BSD-1.2.0-aesni1.tar.xz
> crypto/testmgr.h: *   https://bench.cr.yp.to/supercop/supercop-20170228.tar.xz
> crypto/testmgr.h: *   https://bench.cr.yp.to/supercop/supercop-20170228.tar.xz
> crypto/testmgr.h: *   https://bench.cr.yp.to/supercop/supercop-20170228.tar.xz
> crypto/testmgr.h: *   https://bench.cr.yp.to/supercop/supercop-20170228.tar.xz
> crypto/testmgr.h: *   https://bench.cr.yp.to/supercop/supercop-20170228.tar.xz
> scripts/package/Makefile:       @echo '  perf-tarxz-src-pkg  - Build
> $(perf-tar).tar.xz source tarball'
> tools/testing/selftests/gen_kselftest_tar.sh:
>  ext=".tar.xz"
>
>
>
> I prefer '.tar.xz' for consistency.
>
>
>
>
>
>
> BTW, have you ever looked at scripts/extract-ikconfig?
>
> You added IKHD_ST and IKHD_ED
> just to mimic kernel/configs.c
>
> It is currently pointless without the extracting tool,
> but you might think it is useful to extract headers
> from vmlinux or the module without mounting procfs.
>
>
>
>
> > > This archive makes
> > > it possible to build kernel modules, run eBPF programs, and other
> > > tracing programs that need to extend the kernel for tracing purposes
> > > without any dependency on the file system having headers and build
> > > artifacts.
> > >
> > > On Android and embedded systems, it is common to switch kernels but not
> > > have kernel headers available on the file system. Raw kernel headers
> > > also cannot be copied into the filesystem like they can be on other
> > > distros, due to licensing and other issues. There's no linux-headers
> > > package on Android. Further once a different kernel is booted, any
> > > headers stored on the file system will no longer be useful. By storing
> > > the headers as a compressed archive within the kernel, we can avoid these
> > > issues that have been a hindrance for a long time.
> >
> > The set looks good to me and since the main use case is building bpf progs
> > I can route it via bpf-next tree if there are no objections.
> > Masahiro, could you please ack it?
>
>
> Honestly, I was not tracking this thread
> since I did not know I was responsible for this.
>
>
> I just started to take a closer look, then immediately got scared.
>
> This version is not mature enough for the merge.
>
>
>
> First of all, this patch cannot be compiled out-of-tree (O= option).
>
>
> I do not know why 0-day bot did not catch this apparent breakage.
>
>
> $ make -j8 O=hoge
> make[1]: Entering directory '/home/masahiro/workspace/bsp/linux/hoge'
>   GEN     Makefile
>   Using .. as source for kernel
>   DESCEND  objtool
>   CALL    ../scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
> make[2]: *** No rule to make target 'Module.symvers', needed by
> 'kernel/kheaders_data.txz'.  Stop.
> make[2]: *** Waiting for unfinished jobs....
> /home/masahiro/workspace/bsp/linux/Makefile:1043: recipe for target
> 'kernel' failed
> make[1]: *** [kernel] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/home/masahiro/workspace/bsp/linux/hoge'
> Makefile:152: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2




I saw this build error for in-tree building as well.

We cannot build this from a pristine source tree.

For example, I observed the build error in the following procedure.

$ make mrproper
$ make defconfig
 Set CONFIG_IKHEADERS_PROC=y
$ make




Module.symvers is generated in the modpost stage
(the very last stage of build).

But, vmlinux depends on kernel/kheaders_data.txz,
which includes Module.symvers.

So, this is not so simple since it is a circular dependency...




-- 
Best Regards
Masahiro Yamada
