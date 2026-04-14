Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E413BA23F;
	Tue, 14 Apr 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159744; cv=none; b=ImkMzjNr9nLIyQZd6YdRcR9To2pEjbYAsKOizxKxoUZStykYstxFaKPHnV6pp/kvuax6ZE0kOg0rPeKElXem4rG+ee9LYL38YSBuLyZUd4Le1d6gxaZcPtLysogTUHWJBvO/Sq5dFczq9Ag8MNbtLT7r9WnL/h9M4ILo6pa7PWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159744; c=relaxed/simple;
	bh=6dDw6K3Q5eC7ONVp4Q/poqUyxDUerjQtlXKel8nEmtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMSyFlWAhgtzBHwpYwb0U0geS2hAg1nVwXRwYW3vdey/lh22uWJY61Rkwt4q7npc7OTNaP47OqojlTUqIdf/glcwzdi6aOhdMOhxxz6XiHad5IKIbVfft7e5JlW+fg5HqPO/b3j254rXJlxYPxmo4BUQebdulcqGdffIJZ02OvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=n3dndgFE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="n3dndgFE"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLId4M1859973;
	Tue, 14 Apr 2026 09:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SALnxP
	oQCtNPYfOxlXSbaXhrBFEPGOz4914yQU/ZkSo=; b=n3dndgFEXmTJDIlzkF1t8s
	EcUkvOiCpw5tsWWPn0gHIhkLQjdYZIkZaf4x3gJ94pEnSuoiamnh3nB9MQinrAqu
	b9u8WA5yCWZug/9vOiHknFMkbFL8co3kgC8f1DGkqRKsK6v1SwHrtHMWe5iFL+U3
	AIueIDJFWZFHNpqNGmU7nIqjPtGSpKsp6D6WIKTl4+j5i2CzyvmREyMLp1PdfS4S
	EFiWcHHrmicj4hMsZwUoTeugLdnwHJbJ3sIftxw7nIKzcaf+tSH3Hb9Aj3ZElQcj
	YqKYFgsMmGITeUu9joWN7klR6dhiyy/EzR93ZcpBkHw9DeJWZT+OPSSJQeybYsZQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89p9y73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 09:41:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63E5ClaF004569;
	Tue, 14 Apr 2026 09:41:58 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg24k8src-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 09:41:58 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63E9fvle22676178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 09:41:57 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 076DE5805A;
	Tue, 14 Apr 2026 09:41:57 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D32C758054;
	Tue, 14 Apr 2026 09:41:46 +0000 (GMT)
Received: from [9.124.215.107] (unknown [9.124.215.107])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 09:41:46 +0000 (GMT)
Message-ID: <b49e883b-d666-49cb-bf4d-c83a8d92a0fe@linux.ibm.com>
Date: Tue, 14 Apr 2026 15:11:44 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/53] selftests/mm: ksm_tests: use kselftest framework
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
 <20260406141735.2179309-15-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-15-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: X9XihhT4IuTH-0pLaxOg5j_-fNXdlz57
X-Proofpoint-ORIG-GUID: wjULQ_T17_HUb4l4HkVstnGO1rHsZjLr
X-Authority-Analysis: v=2.4 cv=WbE8rUhX c=1 sm=1 tr=0 ts=69de0be7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=yJIlVMkcM65TG1zAOtEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NiBTYWx0ZWRfX/Xb5ZMrQ6e10
 jrqTG0CTv5T4SpEUil1Yau3okmxLpczTzYVP4vBGDg79bN1FrJrspCAnz4wUZLlLGnBAHFJPrG+
 VameES2+BRxjLK7+sc14zSdMKjxCHgL8kJWQgP5pEeKKIKNvsbc+Qiv5N34laRgUPFXULSuHlEv
 WKyGy0W8OyL7cemFZWzVrj8PcNBEOw7QCHPnuPvMu48V64gwGF5t6j1YEVEr3eVVwHHBAP3T7hD
 hwwPRF2ljZ7HOUDOjoV8MOIBWrguU3b2d1pURgzqYzxvQdAO+ESe3Qbv5Qv2Wr7gVetiHzkQSK+
 tI3sAmMXL91p3PA9eWPHGv/qFAagIqDx+ZBTstiyHT1AndMOx741Vb1wRgQD10SFsZb5PRx4xo4
 8RzTNeM+i8prAQBHFAIiupAFUIYHWvIqZNpsZj53e+KNrFyHFRcsMBBERYW2wHRHVtbTEIH1Mim
 HBychav4esbwoeG3agQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140086

Hi Mike

On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert ksm_tests to use kselftest framework for reporting and tracking
> successful and failing runs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/ksm_tests.c | 180 +++++++++++--------------
>   1 file changed, 81 insertions(+), 99 deletions(-)
>
>

I think we missed one change

diff --git a/tools/testing/selftests/mm/ksm_tests.c 
b/tools/testing/selftests/mm/ksm_tests.c
index 752a2c0d06ab..5219ee54577d 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -104,7 +104,7 @@ static void ksm_print_procfs(void)

         if (!f) {
                 fprintf(stderr, "f %s\n", file_name);
-               perror("fopen");
+               ksft_perror("fopen");
                 return;
         }

Otherwise it looks good to me

Reviewed by: Donet Tom <donettom@linux.ibm.com>

-Donet


> diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
> index a0b48b839d54..752a2c0d06ab 100644
> --- a/tools/testing/selftests/mm/ksm_tests.c
> +++ b/tools/testing/selftests/mm/ksm_tests.c
> @@ -175,12 +175,12 @@ static void  *allocate_memory(void *ptr, int prot, int mapping, char data, size_
>   	void *map_ptr = mmap(ptr, map_size, PROT_WRITE, mapping, -1, 0);
>   
>   	if (!map_ptr) {
> -		perror("mmap");
> +		ksft_perror("mmap");
>   		return NULL;
>   	}
>   	memset(map_ptr, data, map_size);
>   	if (mprotect(map_ptr, map_size, prot)) {
> -		perror("mprotect");
> +		ksft_perror("mprotect");
>   		munmap(map_ptr, map_size);
>   		return NULL;
>   	}
> @@ -201,11 +201,11 @@ static int ksm_do_scan(int scan_count, struct timespec start_time, int timeout)
>   		if (ksm_read_sysfs(KSM_FP("full_scans"), &cur_scan))
>   			return 1;
>   		if (clock_gettime(CLOCK_MONOTONIC_RAW, &cur_time)) {
> -			perror("clock_gettime");
> +			ksft_perror("clock_gettime");
>   			return 1;
>   		}
>   		if ((cur_time.tv_sec - start_time.tv_sec) > timeout) {
> -			printf("Scan time limit exceeded\n");
> +			ksft_print_msg("Scan time limit exceeded\n");
>   			return 1;
>   		}
>   	}
> @@ -218,12 +218,12 @@ static int ksm_merge_pages(int merge_type, void *addr, size_t size,
>   {
>   	if (merge_type == KSM_MERGE_MADVISE) {
>   		if (madvise(addr, size, MADV_MERGEABLE)) {
> -			perror("madvise");
> +			ksft_perror("madvise");
>   			return 1;
>   		}
>   	} else if (merge_type == KSM_MERGE_PRCTL) {
>   		if (prctl(PR_SET_MEMORY_MERGE, 1, 0, 0, 0)) {
> -			perror("prctl");
> +			ksft_perror("prctl");
>   			return 1;
>   		}
>   	}
> @@ -242,7 +242,7 @@ static int ksm_unmerge_pages(void *addr, size_t size,
>   			     struct timespec start_time, int timeout)
>   {
>   	if (madvise(addr, size, MADV_UNMERGEABLE)) {
> -		perror("madvise");
> +		ksft_perror("madvise");
>   		return 1;
>   	}
>   	return 0;
> @@ -324,7 +324,7 @@ static int check_ksm_merge(int merge_type, int mapping, int prot,
>   	struct timespec start_time;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   
> @@ -338,7 +338,6 @@ static int check_ksm_merge(int merge_type, int mapping, int prot,
>   
>   	/* verify that the right number of pages are merged */
>   	if (assert_ksm_pages_count(page_count)) {
> -		printf("OK\n");
>   		munmap(map_ptr, page_size * page_count);
>   		if (merge_type == KSM_MERGE_PRCTL)
>   			prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
> @@ -346,7 +345,6 @@ static int check_ksm_merge(int merge_type, int mapping, int prot,
>   	}
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_FAIL;
>   }
> @@ -358,7 +356,7 @@ static int check_ksm_unmerge(int merge_type, int mapping, int prot, int timeout,
>   	int page_count = 2;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   
> @@ -380,13 +378,11 @@ static int check_ksm_unmerge(int merge_type, int mapping, int prot, int timeout,
>   
>   	/* check that unmerging was successful and 0 pages are currently merged */
>   	if (assert_ksm_pages_count(0)) {
> -		printf("OK\n");
>   		munmap(map_ptr, page_size * page_count);
>   		return KSFT_PASS;
>   	}
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_FAIL;
>   }
> @@ -398,7 +394,7 @@ static int check_ksm_zero_page_merge(int merge_type, int mapping, int prot, long
>   	struct timespec start_time;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   
> @@ -425,12 +421,10 @@ static int check_ksm_zero_page_merge(int merge_type, int mapping, int prot, long
>   	else if (!use_zero_pages && !assert_ksm_pages_count(page_count))
>   		goto err_out;
>   
> -	printf("OK\n");
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_PASS;
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_FAIL;
>   }
> @@ -465,16 +459,16 @@ static int check_ksm_numa_merge(int merge_type, int mapping, int prot, int timeo
>   	int first_node;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   
>   	if (numa_available() < 0) {
> -		perror("NUMA support not enabled");
> +		ksft_perror("NUMA support not enabled");
>   		return KSFT_SKIP;
>   	}
>   	if (numa_num_configured_nodes() <= 1) {
> -		printf("At least 2 NUMA nodes must be available\n");
> +		ksft_print_msg("At least 2 NUMA nodes must be available\n");
>   		return KSFT_SKIP;
>   	}
>   	if (ksm_write_sysfs(KSM_FP("merge_across_nodes"), merge_across_nodes))
> @@ -485,7 +479,7 @@ static int check_ksm_numa_merge(int merge_type, int mapping, int prot, int timeo
>   	numa1_map_ptr = numa_alloc_onnode(page_size, first_node);
>   	numa2_map_ptr = numa_alloc_onnode(page_size, get_next_mem_node(first_node));
>   	if (!numa1_map_ptr || !numa2_map_ptr) {
> -		perror("numa_alloc_onnode");
> +		ksft_perror("numa_alloc_onnode");
>   		return KSFT_FAIL;
>   	}
>   
> @@ -510,13 +504,11 @@ static int check_ksm_numa_merge(int merge_type, int mapping, int prot, int timeo
>   
>   	numa_free(numa1_map_ptr, page_size);
>   	numa_free(numa2_map_ptr, page_size);
> -	printf("OK\n");
>   	return KSFT_PASS;
>   
>   err_out:
>   	numa_free(numa1_map_ptr, page_size);
>   	numa_free(numa2_map_ptr, page_size);
> -	printf("Not OK\n");
>   	return KSFT_FAIL;
>   }
>   
> @@ -529,7 +521,7 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
>   	int pagemap_fd, n_normal_pages, n_huge_pages;
>   
>   	if (!thp_is_enabled()) {
> -		printf("Transparent Hugepages not available\n");
> +		ksft_print_msg("Transparent Hugepages not available\n");
>   		return KSFT_SKIP;
>   	}
>   
> @@ -559,36 +551,35 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
>   		else
>   			n_huge_pages++;
>   	}
> -	printf("Number of normal pages:    %d\n", n_normal_pages);
> -	printf("Number of huge pages:    %d\n", n_huge_pages);
> +	ksft_print_msg("Number of normal pages:    %d\n", n_normal_pages);
> +	ksft_print_msg("Number of huge pages:    %d\n", n_huge_pages);
>   
>   	memset(map_ptr, '*', len);
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   	if (ksm_merge_pages(merge_type, map_ptr, map_size, start_time, timeout))
>   		goto err_out;
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   
>   	scan_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
>   		       (end_time.tv_nsec - start_time.tv_nsec);
>   
> -	printf("Total size:    %lu MiB\n", map_size / MB);
> -	printf("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
> +	ksft_print_msg("Total size:    %lu MiB\n", map_size / MB);
> +	ksft_print_msg("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
>   	       scan_time_ns % NSEC_PER_SEC);
> -	printf("Average speed:  %.3f MiB/s\n", (map_size / MB) /
> +	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
>   					       ((double)scan_time_ns / NSEC_PER_SEC));
>   
>   	munmap(map_ptr_orig, len + HPAGE_SIZE);
>   	return KSFT_PASS;
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr_orig, len + HPAGE_SIZE);
>   	return KSFT_FAIL;
>   }
> @@ -606,30 +597,29 @@ static int ksm_merge_time(int merge_type, int mapping, int prot, int timeout, si
>   		return KSFT_FAIL;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   	if (ksm_merge_pages(merge_type, map_ptr, map_size, start_time, timeout))
>   		goto err_out;
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   
>   	scan_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
>   		       (end_time.tv_nsec - start_time.tv_nsec);
>   
> -	printf("Total size:    %lu MiB\n", map_size / MB);
> -	printf("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
> +	ksft_print_msg("Total size:    %lu MiB\n", map_size / MB);
> +	ksft_print_msg("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
>   	       scan_time_ns % NSEC_PER_SEC);
> -	printf("Average speed:  %.3f MiB/s\n", (map_size / MB) /
> +	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
>   					       ((double)scan_time_ns / NSEC_PER_SEC));
>   
>   	munmap(map_ptr, map_size);
>   	return KSFT_PASS;
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, map_size);
>   	return KSFT_FAIL;
>   }
> @@ -646,37 +636,36 @@ static int ksm_unmerge_time(int merge_type, int mapping, int prot, int timeout,
>   	if (!map_ptr)
>   		return KSFT_FAIL;
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   	if (ksm_merge_pages(merge_type, map_ptr, map_size, start_time, timeout))
>   		goto err_out;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   	if (ksm_unmerge_pages(map_ptr, map_size, start_time, timeout))
>   		goto err_out;
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   
>   	scan_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
>   		       (end_time.tv_nsec - start_time.tv_nsec);
>   
> -	printf("Total size:    %lu MiB\n", map_size / MB);
> -	printf("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
> +	ksft_print_msg("Total size:    %lu MiB\n", map_size / MB);
> +	ksft_print_msg("Total time:    %ld.%09ld s\n", scan_time_ns / NSEC_PER_SEC,
>   	       scan_time_ns % NSEC_PER_SEC);
> -	printf("Average speed:  %.3f MiB/s\n", (map_size / MB) /
> +	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
>   					       ((double)scan_time_ns / NSEC_PER_SEC));
>   
>   	munmap(map_ptr, map_size);
>   	return KSFT_PASS;
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, map_size);
>   	return KSFT_FAIL;
>   }
> @@ -695,24 +684,24 @@ static int ksm_cow_time(int merge_type, int mapping, int prot, int timeout, size
>   		return KSFT_FAIL;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   	for (size_t i = 0; i < page_count - 1; i = i + 2)
>   		memset(map_ptr + page_size * i, '-', 1);
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		return KSFT_FAIL;
>   	}
>   
>   	cow_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
>   		       (end_time.tv_nsec - start_time.tv_nsec);
>   
> -	printf("Total size:    %lu MiB\n\n", (page_size * page_count) / MB);
> -	printf("Not merged pages:\n");
> -	printf("Total time:     %ld.%09ld s\n", cow_time_ns / NSEC_PER_SEC,
> +	ksft_print_msg("Total size:    %lu MiB\n\n", (page_size * page_count) / MB);
> +	ksft_print_msg("Not merged pages:\n");
> +	ksft_print_msg("Total time:     %ld.%09ld s\n", cow_time_ns / NSEC_PER_SEC,
>   	       cow_time_ns % NSEC_PER_SEC);
> -	printf("Average speed:  %.3f MiB/s\n\n", ((page_size * (page_count / 2)) / MB) /
> +	ksft_print_msg("Average speed:  %.3f MiB/s\n\n", ((page_size * (page_count / 2)) / MB) /
>   					       ((double)cow_time_ns / NSEC_PER_SEC));
>   
>   	/* Create 2000 pairs of duplicate pages */
> @@ -724,30 +713,29 @@ static int ksm_cow_time(int merge_type, int mapping, int prot, int timeout, size
>   		goto err_out;
>   
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   	for (size_t i = 0; i < page_count - 1; i = i + 2)
>   		memset(map_ptr + page_size * i, '-', 1);
>   	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
> -		perror("clock_gettime");
> +		ksft_perror("clock_gettime");
>   		goto err_out;
>   	}
>   
>   	cow_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
>   		       (end_time.tv_nsec - start_time.tv_nsec);
>   
> -	printf("Merged pages:\n");
> -	printf("Total time:     %ld.%09ld s\n", cow_time_ns / NSEC_PER_SEC,
> +	ksft_print_msg("Merged pages:\n");
> +	ksft_print_msg("Total time:     %ld.%09ld s\n", cow_time_ns / NSEC_PER_SEC,
>   	       cow_time_ns % NSEC_PER_SEC);
> -	printf("Average speed:  %.3f MiB/s\n", ((page_size * (page_count / 2)) / MB) /
> +	ksft_print_msg("Average speed:  %.3f MiB/s\n", ((page_size * (page_count / 2)) / MB) /
>   					       ((double)cow_time_ns / NSEC_PER_SEC));
>   
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_PASS;
>   
>   err_out:
> -	printf("Not OK\n");
>   	munmap(map_ptr, page_size * page_count);
>   	return KSFT_FAIL;
>   }
> @@ -765,6 +753,10 @@ int main(int argc, char *argv[])
>   	bool use_zero_pages = KSM_USE_ZERO_PAGES_DEFAULT;
>   	bool merge_across_nodes = KSM_MERGE_ACROSS_NODES_DEFAULT;
>   	long size_MB = 0;
> +	const char *test_descr = "KSM merging";
> +
> +	ksft_print_header();
> +	ksft_set_plan(1);
>   
>   	while ((opt = getopt(argc, argv, "dha:p:l:z:m:s:t:MUZNPCHD")) != -1) {
>   		switch (opt) {
> @@ -773,17 +765,13 @@ int main(int argc, char *argv[])
>   			break;
>   		case 'p':
>   			page_count = atol(optarg);
> -			if (page_count <= 0) {
> -				printf("The number of pages must be greater than 0\n");
> -				return KSFT_FAIL;
> -			}
> +			if (page_count <= 0)
> +				ksft_exit_fail_msg("The number of pages must be greater than 0\n");
>   			break;
>   		case 'l':
>   			ksm_scan_limit_sec = atoi(optarg);
> -			if (ksm_scan_limit_sec <= 0) {
> -				printf("Timeout value must be greater than 0\n");
> -				return KSFT_FAIL;
> -			}
> +			if (ksm_scan_limit_sec <= 0)
> +				ksft_exit_fail_msg("Timeout value must be greater than 0\n");
>   			break;
>   		case 'h':
>   			print_help();
> @@ -805,19 +793,15 @@ int main(int argc, char *argv[])
>   			break;
>   		case 's':
>   			size_MB = atoi(optarg);
> -			if (size_MB <= 0) {
> -				printf("Size must be greater than 0\n");
> -				return KSFT_FAIL;
> -			}
> +			if (size_MB <= 0)
> +				ksft_exit_fail_msg("Size must be greater than 0\n");
>   			break;
>   		case 't':
>   			{
>   				int tmp = atoi(optarg);
>   
> -				if (tmp < 0 || tmp > KSM_MERGE_LAST) {
> -					printf("Invalid merge type\n");
> -					return KSFT_FAIL;
> -				}
> +				if (tmp < 0 || tmp > KSM_MERGE_LAST)
> +					ksft_exit_fail_msg("Invalid merge type\n");
>   				merge_type = tmp;
>   			}
>   			break;
> @@ -845,82 +829,80 @@ int main(int argc, char *argv[])
>   			test_name = KSM_COW_TIME;
>   			break;
>   		default:
> -			return KSFT_FAIL;
> +			ksft_exit_fail_msg("Unknown option\n");
>   		}
>   	}
>   
>   	if (prot == 0)
>   		prot = str_to_prot(KSM_PROT_STR_DEFAULT);
>   
> -	if (access(KSM_SYSFS_PATH, F_OK)) {
> -		printf("Config KSM not enabled\n");
> -		return KSFT_SKIP;
> -	}
> +	if (access(KSM_SYSFS_PATH, F_OK))
> +		ksft_exit_skip("Config KSM not enabled\n");
>   
> -	if (ksm_save_def(&ksm_sysfs_old)) {
> -		printf("Cannot save default tunables\n");
> -		return KSFT_FAIL;
> -	}
> +	if (ksm_save_def(&ksm_sysfs_old))
> +		ksft_exit_fail_msg("Cannot save default tunables\n");
>   
>   	if (ksm_write_sysfs(KSM_FP("run"), 2) ||
>   	    ksm_write_sysfs(KSM_FP("sleep_millisecs"), 0) ||
>   	    numa_available() ? 0 :
>   		ksm_write_sysfs(KSM_FP("merge_across_nodes"), 1) ||
>   	    ksm_write_sysfs(KSM_FP("pages_to_scan"), page_count))
> -		return KSFT_FAIL;
> +		ksft_exit_fail_msg("Cannot set up KSM tunables\n");
>   
>   	switch (test_name) {
>   	case CHECK_KSM_MERGE:
> +		test_descr = "KSM merging";
>   		ret = check_ksm_merge(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot, page_count,
>   				      ksm_scan_limit_sec, page_size);
>   		break;
>   	case CHECK_KSM_UNMERGE:
> +		test_descr = "KSM unmerging";
>   		ret = check_ksm_unmerge(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   					ksm_scan_limit_sec, page_size);
>   		break;
>   	case CHECK_KSM_ZERO_PAGE_MERGE:
> +		test_descr = "KSM zero page merging";
>   		ret = check_ksm_zero_page_merge(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   						page_count, ksm_scan_limit_sec, use_zero_pages,
>   						page_size);
>   		break;
>   	case CHECK_KSM_NUMA_MERGE:
> +		test_descr = "KSM NUMA merging";
>   		ret = check_ksm_numa_merge(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   					ksm_scan_limit_sec, merge_across_nodes, page_size);
>   		break;
>   	case KSM_MERGE_TIME:
> -		if (size_MB == 0) {
> -			printf("Option '-s' is required.\n");
> -			return KSFT_FAIL;
> -		}
> +		if (size_MB == 0)
> +			ksft_exit_fail_msg("Option '-s' is required\n");
> +		test_descr = "KSM merge time";
>   		ret = ksm_merge_time(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   				ksm_scan_limit_sec, size_MB);
>   		break;
>   	case KSM_MERGE_TIME_HUGE_PAGES:
> -		if (size_MB == 0) {
> -			printf("Option '-s' is required.\n");
> -			return KSFT_FAIL;
> -		}
> +		if (size_MB == 0)
> +			ksft_exit_fail_msg("Option '-s' is required\n");
> +		test_descr = "KSM merge time with huge pages";
>   		ret = ksm_merge_hugepages_time(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   				ksm_scan_limit_sec, size_MB);
>   		break;
>   	case KSM_UNMERGE_TIME:
> -		if (size_MB == 0) {
> -			printf("Option '-s' is required.\n");
> -			return KSFT_FAIL;
> -		}
> +		if (size_MB == 0)
> +			ksft_exit_fail_msg("Option '-s' is required\n");
> +		test_descr = "KSM unmerge time";
>   		ret = ksm_unmerge_time(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   				       ksm_scan_limit_sec, size_MB);
>   		break;
>   	case KSM_COW_TIME:
> +		test_descr = "KSM COW time";
>   		ret = ksm_cow_time(merge_type, MAP_PRIVATE | MAP_ANONYMOUS, prot,
>   				ksm_scan_limit_sec, page_size);
>   		break;
>   	}
>   
> -	if (ksm_restore(&ksm_sysfs_old)) {
> -		printf("Cannot restore default tunables\n");
> -		return KSFT_FAIL;
> -	}
> +	if (ksm_restore(&ksm_sysfs_old))
> +		ksft_print_msg("Cannot restore default tunables\n");
> +
> +	ksft_test_result_report(ret, "%s\n", test_descr);
>   
> -	return ret;
> +	ksft_finished();
>   }
