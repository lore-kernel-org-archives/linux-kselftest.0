From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 6 Mar 2019 12:49:04 -0500
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNARGQE9y6hr7ZoTbn5-GkPBN2Gk-4=3=Cfnr7Oy-+q69kg@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <201903030526.3AuYFiuN%fengguang.wu@intel.com>
 <CAJWu+op541tQ_TBJs-kOyRRBYDWiN0Znpb=cUQFxuLg-SmjO_g@mail.gmail.com>
 <CAK7LNARGQE9y6hr7ZoTbn5-GkPBN2Gk-4=3=Cfnr7Oy-+q69kg@mail.gmail.com>
Message-ID: <20190306174904.GA34256@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306174904.NPsYi22QcIKmQpmxMpcPq8IgtKCwHds8H1Jaid4JuVQ@z>

Hi Masahiro,
Thanks for review, my replies are inline:

On Wed, Mar 06, 2019@09:26:14PM +0900, Masahiro Yamada wrote:
> On Mon, Mar 4, 2019@1:15 AM Joel Fernandes <joelaf@google.com> wrote:
> >
> > This report is for an older version of the patch so ignore it. The
> > issue is already resolved.
> >
> > On Sat, Mar 2, 2019@2:00 PM kbuild test robot <lkp@intel.com> wrote:
> > >
> > > Hi Joel,
> > >
> > > Thank you for the patch! Yet something to improve:
> > >
> > > [auto build test ERROR on linus/master]
> > > [also build test ERROR on v5.0-rc8]
> > > [cannot apply to next-20190301]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes-Google/Provide-in-kernel-headers-for-making-it-easy-to-extend-the-kernel/20190303-014850
> > > config: sh-allmodconfig (attached as .config)
> > > compiler: sh4-linux-gnu-gcc (Debian 8.2.0-11) 8.2.0
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # save the attached .config to linux build tree
> > >         GCC_VERSION=8.2.0 make.cross ARCH=sh
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> find: 'arch/sh/kernel/module.lds': No such file or directory
> > > >> find: 'arch/sh/kernel/module.lds': No such file or directory
> > >
> > > ---
> > > 0-DAY kernel test infrastructure                Open Source Technology Center
> > > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "kernel-team" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe at android.com.
> 
> 
> 
> Honestly speaking, I am worried about some flaws
> in this feature, but anyway I read your code.

I am not sure what you mean by that :-(. All the previous series's comments
were addressed and it has been well tested by me and others. This looks quite
solid to me. Sorry it took so many revisions, this was not that easy to get right.

> Here are just comments from the build system point of view
> in case something might be useful.
> 
> Please feel free to adopt some of them if you think they are good.
>> [1]
> 
> Please do not ignore kbuild test robot.
> 
> It never makes such a mistake like
> replying to a new patch about the test result from old version.
> 
> The reports are really addressing this version (v4).
> 
> I see the error message even on x86.

I did not mean to. By the way - the error does not cause any issues. It is
just find being noisy. You are right I missed this, and I will correct this
in v5. However, it does not cause any issues to the feature/functionality at all.

> [2]
> 
> The shell script keeps running
> even when an error occurs.
> 
> If any line in a shell script fails,
> probably it went already wrong.
> 
> I highly recommend to add 'set -e'
> at the very beginning of your shell script.
> 
> It will propagate the error to Make.

Ok I will consider making it -e. But please note that, the script itself does
not have any bugs. When you say it this way, it looks a bit bad to the
onlooker as if there is bugs in the code, but there aren't any that I know
off. All the comments in this round of review from view are just cosmetic
changes.

> [3]
> 
> targets += kheaders_data.tar.xz
> targets += kheaders_data.h
> targets += kheaders.md5
> 
> These three lines are unneeded because
> 'targets' is necessary just for if_changed or if_changed_rule.
> 
> Instead, please add
> 
> clean-files := kheaders_data.tar.xz kheaders_data.h kheaders.md5

Ok.

> [4]
> 
> It is pointless to pass 'ikh_file_list'
> from Makefile to the shell script.
> 
> 
> You can directly describe the following in gen_ikh_data.sh
> 
> You do not need to use sed.
> 
> 
> src_file_list="
> include/
> arch/$SRCARCH/Makefile
> arch/$SRCARCH/include/
> arch/$SRCARCH/kernel/module.lds
> scripts/
> Makefile
> "
> 
> obj_file_list="
> scripts/
> include/
> arch/$SRCARCH/include/
> "

Honestly, I prefer to keep it in Makefile.

> if grep -q "^CONFIG_STACK_VALIDATION=y" $KCONFIG_CONFIG; then
>         obj_file_list="$obj_file_list tools/objtool/objtool"
> fi
> 
> 
> 
> Be careful about module.lds
> so that it will work for all architectures.

Yes.

> [5]
> strip-comments.pl is short enough,
> and I do not assume any other user.
> 
> 
> IMHO, it would be cleaner to embed the one-liner perl
> into the shell script, for example, like follows:
> 
> find  $cpio_dir -type f -print0 |
>  xargs -0 -P8 -n1 perl -pi -e 'BEGIN {undef $/;}; s/\/\*((?!SPDX).)*?\*\///smg;'

This does not work. I already tried it. But I guess I could generate the
script on the fly.

> [6]
> It might be better to move
> scripts/gen_ikh_data.sh to kernel/gen_ikh_data.sh
> 
> It will make this feature self-contained in kernel/.
> And (more importantly to me), it would reduce my maintenance field.

Sure.

> [7]
> I do not understand for what 'tarfile_md5' is used.
> Is it necessary?

It is just precaution, incase tar got corrupted and needs to be regenerated.

> [8]
> Is it more efficient to pipe the header files
> to perl script like this?
> 
> 
>  cat (header) | perl 'do something' > (tmp directory)

I don't think so.

> [9]
> 
> I'd prefer avoiding 'pushd && popd' if possible.
> 
> Hint: Kbuild already runs at the top directory
> of objtree.
> 
> 
> It is OK if the change would mess up the script.

This is needed to make out of tree builds work.

> [10]
> 
> You can embed a binary directly into C file
> without producing a giant header file.
> 
> I refactored kernel/configs.c
> https://lore.kernel.org/patchwork/patch/1042013/
> 
> Be careful; my patch has not been merged yet into the mainline.
> 
> It has been a while in linux-next,
> and I have not received any problem report.
> 
> So, I am guessing it will probably be merged
> in the current MW.

Ok I will consider doing this.

Thanks for the review!

 - Joel
