From: joel at joelfernandes.org (Joel Fernandes)
Date: Wed, 6 Mar 2019 13:16:53 -0500
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAJWu+op541tQ_TBJs-kOyRRBYDWiN0Znpb=cUQFxuLg-SmjO_g@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <201903030526.3AuYFiuN%fengguang.wu@intel.com>
 <CAJWu+op541tQ_TBJs-kOyRRBYDWiN0Znpb=cUQFxuLg-SmjO_g@mail.gmail.com>
Message-ID: <20190306181653.GB34256@google.com>

 
> On Sat, Mar 2, 2019 at 2:00 PM kbuild test robot <lkp at intel.com> wrote:
> >
> > Hi Joel,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.0-rc8]
> > [cannot apply to next-20190301]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes-Google/Provide-in-kernel-headers-for-making-it-easy-to-extend-the-kernel/20190303-014850
> > config: sh-allmodconfig (attached as .config)
> > compiler: sh4-linux-gnu-gcc (Debian 8.2.0-11) 8.2.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=8.2.0 make.cross ARCH=sh
> >
> > All errors (new ones prefixed by >>):
> >
> > >> find: 'arch/sh/kernel/module.lds': No such file or directory
> > >> find: 'arch/sh/kernel/module.lds': No such file or directory
On Sun, Mar 03, 2019 at 08:11:59AM -0800, Joel Fernandes wrote:
> This report is for an older version of the patch so ignore it. The
> issue is already resolved.
>

Apologies, this issue is real. However it does not cause any failure. It is
only causing find command to be a bit noisy.

The below diff fixes it and I'll update the patch for v5:

diff --git a/scripts/gen_ikh_data.sh b/scripts/gen_ikh_data.sh
index 1fa5628fcc30..9a7ea856acbc 100755
--- a/scripts/gen_ikh_data.sh
+++ b/scripts/gen_ikh_data.sh
@@ -1,5 +1,6 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+set -e
 
 spath="$(dirname "$(readlink -f "$0")")"
 kroot="$spath/.."
@@ -11,12 +12,14 @@ file_list=${@:2}
 
 src_file_list=""
 for f in $file_list; do
+	if [ ! -f "$kroot/$f" ] && [ ! -d "$kroot/$f" ]; then continue; fi
 	src_file_list="$src_file_list $(echo $f | grep -v OBJDIR)"
 done
 
 obj_file_list=""
 for f in $file_list; do
 	f=$(echo $f | grep OBJDIR | sed -e 's/OBJDIR\///g')
+	if [ ! -f $f ] && [ ! -d $f ]; then continue; fi
 	obj_file_list="$obj_file_list $f";
 done
 
-- 
2.21.0.352.gf09ad66450-goog
