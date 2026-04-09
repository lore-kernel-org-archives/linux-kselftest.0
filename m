Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62BE3A4F29;
	Thu,  9 Apr 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753804; cv=none; b=TS07NoPZxk1edPN3b2F4ug984i7ohgg/cwjdmRBJYyH4EfzdSyCGZXpkmnEYT6/ihRDyjnpBzCQCYdKZcCa3Qd++rHSTypjQ3oYnmXQGxBpcD28knxxR8evCeDzWQ4W9koEGw9d374c+Gx8VBiKn/H+LTWf/FJ6CRXjEAymDzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753804; c=relaxed/simple;
	bh=dg6xy9YUjPO5zIcCTBkM9rtORNUsfk/mvBbZKa/4h6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7kmk4+0xoclKZkQQkrBg7J1dmpXSa0pF8uxuFYGY11X8+TzST6G095F6b7TU8LzJxJwc/vLcADWsi3GBc1suvuP4oeEFvipsS3nq4433RTsf7c4ot4EOMiAxJzKT7Pa4pq5j4GiWdcfM9vWkJEvWjjWUj4nYaW2x6UysGsoPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X+Rhl1rh; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X+Rhl1rh"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639AQUN22591197;
	Thu, 9 Apr 2026 16:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OvEphW
	IYTmaOsYyig1o+y2ujYF+NlxWZBxa7RIBpdl8=; b=X+Rhl1rhew7vjbQi7Z3+4l
	zp+a07MMUvkzo7YSTcKaXg/mPMac9hhC/f+Mu5W2oKUrjaw2CxJC56wlBgVF2iLn
	4bX5D4n274K0rvujuv6VBeJCVtgpsvsyOU6+jHyvM8p9HCC1dHb/DBZXh09owYi3
	HfSHDncYO1muOz/bH/rxE5BDox+RknMp1CwV9PJk24M5d1ULsfEsBRuw3YfJW9YI
	5/7sPXLF6ZuFNf+drAuyxvgU+/Uv3OBykAneDPGvHYrU6FLZVTIlSTtRa8yuP1b9
	thxIc7HJHqH/xZxnZHISs/29AGfEHP6mWVcSldzi3zIHB9xKyQ0jIa3OR3Mi2MPg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2ee4fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 16:56:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 639CmkE6019008;
	Thu, 9 Apr 2026 16:56:11 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcme9mfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 16:56:11 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 639GuBK930343700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2026 16:56:11 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0395C58045;
	Thu,  9 Apr 2026 16:56:11 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F7355805E;
	Thu,  9 Apr 2026 16:56:01 +0000 (GMT)
Received: from [9.124.214.147] (unknown [9.124.214.147])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Apr 2026 16:56:01 +0000 (GMT)
Message-ID: <22e3db13-1e6f-43ec-9682-6eda7fb7ed97@linux.ibm.com>
Date: Thu, 9 Apr 2026 22:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/53] selftests/mm: hugetlb-madvise: use kselftest
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
 <20260406141735.2179309-10-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-10-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: nXHmBfUFBa74AbhTU3U9NXvQFKC9UN5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1NCBTYWx0ZWRfX9Mgs1UO44P1l
 kLxrr7b5KWP/kHm3rsN75OEtbeK2jerdQlf67QqWwhEDj7D2zrsUmdVT28GTVUMMmF76sjhWF33
 3AjtreOUJrSdZ6ZNIFHZXNpONA3sPP269dov/fc4Ogs3stpJ5PuWGb7IWPV3hE19Bx+p2R1kNUz
 D7+DzNzUEBgpuKKc0a3ga3EF+xw/ZAOUIktHapWqBreaVCD3gbE5tDGwpBcqQmfty/VtjZDxGgN
 TwpoZHoDOxUIYhoPAJeHkelaw7wYMlLZ9NPcv5WaYcwLYYJqG6860h8bECPVrX/UGmkUrUUAs1m
 I0mHBh2F5LakJcf21PQWP4M7OuCo+6TC30QBhyj2hHlvHSAnS3bPGGKnsPi9Ck8ADk2Q9qZD+7d
 hEGZpJtBGc795o+uMMoVBTxf+x2L5KcHTotVBNBHaIFItOA26BMIHQsl6/NjyXrG/89wZD48zRI
 gSx33N0/+rqf8E2ID5Q==
X-Authority-Analysis: v=2.4 cv=Cfw4Irrl c=1 sm=1 tr=0 ts=69d7da2d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=DTDaNkLqmGNR2mV1pvMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TNOrP0JNv1SJ8pTC8LEKA6-H--cbC-cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090154


On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert hugetlb-madvise test to use kselftest framework for reporting
> and tracking successful and failing runs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/hugetlb-madvise.c | 204 ++++++++-----------
>   1 file changed, 82 insertions(+), 122 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
> index 898cc90b314f..4c6c346a3af5 100644
> --- a/tools/testing/selftests/mm/hugetlb-madvise.c
> +++ b/tools/testing/selftests/mm/hugetlb-madvise.c
> @@ -26,12 +26,11 @@
>   
>   #define validate_free_pages(exp_free)					\
>   	do {								\
> -		int fhp = get_free_hugepages();				\
> -		if (fhp != (exp_free)) {				\
> -			printf("Unexpected number of free huge "	\
> -				"pages line %d\n", __LINE__);		\
> -			exit(1);					\
> -		}							\
> +		unsigned long fhp = get_free_hugepages();		\
> +		if (fhp != (exp_free))					\
> +			ksft_exit_fail_msg("Unexpected number of free "	\
> +				"huge pages %ld, expected %ld line %d\n", \
> +				fhp, (exp_free), __LINE__);		\
>   	} while (0)
>   
>   unsigned long huge_page_size;
> @@ -57,28 +56,24 @@ int main(int argc, char **argv)
>   	int fd;
>   	int ret;
>   
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
>   	huge_page_size = default_huge_page_size();
> -	if (!huge_page_size) {
> -		printf("Unable to determine huge page size, exiting!\n");
> -		exit(1);
> -	}
> +	if (!huge_page_size)
> +		ksft_exit_skip("Unable to determine huge page size\n");
> +
>   	base_page_size = sysconf(_SC_PAGE_SIZE);
> -	if (!huge_page_size) {
> -		printf("Unable to determine base page size, exiting!\n");
> -		exit(1);
> -	}
> +	if (!base_page_size)
> +		ksft_exit_fail_msg("Unable to determine base page size\n");
>   
>   	free_hugepages = get_free_hugepages();
> -	if (free_hugepages < MIN_FREE_PAGES) {
> -		printf("Not enough free huge pages to test, exiting!\n");
> -		exit(KSFT_SKIP);
> -	}
> +	if (free_hugepages < MIN_FREE_PAGES)
> +		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", free_hugepages, MIN_FREE_PAGES);
>   
>   	fd = memfd_create(argv[0], MFD_HUGETLB);
> -	if (fd < 0) {
> -		perror("memfd_create() failed");
> -		exit(1);
> -	}
> +	if (fd < 0)
> +		ksft_exit_fail_perror("memfd_create");
>   
>   	/*
>   	 * Test validity of MADV_DONTNEED addr and length arguments.  mmap
> @@ -90,16 +85,13 @@ int main(int argc, char **argv)
>   			PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
>   			-1, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
> +
>   	if (munmap(addr, huge_page_size) ||
>   			munmap(addr + (NR_HUGE_PAGES + 1) * huge_page_size,
> -				huge_page_size)) {
> -		perror("munmap");
> -		exit(1);
> -	}
> +				huge_page_size))
> +		ksft_exit_fail_perror("munmap");
>   	addr = addr + huge_page_size;
>   
>   	write_fault_pages(addr, NR_HUGE_PAGES);
> @@ -108,20 +100,14 @@ int main(int argc, char **argv)
>   	/* addr before mapping should fail */
>   	ret = madvise(addr - base_page_size, NR_HUGE_PAGES * huge_page_size,
>   		MADV_DONTNEED);
> -	if (!ret) {
> -		printf("Unexpected success of madvise call with invalid addr line %d\n",
> -				__LINE__);
> -			exit(1);
> -	}
> +	if (!ret)
> +		ksft_exit_fail_msg("madvise with invalid addr unexpectedly succeeded line %d\n", __LINE__);
>   
>   	/* addr + length after mapping should fail */
>   	ret = madvise(addr, (NR_HUGE_PAGES * huge_page_size) + base_page_size,
>   		MADV_DONTNEED);
> -	if (!ret) {
> -		printf("Unexpected success of madvise call with invalid length line %d\n",
> -				__LINE__);
> -			exit(1);
> -	}
> +	if (!ret)
> +		ksft_exit_fail_msg("madvise with invalid length unexpectedly succeeded line %d\n", __LINE__);
>   
>   	(void)munmap(addr, NR_HUGE_PAGES * huge_page_size);
>   
> @@ -132,10 +118,9 @@ int main(int argc, char **argv)
>   			PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
>   			-1, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
> +
>   	write_fault_pages(addr, NR_HUGE_PAGES);
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
> @@ -143,19 +128,14 @@ int main(int argc, char **argv)
>   	ret = madvise(addr + base_page_size,
>   			NR_HUGE_PAGES * huge_page_size - base_page_size,
>   			MADV_DONTNEED);
> -	if (!ret) {
> -		printf("Unexpected success of madvise call with unaligned start address %d\n",
> -				__LINE__);
> -			exit(1);
> -	}
> +	if (!ret)
> +		ksft_exit_fail_msg("madvise with unaligned start unexpectedly succeeded line %d\n", __LINE__);
>   
>   	/* addr + length should be aligned down to huge page size */
>   	if (madvise(addr,
>   			((NR_HUGE_PAGES - 1) * huge_page_size) + base_page_size,
> -			MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +			MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
>   
>   	/* should free all but last page in mapping */
>   	validate_free_pages(free_hugepages - 1);
> @@ -170,17 +150,14 @@ int main(int argc, char **argv)
>   			PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
>   			-1, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
> +
>   	write_fault_pages(addr, NR_HUGE_PAGES);
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
>   
>   	/* should free all pages in mapping */
>   	validate_free_pages(free_hugepages);
> @@ -190,29 +167,25 @@ int main(int argc, char **argv)
>   	/*
>   	 * Test MADV_DONTNEED on private mapping of hugetlb file
>   	 */
> -	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size)) {
> -		perror("fallocate");
> -		exit(1);
> -	}
> +	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size))
> +		ksft_exit_fail_perror("fallocate");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	addr = mmap(NULL, NR_HUGE_PAGES * huge_page_size,
>   			PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE, fd, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
>   
>   	/* read should not consume any pages */
>   	read_fault_pages(addr, NR_HUGE_PAGES);
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/* madvise should not free any pages */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/* writes should allocate private pages */
> @@ -220,10 +193,9 @@ int main(int argc, char **argv)
>   	validate_free_pages(free_hugepages - (2 * NR_HUGE_PAGES));
>   
>   	/* madvise should free private pages */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/* writes should allocate private pages */
> @@ -238,10 +210,9 @@ int main(int argc, char **argv)
>   	 * implementation.
>   	 */
>   	if (fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
> -					0, NR_HUGE_PAGES * huge_page_size)) {
> -		perror("fallocate");
> -		exit(1);
> -	}
> +					0, NR_HUGE_PAGES * huge_page_size))
> +		ksft_exit_fail_perror("fallocate");
> +
>   	validate_free_pages(free_hugepages);
>   
>   	(void)munmap(addr, NR_HUGE_PAGES * huge_page_size);
> @@ -249,29 +220,25 @@ int main(int argc, char **argv)
>   	/*
>   	 * Test MADV_DONTNEED on shared mapping of hugetlb file
>   	 */
> -	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size)) {
> -		perror("fallocate");
> -		exit(1);
> -	}
> +	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size))
> +		ksft_exit_fail_perror("fallocate");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	addr = mmap(NULL, NR_HUGE_PAGES * huge_page_size,
>   			PROT_READ | PROT_WRITE,
>   			MAP_SHARED, fd, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
>   
>   	/* write should not consume any pages */
>   	write_fault_pages(addr, NR_HUGE_PAGES);
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/* madvise should not free any pages */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/*
> @@ -279,29 +246,25 @@ int main(int argc, char **argv)
>   	 *
>   	 * madvise is same as hole punch and should free all pages.
>   	 */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_REMOVE)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_REMOVE))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages);
>   	(void)munmap(addr, NR_HUGE_PAGES * huge_page_size);
>   
>   	/*
>   	 * Test MADV_REMOVE on shared and private mapping of hugetlb file
>   	 */
> -	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size)) {
> -		perror("fallocate");
> -		exit(1);
> -	}
> +	if (fallocate(fd, 0, 0, NR_HUGE_PAGES * huge_page_size))
> +		ksft_exit_fail_perror("fallocate");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	addr = mmap(NULL, NR_HUGE_PAGES * huge_page_size,
>   			PROT_READ | PROT_WRITE,
>   			MAP_SHARED, fd, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
>   
>   	/* shared write should not consume any additional pages */
>   	write_fault_pages(addr, NR_HUGE_PAGES);
> @@ -310,10 +273,8 @@ int main(int argc, char **argv)
>   	addr2 = mmap(NULL, NR_HUGE_PAGES * huge_page_size,
>   			PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE, fd, 0);
> -	if (addr2 == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr2 == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
>   
>   	/* private read should not consume any pages */
>   	read_fault_pages(addr2, NR_HUGE_PAGES);
> @@ -324,17 +285,15 @@ int main(int argc, char **argv)
>   	validate_free_pages(free_hugepages - (2 * NR_HUGE_PAGES));
>   
>   	/* madvise of shared mapping should not free any pages */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages - (2 * NR_HUGE_PAGES));
>   
>   	/* madvise of private mapping should free private pages */
> -	if (madvise(addr2, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr2, NR_HUGE_PAGES * huge_page_size, MADV_DONTNEED))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages - NR_HUGE_PAGES);
>   
>   	/* private write should consume additional pages again */
> @@ -346,15 +305,16 @@ int main(int argc, char **argv)
>   	 * not correct.  private pages should not be freed, but this is
>   	 * expected.  See comment associated with FALLOC_FL_PUNCH_HOLE call.
>   	 */
> -	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_REMOVE)) {
> -		perror("madvise");
> -		exit(1);
> -	}
> +	if (madvise(addr, NR_HUGE_PAGES * huge_page_size, MADV_REMOVE))
> +		ksft_exit_fail_perror("madvise");
> +
>   	validate_free_pages(free_hugepages);
>   
>   	(void)munmap(addr, NR_HUGE_PAGES * huge_page_size);
>   	(void)munmap(addr2, NR_HUGE_PAGES * huge_page_size);
>   
>   	close(fd);
> -	return 0;
> +
> +	ksft_test_result_pass("MADV_DONTNEED and MADV_REMOVE on hugetlb\n");
> +	ksft_finished();
>   }
LGTM


Reviewed by: Donet Tom <donettom@linux.ibm.com>

-Donet
