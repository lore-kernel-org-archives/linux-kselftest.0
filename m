Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1595739BFFE;
	Fri, 13 Mar 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411446; cv=none; b=VptQqwiy3igRcMcxdNN0Ax01upU5z2owlCbpPDeIcHmtHWmHN3I+MhSyW2Gdun2IaqfzOYfVKUXaEv3UcbdkQxUNziBYw1PG39Cyv8o/l4BOdZSi0tbEr/IuBFt6B/38by+JEoSNNXgNrfP1YsZdLxNqdmhhxeojz0Rmm/w8oZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411446; c=relaxed/simple;
	bh=2HGbiFifcb/9WPwfJL0RK/ekkExd7iysoqQSUkA7ctY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhorC9kR07VU6BGtxopaG2EBfQhUnFHG5YqRdDsEzHRPpacmOUvBtuy2kYYpfDJr6bgNCV+vvKXIJHUXXBKl8Ou4e2HyQd04RL1FPyteAtmLZRkRjN6APj6IOoufA9+VCGEQUHD2BSgQcSrcKiReuARls9BNfWWoz6W0T+XkzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lFsswbNg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lFsswbNg"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4nj3G2583633;
	Fri, 13 Mar 2026 14:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bfNCGW
	tAaD9IfVKOzq6e/E4scor5n7oi/yhJ7PfVTvo=; b=lFsswbNgS6TE1ExdUK9O0j
	gIg0IeZvmDhhalvaLc8yGHQgQ1J/BodB9JJX+shGVxxFEfgf+A9KTFh9x6uLJ/NW
	apJTv+ar/xugp8xKiXduGOZh/SfsLvjn5iyv7iRuZhF+JJIYba7Flenu+oRPjYwK
	obHAiuYb1/8ihCSuN5TiEbGfvCNPMwVe6t+CX54DqBxgjhZdBmNGuvVxsLTOYXF3
	6CTk3mPtsXpz0NPDQZtznLTOlKDR83Lp18vIi2zJAATA7wSAxwch3AQOHJWaZsCZ
	k+IwcOTepl7OZoT55V4oDeUQUPSE8gt0Q0Zw24cNzCmEExFRsqgSOL5iZySIYxOA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh9507pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 14:17:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62DAFO2g014698;
	Fri, 13 Mar 2026 14:17:04 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cuha8ey1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 14:17:04 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62DEH4UY28967668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 14:17:04 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2F2B5805E;
	Fri, 13 Mar 2026 14:17:03 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7727358051;
	Fri, 13 Mar 2026 14:16:59 +0000 (GMT)
Received: from [9.39.23.217] (unknown [9.39.23.217])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Mar 2026 14:16:59 +0000 (GMT)
Message-ID: <1f944b56-acb6-44ee-8cc2-6031fcedaeaa@linux.ibm.com>
Date: Fri, 13 Mar 2026 19:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] selftests/mm: fix failures and robustness
 improvements
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>,
        David Hildenbrand
 <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko
 <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org
References: <cover.1773305677.git.sayalip@linux.ibm.com>
 <20260312150526.3662b2717b9a91776a2e43f5@linux-foundation.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <20260312150526.3662b2717b9a91776a2e43f5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=QKtlhwLL c=1 sm=1 tr=0 ts=69b41c62 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=YdAoJE3rqbStyI-1upkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMiBTYWx0ZWRfX2vRLn5fFjDGH
 e7ZBS7DlBp3DH3an/kn0qFOSrvVmI/70hmKoAoNhMP71PeN4a1Lsgm+uGlyNFFaJ+Ll0zHp2g2P
 TPT9mHE5ApJ/tJ/9IikbHY48V27tlt9VmvlC+IcAPgN5OgZSguNwro9U+VAT6xlKAHi3r5zCKQV
 mYzUirBbhGuryEnVNNW6EHXUiQqNPYoKbnGYHqnO1ZkEn0PGOjrrqlV39D3/Ttx2giT5S/b5Ob4
 pRO/CNIJmrYqxPUrrEkBImJUXoGsSQlEQDWkl80jiSu4Oo8hz2eR5bc7lpXpxBmwUahXBZ6mrOg
 UxFQvZSeEghFNQvk0eVKKDaFpGR+cPWJzWaVVVE+WUu5hg1k7yVRjoJ3iOi2T6ObMc2bOYSEjw9
 v6OYxj0lIwH7zsZNWwIgzKve7Z5e8+CGjsYGYe+I4fKB3/kHrnr3TZiNuOORsGdWQNN9jhqJX9b
 3UiTK5fxrBtnxBgX0eA==
X-Proofpoint-ORIG-GUID: EKxMMvXJO_-Q6FuTg3Mm2n_bv_9p0Ewp
X-Proofpoint-GUID: _FoW35RApTu9sZVdSSuEqYmN99KNbMEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130112


On 13/03/26 03:35, Andrew Morton wrote:
> On Thu, 12 Mar 2026 17:55:27 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:
>
>> Hi all,
>>
>> Powerpc systems with a 64K base page size exposed several issues while
>> running mm selftests. Some tests assume specific hugetlb configurations,
>> use incorrect interfaces, or fail instead of skipping when the required
>> kernel features are not available.
>>
>> This series fixes these issues and improves test robustness.
> Thanks, I updated mm.git's mm-new branch to this version.
>
>> ---
>> v1->v2
>>    - For "selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap":
>>      update FLAGS definition to MAP_HUGETLB | MAP_SHARED | MAP_POPULATE and
>>      used it for mmap() calls as suggested during review.
> That was a really small change (below).  It's better to wait a while
> (half to one week) before resending an entire series.  So as to
> hopefully accumulate more changes.
>
>
>
> --- a/tools/testing/selftests/mm/hugepage-mremap.c~b
> +++ a/tools/testing/selftests/mm/hugepage-mremap.c
> @@ -31,7 +31,7 @@
>   #define MB_TO_BYTES(x) (x * 1024 * 1024)
>   
>   #define PROTECTION (PROT_READ | PROT_WRITE | PROT_EXEC)
> -#define FLAGS (MAP_SHARED | MAP_ANONYMOUS)
> +#define FLAGS (MAP_HUGETLB | MAP_SHARED | MAP_POPULATE)
>   
>   static void check_bytes(char *addr)
>   {
> @@ -121,23 +121,20 @@ int main(int argc, char *argv[])
>   
>   	/* mmap to a PUD aligned address to hopefully trigger pmd sharing. */
>   	unsigned long suggested_addr = 0x7eaa40000000;
> -	void *haddr = mmap((void *)suggested_addr, length, PROTECTION,
> -			   MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
> +	void *haddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
>   	ksft_print_msg("Map haddr: Returned address is %p\n", haddr);
>   	if (haddr == MAP_FAILED)
>   		ksft_exit_fail_msg("mmap1: %s\n", strerror(errno));
>   
>   	/* mmap again to a dummy address to hopefully trigger pmd sharing. */
>   	suggested_addr = 0x7daa40000000;
> -	void *daddr = mmap((void *)suggested_addr, length, PROTECTION,
> -			   MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
> +	void *daddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
>   	ksft_print_msg("Map daddr: Returned address is %p\n", daddr);
>   	if (daddr == MAP_FAILED)
>   		ksft_exit_fail_msg("mmap3: %s\n", strerror(errno));
>   
>   	suggested_addr = 0x7faa40000000;
> -	void *vaddr = mmap((void *)suggested_addr, length, PROTECTION,
> -			MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
> +	void *vaddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
>   	ksft_print_msg("Map vaddr: Returned address is %p\n", vaddr);
>   	if (vaddr == MAP_FAILED)
>   		ksft_exit_fail_msg("mmap2: %s\n", strerror(errno));
> _
>
>
Thanks for the guidance. I'll make sure to follow this approach from 
next time.
