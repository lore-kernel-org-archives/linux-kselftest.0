Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E63E95A8;
	Tue, 25 Aug 2026 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648832; cv=none; b=t677xQY1/iNE91Vun+h2smBgJILOiWwe75Z/7inhRL2NSxoZp1p/HmoCP7P6WfB83twWbfq4fy3LPglXyiTd16S8YPzXu2idW7AQdzHG3n0LyrLYnrJJAVevJ2cTCdobfesQ9TkawiY2V2SwUvG/gEHTMS3PFFgSm15C4PhSuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648832; c=relaxed/simple;
	bh=bFFBYanlaQPN81iPMYE4dlBiMifuGy/XaLbZPSnW2H4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h6tZbTJFvD/9RrWBxmarHe0NYJX+NTWBgBqdvPh8XdR/z0Ki4Stb40Vu8lnq5JTHTn/GxskCMFzTdXQqwkY5hNUKqcm4QekFqYu9EnadIKn9JcDgL3PyBLaihum07lPLH/0RWE4wIyBfzFAw4n6BMAA8KxckL0aqKhLzwhYVMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 558d86e4a06411f19a56ed5b684f684d-20260825
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a0246a80-7c1f-4f19-9786-b97f08eff61a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:a0246a80-7c1f-4f19-9786-b97f08eff61a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:04f5cfed6c8dd4bf6997e68066818437,BulkI
	D:260825170706LUVBJ45N,BulkQuantity:0,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 558d86e4a06411f19a56ed5b684f684d-20260825
X-User: husong@kylinos.cn
Received: from [192.168.110.173] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 341956731; Tue, 25 Aug 2026 17:07:01 +0800
Message-ID: <30a72651-c95d-450e-b344-90c504f70c11@kylinos.cn>
Date: Tue, 25 Aug 2026 17:06:47 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 sarthak.sharma@arm.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] selftests/mm: restore enable_soft_offline in
 hugetlb-soft-offline
To: akpm@linux-foundation.org, usama.anjum@arm.com
References: <20260825085756.63030-1-husong@kylinos.cn>
 <20260825085756.63030-4-husong@kylinos.cn>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <20260825085756.63030-4-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Usama,

在 2026/8/25 16:57, Song Hu 写道:
> hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1
> and 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
> finishes, silently disabling soft offlining for the whole system after
> the run.
> 
> Save the original value before the test and restore it from an
> atexit() handler, as hugepage_restore_settings_atexit() in
> hugepage_settings.c already does.  Use read_num()/write_num() from
> vm_util instead of hand-rolled popen()/fopen() helpers.
> 
> The restore handler must not call write_num(): on failure it
> re-enters exit() through ksft_exit_fail_msg(), which is undefined
> behavior from inside an atexit handler.  A non-root run hits it
> directly - the restore write fails the same way the write that
> triggered the exit did.  Restore with plain open()/write(), best
> effort.
> 

Just a note on patch 3/3: v4 changed the restore handler, so your
Reviewed-by/Tested-by no longer apply and were dropped.

write_num() calls ksft_exit_fail_msg() on failure, which re-enters
exit() from inside the atexit handler - undefined behavior that a
non-root run hits directly.  v4 restores with plain open()/write()
instead.  Verified on 7.2.0-rc7-next-20260810: 2/2 pass and the sysctl
is restored afterwards.

Would you mind taking another look when you have time?

Thanks,
Song

> Signed-off-by: Song Hu <husong@kylinos.cn>
> 
> ---
> 
> Changes since v3: the restore handler no longer uses write_num(),
> whose failure path calls exit() from inside an atexit handler -
> undefined behavior on a non-root run.  Restore with plain
> open()/write(), best effort.
> 
>  .../selftests/mm/hugetlb-soft-offline.c       | 49 +++++++++++--------
>  1 file changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> index bc202e4ed2bd..4af9d3db7b5b 100644
> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> @@ -11,6 +11,7 @@
>  
>  #define _GNU_SOURCE
>  #include <errno.h>
> +#include <fcntl.h>
>  #include <stdlib.h>
>  #include <stdio.h>
>  #include <string.h>
> @@ -23,6 +24,7 @@
>  #include <sys/types.h>
>  
>  #include "kselftest.h"
> +#include "vm_util.h"
>  #include "hugepage_settings.h"
>  
>  #ifndef MADV_SOFT_OFFLINE
> @@ -31,6 +33,8 @@
>  
>  #define EPREFIX " !!! "
>  
> +#define ENABLE_SOFT_OFFLINE_PATH "/proc/sys/vm/enable_soft_offline"
> +
>  static int do_soft_offline(int fd, size_t len, int expect_errno)
>  {
>  	char *filemap = NULL;
> @@ -77,26 +81,29 @@ static int do_soft_offline(int fd, size_t len, int expect_errno)
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
> +static unsigned long orig_enable_soft_offline = -1UL;
>  
> -	sprintf(cmd, "echo %d > /proc/sys/vm/enable_soft_offline", value);
> -	cmdfile = popen(cmd, "r");
> +/*
> + * Runs from an atexit handler, so it must not call anything that
> + * exits on failure: write_num() would re-enter exit() through
> + * ksft_exit_fail_msg().
> + */
> +static void restore_enable_soft_offline(void)
> +{
> +	char buf[24];
> +	int fd, len;
>  
> -	if (cmdfile)
> -		ksft_print_msg("enable_soft_offline => %d\n", value);
> -	else {
> -		ksft_perror(EPREFIX "failed to set enable_soft_offline");
> -		return errno;
> -	}
> +	if (orig_enable_soft_offline == -1UL)
> +		return;
>  
> -	pclose(cmdfile);
> -	return 0;
> +	len = snprintf(buf, sizeof(buf), "%lu", orig_enable_soft_offline);
> +	fd = open(ENABLE_SOFT_OFFLINE_PATH, O_WRONLY);
> +	if (fd < 0)
> +		return;
> +	if (write(fd, buf, len) != len)
> +		ksft_print_msg("failed to restore enable_soft_offline: %s\n",
> +			       strerror(errno));
> +	close(fd);
>  }
>  
>  static int create_hugetlbfs_file(struct statfs *file_stat)
> @@ -145,10 +152,7 @@ static void test_soft_offline_common(int enable_soft_offline)
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
> @@ -192,6 +196,9 @@ int main(int argc, char **argv)
>  
>  	ksft_set_plan(2);
>  
> +	orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
> +	atexit(restore_enable_soft_offline);
> +
>  	test_soft_offline_common(1);
>  	test_soft_offline_common(0);
>  

