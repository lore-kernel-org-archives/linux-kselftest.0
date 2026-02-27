Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AB3AE705
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188942; cv=none; b=UpxybUL9Yn3GX9+OhTkAqOZX/jTCShdrEolVKp5R02giSjSqGMYx/Yl8/Sv1YaRyiZg572G7km1qnGANCKfTrH/bW4kvxjXGxoA8lApqUmYxQ+I6+fjPujKh3MPISxBHHh5uQZF8Go9ripRpXy8ojub/wstH87zQorzHmO5Ugig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188942; c=relaxed/simple;
	bh=X4CWdc1HbbKL7purI7oRrHRrKlCitSSWmIMLnO/7dq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFCzpLHuBNF1Vccn9qHjMxiCetZNhm17lYHj2LHzvk1gOBUZXnqhXhaco9s4RRcNH3jlLEZTzuP9Pu1GYp9hQXB3CTg4Q9TrpUuYB5hoze1Rr/VHEDcnA1sEOcEdnKR1+uVfYr2mDZJuEmTg9+ui6yrWp5FN6MGxcefPBVlbJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=UpzqA5Oe; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=G+9Bo3VC; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="UpzqA5Oe";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="G+9Bo3VC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772188938;
	bh=X4CWdc1HbbKL7purI7oRrHRrKlCitSSWmIMLnO/7dq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpzqA5OeeanQmInKhwk/EQch8s1Oxf2cjEsyT+IbgXiDGot4bt0G0BO615aSjqj6e
	 rnG0HJIdj4JX0f3FlBieIJ6AEPMO9hlADNBlOl/OGbVKcoXbWNHpK61zwN+rTOsUme
	 ZKGj/z3+QPmPLJqL3DxHtBkfDRa8xauTt8MUObQW28++nMvke/3Et3vfNb7bSNL5GQ
	 pxznkfku2lW9aqWxd0n4/raAkHesxNW0ol2SsrZP7ZcTpVjKbU51WIFad6afmpm7iQ
	 8r+bnukkSZYOv5Gp8UIM9mDzdpjcfCdb1KDuavrOcR6Z0IyTJ95pw3gdu17o8u7BAF
	 rlLHMgEVjW/O0EpWApm9bor5vmVX0rOANus+FYKSYgjChO0ldKFqcitcav8XOtSiEg
	 3xUVGhRihLhiX5ENB0IfOCbps6rfJT2jM31MaDQVgLCJ7uj1RDsGvA8N/ULvjsVwd0
	 F+bVCoXSNKFa33zh4vLB6tpaBfU/wXCUE0Pg2TDjzGZZZgKb9EmSpIlrxu2q5D3OmR
	 ncIwRRPNZnbOe9glW4zqrw8ic3TMHRtVVpHDMtXvOviF0JW40GjFWzwQBxSoOl7NXI
	 A1WFzGb9QoDpZKsZxwvbAdfpwOYfM0n4f8iA7ACI4Gseyr1092ctM5LlUi9yn5zhdU
	 w7ts+HUZLJK/1KAl3iBLp3To=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 21F491E7A3B; Fri, 27 Feb 2026 18:42:18 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772188935;
	bh=X4CWdc1HbbKL7purI7oRrHRrKlCitSSWmIMLnO/7dq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+9Bo3VCjA8apFXDuE1csjdzzc+ijOeyhsi4zQ3u3YidvRllzFMsA39w60g+Cq4Ox
	 AEu7pt4tjy6TD3Z4Qhi9Kkw2l0mfeuDrsyG8/sCNUO8ZY5UBxAVmb1CZIEmiJCasS5
	 sEZ1aSqarg/6KfEXagZ2KS5cNNZCfH4eIw6BFS/+CNqj77eCpqKliJe3y0zclZ2aVn
	 JLNrwZjG0GILIqjrw2EXYl7tWeBj+k6Lh5/OuUxmHb+lJEK1iQBzPq/lmCFFDUAvnR
	 G/He8pq5EydwML74e1Fep/3566otlxf09Q5NIHts0mTjgMe7uyD/StjZBn7XmoeEu7
	 4RIx4UcPg9nXIdiQgAjgO6rgPerOggjx5YVpyA6OuHXQ/o0fzHzpZ4IFMjFDFgaBgQ
	 KEeoAbpihXEKEmxD+L69kyT0I9M8lF61yDDU9Yr/ij64YlEhO6590C+1TB6HSI/3kL
	 AqAKZiDLfwRF+cy4QZuKxFwoIojAj3nu8KzXOvigjEwg6cBM/W2+a2xg2sRRb3IJzM
	 qP7H7gkRZGaacd9G6H8ApO2PZqL2y9UghLSfbYR3K7+560MccShxrODI10E64PG7TI
	 dcjXmMyNaQLf3dfNmBVWwhJIBcXnasT9KFZQUY6c0Ge3IrCAoI0k+M0Nd4PXHE+hj7
	 KaGrlCF+3M8XuUY3QNqIcrec=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 649AB1E7A38;
	Fri, 27 Feb 2026 18:42:15 +0800 (AWST)
Message-ID: <fb02bcc8-3773-41f6-969d-b5f483a32629@davidgow.net>
Date: Fri, 27 Feb 2026 18:42:12 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: serious bugs in KUnit framework makes test completely useless
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <aaFmiAmg9S18EANA@smile.fi.intel.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <aaFmiAmg9S18EANA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/02/2026 à 5:40 PM, Andy Shevchenko a écrit :
> 
> Hi!
> 
> I have stumbled over the kunit framework issues that make the respective test
> cases useless.
> 
> Now to the details.
> Consider having today's Linux Next.


Hi Andy,

Sorry to hear that KUnit is causing trouble. It looks like this is due 
to those patches crashing the kernel before KUnit gets to run: by using 
the --raw_output=full argument to kunit.py run, the corresponding logs 
are shown.

> 
> Scenario 1 (good):
> 
> I run
> 
> 	./tools/testing/kunit/kunit.py config
> 	./tools/testing/kunit/kunit.py run printf
> 
> Everything works as expected:
> 
>    [10:19:36] Testing complete. Ran 28 tests: passed: 28
>    [10:19:36] Elapsed time: 15.929s total, 0.001s configuring, 15.761s building, 0.114s running
> 
> 

This works fine for me, too. :-)


> Scenario 2 (BAD):
> 
> I applied the following change:
> 
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -18,6 +18,7 @@
>    */
>   
>   #include <linux/stdarg.h>
> +#include <linux/bitops.h>
>   #include <linux/build_bug.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
> @@ -2904,12 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
>   
>   		case FORMAT_STATE_NUM: {
>   			unsigned long long num;
> +			u8 shift = fmt.size * 8 - 1;
>   
>   			if (fmt.size > sizeof(int))
>   				num = va_arg(args, long long);
>   			else
> -				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
> -			str = number(str, end, num, spec);
> +				num = va_arg(args, int);
> +			num = sign_extend64(num, shift);
> +			if (spec.flags & SIGN)
> +				str = number(str, end, num, spec);
> +			else
> +				str = number(str, end, -(long long)num, spec);
>   			continue;
>   		}
>   
> 
> Tests went into cosmos (I waited a few minutes and has to interrupt that):
> 
>    ^CERROR:root:Build interruption occurred. Cleaning console.
>    ^CERROR:root:Build interruption occurred. Cleaning console.
>    ^CERROR:root:Build interruption occurred. Cleaning console.
>    Command '['.kunit/linux', 'kunit.filter_glob=printf', 'kunit.enable=1', 'mem=1G', 'console=tty', 'kunit_shutdown=halt']' timed out after 300 seconds
>    [10:29:52] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
>    [10:29:52] ============================================================
>    [10:29:52] Testing complete. Ran 0 tests: errors: 1
>    [10:29:52] Elapsed time: 305.676s total, 0.001s configuring, 5.669s building, 300.006s running
> 
> NOTE!
> Independently on how long I waited the Elapsed time is about 5 minutes
> (Seems 300 seconds limit as stated in the output).
> 

Interesting: this crashed immediately on my machine. During building, I 
see a (harmless) warning:
../lib/vsprintf.c:2827:27: warning: ‘convert_num_spec’ defined but not 
used [-Wunused-function]




By running KUnit with the --raw_output=full option, I can see a segfault 
(though, as you can see, the numbers throughout the stacktrace a wrong):
<18446744073709551610>Pid: 1, comm: swapper/0 Not tainted 
7.0.0-rc1-gff0627514551-dirty
<18446744073709551610>RIP: ffffffffffffffcd:0xffffffff9fac7320
<18446744073709551610>RSP: ffffffff5f7fc098  EFLAGS: fffffffffffefdf9
<18446744073709551610>RAX: fffffffffffc0000 RBX: ffffffff9ff1ad4c RCX: 
ffffffff9f7b6440
<18446744073709551610>RDX: 0000000000000000 RSI: ffffffff9f7b6388 RDI: 
ffffffffc6cfc8cc
<18446744073709551610>RBP: 0000000000000000 R08: ffffffffffffffff R09: 
ffffffffffffffd0
<18446744073709551610>R10: fffffffffffffff8 R11: fffffffffffffdba R12: 
ffffffff9fac7320
<18446744073709551610>R13: ffffffff9ff1b0d0 R14: 0000000000000000 R15: 
ffffffff9f963fe8
<0>Kernel panic - not syncing: Segfault with no mm
<18446744073709551612>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.0.0-rc1-gff0627514551-dirty #35 VOLUNTARY
<18446744073709551612>Stack:
<18446744073709551612> ffffffff9fbe2fd0 00000000 ffffffff9fffdaec 
ffffffff5f7fc080
<18446744073709551612> ffffffff5f7fc080 ffffffff9ff95050 
ffffffff9fab1be0 ffffffff9ff95050
<18446744073709551612> ffffffff9fbe2fd0 00000000 00000000 00000000
<18446744073709551612>Call Trace:
<18446744073709551612> [<ffffffff9fbe2fd0>] ? 
kernel_init+0x0/0xfffffffffffffe20
<18446744073709551612> [<ffffffff9fffdaec>] ? 
kernel_init_freeable+0xfffffffffffffe8b/0xfffffffffffffc82
<18446744073709551612> [<ffffffff9ff95050>] ? 
uml_curr_cpu+0x0/0xfffffffffffffff0
<18446744073709551612> [<ffffffff9ff95050>] ? 
uml_curr_cpu+0x0/0xfffffffffffffff0
<18446744073709551612> [<ffffffff9fbe2fd0>] ? 
kernel_init+0x0/0xfffffffffffffe20
<18446744073709551612> [<ffffffff9fbe2faa>] ? 
kernel_init+0xffffffffffffffda/0xfffffffffffffe20
<18446744073709551612> [<ffffffff9ff95050>] ? 
uml_curr_cpu+0x0/0xfffffffffffffff0
<18446744073709551612> [<ffffffff9ffa5c27>] ? 
new_thread_handler+0xffffffffffffff87/0xffffffffffffff60

(Trying the same thing with --arch x86_64 suggested that some stack 
corruption is occurring.)

> 
> Scenario 3 (BAD):
> 
> Now I took again a clean tree and applied this change:
> 
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -18,6 +18,7 @@
>    */
>   
>   #include <linux/stdarg.h>
> +#include <linux/bitops.h>
>   #include <linux/build_bug.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
> @@ -2904,11 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
>   
>   		case FORMAT_STATE_NUM: {
>   			unsigned long long num;
> +			u8 shift = fmt.size * 8 - 1;
>   
>   			if (fmt.size > sizeof(int))
>   				num = va_arg(args, long long);
> +			else {
> +				num = va_arg(args, int);
> +			if ((spec.flags & SIGN))
> +				num = sign_extend64(num, shift);
>   			else
> -				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
> +				num &= ~(BIT_ULL(shift) - 1);
> +			}
>   			str = number(str, end, num, spec);
>   			continue;
>   		}
> 
> and run tests again.
> 
>    [10:39:16] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
>    [10:39:16] ============================================================
>    [10:39:16] Testing complete. Ran 0 tests: errors: 1
>    [10:39:16] Elapsed time: 5.762s total, 0.001s configuring, 5.694s building, 0.067s running
> 
> it runs fast and completely useless. (There is no build error)


This one also kernel panics, and when run with --raw_output=full, we can 
see that it's due to all of the character devices' sysfs entries being 
duplicates, because the minor/major are being formatted as '/dev/char/0:0':

<0>sysfs: cannot create duplicate filename '/dev/char/0:0'
(...)
<0>Kernel panic - not syncing: Couldn't register pty driver
<0>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W 
7.0.0-rc1-gff0627514551-dirty #34 VOLUNTARY


> 
> ...
> 
> Please, fix this as it is a serious issue and really makes kunit useless.
> 

There's not much KUnit can do if the kernel panics before any tests can 
be run -- and unfortunately, vsprintf() seems able to cause lots of 
trouble early in the boot process.

One idea is to support building tests as independent userspace 
executables, which wouldn't depend on all of those parts of the kernel 
which break (and would be easier to debug). I discussed this a bit at 
Plumbers a couple of years ago[1], but haven't had a chance to work on 
it since. Even then, it'd require a little bit of test-specific work to 
get an isolated version of the kernel vsprintf to build and be testable.

In the short term, maybe we can improve the interface of kunit.py in 
cases where the kernel crashes. At the moment, we simply report that no 
tests had run (as you've noticed), but maybe we should check more 
actively for panics and/or make a more explicit difference between "no 
tests were run" and "the KUnit framework never exectuted". At the very 
least, we should suggest that --raw_output=full is a good way to debug 
this issue if the user wasn't expecting it in the error message. (I'll 
send a patch out to do this now.)

I hope that helps (at least a little bit), and thanks for sticking with 
KUnit despite these issues!

Cheers,
-- David


[1]: https://lpc.events/event/18/contributions/1790/

