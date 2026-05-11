Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1D3D16F2;
	Mon, 11 May 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494995; cv=none; b=O8APuBlx/qH3bfR8+uel3VuDWknr/U7hAlk41N4FUVyIXn6BOxj4qh8O/dlbVc4Y+TtsiSyCgvy0UZJsZdZLtO24TmhI/g5mo8pLLH07PRXtoYdgFuBsWnm8w2ALRNwhNxcAtImLP+Cfe3gIRCjEZ7+fye9HbgfXJZO3g7wUdNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494995; c=relaxed/simple;
	bh=65WOtYri162fIJG2Eg2MVA6gXjS757lnBTE4mW0pIew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYMFSSiQFCGDXmBENe3r3cUXkjc30RWAupEktcATwgoqYxumIeqbFBoowJl0LC+zqOFe6Az8GEybk6asSiP9cqi9MBuzu2rn3mbKn+1Bbicza3/zgpqT6NR0AXOBYrOpCcPFb+UOfg8o2Cv4XKuYiuOWKhl4BNZgx4iqqn+UOdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K+fzA263; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K+fzA263"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7D9Wl1991346;
	Mon, 11 May 2026 10:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LyziTp
	DawUQZ1AMfG5vG1IZmo3cKN9STSmA1nTF6oJI=; b=K+fzA263+QEvQph2uMRl7F
	ySJm+zKH/fKL2SbyG4cTdbCVDD+4qWmJRz7MK++Geuhlaq++1Y72/XdS6O0b9IVo
	sLHE3LBu1gc0KzUDNtNMPtWtpuRA4jK+V2fIld25zKFXKVIE5wB7hxwOfRmnJXSJ
	uq7QqsmpYWEHkDV18dfjC2L6+0Msa1CyK2U3wGCs2dIcMdRRdvAXZaJmcFUh62yW
	CAFtKNpv63nLZASWIeF1qWJItqFIwFYpPPlUUrA1D3HzYIlIVfRwux8ZBhgNfU8U
	aruqVMtt4BrtG3aLs6r97iq0GHl8eaLDyZq1I30B1XjYkvS+Y1ZfT4ptlcWaTbQw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e1tbhqf24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 10:22:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64BA9SK5025964;
	Mon, 11 May 2026 10:22:47 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e2fmvvvkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 10:22:47 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64BAMkDo26804810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 May 2026 10:22:47 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DADC75805D;
	Mon, 11 May 2026 10:22:46 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A989B58068;
	Mon, 11 May 2026 10:22:42 +0000 (GMT)
Received: from [9.123.6.34] (unknown [9.123.6.34])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 May 2026 10:22:42 +0000 (GMT)
Message-ID: <3d66e75c-4039-40a8-a8d9-e8db62c13b16@linux.ibm.com>
Date: Mon, 11 May 2026 15:52:41 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: handle fork() failure in migration tests
To: Hu Song <husong@kylinos.cn>, akpm@linux-foundation.org, david@kernel.org,
        shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
References: <20260511093433.2372985-1-husong@kylinos.cn>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20260511093433.2372985-1-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZdQt8MVA c=1 sm=1 tr=0 ts=6a01adf8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=y8b2V3OV3dnl5RsapYEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Nufk4kqobnzr1nYYrQ10GQO2dmESkzab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMSBTYWx0ZWRfXwoTAcSb3B1Pf
 uMZU7xldHbYY82PDgptAUc5KjVUtnXyg7x3OixxRsOHV0ahERKEkQDG+skLSB8a6WuIUvGtHoMs
 0wBs0QCxsHWxoi8SskOEaFcoyAZ0EORS+t0FbR7lyUwbe6hVcFyPMdHapWC6Fk0rdXiW6moFZYD
 cc93MoJzCoPlGovuw5/aVpE9imAaJ50JMHjg+SOhiw8w9Fyx/+pnLmE2oYa4WaE51soZTY/WXDH
 WmqSmlLJfmRKA7D+CgbMCYdxgSBfTljooyOyEOeJXDjSP6Pe7ccGNciDdZLcxr0qXCTv6oWlRgW
 s0mIi3Us4Z0NKrJqgT4m//J1i+BG1g5sTNef9rwr+q3+Y6iPTq7FjoAi3pVkO7nvN9uuPIbOqew
 cvsxjGEaXqYxskBrAoFShBN9RQGRfhKConxZxBRCNUTsPDPwDX662ef8SGKmD2ICH+1FlPRwLpp
 khJhJdZ0J3yCMw0m6Mw==
X-Proofpoint-GUID: oLciyCfTsNXsZAGfTXt8saeO8uDDd909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110111

Hi

On 5/11/26 3:04 PM, Hu Song wrote:
> From: Song Hu <husong@kylinos.cn>
>
> When fork() fails and returns -1, the code falls into the else branch
> and stores -1 into self->pids[i]. Later, kill(-1, SIGTERM) is called
> which sends SIGTERM to every process the user has permission to signal,
> potentially killing the entire user session.
>
> Add an explicit check for fork() returning -1 (pid < 0). On failure,
> clean up any already-forked children before failing the test via
> ASSERT_GE(pid, 0). This fix is applied to all three fork() call sites
> in shared_anon, shared_anon_thp, and shared_anon_htlb tests.
>
> Signed-off-by: Hu Song <husong@kylinos.cn>

I am seeing the below issue in checkpatch.pl.

WARNING: From:/Signed-off-by: email name mismatch: 'From: Song Hu 
<husong@kylinos.cn>' != 'Signed-off-by: Hu Song <husong@kylinos.cn>'

-Donet

> ---
>   tools/testing/selftests/mm/migration.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 60e78bbfc0e3..f433e4f195ad 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -163,6 +163,11 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
>   	memset(ptr, 0xde, TWOMEG);
>   	for (i = 0; i < self->nthreads - 1; i++) {
>   		pid = fork();
> +		if (pid < 0) {
> +			while (--i >= 0)
> +				kill(self->pids[i], SIGTERM);
> +			ASSERT_GE(pid, 0);
> +		}
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
>   			/* Parent may have died before prctl so check now. */
> @@ -235,6 +240,11 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
>   	memset(ptr, 0xde, TWOMEG);
>   	for (i = 0; i < self->nthreads - 1; i++) {
>   		pid = fork();
> +		if (pid < 0) {
> +			while (--i >= 0)
> +				kill(self->pids[i], SIGTERM);
> +			ASSERT_GE(pid, 0);
> +		}
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
>   			/* Parent may have died before prctl so check now. */
> @@ -295,6 +305,11 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	memset(ptr, 0xde, TWOMEG);
>   	for (i = 0; i < self->nthreads - 1; i++) {
>   		pid = fork();
> +		if (pid < 0) {
> +			while (--i >= 0)
> +				kill(self->pids[i], SIGTERM);
> +			ASSERT_GE(pid, 0);
> +		}
>   		if (!pid) {
>   			prctl(PR_SET_PDEATHSIG, SIGHUP);
>   			/* Parent may have died before prctl so check now. */
