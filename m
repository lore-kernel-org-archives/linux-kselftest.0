Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988FE327204;
	Wed, 15 Apr 2026 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239537; cv=none; b=NpjnQewwb1EU2bh/agkz+WxzrO6IXtGSz1CgpYpi6NRIJe38S9wLMxZ+tTj9A1w3LR3z85fOsb8605mFCOoPAg+FtC5ViJ2qmsTkjwPd9LSN2I6NTQhP57aIj4Q7iXZN2KCr5mOLK7OgpuvIUZ3V1048lUdoggokg90RVkffSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239537; c=relaxed/simple;
	bh=pNzsf24XkPr8cIpKWJ+IsXDIq2b5cTVIo+EHv+ftpUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7UhpCX+QVbKTVDg11bQ24S+7nrkPVyNsH1e0kr1UMWMrap8JIstJ2uJJmaVe9OTfJ6W7hggGniiRejyKGFfcSh5xPE5RqpV9BtDoFs+9JzSwRJqOqArUveh8Mg0oebje5C0xlQFbDzKOOkmO3HFNj78bo+CrN/R53fdMwDGwq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PYtTvnee; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PYtTvnee"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4hP6w1834976;
	Wed, 15 Apr 2026 07:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CRIBpB
	XdILwWULwaeFoVfR5LPSMUXfdDEhKqNVYPy/M=; b=PYtTvneewOlvgdYzloR+qc
	Y4M1EbHICI/uP/kLG8PsghpdlxOzSYIPWpHI1WfodzNL/C1LOtCAK/gYfGME4jla
	wsKKkhyBSDwvTfhcFF3cifAcU/tjQy+XzqaqMjcE9xV+bQZ26A17vmtzS6WgPU0M
	pi/sKTZOpOyvkldXz1c4Yl8vNSVXfRKye9P/uMOSX1SUb+nLggfM2uCamqbxaF1d
	pVOR5/73cqf8Q+fWHNPd6YUIbgyzme0bkaT6E9nPb/koaWxj770EUu7iiCraG5zA
	K77GVuAOUASATFZdQLKelnv6NhP3pic+d6Uh9qZPgxuprwr1lz0UHfzVcX/e8K1w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89rexhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 07:51:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63F36QuJ003594;
	Wed, 15 Apr 2026 07:51:38 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg1mnd880-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 07:51:38 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63F7pbOs5440264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 07:51:37 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8981A58055;
	Wed, 15 Apr 2026 07:51:37 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8587C5804B;
	Wed, 15 Apr 2026 07:51:28 +0000 (GMT)
Received: from [9.124.217.38] (unknown [9.124.217.38])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Apr 2026 07:51:28 +0000 (GMT)
Message-ID: <5304948b-18ad-43f1-b447-df1f97f31949@linux.ibm.com>
Date: Wed, 15 Apr 2026 13:21:26 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/53] selftests/mm: uffd-unit-tests: use kselftest
 framework
To: Mike Rapoport <rppt@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
        Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
        Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
        Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mm@kvack.org
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-19-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-19-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MCBTYWx0ZWRfX7uf5yzMp4EV7
 ZcwOKodXJFjvDXMi4SwG9EGvPVVr8V2a5xDzUTmJiR5z/DCxjTbWqLlt232AZtYbtnfrqo0yYaJ
 y4KaDkz3hk8m4z/hTVEi/vCgbz6YHk9aNyWLa8B+aD0gSpKQ1C62icHFjJHo+ifZjW9pbnE8NWy
 nNzW6thb1bUMxkdUalHZL6zdIeTEXMqDu7Rsd/q/slwVj4KZzb54syUIzqA71AJitTKJnGpYrQc
 xeOC7p8Tk2efU9mzzXL1DD8qIJoCJuPK3BQPJdcL0gXj8QIpmvT8g5PSvSuzSrhclxFTqSTSWTa
 LDoQPVlzZCHFuZI9t6BIVMqHC9Ua0bvP5n+qRLg5ktmWSwsNN8r0re6tFoIxE3VkCMInS9oFl7p
 6WmESoTDN16gzo+jK97ieci7flahxhD/rrge9HJN7WFe0u+TT0rdT3XSzqZK9TpFum94sokK/qA
 CsLMi1TU6zFKBAfWQAw==
X-Proofpoint-ORIG-GUID: crsjs0cRZXeEf6DcRBo75EnMdPl_BFTG
X-Proofpoint-GUID: RdUmzU2AB-5czPCzIDm2gTB5_OhM7cwq
X-Authority-Analysis: v=2.4 cv=fYidDUQF c=1 sm=1 tr=0 ts=69df438b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=ICrVR6_wMwjK95LA6u4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150070

Hi Mike

On 4/6/26 7:47 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert uffd-unit-tests to use kselftest framework for reporting and
> tracking successful and failing runs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/uffd-unit-tests.c | 79 +++++++++++---------
>   1 file changed, 44 insertions(+), 35 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 6f5e404a446c..1a33db281f8a 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -86,39 +86,24 @@ typedef struct {
>   	uffd_test_case_ops_t *test_case_ops;
>   } uffd_test_case_t;
>   
> -static void uffd_test_report(void)
> -{
> -	printf("Userfaults unit tests: pass=%u, skip=%u, fail=%u (total=%u)\n",
> -	       ksft_get_pass_cnt(),
> -	       ksft_get_xskip_cnt(),
> -	       ksft_get_fail_cnt(),
> -	       ksft_test_num());
> -}
> +static char current_test[256];
>   
>   static void uffd_test_pass(void)
>   {
> -	printf("done\n");
> -	ksft_inc_pass_cnt();
> +	ksft_test_result_pass("%s\n", current_test);
>   }
>   
>   #define  uffd_test_start(...)  do {		\
> -		printf("Testing ");		\
> -		printf(__VA_ARGS__);		\
> -		printf("... ");			\
> -		fflush(stdout);			\
> +		snprintf(current_test, sizeof(current_test), __VA_ARGS__); \
>   	} while (0)
>   
>   #define  uffd_test_fail(...)  do {		\
> -		printf("failed [reason: ");	\
> -		printf(__VA_ARGS__);		\
> -		printf("]\n");			\
> -		ksft_inc_fail_cnt();		\
> +		ksft_test_result_fail("%s\n", current_test);	\
>   	} while (0)
>   
>   static void uffd_test_skip(const char *message)
>   {
> -	printf("skipped [reason: %s]\n", message);
> -	ksft_inc_xskip_cnt();
> +	ksft_test_result_skip("%s (%s)\n", current_test, message);
>   }
>   
>   /*
> @@ -1701,6 +1686,26 @@ static void usage(const char *prog)
>   	exit(KSFT_FAIL);
>   }
>   
> +static int uffd_count_tests(int n_tests, int n_mems, const char *test_filter)
> +{
> +	uffd_test_case_t *test;
> +	int i, j, count = 0;
> +
> +	if (!test_filter)
> +		count += 2;	/* test_uffd_api(false) + test_uffd_api(true) */
> +
> +	for (i = 0; i < n_tests; i++) {
> +		test = &uffd_tests[i];
> +		if (test_filter && !strstr(test->name, test_filter))
> +			continue;
> +		for (j = 0; j < n_mems; j++)
> +			if (test->mem_targets & mem_types[j].mem_flag)
> +				count++;
> +	}
> +
> +	return count;
> +}
> +
>   int main(int argc, char *argv[])
>   {
>   	int n_tests = sizeof(uffd_tests) / sizeof(uffd_test_case_t);
> @@ -1730,24 +1735,31 @@ int main(int argc, char *argv[])
>   		}
>   	}
>   
> -	if (!test_filter && !list_only) {
> +	if (list_only) {
> +		for (i = 0; i < n_tests; i++) {
> +			test = &uffd_tests[i];
> +			if (test_filter && !strstr(test->name, test_filter))
> +				continue;
> +			printf("%s\n", test->name);
> +		}
> +		return KSFT_PASS;
> +	}
> +
> +	ksft_print_header();
> +	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
> +
> +	if (!test_filter) {
>   		has_uffd = test_uffd_api(false);
>   		has_uffd |= test_uffd_api(true);
>   
> -		if (!has_uffd) {
> -			printf("Userfaultfd not supported or unprivileged, skip all tests\n");
> -			exit(KSFT_SKIP);
> -		}
> +		if (!has_uffd)
> +			ksft_exit_skip("Userfaultfd not supported or unprivileged\n");
>   	}
>   
>   	for (i = 0; i < n_tests; i++) {
>   		test = &uffd_tests[i];
>   		if (test_filter && !strstr(test->name, test_filter))
>   			continue;
> -		if (list_only) {
> -			printf("%s\n", test->name);
> -			continue;
> -		}
>   		for (j = 0; j < n_mems; j++) {
>   			mem_type = &mem_types[j];
>   
> @@ -1794,10 +1806,7 @@ int main(int argc, char *argv[])
>   		}
>   	}
>   
> -	if (!list_only)
> -		uffd_test_report();
> -
> -	return ksft_get_fail_cnt() ? KSFT_FAIL : KSFT_PASS;
> +	ksft_finished();
>   }
>   
>   #else /* __NR_userfaultfd */
> @@ -1806,8 +1815,8 @@ int main(int argc, char *argv[])
>   
>   int main(void)
>   {
> -	printf("Skipping %s (missing __NR_userfaultfd)\n", __file__);
> -	return KSFT_SKIP;
> +	ksft_print_header();
> +	ksft_exit_skip("missing __NR_userfaultfd definition\n");
>   }
>   
>   #endif /* __NR_userfaultfd */


LGTM

Reviewed by: Donet Tom <donettom@linux.ibm.com>

-Donet

