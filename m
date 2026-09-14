Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD76F3E49DB;
	Mon, 14 Sep 2026 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370505; cv=none; b=mPcDdoljGuO1H9k9f9YgDslvzB8tTLRlEjjPq1CMOjBewBPboqywOyvWrLmE6Th7xIqS6G14pnve4F606S+3CxI5YvfLVBgvLOlYzwHYQ7urkxneukc38fEsC+6pzP7NOs1blXEBdK+B4QE3Iw6T1E1DUp6KlQ7KWzMV8GWettQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370505; c=relaxed/simple;
	bh=z9NLyr5qGPBtCirsQG24bDt1NKIi/i+eyRvxZel7a9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1WY5z8i4bAYQdNnyiY726c64cWq4if7SY95VhQPD0R25SIDc6tUdN82tR8O54i3o8Eq6t2g7Vr2XEtODZtlaNvYbBzbYaB/J6BFq0xIE8Z+0IuTqPOsEev/tZZNkalY99zW5GiF2Dvqf6i70MT62j7y79r2p7M8LWXSLmRU91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=riad50NH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="riad50NH"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E61ZIX1243011;
	Mon, 14 Sep 2026 07:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aSrUav
	tWrPoutvo8Widw7jUErDEtIcp0dpPIVdX3eXk=; b=riad50NHXo6+I+VazMTrSK
	pw/Z9BjSWPsadrfwhS1VoyRDt3nFmRUXFq0cYwGfp8h9g5dSJIk84U3w8lAAzEeb
	1hTdsyqZcOiv+c6fmm9muizFByLPlPeaBmrzffN1FHv+5gjN3cv6qxYCVr0NPbmI
	gJyBx6MTAbX0LITFQ9/N8tbs4dw7HXkaEZB+IJFMJ0tebzILZbKnnZmJtikWbTms
	tZYVG3Cs72wjSJz7aS3JZNF1uX18/bYYANBF25CbTnnUtTVEiwwX64sKwBEzLgJx
	IW3s9KRqYHz+HYxS7vuEZHfQXU+9eRxJHz7ROeJQ2kQThj4OX5fAda6nRysed55g
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcuqkab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:21:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5o4VJ1775096;
	Mon, 14 Sep 2026 07:21:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gnhevvp6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:21:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68E7LONR52298030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 07:21:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E5320043;
	Mon, 14 Sep 2026 07:21:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8051C2004B;
	Mon, 14 Sep 2026 07:21:20 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.93.83])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Sep 2026 07:21:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, longlong yan <yanlonglong@kylinos.cn>
Cc: npiggin@gmail.com, chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/powerpc: use MAP_FAILED instead of (void *)-1 in tm-signal-context-force-tm
Date: Mon, 14 Sep 2026 12:51:18 +0530
Message-ID: <178919368041.441103.208453892352199243.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722023428.932-1-yanlonglong@kylinos.cn>
References: <20260722023428.932-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX2YKcleLpq/6b
 EYBj2joxXjDI3dPvzTrjakaAEZeLzPC7s9zauSPkN3qhTwcBobuJjwv8AxR/XFThvtf/V89khRn
 sqY60/pv5nKG4t0b/4XGUIuCyPQdHKE=
X-Proofpoint-ORIG-GUID: krgBYSi_lFhbe7FdT2mAxXhvJFkqvcb2
X-Proofpoint-GUID: St9xalCv9EvyCscc7RDcekdq2WZGIA3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/7p7cbieHdBj
 ucC0sRuIqMHgoI1Abr/qxl6MKEAT5ws9Bcm3g/9lFUSAtPW3jPJ0XjrZp8gnSRjBge1b1IMHndi
 QumEombF6cEv9Fm2TMQ8NsDUHT7+K1/tepw3tVxm1xQGIMXEGn69U7kMrkWPTqxHjJxAzcSSHub
 LLe2Jl/icfkpl8YWaLekyCpk+SlpW2HC4O1nQ/R1RgG2BDHRQBk57lD6FqSbQnvZ7Irgv/1Hnie
 ZX/R1LEKMXXejOBiZcA+5rxjgxGYkfuFz6Xkiv9ebxyjHCSmnSOn++45ykeLE5YAzgVjyMhmrlm
 Khp0NuYGwsodL1aQVgwkcQ316T9BuYL/y5e4BwfOVVO67hm2LBhpKDrnGdDs6hXP+hHq+M3PtnO
 fapCAaOY5o4S9FvvwXrdYHqdCVGgmrUCGKI8io6NPi6fi4TcjayejcKY38d9z2hWAom767R200x
 zUMjGhqsAnSO8MllALw==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aa7a077 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=jyw6kHy9CTd0Shu9bYAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

On Wed, 22 Jul 2026 10:34:28 +0800, longlong yan wrote:
> mmap() is documented to return MAP_FAILED on error, but
> tm-signal-context-force-tm.c compares the return value against
> (void *)-1. Replace these with the standard MAP_FAILED macro for
> better readability and type safety.
> 
> 

Applied to powerpc/fixes.

[1/1] selftests/powerpc: use MAP_FAILED instead of (void *)-1 in tm-signal-context-force-tm
      https://git.kernel.org/powerpc/c/bf1d8287816194457c1a936056ad2d1e1e478944

cheers
