Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03C33F39DB;
	Wed,  1 Jul 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895704; cv=none; b=CZi3IrMr+Gy+mKnwBPi7xZHFnfAgKxiS26yJ12vZf+i+nEWF0d9xw2Ex0jh3Xm8W2/m/PXJBMOkYjSGon8k47YyisODboewhg9XIH/RDsGYW28rB2SSUfNkPlUsxMGN8sADy+oAygo6nUqAO5C0V8EfqHq0DwaoL36pAAUVDMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895704; c=relaxed/simple;
	bh=/+UJCdimKchvp4hGnfezxanRfzPGGapIuiYXTA7gshY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajEJWmkzVRzy+xA0A9i4+Z1tIwrmNwg/HnvEUC7BHvGSk7c2WAYVtfqA+A/+I5XLS/69Z+AH38vPU56RnNp75Bek3ff0vylNVAXywOvC+6aN3Ve2g8yEvuvWBYSzAECGeno4x6pp0/cgP8I2x1DtPneF8JYAzdH98cXu46hxaL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V+yd3ZVc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V+yd3ZVc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 746DC339;
	Wed,  1 Jul 2026 01:48:17 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A06D3F85F;
	Wed,  1 Jul 2026 01:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895701; bh=/+UJCdimKchvp4hGnfezxanRfzPGGapIuiYXTA7gshY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V+yd3ZVcRsvvoMX6kDcW9Yk7FWoQf6lFNBopggUuDmFzBrIbEX/ffsQSsH/XF8Gi9
	 /w8d8l+2gU4/wWpktW4xILv7UCLr16UpoGRl1PGXz9e+bSuXUX+pDYSSSkdgdDRxe6
	 l/wHDJm5nZybd4OP1nB0xhQl6zxrtRCknQr+choI=
Message-ID: <d8a1c72d-831e-4880-ac00-5aeac41ceeaa@arm.com>
Date: Wed, 1 Jul 2026 10:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] selftests/mm: unify pkey sighandler selftest
 assertions and tracing
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630073235.3802271-3-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-3-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
> Add per-test tracing to the pkey signal-handler selftest and use
> pkey_assert() for error handling. Each test enables tracing at start
> and disables it at end; on failure, pkey_assert() calls abort_hooks()
> to turn tracing off so ftrace is not left enabled.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  .../selftests/mm/pkey_sighandler_tests.c      | 69 ++++++++++---------
>  1 file changed, 36 insertions(+), 33 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 302fef54049c..085e771227fb 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -19,7 +19,6 @@
>  #include <stdint.h>
>  #include <stdbool.h>
>  #include <signal.h>
> -#include <assert.h>
>  #include <stdlib.h>
>  #include <sys/mman.h>
>  #include <sys/types.h>
> @@ -36,6 +35,10 @@ static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>  static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
>  static siginfo_t siginfo = {0};
>  
> +int iteration_nr = 1;
> +int test_nr;
> +int dprint_in_signal;

Might as well define those in pkey_util.c as well (move them in patch 1
too).

> [...]
>  
>  	/* Use clone to avoid newer glibcs using rseq on new threads */
> -	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> +	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
>  			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
>  			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
>  			     CLONE_DETACHED,

Align these lines to the opening (.

> [...]
>  
>  	/* Use clone to avoid newer glibcs using rseq on new threads */
> -	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> +	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
>  			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
>  			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
>  			     CLONE_DETACHED,

Same here.

- Kevin
