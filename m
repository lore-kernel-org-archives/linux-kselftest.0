Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530508;
	b=5fAuhZ3sD9WXi04TKGi6KRijxsaeyX8EZkTEzQKl4wEzomrXNf+vnKwc5ozibxzHqNET
	 VoUCe2kz2kcWny0Gf1u/fg8qcMfioruy+vkGORo4UOZObxB3ioz262XFoJRlgDz4Msw5H
	 UmJgmuQ4/tJkCGggHRod3jWy341IJZhB1G6siL5Me1rmC03y096TE9b+saGIR7ITtfNA1
	 RDwsoDYSYta+HEVh+9eZM8hDD0m43hpxxy+9Xkoe1x7JobwfMKKVEeauZh4MOztmqAECQ
	 flT5NeQVD5K+0BylxP63zlL5me9yFSWHOuSCMfUF9G+Hyt1ZmCW7O+LbOlucBZvr+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iryZQVDWMboCr+mzKmPFMcC4rJjIhj+mBGOAQYXnrgQ=;
	b=jByThJzkVVH1snROHGvzzZRmxvqG+hlLzWwoihpG/sl6snDk3NyyHV3ohkOQu0xwxcoU
	 dY6Kcn6u+BKtr8sCLG+vFkKAj1Ol6ACEyWknj3NJM9eaJjDVW0PmBOxdwfn7FPfrrJicV
	 wdiWgQ8ghe/Yy20xUxlauQkRVU3O0GQUSo03a/0G6X7jfLz7K/QR8UnNdbg9zhtcWnyDI
	 arir6yF2rXyYayBtWlNUBv5jI7nbBOIlbK+RB0QwO0Ve3RGi7dXKq/LSDyO0EgfubBCT6
	 Y+ywt9YlSRWzJPMY5/lP5e2YRh/ziegRtAenqOK7KJTv/sN97xlmFfsJ04//UtwHmTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SuUdRgmn;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C4606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SuUdRgmn
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOB4VkE2236219;
	Tue, 24 Nov 2026 14:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iryZQV
	DWMboCr+mzKmPFMcC4rJjIhj+mBGOAQYXnrgQ=; b=SuUdRgmnxoRKE7RsLy2xSW
	0g/8sLa8/aFDv4r7IKiEumfvoyl9Zzb1nI5a1zmSHU+ZGbrM8OQ31oTEl3ClUyrj
	tfFHV/YNzy1nWe3vC10E+IYJmLQdPe2361ME/ibS8Wkt4zvl2rNHZnNckjRxzGc/
	doj0JVjWuoCDE1digOadraJnMiLa3vyckkfTnxGUjkQOpxytuWyZ+mZob+6BcCAb
	em+wI76RSyKIrhE4Tbt+uTZJueWcNi+YYfDNJXJ6I8CgSgSNnvVL47s32Jf63TD6
	R+Ra9z9BUss8ZIJ4/IZIExgB8XdsKUibWSuzeNaK5n14YskRnMveQM918N95ZtyA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkg2yw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 14:28:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCoR9U3374824;
	Tue, 24 Nov 2026 14:28:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5axkr9fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 14:28:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOESDdk39059860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 14:28:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A0C12004E;
	Tue, 24 Nov 2026 14:28:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD0552004B;
	Tue, 24 Nov 2026 14:28:10 +0000 (GMT)
Received: from [9.124.211.71] (unknown [9.124.211.71])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Nov 2026 14:28:10 +0000 (GMT)
Message-ID: <0b39ff0e-ee51-45f1-a361-5f0cb49d92b5@linux.ibm.com>
Date: Tue, 24 Nov 2026 19:58:09 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] Subject: [PATCH] selftests/powerpc/rtas: consolidate
 TEST_GEN_PROGS definitions
To: Shirisha G <shirisha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kselftest@vger.kernel.org, maddy@linux.ibm.com,
        venkat88@linux.ibm.com
References: <20260918052321.932660-1-shirisha@linux.ibm.com>
 <20260918052321.932660-7-shirisha@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260918052321.932660-7-shirisha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NSBTYWx0ZWRfX0pZweAluiFvj
 bf05hTBKthK8xpt45M5cunFlYj0SyDYzz6rQLZ71K2ScTtW7xa6xklO4UIYjqrrn+l/YDyV9Sie
 XyWmPZflKDmQUcZiQ+R+IRfYLW+NeaKpomZ3s+vwC4XyP5rdqeSme1DtqFH+7RqXdo4QeTdz1bc
 OzPooxv66K3ye9eCOVGDJqEIrkovwkKXi9Un+y/5e+4SpGWkdRTAymehXQ5peu+OiGIvwPrtoaR
 B39XTp7Q5O0gj7wK2wnW0PsL8dKSP3DErRE8XevzrFyH5HsS3ClX4wAXD02439K/c/Ef830xjaK
 JFY1F8SnpI2baAag6Er9eDQCIk0k0D2HsiSz3E597uIS22K3dG9sDWatAtI15DkjxqtX9JuGWUj
 vU7BjH9ilElwJvHrOfkcSXvHWE5FtqBxcARn4IMQ/ZK4Z6p2sRrTi6LVf2YVD8UBCt0rywkadHy
 BZSUHpYBEf2rZOvjGaA==
X-Proofpoint-ORIG-GUID: H7BOJJMqW5UG_I3VeXGFmdSMWdLjl--Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NSBTYWx0ZWRfX8bOgBtIT48d2
 rvToiAwD0ZucaaUZxH1ZbToTXN85aeD+do7o2URi220YskacrY12hU2JG/OdW8sFpjrAO+LegBy
 KJeSys9bKSzlqcVNf4XEP66HRW7nNCI=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b059f05 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=d9toeekAIwPyeozeaWsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: H7BOJJMqW5UG_I3VeXGFmdSMWdLjl--Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240055



On 18/09/26 10:52, Shirisha G wrote:
> Use a single TEST_GEN_PROGS assignment followed by incremental additions
> for the RTAS selftests binaries.
>
> Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
> ---
>   tools/testing/selftests/powerpc/rtas/Makefile | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 tools/testing/selftests/powerpc/rtas/Makefile
>
> diff --git a/tools/testing/selftests/powerpc/rtas/Makefile b/tools/testing/selftests/powerpc/rtas/Makefile
> new file mode 100644
> index 000000000000..eb30f62c5636
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/rtas/Makefile
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# RTAS tests
> +
> +TEST_GEN_PROGS := rtas_rtc_test
> +TEST_GEN_PROGS += nvram_test
> +TEST_GEN_PROGS += rtas_proc_test
> +TEST_GEN_PROGS += fadump_test
> +TEST_GEN_PROGS += rtas_flash_test

Each test patch should add its own TEST_GEN_PROGS entry. Please move
these lines into the patches that introduce the corresponding tests.

- Sourabh Jain
> +
> +top_srcdir = ../../../../..
> +include ../../lib.mk
> +
> +$(TEST_GEN_PROGS): utils.h
> +
> +CFLAGS += -I$(top_srcdir)/tools/testing/selftests/powerpc/include
> +CFLAGS += -Wall -Werror

