Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C439241D111;
	Mon, 17 Aug 2026 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981297; cv=none; b=pK72mzCl0NZGIzlRVPPQOIuVWC2fNy9mB48g0wDaPgweRK+tYDYoWqRdUBl4jdN0jgCAxp/S4GbywVQP6juVsC04dhuR+X55Qz/aX4tR+HpicwZLRitH+AGT1gIwuLnaiGD8yz9p2ikkEKLjiEaS+KgSTl+2k8WwKjYVMENoJXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981297; c=relaxed/simple;
	bh=5HUYy/NWh82f6yiqf+xRP/nWbaerO9LUZNm0SRxGFPk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ap4HVKbxlzlSBVTWL4cielSbJF9Yr/bwFrpWelmWU/ksh35HAoxchJFIxJIp7eHEvDvcPQd0plefaOZ3Au1tmpFbWkO3Xt2VJCcGwaUegAKlB7VjzW/vC1JrEMOEyVYnWoxiFy5W5lUwneULmJEMBkNCfmflvjd96INuNeh3vJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TKkAfWtO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TKkAfWtO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B97F143D;
	Mon, 17 Aug 2026 08:41:31 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338793F673;
	Mon, 17 Aug 2026 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786981295; bh=5HUYy/NWh82f6yiqf+xRP/nWbaerO9LUZNm0SRxGFPk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TKkAfWtOltSWSxnTnHufmUnAl0SRlqrc2Q4b1aKibOPZ/oKswBZyi21DDUAVtYcIR
	 W/dVCtxvdtwwVmh3Oa/owGE1d85PT5YKlvixIzD/iGXnSM5En8Do4TrqRjlFAfdke8
	 73TyWn4NLReSv4KRKR6vlsrJt2nWMet3joi1y6wQ=
Message-ID: <0b88055f-bd9e-48ea-8735-80931e80a9bd@arm.com>
Date: Mon, 17 Aug 2026 16:41:31 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] selftests/mm: restore enable_soft_offline in
 hugetlb-soft-offline
To: Song Hu <husong@kylinos.cn>, akpm@linux-foundation.org, rppt@kernel.org,
 sarthak.sharma@arm.com
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-4-husong@kylinos.cn>
Content-Language: en-US
From: Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <20260815080716.3596514-4-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2026 9:07 am, Song Hu wrote:
> hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1
> and 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
> finishes, silently disabling soft offlining for the whole system after
> the run.
> 
> Save the original value before the test and restore it from an atexit()
> handler, so the sysctl is also restored when the test exits early via
> ksft_exit_fail_msg(), as hugepage_restore_settings_atexit() in
> hugepage_settings.c already does.  Use read_num()/write_num() from
> vm_util instead of the hand-rolled popen()/fopen() helpers.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  .../selftests/mm/hugetlb-soft-offline.c       | 35 +++++++------------
>  1 file changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> index bc202e4ed2bd..86259921d54c 100644
> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> @@ -23,6 +23,7 @@
>  #include <sys/types.h>
>  
>  #include "kselftest.h"
> +#include "vm_util.h"
>  #include "hugepage_settings.h"
>  
>  #ifndef MADV_SOFT_OFFLINE
> @@ -31,6 +32,8 @@
>  
>  #define EPREFIX " !!! "
>  
> +#define ENABLE_SOFT_OFFLINE_PATH "/proc/sys/vm/enable_soft_offline"
> +
>  static int do_soft_offline(int fd, size_t len, int expect_errno)
>  {
>  	char *filemap = NULL;
> @@ -77,26 +80,12 @@ static int do_soft_offline(int fd, size_t len, int expect_errno)
>  	return ret;
>  }
>  
> -static int set_enable_soft_offline(int value)
> -{
> -	char cmd[256] = {0};
> -	FILE *cmdfile = NULL;
> -
> -	if (value != 0 && value != 1)
> -		return -EINVAL;
> -
> -	sprintf(cmd, "echo %d > /proc/sys/vm/enable_soft_offline", value);
> -	cmdfile = popen(cmd, "r");
> -
> -	if (cmdfile)
> -		ksft_print_msg("enable_soft_offline => %d\n", value);
> -	else {
> -		ksft_perror(EPREFIX "failed to set enable_soft_offline");
> -		return errno;
> -	}
> +static unsigned long orig_enable_soft_offline = -1UL;
>  
> -	pclose(cmdfile);
> -	return 0;
> +static void restore_enable_soft_offline(void)
> +{
> +	if (orig_enable_soft_offline != -1UL)
> +		write_num(ENABLE_SOFT_OFFLINE_PATH, orig_enable_soft_offline);
>  }
>  
>  static int create_hugetlbfs_file(struct statfs *file_stat)
> @@ -145,10 +134,7 @@ static void test_soft_offline_common(int enable_soft_offline)
>  	hugepagesize_kb = file_stat.f_bsize / 1024;
>  	ksft_print_msg("Hugepagesize is %ldkB\n", hugepagesize_kb);
>  
> -	if (set_enable_soft_offline(enable_soft_offline) != 0) {
> -		close(fd);
> -		ksft_exit_fail_msg("Failed to set enable_soft_offline\n");
> -	}
> +	write_num(ENABLE_SOFT_OFFLINE_PATH, enable_soft_offline);
>  
>  	nr_hugepages_before = hugetlb_nr_default_pages();
>  
> @@ -192,6 +178,9 @@ int main(int argc, char **argv)
>  
>  	ksft_set_plan(2);
>  
> +	orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
> +	atexit(restore_enable_soft_offline);
> +

Seems good. Thanks for fixing.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Thanks,
Usama
