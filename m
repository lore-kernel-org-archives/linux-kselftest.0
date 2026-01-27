Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA632230BE9;
	Tue, 27 Jan 2026 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546445; cv=none; b=X0DeqRpt4X1jO6CwQrfbn/AGmUPZYXyy/aITi/idUZW4rbBVBEGe8Nf1Fmlfh3uVXKVI4JCTgpVjnSQ9dXKcnLq21xZ+LhMTrIE260DsU4FvHyLygtLopUStEClW5HI1nPb9BW0qxqgpuwx3/EjAbqNHx9iqYr063SYZNx+kcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546445; c=relaxed/simple;
	bh=Fds3lRap6o4bjOhQoSFy9Z9uQ+rAoiEgHUpJBS1kw0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAasDGwmepbDAJ+jeEAv+izr9HnwPFWH6B85hRLn5NtXnwPzj5xD160+uSgixXLlnME3Cytotkbrb4fhZnHmlNFHeL5m/WSMl6MytMhTmqM5HOIXmWzpSwBTNovZhY/JgLgIesXZaYi16B6k5rudW39H/ktTwNAmAhwp+/waoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3045D1515;
	Tue, 27 Jan 2026 12:40:34 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F57D3F5CA;
	Tue, 27 Jan 2026 12:40:39 -0800 (PST)
Message-ID: <a3428306-9fae-4add-890e-ed7b82bea0b8@arm.com>
Date: Tue, 27 Jan 2026 20:40:37 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT
 tests on ARM
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, fenghuay@nvidia.com,
 reinette.chatre@intel.com, james.morse@arm.com, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng,

On 1/23/26 04:40, Shaopeng Tan wrote:
> Hello Fenghua, Reinette, Ben, James, and to whom it may concern,
> 
> The MPAM driver is nearing upstream merge,
> but resctrl_test doesn't work on the Arm architecture.
> I'm actively working on a series to support CAT/NONCONT_CAT tests for the Arm. 
> (Support for MBM/MBA tests will be considered in the future.)

Great :) Having MPAM support in the resctrl kselftests will be be good.

> 
> While I've modified the resctrl_test code to enable CAT on Arm,
> CAT test is failing in the NVIDIA Grace environment. 
> (I don't have any other environments.)
> Am I misunderstanding the CAT tests, or is there something specific
> about Grace that I'm overlooking? Any advice would be greatly appreciated.

IIUC the L3 cache is in the nvidia interconnect and so changing the
cache portion bitmap would correlate with events from the nvidia
interconnect pmu. However, I don't think you are using events from the
interconnect.

> 
> First of all,
> when running CAT on Grace, I observed that cache limiting is working as expected.
> I verified this by checking "sudo cat /sys/fs/resctrl/c1/mon_data/mon_L3_*/llc_occupancy".
> Furthermore, I noticed that benchmark execution times varied directly with the limited cache size.

Good to know.

> 
> I reused the existing Intel CAT test methodology,
> that involves collecting cache miss counts via perf_event during a benchmark task and then
> verifying a correlation between the cache limit value and these miss counts.
> https://lore.kernel.org/lkml/20231215150515.36983-23-ilpo.jarvinen@linux.intel.com/#r
> 
> I'm aware that the specific cache miss numbers and CAT's impact can
> differ significantly depending on the microarchitecture or SoC.
> For Arm, we need to establish an appropriate minimum difference in LLC
> misses between a test with n+1 bits CBM to the test with n bits.
> 
> However, my experiments with Grace showed that even when I significantly
> varied the cache span size, the average LLC miss counts remained nearly unchanged.
> 
> Detailed test results as follows:
> 
> # # Starting L3_CAT test ...
> # # Mounting resctrl to "/sys/fs/resctrl"
> # # Cache size :119537664
> # # Writing benchmark parameters to resctrl FS
> # # Write schema "L3:1=fc0" to resctrl FS
> # # Write schema "L3:1=3f" to resctrl FS
> # # Write schema "L3:1=fe0" to resctrl FS
> # # Write schema "L3:1=1f" to resctrl FS
> # # Write schema "L3:1=ff0" to resctrl FS
> # # Write schema "L3:1=f" to resctrl FS
> # # Write schema "L3:1=ff8" to resctrl FS
> # # Write schema "L3:1=7" to resctrl FS
> # # Write schema "L3:1=ffc" to resctrl FS
> # # Write schema "L3:1=3" to resctrl FS
> # # Write schema "L3:1=ffe" to resctrl FS
> # # Write schema "L3:1=1" to resctrl FS
> # # Checking for pass/fail
> # # Number of bits: 6
> # # Average LLC val: 1609252
> # # Cache span (lines): 933888
> # # Fail: Check cache miss rate changed more than 4.0%
> # # Percent diff=-0.0
> # # Number of bits: 5
> # # Average LLC val: 1609038
> # # Cache span (lines): 778240
> # # Fail: Check cache miss rate changed more than 3.0%
> # # Percent diff=0.7
> # # Number of bits: 4
> # # Average LLC val: 1620802
> # # Cache span (lines): 622592
> # # Fail: Check cache miss rate changed more than 2.0%
> # # Percent diff=1.1
> # # Number of bits: 3
> # # Average LLC val: 1639214
> # # Cache span (lines): 466944
> # # Fail: Check cache miss rate changed more than 1.0%
> # # Percent diff=0.9
> # # Number of bits: 2
> # # Average LLC val: 1653470
> # # Cache span (lines): 311296
> # # Pass: Check cache miss rate changed more than 0.0%
> # # Percent diff=1.0
> # # Number of bits: 1
> # # Average LLC val: 1669618
> # # Cache span (lines): 155648
> # not ok 4 L3_CAT: test
> 
> Additionally, even with a fixed alloc buffer size(span = 119537664),
> the Average LLC value remains nearly unchanged regardless of the limited cache size.
> Furthermore, it appears that ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL is
> mapped to PERF_COUNT_HW_CACHE_MISSES in "./drivers/perf/arm_pmuv3.c",
> to counteract this, I attempted to use the perf_event measurement event
> to ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD,
> ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL,
> and ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD,
> however, the Average LLC value still remains nearly unchanged.

I think these are from the neoverse_v2 rather than the interconnect.

> 
> My modifications to resctrl_test (for context):
> 
> diff --git a/tools/testing/selftests/resctrl/cache.c
> b/tools/testing/selftests/resctrl/cache.c
> index 9a4a6c52b14c..9f00680039c6 100644
> --- a/tools/testing/selftests/resctrl/cache.c
> +++ b/tools/testing/selftests/resctrl/cache.c
> @@ -8,7 +8,8 @@ char llc_occup_path[1024];
>  void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
>  {
>         memset(pea, 0, sizeof(*pea));
> -       pea->type = PERF_TYPE_HARDWARE;
> +       //pea->type = PERF_TYPE_HARDWARE;
> +       pea->type = PERF_TYPE_RAW;
>         pea->size = sizeof(*pea);
>         pea->read_format = PERF_FORMAT_GROUP;
>         pea->exclude_kernel = 1;
> diff --git a/tools/testing/selftests/resctrl/cat_test.c
> b/tools/testing/selftests/resctrl/cat_test.c
> index 58b1590695d1..3ecf22fa1983 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -8,6 +8,7 @@
>   *    Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
>   *    Fenghua Yu <fenghua.yu@intel.com>
>   */
> +#include "perf/arm_pmuv3.h"
>  #include "resctrl.h"
>  #include <unistd.h>
> 
> @@ -181,7 +182,11 @@ static int cat_test(const struct resctrl_test *test,
>         if (ret)
>                 goto reset_affinity;
> 
>         perf_event_attr_initialize(&pea, PERF_COUNT_HW_CACHE_MISSES);
> +       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE);
> +       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD);
> +       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL);
> +       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD);
>         perf_event_initialize_read_format(&pe_read);
>         pe_fd = perf_open(&pea, bm_pid, uparams->cpu);
>         if (pe_fd < 0) {
> @@ -276,6 +281,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
>         };
>         param.mask = long_mask;
>         span = cache_portion_size(cache_total_size, start_mask, full_cache_mask);
> +       //span = 119537664; //L3 cache size of my machine
> 
>         remove(param.filename);
> 
> Any insights or suggestions would be greatly appreciated.
> 
> Best regards,
> Shaopeng TAN
> 
> ---
> Shaopeng Tan (5):
>   kselftests/resctrl: Detect the ARM architecture
>   kselftests/resctrl: enable noncont_cat for MPAM
>   kselftests/resctrl: remove unnecessary exclude_idle
>   kselftests/resctrl: set shareable_mask to zero if all bits are shared
>     between software and hardware
>   kselftests/resctrl: Add support for CAT test on ARM
> 
>  tools/testing/selftests/resctrl/cache.c         | 1 -
>  tools/testing/selftests/resctrl/cat_test.c      | 5 +++--
>  tools/testing/selftests/resctrl/fill_buf.c      | 4 ++++
>  tools/testing/selftests/resctrl/resctrl.h       | 1 +
>  tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
>  tools/testing/selftests/resctrl/resctrlfs.c     | 2 ++
>  6 files changed, 17 insertions(+), 3 deletions(-)
> 

Thanks,

Ben

