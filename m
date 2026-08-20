Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C43AE18A;
	Thu, 20 Aug 2026 06:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205717; cv=none; b=k56H6lUrlWLScxWc7W3ISB815GQq6R4VDB+r2Qt/b20XR7R485fnasjOERy4MACjYiVN5/4cF9s6ure9MPMk/6xFVMwKP1zbfduCwMNcgy8EZ8fKikOtCQj+vWtYi7Ub/mocvOWfBKyD0VMCUi+0j4bHY96b+SiYvX+ZvZ6lnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205717; c=relaxed/simple;
	bh=aChLoLYF4q5RF8gChg9lR6cBsqDXyCNpwMdOdsBpaSA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jxgTR6j/Q5/NJTqHQO7LfLd0wIZTGdZNwMF84GzQ1AhdikXhTvz4R8jvHEALWPRWHfu0lyCJMHXGrYeEfywQF7n2Fz+iIZH0wHzc3JFJ8soqGxvEtSpQJ6S7DrjX+qRPsFFd3mEGG6ZYe/azM3+BKxoIXRs573feUJBsjwJkYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9f46d1de9c5c11f19a56ed5b684f684d-20260820
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3c416136-d582-41b2-8861-65b0b7d07bf6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:3c416136-d582-41b2-8861-65b0b7d07bf6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:7d505ecffc03ec866331e12b37300df3,BulkI
	D:2608180044547525HKYB,BulkQuantity:1,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f46d1de9c5c11f19a56ed5b684f684d-20260820
X-User: husong@kylinos.cn
Received: from [192.168.110.173] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1706420389; Thu, 20 Aug 2026 14:01:44 +0800
Message-ID: <a6d9ce4b-3880-48af-8fa6-dfa7129c0464@kylinos.cn>
Date: Thu, 20 Aug 2026 14:01:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
To: Usama Anjum <usama.anjum@arm.com>, akpm@linux-foundation.org,
 rppt@kernel.org, sarthak.sharma@arm.com
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-3-husong@kylinos.cn>
 <1787017182354310.22.seg@mailgw.kylinos.cn>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <1787017182354310.22.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Usama

在 2026/8/17 23:44, Usama Anjum 写道:
> On 15/08/2026 9:07 am, Song Hu wrote:
>> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
>> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
>> TAP line, so its output is not valid KTAP.  Add the header and switch
>> the skip to ksft_exit_skip().
>>
>> Also fix two more KTAP compliance issues spotted in review:
>>
>> - get_mmap_min_addr() calls strerror(errno) after fclose(), which may
>>   clobber errno; save errno before fclose() instead.
>>
>> - Some ksft_*() messages embed "\n\t", so the text after each embedded
>>   newline is printed without the "# " prefix.  Split those into separate
>>   messages.
>>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
>>  tools/testing/selftests/mm/mremap_test.c | 41 +++++++++++++-----------
>>  1 file changed, 23 insertions(+), 18 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
>> index 131d9d6db867..28f151daabe4 100644
>> --- a/tools/testing/selftests/mm/mremap_test.c
>> +++ b/tools/testing/selftests/mm/mremap_test.c
>> @@ -111,18 +111,17 @@ static unsigned long long get_mmap_min_addr(void)
>>  		return addr;
>>  
>>  	fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
>> -	if (fp == NULL) {
>> -		ksft_print_msg("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
>> -			strerror(errno));
>> -		exit(KSFT_SKIP);
>> -	}
>> +	if (!fp)
>> +		ksft_exit_skip("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
>> +			       strerror(errno));
> 
> The skip conditions are usually at the start of the test before we set
> the total number planned tests. If skip like this happens later, it
> still counts as failure. I found the following corresponding output
> with this patch:
> 
> TAP version 13
> # Test configs:
> # threshold_mb=4
> # pattern_seed=1786980558
> 1..26
> ok 1 # SKIP Failed to read /proc/sys/vm/mmap_min_addr: Success
> # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> # Planned tests != run tests (26 != 1)
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
> MREMAP_FORCED_SKIP_RC=4
> ### MREMAP FORCED READ-SKIP END
> 

Right, get_mmap_min_addr() is first reached from deep inside
run_mremap_test_case(), long after the plan is set.  v3 caches
mmap_min_addr in main(), right after ksft_print_header() and before
ksft_set_plan(), so the skip paths now run before the plan.  Reproducing
your scenario by injecting a read failure on the sysctl (LD_PRELOAD
fopen shim handing the test /dev/null for it):

	TAP version 13
	1..0 # SKIP Failed to read /proc/sys/vm/mmap_min_addr: Success

Thanks,
Song

>>  
>>  	n_matched = fscanf(fp, "%llu", &addr);
>>  	if (n_matched != 1) {
>> -		ksft_print_msg("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
>> -			strerror(errno));
>> +		int err = errno;
>> +
>>  		fclose(fp);
>> -		exit(KSFT_SKIP);
>> +		ksft_exit_skip("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
>> +			       strerror(err));
>>  	}
>>  
>>  	fclose(fp);
>> @@ -1164,10 +1163,11 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>>  					    rand_addr);
>>  
>>  	if (remap_time < 0) {
>> -		if (test_case.expect_failure)
>> -			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
>> -					      test_case.name);
>> -		else {
>> +		if (test_case.expect_failure) {
>> +			ksft_print_msg("%s: expected mremap failure\n",
>> +				       test_case.name);
>> +			ksft_test_result_xfail("%s\n", test_case.name);
>> +		} else {
>>  			ksft_test_result_fail("%s\n", test_case.name);
>>  			*failures += 1;
>>  		}
>> @@ -1177,11 +1177,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>>  		 * was faulted in.
>>  		 */
>>  		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
>> -		    test_case.config.region_size <= threshold_mb * _1MB)
>> -			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
>> -					      test_case.name, remap_time);
>> -		else
>> +		    test_case.config.region_size <= threshold_mb * _1MB) {
>> +			ksft_print_msg("%s: mremap time: %12lldns\n",
>> +				       test_case.name, remap_time);
>>  			ksft_test_result_pass("%s\n", test_case.name);
>> +		} else {
>> +			ksft_test_result_pass("%s\n", test_case.name);
>> +		}
>>  	}
>>  }
>>  
>> @@ -1250,13 +1252,16 @@ int main(int argc, char **argv)
>>  	time_t t;
>>  	FILE *maps_fp;
>>  
>> +	ksft_print_header();
>> +
>>  	pattern_seed = (unsigned int) time(&t);
>>  
>>  	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
>>  		exit(EXIT_FAILURE);
>>  
>> -	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
>> -		       threshold_mb, pattern_seed);
>> +	ksft_print_msg("Test configs:\n");
>> +	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
>> +	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
>>  
>>  	/*
>>  	 * set preallocated random array according to test configs; see the
> 
> Thanks,
> Usama

