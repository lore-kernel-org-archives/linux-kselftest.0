Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E0E2980A8;
	Tue, 30 Jun 2026 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809996; cv=none; b=LuGGUiVxwrzFiq6XJ9SZK+/I8IfXwNjyEC7L+6CJ0la+XEKSI7nYcMhSU5dvCfDKP2NV3ui1AevEUppm0z2cWKsBCbT6Zl1LGzGcmAb8N0GFAxTEOdFw5owBe4vU+7/hjMDvjBdRyvUAOsisu1LW0zm8ExCXPWeJBT7FfD1j7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809996; c=relaxed/simple;
	bh=3AqJp5i7XIK+jRB+gWzzbQTkxN1da8ybVT+nch5RbIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXJdaLcD9JscYyU1W81PRWMZcxZ9Qf6dTFJuhXqEwLRzB3bKJBT9hG2op7bvVuik3qDR8if5qoYlpKRlh2u8qbRPTgkL0lLhTc3lT7M8xz3BcVXWJ0YO/sK97bAIfZMSmxokJpEDmBfrLehdqVT4hbbZO4sO0IUQQDQQU/Oj6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=efH2a60X; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="efH2a60X"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E31FD2C1C;
	Tue, 30 Jun 2026 01:59:48 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8055D3F905;
	Tue, 30 Jun 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782809993; bh=3AqJp5i7XIK+jRB+gWzzbQTkxN1da8ybVT+nch5RbIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=efH2a60XTMLqXCin030aJfgiBIrLDjzaEAGTvIuHMIxezgFdlj/vhszDkAoTvyvr9
	 SuuU8ohtWyZDhewEGi60YBBMw8nakSWsmsr+eNWPayC7fveSjZuZlobeLjNTC8V/Ig
	 pA/O46kRhBqwq5NjpKC99EwbVh5wWlc+np71zIeo=
Message-ID: <5d72fce2-5acf-44ce-bf5e-3ee74611c6e5@arm.com>
Date: Tue, 30 Jun 2026 14:29:46 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: hmm-tests: include linux/mman.h to access
 MADV_COLLAPSE
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
References: <20260628143111.36863-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260628143111.36863-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/06/26 8:01 pm, Zenghui Yu wrote:
> The following compilation error occurs with an old version of glibc due to
> a recent commit adding MADV_COLLAPSE testing:
> 
>  [root@localhost mm]# getconf GNU_LIBC_VERSION
>  glibc 2.34
>  [root@localhost mm]# make
>    CC       hmm-tests
>  hmm-tests.c: In function 'hmm_migrate_anon_huge_fault':
>  hmm-tests.c:2355:27: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
>   2355 |  ret = madvise(map, size, MADV_COLLAPSE);
>        |                           ^~~~~~~~~~~~~
>        |                           MADV_COLD
>  hmm-tests.c:2355:27: note: each undeclared identifier is reported only once for each function it appears in
>  make: *** [../lib.mk:225: /root/code/linux/tools/testing/selftests/mm/hmm-tests] Error 1
> 
> Include linux/mman.h (which provides the definition of MADV_COLLAPSE) to
> fix the build error.
> 
> Fixes: e3d8707358ea ("selftests/mm/hmm-tests: test pagemap reads of PMD device-private entries")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  tools/testing/selftests/mm/hmm-tests.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index e4c49699f3f7..2f2b9879d100 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -23,6 +23,7 @@
>  #include <time.h>
>  #include <pthread.h>
>  #include <limits.h>
> +#include <linux/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <sys/mman.h>

