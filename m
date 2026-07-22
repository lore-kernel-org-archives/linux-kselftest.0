Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0343C09E5;
	Wed, 22 Jul 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713185; cv=none; b=tYEV21Ki2sLp0fnEOu85Md0bOleNnU78ql5+OuPfMBUi0XPTUDf79n92dBZvf/4g3BXHUzHOIfweaFWlGyNupdmm1NI6zg+24wuIjfgp+mTXIJL3XhqIYEG94tZHAc1FL7XlIbmb7lFz52dtWUSgTfTq/pDvQ9qhIZkYHG/bXYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713185; c=relaxed/simple;
	bh=HeiGLpIcFOv9ugrMaVEBkKL6C72LJtns0/xmNAzaGEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1GdRwM70mVBs+LfyqeOTUa75ZYTqlyIe9Dbko4TWLSyNLaOz8/J4vQhASvF0VOaGHBKM7STyzyXo5JvhLWWqxh1SQEUdM4cetEvW3h4+bP8HA3xgfMZO1sF/dkkvwDD3Vcz9jo1SM5VnjrE6yfA5sLsqQqRolfv67IDu2zyvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qn7RaQGA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qn7RaQGA"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9BdLx3662534;
	Wed, 22 Jul 2026 09:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=3+NNsGyiK9CxewWiMiMkQYrP5ogKxM
	RH0y8i6UkvTHk=; b=qn7RaQGA+MzpEz4j2DGVf6RyxAUDVpIBCcVo4lPURrGCkh
	tUHGQSu2FsUmZiKqlT+1E/KaSP/n0v0FkR/sOIevt7lrOS08hQd8S4CN4uxg+wqm
	0nWay96pYy0C0fhRqmZr1OosbQMDxo5KW97u5UyjNjyFEwzVT6kYPbN6imCiXC9J
	okPp+0FM690MPlaZyv77N2OVMheaYJ6zFD51kkKeVwPP8Y6vleO+uOdBH4U0F+pn
	RLrP2Y7BD3WTH/DyaZsT5ip0bds9lzdXWi6H1mKdp3oC5bc3xYtz/TjOeYpqMiQg
	wTg0mHCctBYUypRkvrs3jLF8gTv+DinNTl2v1YrQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fg7abhdeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 09:39:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66M9YaLp005959;
	Wed, 22 Jul 2026 09:39:21 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fgktq6u8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 09:39:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66M9dJuw55968114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2026 09:39:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4024200C5;
	Wed, 22 Jul 2026 09:39:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1F21200BD;
	Wed, 22 Jul 2026 09:39:17 +0000 (GMT)
Received: from fedora (unknown [9.5.7.39])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Jul 2026 09:39:17 +0000 (GMT)
Date: Wed, 22 Jul 2026 15:09:22 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/powerpc: use MAP_FAILED instead of (void *)-1
 in  tm-signal-context-force-tm
Message-ID: <20260722135555.0e8fd8a6-a7-amachhiw@linux.ibm.com>
Mail-Followup-To: longlong yan <yanlonglong@kylinos.cn>, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org
References: <20260722023428.932-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722023428.932-1-yanlonglong@kylinos.cn>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfX3EJ4oTO02D0+
 MJ9C1aI1iW0AU2hKL3NxaiKlJV0SFGC6XT4kmaTrEa5/nMrn1C5OBfJXL5uZ+9WB/IoRr/Z2TXn
 9Qu6EjhTVYQ/SECtDKnfbZVc7ZkTVYdqpOkdY5KywF03oXt3eGgfcX0OoGrHuQhswNEg3v1QRwT
 0SbSq8Jto3VBwnDS/ojm/paAjB3MJms96BLqiTN2f/4SF2QvzevZseEFwRITkU9ed6ob9lI1J3/
 pYRYFwL5HbOslbeDYiKVaeCwlU42UqI+RhTOUdFO+blkZdGb3ZdzD+5SBOOVQaTi2b2ig2NBbv2
 lHSJ4bfozFBzZQgKUkhQx0Pq2iX+AF2W7yw6/LJO4GoGin7xGhyNnU1yhiCiDszQ+gGL9AQF+c0
 wo8joivqsDB/ca5rq6I+dNKwRhxVRygI0Uq3Av+tkK9kX9X5T4PG/BtHPH1CW4RwUG+R7FYb+18
 4hJqdf637+e2REgyq+w==
X-Authority-Analysis: v=2.4 cv=F7ZnsKhN c=1 sm=1 tr=0 ts=6a608fcb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=OvgY56bCG6SZeGXbB8IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uVD3uq5iQkjy7GnyEMm0LyidBBjU9xxS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfX0hD15Edo+WUO
 zon4CbqAkFGHDXysnfmJScoNaL6L5MVhZ2ZGyDpuK2HHTk6m19sKmuHW/sftOzvSYFVNvJu7iAM
 85HK1cviAUwXde5QTWnrTljUD6c63Qs=
X-Proofpoint-GUID: PdQ9SSURt5SCdnwv_5KZXaKmhnRrZD8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220087

On 2026/07/22 10:34 AM, longlong yan wrote:
> mmap() is documented to return MAP_FAILED on error, but
> tm-signal-context-force-tm.c compares the return value against
> (void *)-1. Replace these with the standard MAP_FAILED macro for
> better readability and type safety.

The mmap man page does confirm:

  RETURN VALUE
         On success, mmap() returns a pointer to the mapped area.  On
         error, the value MAP_FAILED (that is, (void *) -1) is returned,
         and errno is set to indicate the error.

So, the MAP_FAILED substitution looks correct. Please feel free to add:

Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Thanks,
Amit

> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  .../testing/selftests/powerpc/tm/tm-signal-context-force-tm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> index 0a4bc479ae39..5dc0f12f467d 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> @@ -60,7 +60,7 @@ void usr_signal_handler(int signo, siginfo_t *si, void *uc)
>  	ucp->uc_link = mmap(NULL, sizeof(ucontext_t),
>  			    PROT_READ | PROT_WRITE,
>  			    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> -	if (ucp->uc_link == (void *)-1) {
> +	if (ucp->uc_link == MAP_FAILED) {
>  		perror("Mmap failed");
>  		exit(-1);
>  	}
> @@ -129,7 +129,7 @@ void tm_trap_test(void)
>  		ss.ss_size = SIGSTKSZ;
>  		ss.ss_flags = 0;
>  
> -		if (ss.ss_sp == (void *)-1) {
> +		if (ss.ss_sp == MAP_FAILED) {
>  			perror("mmap error\n");
>  			exit(-1);
>  		}
> -- 
> 2.43.0
> 
