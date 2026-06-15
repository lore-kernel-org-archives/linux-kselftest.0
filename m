Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF3F267AF2;
	Mon, 15 Jun 2026 05:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500782; cv=none; b=YPGShfuJbOCwckbt6a5Gtn647uu2n2GPicef2ho2ClvaFmLnQCM66bGpM1xZ5av4Irva7+7WEwWyYDRnjBuMVqvfg5Q1YcklXCp6e6F+aPbjYZvUNahZBoKdiVVztP6EOo6LylRRnuhdl3ednT7RcWBCjr9pMZ0yUazaDctLF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500782; c=relaxed/simple;
	bh=S7L7x+32c5lUhbucYzbdr88oreZ2IGsNxVjEJ1ErFfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE300R1fgJF5knFGQW96VPd5BQFFbHVIpQeH+zFhRoi64/om6oW6ofmjQ+XiRYb6/ajuB0DOvADxyhPzqb4ptBowPkySOghSu98fLKhtrux8Ab6i/Tb0X9bb3A6DkS7m/F/7S8m+xUg8GtH3hrGuIG70AKlbWhhZnQ25+iGaeOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ny0yyHGq; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ny0yyHGq"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1nSPh953946;
	Mon, 15 Jun 2026 05:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=y4WAWHHpKXyUOpR9MYfsdk2Z7Xa2Gg
	rcKfS3GeYk5VM=; b=ny0yyHGqidaJb8fzX4/ROoCtzfwjO6x1yhDSNMxYdy/u4/
	hq0ay283Tlfuv6G6JpXtLt74EEECN1MOslXW4ie+11Z+CXR3b+/qLJM3Bd3fHHz2
	F+WJ9KvSxx+qhfbqalob0+tHpEhhnUJnaxoPKOrPKh1zoJRSETh8rq+uOaz9Zo3b
	BerkrTvkukLfUICG2FTtS4e0Wa29X+jS/S+PFq5lpAYzzmftwc8pYkce4dgm8LoR
	ytJuyY1qgTgOP2UQBze5r9Oc5ZcUt2nxxU0T2OHMTomTR6rxfS5fpdbYuBRhBWR9
	8egS+jgGnQsIprvxvfzFL+0NZPmwtn4nLMqM834g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4es1v26fc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 05:19:38 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65F5Jbq7018279;
	Mon, 15 Jun 2026 05:19:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eskrg4x05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 05:19:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65F5JZRS48824814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jun 2026 05:19:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A76372004B;
	Mon, 15 Jun 2026 05:19:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFA3120040;
	Mon, 15 Jun 2026 05:19:32 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.124.215.190])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Jun 2026 05:19:32 +0000 (GMT)
Date: Mon, 15 Jun 2026 10:49:28 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: shuah@kernel.org, brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/filesystems: allow security.selinux
 xattr in listxattr kernfs test
Message-ID: <ai-LYN1iWl6VR6s5@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
 <20260521101758.14639-2-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521101758.14639-2-disgoel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1MyBTYWx0ZWRfX2HnRoCZ+Gt2i
 YX7ITsJKZTLqTTYSJze/fAArWHLi2FdWbbpEt7XeyTz7NFDnp4Ckac8zTzofQA9ptV1o3HpSYlm
 5QBNJ4NIsPzxCy1fY1kuNP9bYL/GDm0=
X-Proofpoint-GUID: lW0OpqYtU65_xm9x9nkZkxbv2VFi8Kmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1MyBTYWx0ZWRfX9Cm4P8wZpBCl
 7HGkT9A5fAoZECGO6B6J5rN5Lp0SFgKz4U1/7vT2LGo4iHWb/suXuPVh0fqQ5D3z9+oatmmBPlp
 m5aazF5BZRRfKPexcNmLMgn+Vlov3ai/1EMLn2HT4fHdXNaM+4DQZpTsHIST3wSZa/FAKPx3qgz
 OHTg6XO4+zrAuDSHXTCLZmngt5e4fjEbtJDrmyMrdImgyR2bmmHooUrNKdDx9Z6w/ATe1QYDiMr
 FLysgdM46k9dGeY4Lu1+bP/blYpgfT58dvdIGD4pbIDUDPdGNfZZIqe/LoObJcEEISBcw9jM20i
 X4USBUaXTGWbSWm5mmAr4q8qiy9VPzgYpMHYefXx8LL9+MfE4jMFpE4uSKTszSHENXm0VOFSxao
 itRmH9iTxtqnLvFtYiYhS8kgMM9FJI+26B7y/wGLlSyvPEKEeepzkkcR72XJ15bEmys7h+zEyKT
 NrdjtiJTvVLozrSM5+A==
X-Proofpoint-ORIG-GUID: lW0OpqYtU65_xm9x9nkZkxbv2VFi8Kmk
X-Authority-Analysis: v=2.4 cv=Dd0nbPtW c=1 sm=1 tr=0 ts=6a2f8b6a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=uZYzrYpDve5o_9i6NpYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150053

On Thu, May 21, 2026 at 03:47:57PM +0530, Disha Goel wrote:
> kernfs_test assumes that flistxattr() on /sys/kernel/warn_count always
> returns an empty list. However, systems with SELinux enabled may expose
> security.selinux xattr via listxattr() during policy load, which makes
> the test fail even though kernfs is behaving correctly.
> 
> Allow security.selinux xattr in kernfs_listxattr while continuing to
> reject other unexpected xattrs. Keep the existing user.foo getxattr
> check unchanged.
> 
> This avoids false failures on SELinux-enabled systems while preserving
> the original purpose of the test.
> 
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
> ---
>  .../selftests/filesystems/kernfs_test.c       | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
> index 84c2b910a60d..a5e480d662e0 100644
> --- a/tools/testing/selftests/filesystems/kernfs_test.c
> +++ b/tools/testing/selftests/filesystems/kernfs_test.c
> @@ -4,6 +4,8 @@
>  
>  #include <fcntl.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <sys/stat.h>
>  #include <sys/xattr.h>
>  
> @@ -12,12 +14,33 @@
>  
>  TEST(kernfs_listxattr)
>  {
> +	char *buf, *xattr;
> +	ssize_t len, ret;
>  	int fd;
>  
> -	/* Read-only file that can never have any extended attributes set. */
> +	/* Read-only file that can never have any extended attributes set.
> +	 * However, SELinux may set security.selinux xattr on kernfs files
> +	 * during policy load, so we explicitly ignore it.
> +	 */
>  	fd = open("/sys/kernel/warn_count", O_RDONLY | O_CLOEXEC);
>  	ASSERT_GE(fd, 0);
> -	ASSERT_EQ(flistxattr(fd, NULL, 0), 0);
> +
> +	len = flistxattr(fd, NULL, 0);
> +	ASSERT_GE(len, 0);
> +
> +	if (len > 0) {
> +		buf = malloc(len);
> +		ASSERT_NE(buf, NULL);
> +
> +		ret = flistxattr(fd, buf, len);
> +		ASSERT_EQ(ret, len);
> +
> +		for (xattr = buf; xattr < buf + len; xattr += strlen(xattr) + 1)
> +			ASSERT_EQ(strcmp(xattr, "security.selinux"), 0);

Hi Disha,

Yes we did check that this particular file was showing selinux xattrs,
so I guess the test's assumption is wrong. 

However, looking a bit more closely this test is designed to check that
when no xattrs are set then listxattr() always returns 0 and getxattr()
returns ENODATA. So having SELinux attributes defeats the purpose of the
test.

Maybe a better approach would be to just skip the test if any SELinux
attribute (or any attribute) is present on this file. Idk if with
SELinux its possible to have a file with no attr, if there is then maybe
we should use that file instead.

Regards,
Ojaswin

> +
> +		free(buf);
> +	}
> +
>  	EXPECT_EQ(close(fd), 0);
>  }
>  
> -- 
> 2.45.1
> 
