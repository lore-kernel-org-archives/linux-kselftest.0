Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865E72622;
	Tue, 19 May 2026 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163418; cv=none; b=hCbdKLFTbeCZXGDaZ7ucT9OYySGg8k2fojAJ1QA5ZJ/o7Q4fOjNbaP7gtsG1ZyMO/3iZADvfVG98nKFX3W09MYuDyMzkMUeR8rtyhS/NeIUtlrk+SSv5Rsawy/fgk892eQu7S8JLRqaJNhcKgYlREFqWiTmRDsrAe10myCQzW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163418; c=relaxed/simple;
	bh=tGdmGus3tobMvv3dkIiveN4oyyaiapIhwN+3/WQ8Aak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MjpzEGyOKBhNmnk7QyR8NjDZOB2O9FHu3pEp7yt4nEh6fTRST4rmmu4C1EIcHzUHsJVV6S3CbVdX8u7n8c7c5QOlU0Q/OQyl6qXgRPeZ143DtOff7iB9kkDSWkVPR+1nTJI5gCcsfBVq7jKXffAUjEJLHRX0REsQctR0+Jd1h5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XzAcTUhX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XzAcTUhX"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IIY5SU3601206;
	Tue, 19 May 2026 04:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ca3jQm
	gYoBxwt2hfWOIQFk+4l+px1wE9D3uZ46WvRh0=; b=XzAcTUhXYo0iuGZnk4r/LH
	e7BHU75pPHzA2f6oIKuXc28kfH4gMc+uja55SVGA9XWeKn3nwBzimD9skbofbzAN
	JpRnuRp5vOOxiMhuJ4ZDfkXLrPDseSHxN7Lg82BITDXRdv6rInvGyTIKzsadhM6h
	2ve6ftBzF+EfVjxtnnvbaLHZSOt93W65yc9b+691ZMN4KyMbsn47aI9YKv+Q4th/
	jdur41iBNQKEQ+XmuUfed8VJIXd2+TM6fE4fGYlS7lBbaXnjfp0dFFB2539xrsTg
	h8H/Cls3yVtGxfxUgoNL2aDznylzq1gkpUylOZU6zH15J+es+5jHaKtBMdim1urw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h8mk2e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:03:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J3s9aG021158;
	Tue, 19 May 2026 04:03:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk0vxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:03:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64J43LdI48824700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 04:03:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6183920049;
	Tue, 19 May 2026 04:03:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E632020040;
	Tue, 19 May 2026 04:03:18 +0000 (GMT)
Received: from aboo.ibm.com (unknown [9.39.29.16])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 04:03:18 +0000 (GMT)
Message-ID: <a315968224c2f22da8dea7f7fe16588221378f8e.camel@linux.ibm.com>
Subject: Re: [PATCH 0/3] selftests/mm: assorted fixes for hmm-tests
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, Sayali Patil <sayalip@linux.ibm.com>,
        linux-kernel@vger.kernel.org, aboorvad@linux.ibm.com
Date: Tue, 19 May 2026 09:33:17 +0530
In-Reply-To: <20260512200631.b52b15dd47cdbfb887ab3e3b@linux-foundation.org>
References: <cover.1777870179.git.aboorvad@linux.ibm.com>
	 <20260512200631.b52b15dd47cdbfb887ab3e3b@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jq04XcvYFihocjfvOVCOObX_xZCw9uuG
X-Authority-Analysis: v=2.4 cv=GYMnWwXL c=1 sm=1 tr=0 ts=6a0be110 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=WStnval94jwVSkObcqcA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: jq04XcvYFihocjfvOVCOObX_xZCw9uuG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzMSBTYWx0ZWRfX309KTbWepcXD
 7CUmOuKIMXG+RhTWfqiellPXKHYAe4HggTZOz6Ts+X3hWK+PCCraW76zH/nXisS/BoyzANNqIKU
 zkZbpLxUByPWAbRBLCSayIIyUUTlzQ482p0kO2YKn7GAD9ExWR5UIUf47zNafITBsVNvw0kNzXU
 GCMXwExniWnM9n3RcBLsqEuxoJvbj2FfxJLBDyQDqPqdv8UkGIokCly/lANN+ffpz1TBeGNJRlC
 00ThDiR3XUxy6nF4WoYvS3tAxO5kdFILNwJ/BOa/X/2akK2iHzx5KHl3ynVgxfhavm2cT/DU7C9
 IzMvaz6GQNVQ6IN8jN592XO31gCFiZzCWOcFwnPOVNR6Jt/lpXLB2ARzBvwzOirxdTrRn150OeK
 k5USKq7sVEvzDPUsgpG5FJPeXP0SYjV6nCNWbQxGGT4mjXM2UD7Y4/Td2CquvGQ7TMUxpdGj+ZV
 8FSADXAiZqVX9GNPiRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190031

On Tue, 2026-05-12 at 20:06 -0700, Andrew Morton wrote:
> On Mon,=C2=A0 4 May 2026 14:41:05 +0530 Aboorva Devarajan <aboorvad@linux=
.ibm.com> wrote:
>=20
> > This series fixes a few issues in hmm-tests that show up when
> > page-size and huge-page configuration differ from the hardcoded
> > assumptions the tests were written for (PMD/THP sizing, default
> > hugepage size, and related cases).
> >=20
> > It also includes a minor fix to exclusive_cow: the test ignored the
> > return value of fork(), so both parent and child ran the same teardown
> > path.
>=20
> Thanks.=C2=A0 AI review asked a few reasonable-sounding questions:
> 	https://sashiko.dev/#/patchset/cover.1777870179.git.aboorvad@linux.ibm.c=
om

Hi Andrew,

yes, we will address these and send a v2.

Thanks,
Aboorva
