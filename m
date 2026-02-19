Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28730649A;
	Thu, 19 Feb 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771485974; cv=none; b=Z2Kj/EFigiunJvH/D5QT/40vkervbiqt/Mb65fX1Y5H1z3EvkAp+jwTEHwIH9mt/YVi7obgeR3PI2sp/4CS+IRrDyO4GyXAqCFMKRjOVFcFvo8ojgmBuPVIVRHpAvpeZby3U8e55dh9n/BQsHB5Q5AOAELB6bD2innhIQKDEtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771485974; c=relaxed/simple;
	bh=S8uy5am7loHdqZkUmmshDPvqANgTRKwpsv/nWxhX/IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6GiTkfJYoO/G9l/B4BlyYvVjIyZXc3hGPC1Glpu01+i3+0DFx/Pkh6szpoXbfrhzl6cRAFslHnYjHqoIsP4fYXc1BSAcDkQH9S6c8OSD2IpFAg72rUAIzyCrUtcMh0P+nM9gTns/CiM/khuUTsl+fECjCKFAuTTomYGyKQLb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f6smysTe; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f6smysTe"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IH9F5l1967517;
	Thu, 19 Feb 2026 07:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BRKydu
	kz0jN83Do86qwi4dzgEUce+eAb/XiyYzWyrl0=; b=f6smysTeirori9g6/hhIHK
	vKi6IV/4/HLesDTZHmMspLMQrzphKTG4G/cWH8PsU5rqvi6Qc6behNMXwtzkrcvZ
	nAQTk2J4982An01xvvdll9oViXz9PGMre6mVs5dU+z/vxyEXyKufxhFjzQ2RG5aB
	g8tOJ783qjh8nrun/uj6lNMElDnSKW23F+MyVujFgT9IpbUqI0XJhPTyeejNEHp8
	AD8B3e9LPYdybuuDYIW3q+5QRTKyqCT5DHWSvpHY1TVnVfCjDXWuEhsEctzA0E5T
	hrzzZ6Xok7c2zUMRWcalIjLLNIqm/1OeW1ffNkrr03lROdVQDu+z/v8b/EnXdSQg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6uvwxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 07:25:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61J3auVu015846;
	Thu, 19 Feb 2026 07:25:58 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb45b756-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 07:25:58 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61J7Pvu433817184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Feb 2026 07:25:58 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D752058054;
	Thu, 19 Feb 2026 07:25:57 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 731F758045;
	Thu, 19 Feb 2026 07:25:53 +0000 (GMT)
Received: from [9.109.243.201] (unknown [9.109.243.201])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Feb 2026 07:25:53 +0000 (GMT)
Message-ID: <e86ce6a1-fb37-4139-a3e9-6f8ee6276737@linux.ibm.com>
Date: Thu, 19 Feb 2026 12:55:51 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: skip migration tests if NUMA is unavailable
To: AnishMulay <anishm7030@gmail.com>, akpm@linux-foundation.org,
        david@kernel.org, shuah@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260218163941.13499-1-anishm7030@gmail.com>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <20260218163941.13499-1-anishm7030@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E+/AZKdl c=1 sm=1 tr=0 ts=6996bb07 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=0yyZkKLRId3T3oa8QXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2NCBTYWx0ZWRfX+UaOEBhviScz
 rJ3ouH5H24mU7GY8AmpuTpNuLiP8PynNj0KpZreaBoaKwWHEJfqivmUHNNRGf+8ZBgExjgvkcCX
 e6y61frpXsW7XMXkrupwEQxf3bMLdNGCVx9+7UvW8CecyC3/5UctobKY/3J82H63MSnZIOzu319
 z+CrrAM8ZxnURCSXXP2H2kiKDtWxwBIPCkvFqr4r8q0HEmhk6VYXnFwqBYWsP/Gxfm3qqTL9TIK
 bmJjOqZMlYL+/1zzE2snge47u5f7T/bZgkQfwlZdnnjU7OqRPSuEqkdmQ/BDhK3yE/6gz8RkDR7
 vHNDD+ADgWQVIBsoZdrZnuQ55ks1weaqSvQlSH4s0yudHBOn3+Hnft4Fg40sPW36SYq+bMVC4Nk
 fUTAN+NHnUBsydBR1rJpz9zNT1GnMCyMdPWy2+4l7tVUYLDqPLAf74KJ9jEnIrQqUsFveoH4yOw
 wM3J9H4GyksijmSKKtw==
X-Proofpoint-ORIG-GUID: lWYIz3aFCcFo0wp-coajTjwNK_-cZP4s
X-Proofpoint-GUID: aRmFRU3TIH6bxyBPPTh_dgqrLVJij9bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190064

Hi Anish,

On 18/02/26 22:09, AnishMulay wrote:
> Currently, the migration test asserts that numa_available() returns 0.
> On systems where NUMA is not available (returning -1), such as certain
> ARM64 configurations or single-node systems, this assertion fails and
> crashes the test.
>
> Update the test to check the return value of numa_available(). If it
> is less than 0, skip the test gracefully instead of failing.
>
> This aligns the behavior with other MM selftests (like rmap) that
> skip when NUMA support is missing.
>
> Signed-off-by: AnishMulay <anishm7030@gmail.com>
I tested it on my system and its skipping the test if NUMA not available.

TAP version 13
1..6
# Starting 6 tests from 1 test cases.
#  RUN           migration.private_anon ...
#      SKIP      NUMA not available
#            OK  migration.private_anon
ok 1 migration.private_anon # SKIP NUMA not available
#  RUN           migration.shared_anon ...
#      SKIP      NUMA not available
#            OK  migration.shared_anon
ok 2 migration.shared_anon # SKIP NUMA not available
#  RUN           migration.private_anon_thp ...
#      SKIP      NUMA not available
#            OK  migration.private_anon_thp
ok 3 migration.private_anon_thp # SKIP NUMA not available
#  RUN           migration.shared_anon_thp ...
#      SKIP      NUMA not available
#            OK  migration.shared_anon_thp
ok 4 migration.shared_anon_thp # SKIP NUMA not available
#  RUN           migration.private_anon_htlb ...
#      SKIP      NUMA not available
#            OK  migration.private_anon_htlb
ok 5 migration.private_anon_htlb # SKIP NUMA not available
#  RUN           migration.shared_anon_htlb ...
#      SKIP      NUMA not available
#            OK  migration.shared_anon_htlb
ok 6 migration.shared_anon_htlb # SKIP NUMA not available
# PASSED: 6 / 6 tests passed.
# 6 skipped test(s) detected. Consider enabling relevant config options 
to improve c
overage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:6 error:0

Tested-by: Sayali Patil <sayalip@linux.ibm.com>

Thanks,
Sayali

> ---
>   tools/testing/selftests/mm/migration.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index ee24b88c2b248..60e78bbfc0e3e 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -36,7 +36,8 @@ FIXTURE_SETUP(migration)
>   {
>   	int n;
>   
> -	ASSERT_EQ(numa_available(), 0);
> +	if (numa_available() < 0)
> +		SKIP(return, "NUMA not available");
>   	self->nthreads = numa_num_task_cpus() - 1;
>   	self->n1 = -1;
>   	self->n2 = -1;
