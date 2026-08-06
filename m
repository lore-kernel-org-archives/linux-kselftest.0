Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694983DA7E4;
	Thu,  6 Aug 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004562; cv=none; b=YbX89lcreUMrVVTBWUFhHLx61g1AHwIgo2vyyHeJtVMpZMTl/HeRO4u1ZsGZilFeNBCEpaEIGU6lMgR9/ALyUwtC6alAZtX9oOJyJBHoc2wC81vl2ktKxr2YWUR2vyr6L6l2hv8ezveufQj8b1N6kXG9gKWP2OFqw4eyNWmxOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004562; c=relaxed/simple;
	bh=sHkZLSSOGg+fI3Dt3vUjkXesaInaqIgYgOcwYebg2a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=otKiED2WAXHqUoQ6LehJ5+70w865Hpju4QUxM+4yWVqScFNf0PsjxuRicnVXkowS9zq2HDunvWsBV3lZ663JzwJtUtkSecHN1KiuUPRMKAb1b/Mbe+rnQyx/ymlZvBxSvaAPqkjA3Ji3w6sIjJoT7WmfE1nzo5uq2fvrFmULZuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rNkOuxuO; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rNkOuxuO"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4NuVl080bt4cA2uVz75kzQbvjwfydsHS9/195tFer8k=;
	b=rNkOuxuOy6FOR22QgZpBTFAow9DPI4vCWJsA0NRKxpTmhfRz8z3kOdqX5jiIFnSN0EVCLVxSS
	Qi+F61a0r7NvpEwRy0fo3We9RaHuk1A90ySGA38QqKG+/+RfiXGTumdoY8xEg3kCaGB0cot4vu+
	P7Fit34Z3j/1NNuCfITREv0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hG0Px1xDLzcb0W;
	Thu,  6 Aug 2026 16:12:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 66A1A4056D;
	Thu,  6 Aug 2026 16:22:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Aug 2026 16:22:32 +0800
Message-ID: <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
Date: Thu, 6 Aug 2026 16:22:31 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <Aishwarya.TCV@arm.com>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
 <20260728021122.2640104-2-ruanjinjie@huawei.com>
 <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



在 2026/8/5 23:04, Mark Brown 写道:
> On Tue, Jul 28, 2026 at 10:11:21AM +0800, Jinjie Ruan wrote:
>> As Kees suggested, add a test that verifies that seccomp observes the
>> correct first argument after a ptracer modifies x0 at a syscall-enter-stop
>> on arm64.
> 
> This change is now in -next and is breaking the build on Arm's internal
> KernelCI instance, the same thing can also be seen on at least upstream
> KernelCI mixed in with extra issues due to what looks like a
> missing/failed headers_install - I'll report the infra aspects of that
> separately:

Thank you for the report.

> 
>   CC       seccomp_ptrace_x0_bypass
> seccomp_ptrace_x0_bypass.c: In function ‘do_child’:
> seccomp_ptrace_x0_bypass.c:67:28: error: array type has incomplete element type ‘struct sock_filter’
>    67 |         struct sock_filter filter[] = {
>       |                            ^~~~~~
> seccomp_ptrace_x0_bypass.c:68:17: warning: implicit declaration of function ‘BPF_STMT’; did you mean ‘BPF_STX’? [-Wimplicit-function-declaration]
>    68 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),  /* nr */
>       |                 ^~~~~~~~
>       |                 BPF_STX
> seccomp_ptrace_x0_bypass.c:69:17: warning: implicit declaration of function ‘BPF_JUMP’; did you mean ‘BPF_JMP’? [-Wimplicit-function-declaration]
>    69 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 3),
>       |                 ^~~~~~~~
>       |                 BPF_JMP
> seccomp_ptrace_x0_bypass.c:75:16: error: variable ‘prog’ has initializer but incomplete type
>    75 |         struct sock_fprog prog = {
>       |                ^~~~~~~~~~
> seccomp_ptrace_x0_bypass.c:76:18: error: ‘struct sock_fprog’ has no member named ‘len’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                  ^~~
> In file included from seccomp_ptrace_x0_bypass.c:38:
> /tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: warning: excess elements in struct initializer
>    64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>       |                         ^
> seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro ‘ARRAY_SIZE’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                        ^~~~~~~~~~
> /tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: note: (near initialization for ‘prog’)
>    64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>       |                         ^
> seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro ‘ARRAY_SIZE’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                        ^~~~~~~~~~
> seccomp_ptrace_x0_bypass.c:77:18: error: ‘struct sock_fprog’ has no member named ‘filter’
>    77 |                 .filter = filter,
>       |                  ^~~~~~
> seccomp_ptrace_x0_bypass.c:77:27: warning: excess elements in struct initializer
>    77 |                 .filter = filter,
>       |                           ^~~~~~
> seccomp_ptrace_x0_bypass.c:77:27: note: (near initialization for ‘prog’)
> seccomp_ptrace_x0_bypass.c:75:27: error: storage size of ‘prog’ isn’t known
>    75 |         struct sock_fprog prog = {
>       |                           ^~~~
> seccomp_ptrace_x0_bypass.c:75:27: warning: unused variable ‘prog’ [-Wunused-variable]
> seccomp_ptrace_x0_bypass.c:67:28: warning: unused variable ‘filter’ [-Wunused-variable]
>    67 |         struct sock_filter filter[] = {
> 
> 
>> --- /dev/null
>> +++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
>> @@ -0,0 +1,195 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Test that seccomp, tracepoints and audit observe the correct syscall
>> + * arguments after a ptracer has modified them at syscall-enter-stop.
> 
>> +#include <linux/filter.h>
> 
> The relevant definitions ought to be being picked up from here, there's
> a copy of a current version in tools/include and has been for a while
> (since at least v6.18) but there's no Makefile update to ensure that
> gets picked up.

Will add -I$(top_srcdir)/tools/include to CFLAGS for this test.

> 
>> +#ifndef __NR_write
>> +#define __NR_write 64
>> +#endif
> 
> That's...  interesting.

I'll remove the hardcoded __NR_write.

