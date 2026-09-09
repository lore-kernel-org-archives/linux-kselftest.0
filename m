Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46929565111;
	Wed,  9 Sep 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960197; cv=none; b=oYIkXr/XC+fb9afDP1py6m6/fGoxs4a8XIJB6sbM2NY4zvLup88hydRvGyHz2D4KW2Nlu4vl9j4Zy4xjAKIoLKYXDujQl8x/LxEoNFaU1wI35VIVEiMOZDr+7rLNX7J3tVvfLVVlyWoSaUzRrzMDhQvf0ZSDD0WtSI/EN/q5ABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960197; c=relaxed/simple;
	bh=L0frrBWn2OKkVelRR/i5mDRjxBL//1sLi7X556MNR5E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C24HnuPCiK5d0rTPhyX9bsMYTIqXmxw1fpTcTr5OOW5XlWgWk7CnOBBvV5kfo19v7TV7lZDYC1CMWL9AujGo+2EUwT1JXXWE0vgBND74enEO3IvASG2HXNiP9wP+5JJqUNKSJSXQdet89GwSv/NQ5pqE2Jul9HmF9eSlLSweVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LdxZoiA3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LdxZoiA3"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689B1pe62666403;
	Wed, 9 Sep 2026 13:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=C37o+2
	d2YNoPpp09eOqsl1fAi8nWXqlTIZ/1LcuxG48=; b=LdxZoiA3QFQsMFfCoafPKt
	8ICciRlZdFWixNfN9G2IEtXkjxFUYuaMssAlGxkF+l4b38yjQFiF2Bu9JELOKsOL
	bZivOTi8Dl/x5LKoavJfaodM5sD7JulMRwOY0ObIsGIsjI9FurS6QfNzqC7m9GkE
	kvxRLsU63dGuY9P1NBSqeMqkBIQS+9DZLVmvOniNl00osVMXqN2wsNl07qKmL5LR
	5q9BeBwAuGV6fFGu9aNpWUXyrpBPosg67dBKdKGBm/Xvc/8jA1Qv9awtrt+Ly9ON
	N4/V1p1q8iLqKiOGlXGvH25TvGmJV+r37PO6aRmwhZJ8kQYOIFkL6KCTV1+hOOqg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjrwqcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 13:22:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 689CuHqo031375;
	Wed, 9 Sep 2026 13:22:54 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxwhacpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 13:22:54 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 689DMrCe44695894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 13:22:53 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F151E58052;
	Wed,  9 Sep 2026 13:22:52 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C72458054;
	Wed,  9 Sep 2026 13:22:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.123.0.173])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Sep 2026 13:22:49 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] selftests/powerpc: use MAP_FAILED instead of (void *)-1
 in  tm-signal-context-force-tm
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260722023428.932-1-yanlonglong@kylinos.cn>
Date: Wed, 9 Sep 2026 18:52:36 +0530
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7E476E5-441D-42A6-901C-502AB7F38F90@linux.ibm.com>
References: <20260722023428.932-1-yanlonglong@kylinos.cn>
To: longlong yan <yanlonglong@kylinos.cn>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6aa15daf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=Wrt6cOJku4apROHjGUkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NiBTYWx0ZWRfX4QSPB/xjNBGf
 9qtGPBirgEJVmY6NscH4D/jrZtIk8cwCR4CScQGvaEQPNcphAONZP08teHPVFAlxpJqTMMvsz+S
 W9pY7n+QXTXXEsZvL8rmCgDLIZ9ToJE=
X-Proofpoint-ORIG-GUID: Yd7Z5hTU1tCP8B--8CHKXjBqzfq_ukyB
X-Proofpoint-GUID: FYrxNs7_dEaH3yRvSPCRAB8F-js1ZXO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NiBTYWx0ZWRfX7mScuuNwQwLz
 5tkvjTG9MD3hreiOLnCvNR7yrYVheJIzdtVddRrGs/x9MLuNArFgVdNPMZJ9pmRTIWXjibs9SZR
 vQfNQbwK0I/EJQM98JYl82HPvInpFZBGCINiCaV/f02a9HOWYCCa3/uR63stHoL517FYK7K8/hG
 A6BOURf3yuu2GI4cItR91Q6FXA26UJqZ7dobKzLi1tF4nV2pIMMzYwzaP4+gL6Q4rx0VXiIMCAw
 kwtY8MkpFOzmqzFiUh9Jm+USCZDo1KBBxgpngPSbsT+dcPNMDd8MQVkbsgRoqk9UkIsldGxQZeV
 K6rtgA8lGW7ipB7Rvuf78ECXtv17LQNesRiNubEH4aGk3a3GoNgCdjA8rniLOrCkx1xkmdxp9NM
 UI+IcP3ZAby65bqgm6Oi1d0HtLqAzbyJI80tdS3age3/Z+4thiQLHtODJwcA6W6waqIv5ZC8oYq
 9hjQ5tgo54A3QKqgzvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090146



> On 22 Jul 2026, at 8:04=E2=80=AFAM, longlong yan =
<yanlonglong@kylinos.cn> wrote:
>=20
> mmap() is documented to return MAP_FAILED on error, but
> tm-signal-context-force-tm.c compares the return value against
> (void *)-1. Replace these with the standard MAP_FAILED macro for
> better readability and type safety.
>=20
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---

Tested this patch, by applying on top of mainline.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

# timeout set to 0
# selftests: powerpc/tm: tm-signal-context-force-tm
# test: tm_signal_context_force_tm
# tags: git_version:v7.3-rc2-28-g5572a2d442d5
# success: tm_signal_context_force_tm
ok 18 selftests: powerpc/tm: tm-signal-context-force-tm

Regards,
Venkat.
> .../testing/selftests/powerpc/tm/tm-signal-context-force-tm.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c =
b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> index 0a4bc479ae39..5dc0f12f467d 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> @@ -60,7 +60,7 @@ void usr_signal_handler(int signo, siginfo_t *si, =
void *uc)
> ucp->uc_link =3D mmap(NULL, sizeof(ucontext_t),
>    PROT_READ | PROT_WRITE,
>    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> - if (ucp->uc_link =3D=3D (void *)-1) {
> + if (ucp->uc_link =3D=3D MAP_FAILED) {
> perror("Mmap failed");
> exit(-1);
> }
> @@ -129,7 +129,7 @@ void tm_trap_test(void)
> ss.ss_size =3D SIGSTKSZ;
> ss.ss_flags =3D 0;
>=20
> - if (ss.ss_sp =3D=3D (void *)-1) {
> + if (ss.ss_sp =3D=3D MAP_FAILED) {
> perror("mmap error\n");
> exit(-1);
> }
> --=20
> 2.43.0
>=20

