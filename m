From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Mon, 29 Apr 2019 16:28:18 -0400 (EDT)
Subject: [PATCH for 5.2 12/12] rseq/selftests: add -no-integrated-as for
 clang
In-Reply-To: <CAKwvOdnbH0+ju5Ny-mB-Z4kC+ALyCJOU4Q8OCLHHjFAQzJqsXA@mail.gmail.com>
References: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
 <20190429152803.7719-13-mathieu.desnoyers@efficios.com>
 <CAKwvOdnbH0+ju5Ny-mB-Z4kC+ALyCJOU4Q8OCLHHjFAQzJqsXA@mail.gmail.com>
Message-ID: <712082435.384.1556569697998.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429202818.9rU-Yz9a4o4PuOV9CvXA_qDCePd62gHU4w08urtoIGI@z>

----- On Apr 29, 2019,@1:03 PM, ndesaulniers ndesaulniers@google.com wrote:

> On Mon, Apr 29, 2019 at 8:29 AM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> Ongoing work for asm goto support from clang requires the
>> -no-integrated-as compiler flag.
>>
>> This compiler flag is present in the toplevel kernel Makefile,
>> but is not replicated for selftests. Add it specifically for
>> the rseq selftest which requires asm goto.
>>
>> Link: https://reviews.llvm.org/D56571
>> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
>> CC: Nick Desaulniers <ndesaulniers at google.com>
>> CC: Thomas Gleixner <tglx at linutronix.de>
>> CC: Joel Fernandes <joelaf at google.com>
>> CC: Peter Zijlstra <peterz at infradead.org>
>> CC: Catalin Marinas <catalin.marinas at arm.com>
>> CC: Dave Watson <davejwatson at fb.com>
>> CC: Will Deacon <will.deacon at arm.com>
>> CC: Shuah Khan <shuah at kernel.org>
>> CC: Andi Kleen <andi at firstfloor.org>
>> CC: linux-kselftest at vger.kernel.org
>> CC: "H . Peter Anvin" <hpa at zytor.com>
>> CC: Chris Lameter <cl at linux.com>
>> CC: Russell King <linux at arm.linux.org.uk>
>> CC: Michael Kerrisk <mtk.manpages at gmail.com>
>> CC: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
>> CC: Paul Turner <pjt at google.com>
>> CC: Boqun Feng <boqun.feng at gmail.com>
>> CC: Josh Triplett <josh at joshtriplett.org>
>> CC: Steven Rostedt <rostedt at goodmis.org>
>> CC: Ben Maurer <bmaurer at fb.com>
>> CC: linux-api at vger.kernel.org
>> CC: Andy Lutomirski <luto at amacapital.net>
>> CC: Andrew Morton <akpm at linux-foundation.org>
>> CC: Linus Torvalds <torvalds at linux-foundation.org>
>> ---
>>  tools/testing/selftests/rseq/Makefile | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/rseq/Makefile
>> b/tools/testing/selftests/rseq/Makefile
>> index c30c52e1d0d2..d6469535630a 100644
>> --- a/tools/testing/selftests/rseq/Makefile
>> +++ b/tools/testing/selftests/rseq/Makefile
>> @@ -1,5 +1,11 @@
>>  # SPDX-License-Identifier: GPL-2.0+ OR MIT
>> -CFLAGS += -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./
>> +
>> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>> +CLANG_FLAGS += -no-integrated-as
>> +endif
>> +
>> +CFLAGS += -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./ \
>> +         $(CLANG_FLAGS)
> 
> The top level Makefile exports $(CLANG_FLAGS), which should contain
> `-no-integrated-as`.  Is that available here?  If so, then you can
> just add `$(CLANG_FLAGS)`, no compiler check needed.

AFAIU, the makefiles under tools/testing/selftests all end up including
tools/testing/selftests/lib.mk, which states:

"# This mimics the top-level Makefile. We do it explicitly here so that this
 # Makefile can operate with or without the kbuild infrastructure."

So I don't think it's using any of the definitions from the toplevel
Makefile.

> If not, maybe the test for CONFIG_CC_IS_CLANG is cleaner?

A quick test indicates that the toplevel CONFIG_* definitions are unavailable
from the kernel selftests makefiles.

> Thanks for the patch, and helping test asm goto in Clang!

You're very welcome! Considering that I intend to have rseq widely adopted in
user-space, it's only natural to consider that its user-space side needs to be
compiled by clang as well.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
