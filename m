Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F4316190;
	Thu, 21 May 2026 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354845; cv=none; b=joHoT2xmytvwmtE8T8+IZAH6UptU/hQq1WhkpaiCqAaqyZ8M451kpldjzIAf/PrhQCKSBXiqroTf0ZzWsLdDqXgtqpQizl0uGL+51PhbDDW74tnOlLp8wLysAkw9q9sXyUO9QLE94CLcsjmawYJM4q89EYZA+omI8jcHiK1wUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354845; c=relaxed/simple;
	bh=vVVpBi2uuiv/TLBCRr7q2WlEbDwpdia57BBdVTHgOY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgFtJoaSISIE4GREAYs1PCn7j2R4sIk6rbzTRw7ICqqBLaVoqC8p2/wU0UTH19tv1BnV6iJ9aVC1fKRcBCeVxZrVC6zhiwPr9975x72eefaJrfqmOQRlIuEFGXJOo9BhHKN25PlfQGGMBoDu9PZzfD3Luh5hyV8b6Xz1G72k8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OKqUzPnh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OKqUzPnh"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KJ8bo31588176;
	Thu, 21 May 2026 09:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OevyjT
	u9FiHf2CLX090f6Fl/3bswf0qDQG/sp+fQ7zg=; b=OKqUzPnhznUoDQSmPi9Vma
	m/Jt/P0O62RFr6XuEAeTto1ilU+XOVRHbiFPT60g6GgTFUiucBoPCXvpedr5+nr7
	aE/VoYW+fekw9XWuXJ6H3kvKa2n6TCxjuNHeXp6f6mxiRjgqkmAyESwqlN9vHd4N
	PyV1sfYvRDzUoqe+8Joa47JNkAtFoKdpS4km7yssIP59/NgO/jQkcXyDG7URxVui
	8qSsbGGgTQHYuxol1rlhsWDnA/1TOxtn8aAviD+PyJbWE24seN9e61silVElBVSf
	Y+UDcGMp/9rx9CR2YQ4smnuqQDs2wqAIH++/7Gm/OHJdGY5MAHGwkaF2OIEHsrLg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6hb8mvq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 09:13:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L998Nj001114;
	Thu, 21 May 2026 09:13:42 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e754gk403-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 09:13:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64L9DgLZ48496976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 09:13:42 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13F9658054;
	Thu, 21 May 2026 09:13:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B81FB58050;
	Thu, 21 May 2026 09:13:36 +0000 (GMT)
Received: from [9.123.3.209] (unknown [9.123.3.209])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 May 2026 09:13:36 +0000 (GMT)
Message-ID: <88202b56-1dc5-43e2-9d1f-a0823a9531f0@linux.ibm.com>
Date: Thu, 21 May 2026 14:43:35 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sayali Patil <sayalip@linux.ibm.com>
Subject: Re: [PATCH v7 11/13] selftests/mm: skip uffd-stress test when
 nr_pages_per_cpu is zero
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1779296493.git.sayalip@linux.ibm.com>
 <0707e9a0f1b3dd904c4a069b91db317f9c160faa.1779296493.git.sayalip@linux.ibm.com>
Content-Language: en-IN
In-Reply-To: <0707e9a0f1b3dd904c4a069b91db317f9c160faa.1779296493.git.sayalip@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4OSBTYWx0ZWRfX0NfPxMuPQdl8
 ZQEW9qTenAPbDx/m/wMEMbT71aF8Nrx90/1QHthXxmzys/O8PX+PZJa8c8Km+aCHWlnfl94BhRO
 p4dj+pxgQqaXY8c3+luxPdjK/DJ4hyP0JQ+upF4txAE4bKzFoLvWHXr0Bor94MaVoaIoLKEiPO/
 Vz4MNDmKfa3/GbRbB1+0aSTN+a1+cQAXxruJTAWjTxsrOTPR0kzih/YzKr0fYpWPLsDIoZ3ZugT
 OLYUjmYp2NM6cQxl6zvqvE6fGZw40XLIAuUesPFIMhfXcgo1cyOrLNAnjj7/zIXljBK5qPt91JG
 l5OlqmEzh7rymHqn5WGMxYOV0CGiWfW4726bau2MCrgwdZWq8Ug14SUbeuuF8pcQ5nkoZC52A+a
 34rEq4PYDPtGZPJ9SgQwPzllQEOwP/gjiwiQ1ciXoXZp2C6/EeuiXjhdZHJ/f8VH/R/l7mWH+40
 dE/HuLCtEjs6PD5BNJw==
X-Proofpoint-GUID: YBD6R_YN9_Ss56w9WvlauW_CAYGbIE73
X-Proofpoint-ORIG-GUID: nSLeMh-JvVOwp7mGCId-w65f2VJDqkvX
X-Authority-Analysis: v=2.4 cv=aYBRWxot c=1 sm=1 tr=0 ts=6a0eccc8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=Ikd4Dj_1AAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Bj7DDXi5LvTWgAAjYWoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210089



On 21/05/26 12:17, Sayali Patil wrote:
> uffd-stress currently fails when the computed nr_pages_per_cpu
> evaluates to zero:
> 
> nr_pages_per_cpu = bytes / page_size / nr_parallel
> 
> This can occur on systems with large hugepage sizes (e.g. 1GB) and a
> high number of CPUs, where the total allocated memory is sufficient
> overall but not enough to provide at least one page per cpu.
> 
> In such cases, the failure is due to insufficient test resources
> rather than incorrect kernel behaviour. Update the test
> to treat this condition as a test skip instead of reporting an error.
> 
> Fixes: db0f1c138f18 ("selftests/mm: print some details when uffd-stress gets bad params")
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>   tools/testing/selftests/mm/uffd-stress.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
> index 43cc79590136..39e13e2078a9 100644
> --- a/tools/testing/selftests/mm/uffd-stress.c
> +++ b/tools/testing/selftests/mm/uffd-stress.c
> @@ -489,9 +489,9 @@ int main(int argc, char **argv)
>   
>   	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
>   	if (!gopts->nr_pages_per_cpu) {
> -		_err("pages_per_cpu = 0, cannot test (%lu / %lu / %lu)",
> -			bytes, gopts->page_size, gopts->nr_parallel);
> -		usage();
> +		ksft_print_msg("pages_per_cpu = 0, cannot test (%zu / %lu / %lu)\n",
> +			       bytes, gopts->page_size, gopts->nr_parallel);
> +		return KSFT_SKIP;
>   	}
>   
>   	bounces = atoi(argv[3]);


Hi Andrew,
Can you please apply the below fixlet on top of this patch as suggested 
by Sashiko.

 From aa8f2eea63defd9b9c1342b83838f48e93e1b918 Mon Sep 17 00:00:00 2001
From: Sayali Patil <sayalip@linux.ibm.com>
Date: Thu, 21 May 2026 13:32:51 +0530
Subject: [PATCH] [fixlet] selftests/mm: use ksft_exit_skip() instead of
  KSFT_SKIP in uffd-stress

When nr_pages_per_cpu evaluates to zero, the test is skipped by
printing a message and returning KSFT_SKIP manually.

Replace this with ksft_exit_skip(), which prints the skip message
and exits with the correct skip status in a single helper, making
the code consistent with other selftests.

Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
  tools/testing/selftests/mm/uffd-stress.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c 
b/tools/testing/selftests/mm/uffd-stress.c
index 39e13e2078a9..3401dd6028f0 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -489,9 +489,8 @@ int main(int argc, char **argv)

  	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
  	if (!gopts->nr_pages_per_cpu) {
-		ksft_print_msg("pages_per_cpu = 0, cannot test (%zu / %lu / %lu)\n",
+		ksft_exit_skip("pages_per_cpu = 0, cannot test (%zu / %lu / %lu)\n",
  			       bytes, gopts->page_size, gopts->nr_parallel);
-		return KSFT_SKIP;
  	}

  	bounces = atoi(argv[3]);
-- 
2.52.0


Thanks,
Sayali
