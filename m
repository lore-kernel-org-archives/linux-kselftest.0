Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B6283FD4;
	Wed, 17 Jun 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695103; cv=none; b=RvR37MTGQe0hH5L6Mda7QXCx0prh59yJ6WamqBKbLVkAYApgL3tb3UhxsUdmbuXEJLPZXFp8XkfhefuMZ8fzR0dzf/VKWlHgSX2KNYEmVUKJtmnsiOu//9C4qEbIBuYzt4jhF6toFQ46NzAXKUS3p1u5UU3RRDXC4GS9t0XvwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695103; c=relaxed/simple;
	bh=Ovbv1wVWesLUEMi7MRtd1yUR/cw/5X3YYXwSLiO85iU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ThH+Ifhaniczyt3zqWIDC28qeb3EnzQ3DgYSSS+6iXHVFdyYsFRhto9xiKS92/wjCva/PsVdmd670OGHeI2tPrB9s0Xzz04RzjN4kJ+niLtQKuswP9P0crkaGhPWCFIq/DEwUjYVjmHUfynWgyq/CNmaJPZ/5j+M4aIq7G6KFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ggsRb1gz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ggsRb1gz"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8mvoR4022498;
	Wed, 17 Jun 2026 11:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K/BYBw
	lrh+/cauKNwv6NTItpL2Yv1/vTfSj+08Uc820=; b=ggsRb1gzIMsVV5TCw8zsLq
	687ZB/m8jw0UGZfs8jcRFL7/JkTic4SlP/VpZ9I86QoRYsE9QHZATaX6z9wBXwoo
	EnkvneFK+6R6BF3y7PGuMZEvhMjHhoX46E68GC3FVRKEuk1qnmaDzuD0mr34U6iD
	kev0G84onunxQnXMJCkVzzqGEMcgZZctC3IDTjpzfQ/EgVWMKWfvzCZWFuZmjBle
	Lcg/hzMzrChDPnsb4GN7thr+ErTX51dnHpa7i88CYYjgi5XHOgrqX9mp8bldRDgz
	vPAzU0XnxUGuaFVITIYtyphwqBGBaScUq2g59wx5FV9xnJsNEGxnDBaPc7cDiemw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqx2j1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 11:18:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HB4cgm020026;
	Wed, 17 Jun 2026 11:18:15 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eudva2ugy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 11:18:15 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HBIFt924969762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 11:18:15 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06EE858059;
	Wed, 17 Jun 2026 11:18:15 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BBB758053;
	Wed, 17 Jun 2026 11:18:13 +0000 (GMT)
Received: from [9.123.6.235] (unknown [9.123.6.235])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Jun 2026 11:18:12 +0000 (GMT)
Message-ID: <6017445d-6cd3-4b20-8678-4a09ef20ce6c@linux.ibm.com>
Date: Wed, 17 Jun 2026 16:48:11 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yeswanth Krishna <yeswanth@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] selftests/filesystems: allow security.selinux
 xattr in listxattr kernfs test
To: Disha Goel <disgoel@linux.ibm.com>, shuah@kernel.org
Cc: brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
 <20260521101758.14639-2-disgoel@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260521101758.14639-2-disgoel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfX5erRo9cX+xaL
 oyKVJgN38FeA7MdYseX3EXUK+nzcMGPO1SJBds7B3XdyzS21bcBe0PgxFnJFS5klR2XbOZoXRQV
 ZSTBugsdK/zuTjcy34J8MWpMl52xIqjd6LW11yy9k6xiWmZdBinlZgsYPIZn9XHELLX4cOhl8+M
 Pa96V+qQ2f/zlvY3MnSFKpQibqsgvMuhNSJ4bgthy05wdLP2v7QmBAJQ/mwLGO6TDCBYwvCaL8H
 VEgv+cjD5RivAZx0QfAuImSC11LOu7pNRXcjw3jwOvJPqBrMF2xe5FA1HxhzDSN5+D0FnObnw0o
 bqcbarkXdos8J2Ys8DZONnTttJwmpkCEJDVqmiuoeQ0aXqgunyuRvfDOjr6goTTP2aXvMzldqAF
 +r+y0IHjY4GZS32u0jnE4H+0ccT4gi/Dvqan3achFxJEHgUHS8L6kxbF+A93Wolg2C2yIMTXueJ
 8+oIL0X1G6pW1GgztZw==
X-Proofpoint-GUID: EvKq5F1XNZvPNVXLu5SE_iFttE1kKEzc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfX2bIpcY+kvsNu
 FyKR5MYtmWarbKKd7QL6ZhuUkZxi5t0Q6890D727vAgecFEnsw1BkN8RLl9DVKqrho7KwG03vHg
 IGJyW3ECESokQBbbIEBWli3uq/YC3sE=
X-Proofpoint-ORIG-GUID: EvKq5F1XNZvPNVXLu5SE_iFttE1kKEzc
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a328278 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=gE-MmNtdKQ2aI5B3L7MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170107

On 21/05/26 3:47 pm, Disha Goel wrote:

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
> Signed-off-by: Disha Goel<disgoel@linux.ibm.com>
> ---

Hi Disha,

I have tested this patch on my ppc64le system and it works as expected.

Test Environment:
- Kernel: Linux (mainline)

Logs
====
# make -C tools/testing/selftests/filesystems run_tests
make: Entering directory '/root/linux/tools/testing/selftests/filesystems'
# timeout set to 45
# selftests: filesystems: kernfs_test
# TAP version 13
# 1..2
# # Starting 2 tests from 1 test cases.
# #  RUN           global.kernfs_listxattr ...
# #            OK  global.kernfs_listxattr
# ok 1 global.kernfs_listxattr
# #  RUN           global.kernfs_getxattr ...
# #            OK  global.kernfs_getxattr
# ok 2 global.kernfs_getxattr
# # PASSED: 2 / 2 tests passed.
# # Totals: pass:2 fail:0 xfail:0 xpass:0 skip:0 error:0
ok 3 selftests: filesystems: kernfs_test
|All filesystem selftests also passed without issues.|

Please add below tag.

Tested-by: Yeswanth Krishna<yeswanth@linux.ibm.com>

Thanks,
Yeswanth Krishna

>   .../selftests/filesystems/kernfs_test.c       | 27 +++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
> index 84c2b910a60d..a5e480d662e0 100644
> --- a/tools/testing/selftests/filesystems/kernfs_test.c
> +++ b/tools/testing/selftests/filesystems/kernfs_test.c
> @@ -4,6 +4,8 @@
>   
>   #include <fcntl.h>
>   #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>   #include <sys/stat.h>
>   #include <sys/xattr.h>
>   
> @@ -12,12 +14,33 @@
>   
>   TEST(kernfs_listxattr)
>   {
> +	char *buf, *xattr;
> +	ssize_t len, ret;
>   	int fd;
>   
> -	/* Read-only file that can never have any extended attributes set. */
> +	/* Read-only file that can never have any extended attributes set.
> +	 * However, SELinux may set security.selinux xattr on kernfs files
> +	 * during policy load, so we explicitly ignore it.
> +	 */
>   	fd = open("/sys/kernel/warn_count", O_RDONLY | O_CLOEXEC);
>   	ASSERT_GE(fd, 0);
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
> +
> +		free(buf);
> +	}
> +
>   	EXPECT_EQ(close(fd), 0);
>   }
>   
