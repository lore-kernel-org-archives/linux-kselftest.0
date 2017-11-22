From: shuah at kernel.org (Shuah Khan)
Date: Wed, 22 Nov 2017 08:20:52 -0700
Subject: [Linux-kselftest-mirror] [PATCH update for 4.15 2/3] cpu_opv:
 selftests: Implement selftests (v4)
In-Reply-To: <20171121221933.25959-2-mathieu.desnoyers@efficios.com>
References: <20171121221933.25959-1-mathieu.desnoyers@efficios.com>
 <20171121221933.25959-2-mathieu.desnoyers@efficios.com>
Message-ID: <00142e09-bcb9-a145-cbe3-27b61213f361@kernel.org>

On 11/21/2017 03:19 PM, Mathieu Desnoyers wrote:
> Implement cpu_opv selftests. It needs to express dependencies on
> header files and .so, which require to override the selftests
> lib.mk targets. Use OVERRIDE_TARGETS define for this.
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> CC: Russell King <linux at arm.linux.org.uk>
> CC: Catalin Marinas <catalin.marinas at arm.com>
> CC: Will Deacon <will.deacon at arm.com>
> CC: Thomas Gleixner <tglx at linutronix.de>
> CC: Paul Turner <pjt at google.com>
> CC: Andrew Hunter <ahh at google.com>
> CC: Peter Zijlstra <peterz at infradead.org>
> CC: Andy Lutomirski <luto at amacapital.net>
> CC: Andi Kleen <andi at firstfloor.org>
> CC: Dave Watson <davejwatson at fb.com>
> CC: Chris Lameter <cl at linux.com>
> CC: Ingo Molnar <mingo at redhat.com>
> CC: "H. Peter Anvin" <hpa at zytor.com>
> CC: Ben Maurer <bmaurer at fb.com>
> CC: Steven Rostedt <rostedt at goodmis.org>
> CC: "Paul E. McKenney" <paulmck at linux.vnet.ibm.com>
> CC: Josh Triplett <josh at joshtriplett.org>
> CC: Linus Torvalds <torvalds at linux-foundation.org>
> CC: Andrew Morton <akpm at linux-foundation.org>
> CC: Boqun Feng <boqun.feng at gmail.com>
> CC: Shuah Khan <shuah at kernel.org>
> CC: linux-kselftest at vger.kernel.org
> CC: linux-api at vger.kernel.org
> ---
> Changes since v1:
> 
> - Expose similar library API as rseq:  Expose library API closely
>   matching the rseq APIs, following removal of the event counter from
>   the rseq kernel API.
> - Update makefile to fix make run_tests dependency on "all".
> - Introduce a OVERRIDE_TARGETS.
> 
> Changes since v2:
> 
> - Test page faults.
> 
> Changes since v3:
> 
> - Move lib.mk OVERRIDE_TARGETS change to its own patch.
> - Printout TAP output.
> ---
>  MAINTAINERS                                        |    1 +
>  tools/testing/selftests/Makefile                   |    1 +
>  tools/testing/selftests/cpu-opv/.gitignore         |    1 +
>  tools/testing/selftests/cpu-opv/Makefile           |   17 +
>  .../testing/selftests/cpu-opv/basic_cpu_opv_test.c | 1167 ++++++++++++++++++++
>  tools/testing/selftests/cpu-opv/cpu-op.c           |  348 ++++++
>  tools/testing/selftests/cpu-opv/cpu-op.h           |   68 ++
>  7 files changed, 1603 insertions(+)
>  create mode 100644 tools/testing/selftests/cpu-opv/.gitignore
>  create mode 100644 tools/testing/selftests/cpu-opv/Makefile
>  create mode 100644 tools/testing/selftests/cpu-opv/basic_cpu_opv_test.c
>  create mode 100644 tools/testing/selftests/cpu-opv/cpu-op.c
>  create mode 100644 tools/testing/selftests/cpu-opv/cpu-op.h
> 

Looks good.

Acked-by: Shuah Khan <shuahkh at osg.samsung.com>

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
