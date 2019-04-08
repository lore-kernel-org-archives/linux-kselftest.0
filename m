From: ldv at altlinux.org (Dmitry V. Levin)
Date: Mon, 8 Apr 2019 21:04:04 +0300
Subject: [PATCH linux-next v9 7/7] selftests/ptrace: add a test case for
 PTRACE_GET_SYSCALL_INFO
In-Reply-To: <f2f015da-35d4-7207-cd57-e6589cd9d2c4@kernel.org>
References: <20190408174036.GA11889@altlinux.org>
 <20190408174236.GH11889@altlinux.org>
 <f2f015da-35d4-7207-cd57-e6589cd9d2c4@kernel.org>
Message-ID: <20190408180404.GB11964@altlinux.org>

On Mon, Apr 08, 2019 at 11:51:45AM -0600, shuah wrote:
> On 4/8/19 11:42 AM, Dmitry V. Levin wrote:
> > Check whether PTRACE_GET_SYSCALL_INFO semantics implemented in the kernel
> > matches userspace expectations.
> > 
> > Cc: Oleg Nesterov <oleg at redhat.com>
> > Cc: Andy Lutomirski <luto at kernel.org>
> > Cc: Shuah Khan <shuah at kernel.org>
> > Cc: Elvira Khabirova <lineprinter at altlinux.org>
> > Cc: Eugene Syromyatnikov <esyr at redhat.com>
> > Cc: linux-kselftest at vger.kernel.org
> > Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> > ---
> > 
> > Notes:
> >      v9: unchanged
> >      v8: unchanged
> >      v7: unchanged
> >      v6: made PTRACE_GET_SYSCALL_INFO return value checks strict
> >      v5: initial revision
> > 
> >   tools/testing/selftests/ptrace/.gitignore     |   1 +
> >   tools/testing/selftests/ptrace/Makefile       |   2 +-
> >   .../selftests/ptrace/get_syscall_info.c       | 271 ++++++++++++++++++
> >   3 files changed, 273 insertions(+), 1 deletion(-)
> >   create mode 100644 tools/testing/selftests/ptrace/get_syscall_info.c
> > 
> > diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
> > index b3e59d41fd82..cfcc49a7def7 100644
> > --- a/tools/testing/selftests/ptrace/.gitignore
> > +++ b/tools/testing/selftests/ptrace/.gitignore
> > @@ -1 +1,2 @@
> > +get_syscall_info
> >   peeksiginfo
> > diff --git a/tools/testing/selftests/ptrace/Makefile b/tools/testing/selftests/ptrace/Makefile
> > index 8a2bc5562179..4bc550b6b845 100644
> > --- a/tools/testing/selftests/ptrace/Makefile
> > +++ b/tools/testing/selftests/ptrace/Makefile
> > @@ -1,5 +1,5 @@
> >   CFLAGS += -iquote../../../../include/uapi -Wall
> >   
> > -TEST_GEN_PROGS := peeksiginfo
> > +TEST_GEN_PROGS := get_syscall_info peeksiginfo
> >   
> >   include ../lib.mk
> > diff --git a/tools/testing/selftests/ptrace/get_syscall_info.c b/tools/testing/selftests/ptrace/get_syscall_info.c
> > new file mode 100644
> > index 000000000000..28e972825b74
> > --- /dev/null
> > +++ b/tools/testing/selftests/ptrace/get_syscall_info.c
> > @@ -0,0 +1,271 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> 
> This should be just GPL-2.0+

LICENSES/preferred/GPL-2.0 says these variants are equivalent:
"
[...]
Valid-License-Identifier: GPL-2.0+
Valid-License-Identifier: GPL-2.0-or-later
[...]
  For 'GNU General Public License (GPL) version 2 or any later version' use:
    SPDX-License-Identifier: GPL-2.0+
  or
    SPDX-License-Identifier: GPL-2.0-or-later
"

The usage statistics shows that GPL-2.0+ is more popular in the kernel
tree than GPL-2.0-or-later, though.

> The rest looks good to me. Assuming this patch has dependency on the
> rest of the patches in this series and once the above change is made:

No problem, I'm fine with either variant of the license identifier.

> Acked-by: Shuah Khan <shuah at kernel.org>

Thanks,

-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190408/8d65146a/attachment-0001.sig>
