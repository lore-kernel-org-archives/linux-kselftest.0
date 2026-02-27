Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FAC41B34B
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203428; cv=none; b=A8YSnnAhSy/4QZwOT19zRCRlPJARgxHiSPcWi0MSv/2xE3CZCakUkfEC02bTtZ5bXHQlX5f0dcht7ODmBMnPSRzbfh5oRU3cr3efAJjf4V0mXzEsEMg9OkyWB/0T7qdm+rNfioc7OaFMIjTnxCb9HjxT+wfq4aGAS69MeDL/r5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203428; c=relaxed/simple;
	bh=y0ZRCV1GkBXTZpp0S5PnEFMJTP9eFANWAwfXvA+HgpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6YjfYgXJ4d0lv4rbCKkYs1PUo9U8vwTRReaJg0XZ7RmGx40JYpBehO095j28goWLTxoS8ihmpp9mm7QnnmipqOs1KIn5EOg02CcoY7gcyi6wEbtQROxy4WzHkcsNE2niMTjbYlq7O8OGPiYnFlPwDctC8y8WmrSnOBbqIiTUKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5EuMJzO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5EuMJzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772203426; x=1803739426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y0ZRCV1GkBXTZpp0S5PnEFMJTP9eFANWAwfXvA+HgpE=;
  b=J5EuMJzOMqIRsODtPxLynT6H7VPUQkJau3+DBDx7MvAsR6jpHEQ4i423
   XpJxU9XC1DWYCH6dmVy72E9TaffXonvPYPVSzHQFiFzE8NTfDOFGOAKue
   Fr4UNy0YHbgyM/E4vllnQNVrUNuHAntdd+zEaTFF5fyAlMe0VkVR2JDzS
   Uj9RHjst23IxK4pcQb69flH99VftQ1tZS2os3eXuekQm78FmNKBvfhqJc
   GRPR6P9OX2yjOBQTwF4xg5e/Wb5m751zU5OBjGVP6zmQBu1YjHTuJEEEE
   DZd5qgllI8ebSsANvzYfbF5EHKyXw36lUKiULFc/htQnr7K9qKo6bOrPd
   w==;
X-CSE-ConnectionGUID: bWf7T1wyQzmTQ7/EkQtlCw==
X-CSE-MsgGUID: Z4UZkqDGQGClfg6Luo+nhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77150605"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77150605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:43:45 -0800
X-CSE-ConnectionGUID: cYhGmB/xTRiPlLSJab0S4A==
X-CSE-MsgGUID: WZu4dGLkQG2a/txx2lyz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="214330815"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:43:43 -0800
Date: Fri, 27 Feb 2026 16:43:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: serious bugs in KUnit framework makes test completely useless
Message-ID: <aaGtnUB2Rt2H9vhB@ashevche-desk.local>
References: <aaFmiAmg9S18EANA@smile.fi.intel.com>
 <fb02bcc8-3773-41f6-969d-b5f483a32629@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb02bcc8-3773-41f6-969d-b5f483a32629@davidgow.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 27, 2026 at 06:42:12PM +0800, David Gow wrote:
> Le 27/02/2026 à 5:40 PM, Andy Shevchenko a écrit :
> > 
> > I have stumbled over the kunit framework issues that make the respective test
> > cases useless.
> > 
> > Now to the details.
> > Consider having today's Linux Next.
> 
> Sorry to hear that KUnit is causing trouble. It looks like this is due to
> those patches crashing the kernel before KUnit gets to run: by using the
> --raw_output=full argument to kunit.py run, the corresponding logs are
> shown.
> 
> > 
> > Scenario 1 (good):
> > 
> > I run
> > 
> > 	./tools/testing/kunit/kunit.py config
> > 	./tools/testing/kunit/kunit.py run printf
> > 
> > Everything works as expected:
> > 
> >    [10:19:36] Testing complete. Ran 28 tests: passed: 28
> >    [10:19:36] Elapsed time: 15.929s total, 0.001s configuring, 15.761s building, 0.114s running
> 
> This works fine for me, too. :-)
> 
> 
> > Scenario 2 (BAD):
> > 
> > I applied the following change:
> > 
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -18,6 +18,7 @@
> >    */
> >   #include <linux/stdarg.h>
> > +#include <linux/bitops.h>
> >   #include <linux/build_bug.h>
> >   #include <linux/clk.h>
> >   #include <linux/clk-provider.h>
> > @@ -2904,12 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
> >   		case FORMAT_STATE_NUM: {
> >   			unsigned long long num;
> > +			u8 shift = fmt.size * 8 - 1;
> >   			if (fmt.size > sizeof(int))
> >   				num = va_arg(args, long long);
> >   			else
> > -				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
> > -			str = number(str, end, num, spec);
> > +				num = va_arg(args, int);
> > +			num = sign_extend64(num, shift);
> > +			if (spec.flags & SIGN)
> > +				str = number(str, end, num, spec);
> > +			else
> > +				str = number(str, end, -(long long)num, spec);
> >   			continue;
> >   		}
> > 
> > Tests went into cosmos (I waited a few minutes and has to interrupt that):
> > 
> >    ^CERROR:root:Build interruption occurred. Cleaning console.
> >    ^CERROR:root:Build interruption occurred. Cleaning console.
> >    ^CERROR:root:Build interruption occurred. Cleaning console.
> >    Command '['.kunit/linux', 'kunit.filter_glob=printf', 'kunit.enable=1', 'mem=1G', 'console=tty', 'kunit_shutdown=halt']' timed out after 300 seconds
> >    [10:29:52] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
> >    [10:29:52] ============================================================
> >    [10:29:52] Testing complete. Ran 0 tests: errors: 1
> >    [10:29:52] Elapsed time: 305.676s total, 0.001s configuring, 5.669s building, 300.006s running
> > 
> > NOTE!
> > Independently on how long I waited the Elapsed time is about 5 minutes
> > (Seems 300 seconds limit as stated in the output).
> 
> Interesting: this crashed immediately on my machine. During building, I see
> a (harmless) warning:
> ../lib/vsprintf.c:2827:27: warning: ‘convert_num_spec’ defined but not used
> [-Wunused-function]

You need to enable binary printf() in the configuration, or comment out that function.
I have no such warning as I dropped the function (haven't used it in the above change
for the sake of simplicity.

> By running KUnit with the --raw_output=full option, I can see a segfault
> (though, as you can see, the numbers throughout the stacktrace a wrong):
> <18446744073709551610>Pid: 1, comm: swapper/0 Not tainted
> 7.0.0-rc1-gff0627514551-dirty
> <18446744073709551610>RIP: ffffffffffffffcd:0xffffffff9fac7320
> <18446744073709551610>RSP: ffffffff5f7fc098  EFLAGS: fffffffffffefdf9
> <18446744073709551610>RAX: fffffffffffc0000 RBX: ffffffff9ff1ad4c RCX:
> ffffffff9f7b6440
> <18446744073709551610>RDX: 0000000000000000 RSI: ffffffff9f7b6388 RDI:
> ffffffffc6cfc8cc
> <18446744073709551610>RBP: 0000000000000000 R08: ffffffffffffffff R09:
> ffffffffffffffd0
> <18446744073709551610>R10: fffffffffffffff8 R11: fffffffffffffdba R12:
> ffffffff9fac7320
> <18446744073709551610>R13: ffffffff9ff1b0d0 R14: 0000000000000000 R15:
> ffffffff9f963fe8
> <0>Kernel panic - not syncing: Segfault with no mm
> <18446744073709551612>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 7.0.0-rc1-gff0627514551-dirty #35 VOLUNTARY
> <18446744073709551612>Stack:
> <18446744073709551612> ffffffff9fbe2fd0 00000000 ffffffff9fffdaec
> ffffffff5f7fc080
> <18446744073709551612> ffffffff5f7fc080 ffffffff9ff95050 ffffffff9fab1be0
> ffffffff9ff95050
> <18446744073709551612> ffffffff9fbe2fd0 00000000 00000000 00000000
> <18446744073709551612>Call Trace:
> <18446744073709551612> [<ffffffff9fbe2fd0>] ?
> kernel_init+0x0/0xfffffffffffffe20
> <18446744073709551612> [<ffffffff9fffdaec>] ?
> kernel_init_freeable+0xfffffffffffffe8b/0xfffffffffffffc82
> <18446744073709551612> [<ffffffff9ff95050>] ?
> uml_curr_cpu+0x0/0xfffffffffffffff0
> <18446744073709551612> [<ffffffff9ff95050>] ?
> uml_curr_cpu+0x0/0xfffffffffffffff0
> <18446744073709551612> [<ffffffff9fbe2fd0>] ?
> kernel_init+0x0/0xfffffffffffffe20
> <18446744073709551612> [<ffffffff9fbe2faa>] ?
> kernel_init+0xffffffffffffffda/0xfffffffffffffe20
> <18446744073709551612> [<ffffffff9ff95050>] ?
> uml_curr_cpu+0x0/0xfffffffffffffff0
> <18446744073709551612> [<ffffffff9ffa5c27>] ?
> new_thread_handler+0xffffffffffffff87/0xffffffffffffff60
> 
> (Trying the same thing with --arch x86_64 suggested that some stack
> corruption is occurring.)

Got it!

> > Scenario 3 (BAD):
> > 
> > Now I took again a clean tree and applied this change:
> > 
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -18,6 +18,7 @@
> >    */
> >   #include <linux/stdarg.h>
> > +#include <linux/bitops.h>
> >   #include <linux/build_bug.h>
> >   #include <linux/clk.h>
> >   #include <linux/clk-provider.h>
> > @@ -2904,11 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
> >   		case FORMAT_STATE_NUM: {
> >   			unsigned long long num;
> > +			u8 shift = fmt.size * 8 - 1;
> >   			if (fmt.size > sizeof(int))
> >   				num = va_arg(args, long long);
> > +			else {
> > +				num = va_arg(args, int);
> > +			if ((spec.flags & SIGN))
> > +				num = sign_extend64(num, shift);
> >   			else
> > -				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
> > +				num &= ~(BIT_ULL(shift) - 1);
> > +			}
> >   			str = number(str, end, num, spec);
> >   			continue;
> >   		}
> > 
> > and run tests again.
> > 
> >    [10:39:16] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
> >    [10:39:16] ============================================================
> >    [10:39:16] Testing complete. Ran 0 tests: errors: 1
> >    [10:39:16] Elapsed time: 5.762s total, 0.001s configuring, 5.694s building, 0.067s running
> > 
> > it runs fast and completely useless. (There is no build error)
> 
> This one also kernel panics, and when run with --raw_output=full, we can see
> that it's due to all of the character devices' sysfs entries being
> duplicates, because the minor/major are being formatted as '/dev/char/0:0':
> 
> <0>sysfs: cannot create duplicate filename '/dev/char/0:0'
> (...)
> <0>Kernel panic - not syncing: Couldn't register pty driver
> <0>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W
> 7.0.0-rc1-gff0627514551-dirty #34 VOLUNTARY

Thanks for trying it and explaining me what's going on. At the bottom line I missed
--raw_output=full which should be enough for me.

...

> > Please, fix this as it is a serious issue and really makes kunit useless.
> 
> There's not much KUnit can do if the kernel panics before any tests can be
> run -- and unfortunately, vsprintf() seems able to cause lots of trouble
> early in the boot process.
> 
> One idea is to support building tests as independent userspace executables,
> which wouldn't depend on all of those parts of the kernel which break (and
> would be easier to debug). I discussed this a bit at Plumbers a couple of
> years ago[1], but haven't had a chance to work on it since. Even then, it'd
> require a little bit of test-specific work to get an isolated version of the
> kernel vsprintf to build and be testable.
> 
> In the short term, maybe we can improve the interface of kunit.py in cases
> where the kernel crashes. At the moment, we simply report that no tests had
> run (as you've noticed), but maybe we should check more actively for panics
> and/or make a more explicit difference between "no tests were run" and "the
> KUnit framework never exectuted". At the very least, we should suggest that
> --raw_output=full is a good way to debug this issue if the user wasn't
> expecting it in the error message. (I'll send a patch out to do this now.)

Most annoying part is hanging the console, and then after Ctrl+C pressed,
+300 seconds (unneeded!) timeout occurs.

> I hope that helps (at least a little bit), and thanks for sticking with
> KUnit despite these issues!
> 
> [1]: https://lpc.events/event/18/contributions/1790/

-- 
With Best Regards,
Andy Shevchenko


