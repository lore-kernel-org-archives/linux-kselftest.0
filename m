Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777903D88E8;
	Tue, 14 Apr 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162985; cv=none; b=A7/1o9+SmV+r7YVjGUn4Ydau5x1x058p315NYMC7kcnaQ4I6sKYPjBpIQY3tabyUij5Og+aYh0+HZga2mgNJwRVMwj9BEbV/4o1v2y7QVCHkmsELtd7ciptz41/ikLaCBua/+8Or5SLTBYGF5dZ0agn8oi0T7sdycIpInk2OPGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162985; c=relaxed/simple;
	bh=zc8gTghEZByKaOUYRU40AKOMObKMrDJLV+i44VkCp7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kT4XPcIcWBKDoM02Zx78XTgYRvOJHmDG44pmWD1OSEjwVIv93NbswuYnBpxQXwP+7QhJr17LKcwztcOM9D8Jv92NaHL0lSGpNkqBtdxUmYW+CAFb+XivJBlQCEGm/+WTKKlOljw12D9s16tquuOYJCB4l5mkjyMWeZeTg7qHZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=H5E2rrfS; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="H5E2rrfS"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLIRq21832977;
	Tue, 14 Apr 2026 10:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cRw0Mj
	+uIAd+TbzCKr78WtBvzN09PLex0QRertW9J0M=; b=H5E2rrfSzdSsXy6CDqTqwu
	ZB2PCCLtRAumZohLhTZonPShT4NaFMC0/jxPscFoxhkKAO3VBgRFowZ8+F5eTUzd
	aJzvHluwwS93h+5UDhryqD50y9W2YpjHZJG2INnlWZzmmI+al1IE7eielqZH+suP
	eSrX/ZqIioZ5DVWDX9wzf5EqObivIlghlpV0Y9COBuFHnUCDjLfD0vvjvxgImRig
	KCZx/sh3wBbwhWS/njxYZFjclb+Gw9OZ8S4r2nL5orTbBA5BwVyE60vZlpk8GLO6
	glSOlSkkVj7TYawFOg+eWkYxWMlqpKT2Lekxvbvk49+lVWKRAvrtVo50ugvZSspw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89ra7x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 10:35:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63EAVawT025831;
	Tue, 14 Apr 2026 10:35:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg3b1gsqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 10:35:55 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63EAZsA832244390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 10:35:54 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8C3658059;
	Tue, 14 Apr 2026 10:35:54 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5572058043;
	Tue, 14 Apr 2026 10:35:45 +0000 (GMT)
Received: from [9.39.26.89] (unknown [9.39.26.89])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 10:35:44 +0000 (GMT)
Message-ID: <fab52975-b377-4171-9150-eeaf9677e753@linux.ibm.com>
Date: Tue, 14 Apr 2026 16:05:43 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/53] selftests/mm: protection_keys: use kselftest
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
 <20260406141735.2179309-17-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-17-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfX8/pF1nJ6I/vK
 gxJBg8I5nHuwqpzF9N2U4HvlOzOmY1BrgvC2QR6WT1Nzn1idtVPNna/J1tSntHMmA3Wv9xhixZt
 vOOlgiZNGAWbem4/qj+uTvwM+cNqbu7dOgj6cbfLIo86z8I8X6TpedTMIGiKmkH7D4PwJp/lDJ+
 feM1qUP8D9tWJibK6XmctOK4rggEeY1JIxulX7gos81hrX1b5+V/9XRn6M8RQrZr2R7evLUZyCj
 VlSj7WAKXo3ikyuU2v4IOkHthbR/fKiUYAbgf32YvO+MfGmiECYv59ffS+Pz4B1vCpvotC5ol9h
 2KHn7GqV5QHovYL41wj1TWf/ulaKH1mhqDeQh8OyUzTbUYEup5BH3cT1KF6PF0xQNQteuG8u4nB
 nwgm4Ct9svgaL5EQQwJ/rfxmT9bvMZa8o2fnWWP05jrhJaGnzmn5L7bt2saIU/1RwTc3ZbIrqL3
 6aEHQGMCQY4VgRp6AuQ==
X-Proofpoint-ORIG-GUID: JdJTr1HsuRWmXo_HZln53nTQ8Jcyfdb1
X-Proofpoint-GUID: xojNtymjtNjO51RGGwKKZ2aAnCCZecFX
X-Authority-Analysis: v=2.4 cv=fYidDUQF c=1 sm=1 tr=0 ts=69de188d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=4NaIcouCGBq_Vv9_7IwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140096

Hi Mike

On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert protection_keys test to use kselftest framework for reporting
> and tracking successful and failing runs.
>
> Adjust dprintf0() printouts to use "#" in the beginning of the line for
> TAP compatibility and add fflush(stdout) in the end of the test to
> ensure all the ksft_print_*() messages are really output.


I noticed that this test uses perror() Would it be appropriate to 
convert it to ksft_perror() for consistency?

-Donet


>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/pkey-helpers.h    |  6 +++--
>   tools/testing/selftests/mm/protection_keys.c | 27 ++++++++++++--------
>   2 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
> index 7c29f075e40b..ae010b075417 100644
> --- a/tools/testing/selftests/mm/pkey-helpers.h
> +++ b/tools/testing/selftests/mm/pkey-helpers.h
> @@ -71,10 +71,12 @@ static inline void sigsafe_printf(const char *format, ...)
>   extern void abort_hooks(void);
>   #define pkey_assert(condition) do {		\
>   	if (!(condition)) {			\
> -		dprintf0("assert() at %s::%d test_nr: %d iteration: %d\n", \
> +		dprintf0("# assert() at %s::%d test_nr: %d iteration: %d\n", \
>   				__FILE__, __LINE__,	\
>   				test_nr, iteration_nr);	\
> -		dprintf0("errno at assert: %d", errno);	\
> +		dprintf0("# errno at assert: %d\n", errno);	\
> +		ksft_test_result_fail("test %d (iteration %d)\n",	\
> +				      test_nr, iteration_nr);		\
>   		abort_hooks();			\
>   		exit(__LINE__);			\
>   	}					\
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index 80c6124e8378..c069250969f5 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -136,6 +136,7 @@ static void tracing_off(void)
>   
>   void abort_hooks(void)
>   {
> +	fflush(stdout);
>   	fprintf(stderr, "running %s()...\n", __func__);
>   	tracing_off();
>   #ifdef SLEEP_ON_ABORT
> @@ -370,8 +371,8 @@ static void signal_handler(int signum, siginfo_t *si, void *vucontext)
>   	if ((si->si_code == SEGV_MAPERR) ||
>   	    (si->si_code == SEGV_ACCERR) ||
>   	    (si->si_code == SEGV_BNDERR)) {
> -		printf("non-PK si_code, exiting...\n");
> -		exit(4);
> +		dprintf0("# non-PK si_code: %d, exiting...\n", si->si_code);
> +		exit(1);
>   	}
>   
>   	si_pkey_ptr = siginfo_get_pkey_ptr(si);
> @@ -719,7 +720,7 @@ static void setup_hugetlbfs(void)
>   	long hpagesz_mb;
>   
>   	if (geteuid() != 0) {
> -		fprintf(stderr, "WARNING: not run as root, can not do hugetlb test\n");
> +		ksft_print_msg("WARNING: not run as root, can not do hugetlb test\n");
>   		return;
>   	}
>   
> @@ -855,7 +856,7 @@ void expected_pkey_fault(int pkey)
>   
>   #define do_not_expect_pkey_fault(msg)	do {			\
>   	if (last_pkey_faults != pkey_faults)			\
> -		dprintf0("unexpected PKey fault: %s\n", msg);	\
> +		dprintf0("# unexpected PKey fault: %s\n", msg);	\
>   	pkey_assert(last_pkey_faults == pkey_faults);		\
>   } while (0)
>   
> @@ -1753,7 +1754,7 @@ static void run_tests_once(void)
>   		tracing_off();
>   		close_test_fds();
>   
> -		printf("test %s PASSED (iteration %d)\n", pkey_tests[test_nr].name, iteration_nr);
> +		ksft_test_result_pass("test %s (iteration %d)\n", pkey_tests[test_nr].name, iteration_nr);
>   		dprintf1("======================\n\n");
>   	}
>   	iteration_nr++;
> @@ -1773,27 +1774,31 @@ int main(void)
>   
>   	setup_handlers();
>   
> -	printf("has pkeys: %d\n", pkeys_supported);
> +	ksft_print_header();
>   
>   	if (!pkeys_supported) {
>   		int size = PAGE_SIZE;
>   		int *ptr;
>   
> -		printf("running PKEY tests for unsupported CPU/OS\n");
> +		ksft_set_plan(1);
> +		ksft_print_msg("running PKEY tests for unsupported CPU/OS\n");
>   
>   		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
>   		assert(ptr != (void *)-1);
>   		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
> -		exit(0);
> +		ksft_test_result_pass("pkey on unsupported CPU/OS\n");
> +		ksft_finished();
>   	}
>   
> +	ksft_set_plan(ARRAY_SIZE(pkey_tests) * nr_iterations);
> +
>   	pkey_setup_shadow();
> -	printf("startup pkey_reg: %016llx\n", read_pkey_reg());
> +	ksft_print_msg("startup pkey_reg: %016llx\n", read_pkey_reg());
>   	setup_hugetlbfs();
>   
>   	while (nr_iterations-- > 0)
>   		run_tests_once();
>   
> -	printf("done (all tests OK)\n");
> -	return 0;
> +	ksft_finished();
> +	fflush(stdout);
>   }
