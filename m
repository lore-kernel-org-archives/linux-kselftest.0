Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4D348866;
	Thu,  9 Apr 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728220; cv=none; b=EwYP7QcWufexqU3Lj/ZcVt5EXDB8jSEy6P8iCaVEs3E9HqMXze9Ql39MhDMKBxKtaT6VWcxnBXSVb9Aga1slDLV/HlvTI05R5UwUygz7N8RjV4rNxs5SuCSc9xBxEVAfBH2rFyzlC7JckdrtngiLPorpkpwSC3ZiPfMfhTpnEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728220; c=relaxed/simple;
	bh=QjUQ5iCnEniz4u/CvSn0JBogk2mJnUbiSgtctY9OmCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGxA04RPDcdYJlKj7xA2yK09JKBX8sCi7m+iQApcBpM0Bm2HiV2XfYqI+mMI5BHNNM0bV+tVq3n4TY8ZX7RrQ7lDq7V+RdDLwmDdwk/8LS9Tg2ghulrkZc1fqVYBUv99GDRdlspAVIIJX6NS4ycTrX+1YHddyF8IpmhMp9SDTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K+vzRBGj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K+vzRBGj"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Iaujj2591197;
	Thu, 9 Apr 2026 09:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xy0aFw
	R9hSVE9FugkDv+q+eeKeSUlXGFf66m16wYZTY=; b=K+vzRBGjvv0GAIELRmHXmD
	AG6FzR/3WhCmO8/ju6+uAMrPbP7dUxcnUlxfbOHkx3Ze+dbfNZjTyJ0It2b817uz
	9VtfWlqv8A7rM3Fb5kiH4nREVPRyKUtiPIDfNIr4JUYg0rt7eWWV/n3rZ8uT7IPx
	O8fp/10P7+DsuvOOo9gt0G0c1carPsMhGKwSuxg0PkKQHRH/t4J0esZUSAWDMmb2
	lXND6DRl8SYzsVnf/eeFtBXlo9d4rDKIeV75Jc63J9TDmVBNjZwG1qW4B3yRdDPP
	C+7fNp0x0kxW/2lF2ClH3IDgc+TetEvioJGt2SjaDSVFwuB61COotbwfTpKekMRg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2ecbv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 09:49:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6397qZQh030062;
	Thu, 9 Apr 2026 09:49:55 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dcme7k231-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 09:49:55 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6399ns7F21234386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2026 09:49:54 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 744FB5805B;
	Thu,  9 Apr 2026 09:49:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB9D758058;
	Thu,  9 Apr 2026 09:49:46 +0000 (GMT)
Received: from [9.123.6.34] (unknown [9.123.6.34])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Apr 2026 09:49:46 +0000 (GMT)
Message-ID: <eb94ebf2-cc19-4a1b-962a-98346d7b7b6c@linux.ibm.com>
Date: Thu, 9 Apr 2026 15:19:45 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/53] selftests/mm: hugetlb-shm: use kselftest framework
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
 <20260406141735.2179309-8-rppt@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260406141735.2179309-8-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xVUArB0X5A1WkQ7OklpwXZUw-uOrUNTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4NyBTYWx0ZWRfX3um++GYn/J4e
 k/DgGJjCM1y8fPjGK7gNbOtHEsHE5jmcxN2buo4El6zG96Exk+rR6WGBFy9t+Io9E/UBql4hU0K
 5SFZTOxnwwSPPerkd8DGIoOToaZTpQOdDo/N7BysKTlrP1hIRfXMyuCOF3kOPL01IOz5FrRKn0o
 hR/j0y4GixOIjounq2lf0a72RH7LlLUix8IZmMCqZ6W+nkV863yeza++96H0o6i1KSf7R21XMnU
 OwY7ubbPDYuuK0v7acedxmCe4kJZBJ9SaWMGG/XY3GlT9IF9WOhr3Tu2FrOv6WyBk9Auknj8gCU
 G46WeboS1YbkgDfK3cqXGtuaQ9IcaboxzHPH6yrgL+74Nd/xVpPPNm+JhDkD5D7ppGSMMqOqHZ9
 du+wCRQ+KGPExKXgTtRoEBhqKQzFTlY4xhtsPMoStsYqkgDGz6k24fxcl53FbvVyWtpew1dOBEr
 XoczcdN8WD70P/Iwmcg==
X-Authority-Analysis: v=2.4 cv=Cfw4Irrl c=1 sm=1 tr=0 ts=69d77645 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=rVzG8BGgQnyHgGzjHBUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: p7hSlYH4aeAOw0kLZuXNyaF_sX3yLzpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090087

Hi Mike

On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Convert hugetlb-shm test to use kselftest framework for reporting and
> tracking successful and failing runs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/hugetlb-shm.c | 46 ++++++++++++------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
> index de8f5d523084..10e4baa091f2 100644
> --- a/tools/testing/selftests/mm/hugetlb-shm.c
> +++ b/tools/testing/selftests/mm/hugetlb-shm.c
> @@ -28,9 +28,9 @@
>   #include <sys/shm.h>
>   #include <sys/mman.h>
>   
> -#define LENGTH (256UL*1024*1024)
> +#include "vm_util.h"
>   
> -#define dprintf(x)  printf(x)
> +#define LENGTH (256UL*1024*1024)
>   
>   int main(void)
>   {
> @@ -38,44 +38,44 @@ int main(void)
>   	unsigned long i;
>   	char *shmaddr;
>   
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
>   	shmid = shmget(2, LENGTH, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W);
> -	if (shmid < 0) {
> -		perror("shmget");
> -		exit(1);
> -	}
> -	printf("shmid: 0x%x\n", shmid);
> +	if (shmid < 0)
> +		ksft_exit_fail_perror("shmget");
> +
> +	ksft_print_msg("shmid: 0x%x\n", shmid);
>   
>   	shmaddr = shmat(shmid, NULL, 0);
>   	if (shmaddr == (char *)-1) {
> -		perror("Shared memory attach failure");
> +		ksft_perror("Shared memory attach failure");
>   		shmctl(shmid, IPC_RMID, NULL);
> -		exit(2);
> +		ksft_exit_fail();
>   	}
> -	printf("shmaddr: %p\n", shmaddr);
> +	ksft_print_msg("shmaddr: %p\n", shmaddr);
>   
> -	dprintf("Starting the writes:\n");
> -	for (i = 0; i < LENGTH; i++) {
> +	ksft_print_msg("Starting the writes:\n");
> +	for (i = 0; i < LENGTH; i++)
>   		shmaddr[i] = (char)(i);
> -		if (!(i % (1024 * 1024)))
> -			dprintf(".");
> -	}
> -	dprintf("\n");
>   
> -	dprintf("Starting the Check...");
> +	ksft_print_msg("Starting the Check...");


Do we need to add a newline (\n) here? The output is currently printed as:
# Starting the Check...# Done.
If this is intentional, please ignore this comment. Otherwise, it looks 
good to me.



./hugetlb-shm
TAP version 13
1..1
# shmid: 0x1
# shmaddr: 0x7ffface00000
# Starting the writes:
# Starting the Check...# Done.
ok 1 hugepage using SysV shmget/shmat
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Reviewed by: Donet Tom <donettom@linux.ibm.com>

-Donet

>   	for (i = 0; i < LENGTH; i++)
>   		if (shmaddr[i] != (char)i) {
> -			printf("\nIndex %lu mismatched\n", i);
> -			exit(3);
> +			ksft_print_msg("Index %lu mismatched\n", i);
> +			shmctl(shmid, IPC_RMID, NULL);
> +			ksft_exit_fail_msg("Data mismatch at index %lu\n", i);
>   		}
> -	dprintf("Done.\n");
> +	ksft_print_msg("Done.\n");
>   
>   	if (shmdt((const void *)shmaddr) != 0) {
> -		perror("Detach failure");
> +		ksft_perror("Detach failure");
>   		shmctl(shmid, IPC_RMID, NULL);
> -		exit(4);
> +		ksft_exit_fail();
>   	}
>   
>   	shmctl(shmid, IPC_RMID, NULL);
>   
> -	return 0;
> +	ksft_test_result_pass("hugepage using SysV shmget/shmat\n");
> +	ksft_finished();
>   }
