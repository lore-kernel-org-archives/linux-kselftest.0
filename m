Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989813BF69A;
	Thu,  9 Apr 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732516; cv=none; b=I90MbqXjfzSiD6Gw2GDfdyJ8yL7gnObTu8sXD7QjC5uGjgdSnA/ANMCMOL9/waWaL1DVNNdSDd3m9Jaj/n5rguLH2XQ3jwjx7c708jjF+L4ZKLcvs+i3o6GsEu2+Lkwii2WYqlqhib6Qua+h4LR9cKsgU4a/VW6AS5kspk0LHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732516; c=relaxed/simple;
	bh=TK7U7ckdPHtk9zjBbmdMpTakD8qz6ZeVycv5qgtPUcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhlabSKbHusTeUAGKqScV0UoZiH/zfNVjDYvr5ddeoXTNoR/deSkyjvIWxNYO5hrpeNX4WXPgNZl/QxhlAjqmpD96YygjfN75IP3R03EjWNN36OyyL1yV5bPexkYZ2++omwl8Pr/y4s8USq5/+KwJ7cUOFGpCDuBjJIrHH44RCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=H8S0gGFn; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="H8S0gGFn"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639AKV4R2210122;
	Thu, 9 Apr 2026 11:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rIMyBL
	9VKU3VOm9TAm9cZevyUsGgECvXVpjQxPXiBno=; b=H8S0gGFnV2e1ge8kS8kcQq
	Qt43vGcU1YFCsRxDLeMM/02AX6ixGc8/FARxK0NY3hoNK4dbNuedJOnAERnT3i1/
	a7w25l2GBR4j97KEE8mKocKiYLNPwv8I7YAQAvg1cZS6t5nriLBJDiRMO8Vt7ZZC
	aAPGh8kLQi3n+A3DWWSlLxPMsCbbfZfQhlkJ+4Q2DI1w0uQeisZyK0IeIuU+gjgn
	FhV/v48fBSJBhKC7Ce2Uk8DyOwN7VklBoyy8ZrR9Lgy6m5RIF9I0174OsK/uqlx6
	EX7vqacWzrBAvD15lk3Gd9PPCK3m1AF0q/r2kWFhhiJHYynA47OcSIgBeRUXCNUQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2hkq6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:01:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6397uLM4018946;
	Thu, 9 Apr 2026 11:01:23 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcme9k9uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:01:23 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 639B1NIK31261336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2026 11:01:23 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E940958078;
	Thu,  9 Apr 2026 11:01:22 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C31158068;
	Thu,  9 Apr 2026 11:01:15 +0000 (GMT)
Received: from [9.123.6.34] (unknown [9.123.6.34])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Apr 2026 11:01:15 +0000 (GMT)
Message-ID: <85b3ac61-cfb0-46f8-97eb-c83dba02a085@linux.ibm.com>
Date: Thu, 9 Apr 2026 16:31:13 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/53] selftests/mm: hugetlb-vmemmap: use kselftest
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
 <20260406141735.2179309-9-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-9-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA5NyBTYWx0ZWRfX2b9BjQ4wVTo/
 WEGRAqqmJxYjHsV9JIl56tJYQW9Jev4Q2f6oGmLzQ5jFtS+2aYQW63pKX85vdh3F4v3d25rCJXo
 zSMHx25KOUmYE2bpdSs9d//4zMXVunYmy56a5UibicGR1jSJR9S3cYr/lsxO5uhoP2CntMSnndr
 jCrLqNnTflGC/MIHfSMupHcYwzPVARBHQH0t4lTMKuLKRrD8Fs5uUvKXP5GTwiDeEPypPjTuX2H
 GGeAlqYzs2XMlhva/U++Xw3HIBJ2SSL2GbPjB+wp+1ONdYYfyyo7kfbaZLBRKrkLV5AlC5T7Hsq
 48oZx7DCf1o8y3QnE7y9nhvtECU+dw3wpZ0MtTAFrbhFOEUnMNgiJwI0QW4W+8Xa9LdzdmZ/i3V
 ZNi6cykiKqqOQkJG2vFLV1f/n7aVxlOvh3zSMvDv2SqrWrB40iz/dDMVTrX/8JMMmLocjw3nGU4
 D00o+zTSzKRqv8vbdTg==
X-Proofpoint-GUID: jRYhCQLN8hKYG8nSPO3I2m3eqY8sTPjN
X-Authority-Analysis: v=2.4 cv=a/wAM0SF c=1 sm=1 tr=0 ts=69d78705 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=7NxCnIlu8LxO6o6IPQsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 69WW6bf3RBaI6LryHGipT278zKZ93G8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090097


On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert hugetlb-vmemmap test to use kselftest framework for reporting
> and tracking successful and failing runs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/hugetlb-vmemmap.c | 42 +++++++++-----------
>   1 file changed, 18 insertions(+), 24 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
> index df366a4d1b92..485a6978b40f 100644
> --- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
> +++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
> @@ -63,7 +63,7 @@ static int check_page_flags(unsigned long pfn)
>   	read(fd, &pageflags, sizeof(pageflags));
>   	if ((pageflags & HEAD_PAGE_FLAGS) != HEAD_PAGE_FLAGS) {
>   		close(fd);
> -		printf("Head page flags (%lx) is invalid\n", pageflags);
> +		ksft_print_msg("Head page flags (%lx) is invalid\n", pageflags);
>   		return -1;
>   	}
>   
> @@ -77,7 +77,7 @@ static int check_page_flags(unsigned long pfn)
>   		if ((pageflags & TAIL_PAGE_FLAGS) != TAIL_PAGE_FLAGS ||
>   		    (pageflags & HEAD_PAGE_FLAGS) == HEAD_PAGE_FLAGS) {
>   			close(fd);
> -			printf("Tail page flags (%lx) is invalid\n", pageflags);
> +			ksft_print_msg("Tail page flags (%lx) is invalid\n", pageflags);
>   			return -1;
>   		}
>   	}
> @@ -91,44 +91,38 @@ int main(int argc, char **argv)
>   {
>   	void *addr;
>   	unsigned long pfn;
> +	int ret;
> +
> +	ksft_print_header();
> +	ksft_set_plan(1);
>   
>   	pagesize  = psize();
>   	maplength = default_huge_page_size();
> -	if (!maplength) {
> -		printf("Unable to determine huge page size\n");
> -		exit(1);
> -	}
> +	if (!maplength)
> +		ksft_exit_skip("Unable to determine huge page size\n");
>   
>   	addr = mmap(NULL, maplength, PROT_READ | PROT_WRITE,
>   			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
> -	if (addr == MAP_FAILED) {
> -		perror("mmap");
> -		exit(1);
> -	}
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
>   
>   	/* Trigger allocation of HugeTLB page. */
>   	write_bytes(addr, maplength);
>   
>   	pfn = virt_to_pfn(addr);
>   	if (pfn == -1UL) {
> +		ksft_perror("virt_to_pfn");
>   		munmap(addr, maplength);
> -		perror("virt_to_pfn");
> -		exit(1);
> +		ksft_exit_fail();
>   	}
>   
> -	printf("Returned address is %p whose pfn is %lx\n", addr, pfn);
> +	ksft_print_msg("Returned address is %p whose pfn is %lx\n", addr, pfn);
>   
> -	if (check_page_flags(pfn) < 0) {
> -		munmap(addr, maplength);
> -		perror("check_page_flags");
> -		exit(1);
> -	}
> +	ret = check_page_flags(pfn);
>   
> -	/* munmap() length of MAP_HUGETLB memory must be hugepage aligned */
> -	if (munmap(addr, maplength)) {
> -		perror("munmap");
> -		exit(1);
> -	}
> +	if (munmap(addr, maplength))
> +		ksft_exit_fail_perror("munmap");
>   
> -	return 0;
> +	ksft_test_result(!ret, "HugeTLB vmemmap page flags\n");
> +	ksft_finished();


LGTM


Reviewed by: Donet Tom <donettom@linux.ibm.com>

-Donet


>   }
