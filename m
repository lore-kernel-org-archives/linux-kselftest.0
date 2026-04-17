Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03712DD5F6;
	Fri, 17 Apr 2026 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394610; cv=none; b=qKYoOStJfqkA/rP26DwZXOx+Kpsx0l0EeaBoj/KIIlJYpaZvFaQaWB3n/Mbb3MzhqtAvIyNHGtLEfHdIx84aAwEM2vWLHKLouL/AfHCiW+5vXtBnWpU4DGVhlVuP+nFqm1KgBTd7GNHo3G9pC+hZ/HvzChvFmBdTThx7IFJuyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394610; c=relaxed/simple;
	bh=9yoj+9oeEOwnrvff37at3nCipTt6lz6mKXZWJBxfIgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCsec58L4WuVdaXBJx1GzfbRoS+8FYgcmXm84FtED+kJjziUsYF+xpo17Wr7AaC4iMIuIQ0XwBbdQBKr2U92ZTvR738aHF/ZV+V7itod+eeBfeobTrt//VweL4rI0eOoCBmEJgHeNLrxb/C3OOTD5v7uxw2H9ohg5A3Wix9gkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M8X2GZ8y; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M8X2GZ8y"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BB5F165C;
	Thu, 16 Apr 2026 19:56:39 -0700 (PDT)
Received: from [10.163.182.249] (unknown [10.163.182.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 112CC3F7B4;
	Thu, 16 Apr 2026 19:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776394604; bh=9yoj+9oeEOwnrvff37at3nCipTt6lz6mKXZWJBxfIgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M8X2GZ8ypCm0VLfXOXX1CmyqgoRIfqPMz6W9lp//mbyhZ/QrtqatUvTs4fbYSDAFo
	 kQNAxxrcNdsOtRq83S56upNsXbISnVASnftmGy3ajXX/1IU5fU6aBPkscDmM/QtsvJ
	 jwga2vxGy4SjiCYKGaSFGuOICX7fn6gp+pUatthI=
Message-ID: <aee4e68c-077f-4056-9d40-69bc849d1538@arm.com>
Date: Fri, 17 Apr 2026 08:26:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
To: Mike Rapoport <rppt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aeE4XSuXY8RfphVs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/04/26 12:58 AM, Mike Rapoport wrote:
> On Thu, Apr 16, 2026 at 08:10:53PM +0100, Mark Brown wrote:
>> On Thu, Apr 16, 2026 at 09:05:11PM +0200, David Hildenbrand (Arm) wrote:
>>> On 4/16/26 20:40, Mark Brown wrote:
>>
>>>> Several of the mm selftests made use of /proc/pid/mem as part of their
>>>> operation but we do not specify this in the config fragment for them, at
>>>> least mkdirty and ksm_functional_tests have this requirement.
>>
>>> I guess we could teach most tests to SKIP if /proc/pid/mem is unusable.
>>
>> That would be nicer, yes.  I imagine some of these will predate there
>> being a configuration option here at all, it's possible there's newer
>> tests that skip cleanly - I didn't look at the skips.
> 
> Enabling access to /proc/pid/mem keeps the coverage, not that it's great
> right now, but still.
> 
> But sure graceful skips are better than failing the entire tests. Would be
> something like this:
> 
> diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
> index 8d874c4754f3..374b5a25f36d 100644
> --- a/tools/testing/selftests/mm/ksm_functional_tests.c
> +++ b/tools/testing/selftests/mm/ksm_functional_tests.c
> @@ -37,7 +37,6 @@ enum ksm_merge_mode {
>  	KSM_MERGE_NONE, /* PRCTL already set */
>  };
>  
> -static int mem_fd;
>  static int pages_to_scan_fd;
>  static int sleep_millisecs_fd;
>  static int pagemap_fd;
> @@ -622,10 +621,17 @@ static void test_prot_none(void)
>  {
>  	const unsigned int size = 2 * MiB;
>  	char *map;
> +	int mem_fd;
>  	int i;
>  
>  	ksft_print_msg("[RUN] %s\n", __func__);
>  
> +	mem_fd = open("/proc/self/mem", O_RDWR);
> +	if (mem_fd < 0) {
> +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> +		return;
> +	}
> +
>  	map = mmap_and_merge_range(0x11, size, PROT_NONE, KSM_MERGE_MADVISE);
>  	if (map == MAP_FAILED)
>  		goto unmap;
> @@ -694,9 +700,6 @@ static void test_fork_ksm_merging_page_count(void)
>  
>  static void init_global_file_handles(void)
>  {
> -	mem_fd = open("/proc/self/mem", O_RDWR);
> -	if (mem_fd < 0)
> -		ksft_exit_fail_msg("opening /proc/self/mem failed\n");
>  	if (ksm_stop() < 0)
>  		ksft_exit_skip("accessing \"/sys/kernel/mm/ksm/run\") failed\n");
>  	if (ksm_get_full_scans() < 0)
> diff --git a/tools/testing/selftests/mm/mkdirty.c b/tools/testing/selftests/mm/mkdirty.c
> index 68dd447a5454..e4a94638018b 100644
> --- a/tools/testing/selftests/mm/mkdirty.c
> +++ b/tools/testing/selftests/mm/mkdirty.c
> @@ -27,7 +27,6 @@
>  
>  static size_t pagesize;
>  static size_t thpsize;
> -static int mem_fd;
>  static int pagemap_fd;
>  static sigjmp_buf env;
>  
> @@ -86,11 +85,18 @@ static char *mmap_thp_range(int prot, char **_mmap_mem, size_t *_mmap_size)
>  static void test_ptrace_write(void)
>  {
>  	char data = 1;
> +	int mem_fd;
>  	char *mem;
>  	int ret;
>  
>  	ksft_print_msg("[INFO] PTRACE write access\n");
>  
> +	mem_fd = open("/proc/self/mem", O_RDWR);
> +	if (mem_fd < 0) {
> +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> +		return;
> +	}
> +
>  	mem = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE|MAP_ANON, -1, 0);
>  	if (mem == MAP_FAILED) {
>  		ksft_test_result_fail("mmap() failed\n");
> @@ -124,10 +130,17 @@ static void test_ptrace_write_thp(void)
>  	char *mem, *mmap_mem;
>  	size_t mmap_size;
>  	char data = 1;
> +	int mem_fd;
>  	int ret;
>  
>  	ksft_print_msg("[INFO] PTRACE write access to THP\n");
>  
> +	mem_fd = open("/proc/self/mem", O_RDWR);
> +	if (mem_fd < 0) {
> +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> +		return;
> +	}
> +
>  	mem = mmap_thp_range(PROT_READ, &mmap_mem, &mmap_size);
>  	if (mem == MAP_FAILED)
>  		return;
> @@ -343,9 +356,6 @@ int main(void)
>  	ksft_print_header();
>  	ksft_set_plan(tests);
>  
> -	mem_fd = open("/proc/self/mem", O_RDWR);
> -	if (mem_fd < 0)
> -		ksft_exit_fail_msg("opening /proc/self/mem failed\n");
>  	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
>  	if (pagemap_fd < 0)
>  		ksft_exit_fail_msg("opening /proc/self/pagemap failed\n");
>

Change LGTM making these tests skip rather gracefully.
 
>>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>>
>> Thanks.
> 
> 
> 

