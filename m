From: shuah@kernel.org (Shuah Khan)
Date: Wed, 22 Nov 2017 08:16:06 -0700
Subject: [Linux-kselftest-mirror] [PATCH update for 4.15 1/3] selftests:
 lib.mk: Introduce OVERRIDE_TARGETS
In-Reply-To: <20171121221933.25959-1-mathieu.desnoyers@efficios.com>
References: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
 <20171121221933.25959-1-mathieu.desnoyers@efficios.com>
Message-ID: <48e64ffd-4936-74cf-aaee-c383fc75a97f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171122151606.1RSLpYgbiit91jw4K6vzqa8K1mw4U1AUPGQmZkv966A@z>

On 11/21/2017 03:19 PM, Mathieu Desnoyers wrote:
> Introduce OVERRIDE_TARGETS to allow tests to express dependencies on
> header files and .so, which require to override the selftests lib.mk
> targets.
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
>  tools/testing/selftests/lib.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 5bef05d6ba39..441d7bc63bb7 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -105,6 +105,9 @@ COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
>  LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
>  endif
>  
> +# Selftest makefiles can override those targets by setting
> +# OVERRIDE_TARGETS = 1.
> +ifeq ($(OVERRIDE_TARGETS),)
>  $(OUTPUT)/%:%.c
>  	$(LINK.c) $^ $(LDLIBS) -o $@
>  
> @@ -113,5 +116,6 @@ $(OUTPUT)/%.o:%.S
>  
>  $(OUTPUT)/%:%.S
>  	$(LINK.S) $^ $(LDLIBS) -o $@
> +endif
>  
>  .PHONY: run_tests all clean install emit_tests
> 

Thanks for splitting this patch. It will make it easier since it
is kselftest framework change.

Acked-by: Shuah Khan <shuahkh at osg.samsung.com>

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
