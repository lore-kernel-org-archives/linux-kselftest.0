From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 21 Feb 2019 10:29:04 -0500
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNAQ7GqCNc008ZZ4K0_BdTVMdwwVUgnfqBO-kDBmw4ikr3w@mail.gmail.com>
References: <20190211143600.15021-1-joel@joelfernandes.org>
 <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
 <CAK7LNAThSm1n1B_Ss0gRDZ3H-DWj2bvpZ+6Ui2jEo4Pt9YynEA@mail.gmail.com>
 <CAK7LNATf4adEEqWko2YO46wHHi-Vvc+_LBjQGNnM7rt8GSOgZQ@mail.gmail.com>
 <20190219151652.GA110907@google.com>
 <CAK7LNAQ7GqCNc008ZZ4K0_BdTVMdwwVUgnfqBO-kDBmw4ikr3w@mail.gmail.com>
Message-ID: <20190221152904.GC19213@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190221152904.dfZymOdhf0kprQokAU_bdaSpdrynntxnc7I4NwJ2h4Y@z>

On Thu, Feb 21, 2019@11:34:41PM +0900, Masahiro Yamada wrote:
> On Wed, Feb 20, 2019@12:17 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> >
> > Firstly, I want to apologize for not testing this and other corner cases you
> > brought up. I should have known better. Since my build was working, I assumed
> > that the feature is working. For that, I am very sorry.
> 
> 
> You do not need to apologize. 0day bot usually catches build errors.
> I guess 0day bot performs compile-tests only incrementally
> and that is why we did not get any report.

Oh ok :) thanks.

> > Secondly, it turns out Module.symvers circularly dependency problem also
> > exists with another use case.
> > If one does 'make modules_prepare' in a base kernel tree and then tries to
> > build modules with that tree, a warning like this is printed but the module
> > still gets built:
> >
> >   WARNING: Symbol version dump ./Module.symvers
> >            is missing; modules will have no dependencies and modversions.
> >
> >   CC [M]  /tmp/testmod/test.o
> >   Building modules, stage 2.
> >   MODPOST 1 modules
> >   CC      /tmp/testmod/test.mod.o
> >   LD [M]  /tmp/testmod/test.ko
> >
> > So, I am thinking that at least for first pass I will just drop the inclusion
> > of Module.symvers in the archive and allow any modules built using
> > /proc/kheaders.tar.xz to not use it.
> >
> > Kbuild will print a warning anyway when anyone tries to build using
> > /proc/kheaders.tar.xz, so if the user really wants module symbol versioning
> > then they should probably use a full kernel source tree with Module.symvers
> > available. For our usecase, kernel symbol versioning is a bit useless when
> > using /proc/kheaders.tar.gz because the proc file is generated with the same
> > kernel that the module is being built against, and subsequently loaded into
> > the kernel. So it is not likely that the CRC of a kernel symbol will be
> > different from what the module expects.
> 
> 
> Without Module.symver, modpost cannot check whether references are
> resolvable or not.
> 
> You will see "WARNING ... undefined" for every symbol referenced from
> the module.
> 
> 
> I am not an Android developer.
> So, I will leave this judge to other people.

IMO I don't see a way around this limiation but it would be nice if there was
a way to make it work. Since the kernel modules being built by this mechanism
are for tracing/debugging purposes, it is not a major concern for us.


> One more request if you have a chance to submit the next version.
> Please do not hide error messages.

Actually it was intended to suppress noise, not hide errors as such. I have
fixed all the errors in the next version and will be submitting it soon.

Thanks a lot for the review!

 - Joel


> I wondered why you redirected stdout/stderr from the script.
> 
> I applied the following patch, and I tested.  Then I see why.
> 
> Please fix your code instead of hiding underlying problems.
> 
> 
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 1d13a7a..a76ccbd 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -148,7 +148,7 @@ $(obj)/kheaders.o: $(obj)/kheaders_data.h
>  targets += kheaders_data.txz
> 
>  quiet_cmd_genikh = GEN     $(obj)/kheaders_data.txz
> -cmd_genikh = $(srctree)/scripts/gen_ikh_data.sh $@ $^ >/dev/null 2>&1
> +cmd_genikh = $(srctree)/scripts/gen_ikh_data.sh $@ $^
>  $(obj)/kheaders_data.txz: $(ikh_file_list) FORCE
>         $(call cmd,genikh)
> 
> 
> 
> 
> 
> 
> masahiro at grover:~/workspace/linux-yamada$ make
>   CALL    scripts/checksyscalls.sh
>   DESCEND  objtool
>   CHK     include/generated/compile.h
>   GEN     kernel/kheaders_data.txz
> find: ‘FORCE’: No such file or directory
> 70106 blocks
> Can't do inplace edit: kernel/kheaders_data.txz.tmp is not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/arch is not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/arch/x86 is not a
> regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/arch/x86/include
> is not a regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/uapi is not a regular
> file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/uapi/asm is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/generated is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/generated/uapi is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/generated/uapi/asm is
> not a regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/generated/asm is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm is not a regular
> file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/xen is not a regular
> file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/uv is not a regular
> file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/numachip is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/e820 is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/fpu is not a regular
> file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/crypto is not a
> regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/arch/x86/include/asm/trace is not a
> regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts is not a
> regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/genksyms
> is not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/ksymoops
> is not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/gdb is not
> a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/gdb/linux
> is not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/basic is
> not a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/dtc is not
> a regular file.
> Can't do inplace edit: kernel/kheaders_data.txz.tmp/scripts/dtc/libfdt
> is not a regular file.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes is not a
> regular file.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/arm64:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/xtensa:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/openrisc:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/nios2:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/mips:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/arm:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/microblaze:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/arc:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/sh:
> No such file or directory.
> Can't open kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/powerpc:
> No such file or directory.
> Can't do inplace edit:
> kernel/kheaders_data.txz.tmp/scripts/dtc/include-prefixes/dt-bindings
> is not a regular file.
> 
>   [ massive amount of error messages continues ]
> 
> 
> 
> 
> 
> 
> > I can't think any other ways at the moment to break the circular dependency
> > so I'm thinking this is good enough for now especially since Kbuild will
> > print a proper warning. Let me know what you think?
> >
> > thanks,
> >
> >  - Joel
> >
> --
> Best Regards
> Masahiro Yamada
