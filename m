Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDA3BC673;
	Sun, 20 Sep 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897309; cv=none; b=fHkcOG/Mt43HjI+Mz7URohLeFt7ipSEWqRkil2UXSMSwI4Ndmi78hq1XbwY1QPVPLgjzlB3IgOBd3kVYvYUEK1PjlhPqJ2syr0qbQLKsi4efGFvyuvT7k52LPn0UAfJlX6eMet7cOkhAXkGicx7Z9LR2jBAnXTL+Wy+b+s22zPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897309; c=relaxed/simple;
	bh=TTuOuv7aCRRrAmn0YrBd7cx6tuRrzf8AFE1A+BSio7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVTikAhAQG9Gm/Lcbip/qyz7zspYE5VJcWuUrrKAGykGmbR91IWxslTkGwPOvGsm9S16ANZCmy00Mw9jkuckfsUee7fxpbrlXM4YMAnY5kjnuWs7j6wMql0XXrWCBv6+mNG/rlWmJufckeBpQmILSa29n04gaUgNO/97tkll2Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Fw3c/ebX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Fw3c/ebX"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8ZYce373513;
	Sun, 20 Sep 2026 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Skt4E0DlbpMQaShuF9ydyq8SUj/gva
	nvR/EkNnFxXm8=; b=Fw3c/ebXgKWj1n14V+oJNAra/0LQzJXiLzppQWFy6MNAEe
	RCRDORY/2dwtOFLIEj/ZeiA6Z5zkkGg7ZZ5PIIRUjGXpPoUCGKKt0nXYYr3t8gHd
	dvP3K7DWdXD9l/rnjDNw+ZGLL/4jrabKAPIpka0Wjq1+LcLKkDpNg9LTKHx1a649
	VyogLuwWKb73ARV1Q6m5/8jJZbFo9KUQ9hgcez+IhkxIsgXIELDfiPNcWLVVtda8
	hVjsEOm1e7Sdj5r13mSlUKbXUDpkQCfU7rcORBrboG6UnFBtfjG6HOU3HnMBwnOb
	tIQ8jtRvAh7hkmcJg4pixZkEOz5AyTdds2A513kQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1c2uk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 20 Sep 2026 09:41:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8WV0O3689145;
	Sun, 20 Sep 2026 09:41:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gt4qq18yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Sep 2026 09:41:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68K9fKRj32309506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Sep 2026 09:41:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 308A920040;
	Sun, 20 Sep 2026 09:41:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 040AC20043;
	Sun, 20 Sep 2026 09:41:16 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.124.209.136])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 20 Sep 2026 09:41:15 +0000 (GMT)
Date: Sun, 20 Sep 2026 15:11:12 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: shuah@kernel.org, brauner@kernel.org, cyphar@cyphar.com,
        amir73il@gmail.com, jack@suse.cz, yeswanth@linux.ibm.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com
Subject: Re: [PATCH v3 2/2] selftests/filesystems: skip listxattr kernfs test
 if xattrs are present
Message-ID: <aq-qON6GF3Brn7pK@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <20260803150837.91604-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803150837.91604-1-disgoel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ONjsAxR8EUk4zd5baJ3F741udYP9QYvY
X-Authority-Analysis: v=2.4 cv=EOCTQFZC c=1 sm=1 tr=0 ts=6aafaa45 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Y5d25qPl2hKq6r7L3g4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzOCBTYWx0ZWRfX4L0gnUadzTFY
 Gqkdx9+V+dvOgwAMevoQmsIJiZdFC1ALorZHU1x6XNnIbWhM1z2uy8gOmaWAooeVJWVJzLkKxnY
 LPncSj69TiL/lvnlDxmQU7OAOJg1QcQ=
X-Proofpoint-GUID: B6jI9vcFy1WNlvGhwbGXD670-dEl7ZQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzOCBTYWx0ZWRfXyEiUiIlPckrb
 1aQdWzl3KwvG3SEUcYTxYlmuccHtHyGnbeIFyvGnQZSFUTjQ4OF6ryVrU8aGESwy8oe00JA8evQ
 hMtDUKyCaPsV5RyhVjKVqYbZK2sIywN76+wNIhk9O55Y8yHgElXbgjsYyENltQ8GVYZJ/eRnteC
 4XZXNFlWS8R/C34R1xzVeOdhvyOQ959Z12XddWlAkmpNbAWZ+s5KYhpVVGzk8zKuHjhvlMcNDu7
 GsCbP8/soTrYzzJIUAq6/hQff27OKJ5JDeFymf1r2PwyEpqvkg3zPmT6C14CMQAEe9nTXPB2oIY
 zxgTMQfEqB7X5XDmPXGz97PzEEPMLXuvtLSrgxWVdoFx2y6cvyBoFWAHQfQ9WURz/QPs8ZarsS7
 oEp6idowg1q70qvJOwZ3bs+CcpYq010VA9pwYm2VVqsVMEET5ImOCYwd5C9WnLvKeTyLqPpG1Fz
 Om34WkuMBsjnwcSt5OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200138

On Mon, Aug 03, 2026 at 08:38:37PM +0530, Disha Goel wrote:
> kernfs_test assumes that flistxattr() on /sys/kernel/warn_count always
> returns an empty list. However, systems with SELinux enabled may expose
> security.selinux xattr via listxattr() during policy load, which makes
> the test fail even though kernfs is behaving correctly.
> 
> Skip the xattr content check if any xattrs are present, while still
> verifying that flistxattr() succeeds (returns >= 0) on a kernfs file.
> The existing user.foo getxattr check remains unchanged.
> 
> This avoids false failures on SELinux-enabled systems while preserving
> the original purpose of the test.
> 
> Tested-by: Yeswanth Krishna <yeswanth@linux.ibm.com>
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
> ---
> v2 -> v3
> - Skip the xattr content check instead of allowlisting security.selinux,
>   as suggested by Ojaswin.
> - Add Tested-by tag.
> 
> Link to v2: https://lore.kernel.org/all/20260521101758.14639-2-disgoel@linux.ibm.com/

Thanks for the change, looks good now.

Feel free to add:
Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>

Regards,
ojaswin
 
> 
>  .../testing/selftests/filesystems/kernfs_test.c  | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
> index 84c2b910a60d..ca13646c9328 100644
> --- a/tools/testing/selftests/filesystems/kernfs_test.c
> +++ b/tools/testing/selftests/filesystems/kernfs_test.c
> @@ -12,12 +12,24 @@
>  
>  TEST(kernfs_listxattr)
>  {
> +	ssize_t len;
>  	int fd;
>  
> -	/* Read-only file that can never have any extended attributes set. */
> +	/* Read-only file that can never have any extended attributes set.
> +	 * However, on systems with SELinux enabled, security.selinux xattr
> +	 * may be present. Skip the content check if any xattrs are found.
> +	 */
>  	fd = open("/sys/kernel/warn_count", O_RDONLY | O_CLOEXEC);
>  	ASSERT_GE(fd, 0);
> -	ASSERT_EQ(flistxattr(fd, NULL, 0), 0);
> +
> +	len = flistxattr(fd, NULL, 0);
> +	ASSERT_GE(len, 0);
> +
> +	if (len > 0) {
> +		close(fd);
> +		SKIP(return, "xattrs present on /sys/kernel/warn_count, skipping xattr content check");
> +	}
> +
>  	EXPECT_EQ(close(fd), 0);
>  }
>  
> -- 
> 2.45.1
> 
