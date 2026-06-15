Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8922356C6;
	Mon, 15 Jun 2026 05:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500333; cv=none; b=bd6hzZvov0ZibBjkE/D2Fr16qRemcOu/0S3AJU85Ff0URxAAA0x0nE0WrXJWX9lWNm60wKzWBdDvFMKWzw8oJJsx9HghvBDTajhrq9ed9mA3F9YyRAT3GnhXf0DB05LvFE+cRiEg6pWTcnPQpX96xAODDqxZmu8gp2tT8hm6QhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500333; c=relaxed/simple;
	bh=MuLLO+mTIF87yLXIghfzgPjQroOQecpnDd4cAIqTOG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVxJ0bwjYGOtd9/oxXnFHS7qD4mM4nR2JegBmTZGvc1nKucUgl5T8er+0PPaUeztxiz9EBkaIsk0SUcW88rBBro9+gyAmG1jqc8FnOOreJqJ0HOD1N6MS/9du4c/NlqcasXvwvG5j3biuXTnlqHTRb2tuipGZQv4HU0S9u9H0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gEUk38D1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gEUk38D1"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1o38P971141;
	Mon, 15 Jun 2026 05:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=YE5W+FJH4g3i6SIv660RnV95iq8jcK
	KcZ5NLC5uuPmw=; b=gEUk38D10CscQPBrh0S4KoA/Rdd2szOmSjNavnSRU9cKvZ
	xVeJdUEoUrs96P5R95j7jlK75h1UBbmxovka+J7SjpTcDOZagTEgBVR2js6NDCGO
	isKCVQJ2PQtFkGDVmQ6r5uuTBuTto0aF/aAURpzX8iLBYPrrWnZje13gYrWKfqKN
	vUcPUbVCxJUuhKnaX+EJn9L8AfPfXZu+dkmUDkV3+5Apqusv1X50U5w7C8nmab87
	FWcXVyMiLn9myOJRbY6wsyuzeY5AQBXxg124WE/YtgFTSHEAdvkcAPga1IAHQbep
	Xjjm/vZxUFN8PBQt43CMXXc2WT7D5o27PF2llBfw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4es1u0eeve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 05:12:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65F54bFH013689;
	Mon, 15 Jun 2026 05:12:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eshhpw82t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 05:12:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65F5C5w648759180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jun 2026 05:12:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5653220040;
	Mon, 15 Jun 2026 05:12:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35F2C20043;
	Mon, 15 Jun 2026 05:12:03 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.124.215.190])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Jun 2026 05:12:02 +0000 (GMT)
Date: Mon, 15 Jun 2026 10:42:00 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: shuah@kernel.org, brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] selftests/filesystems: Move file_stressor to
 dedicated subdirectory
Message-ID: <ai-JoBUlTSwrRvnI@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521101758.14639-1-disgoel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iTGstv8eqp8BaidVM-yFz5D8_frFsXVA
X-Authority-Analysis: v=2.4 cv=XdK5Co55 c=1 sm=1 tr=0 ts=6a2f89a7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=w3ySOVsQRQwAp08LaXAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0NyBTYWx0ZWRfXwKSWdKc34yrQ
 ShYY4GOtWd0Gsf/lIR4jAZjOsXcuXL3FWJvCBZNZSwFSFJkPenp+/56IIn5LuxwSvA+9yoPgxQS
 hL1bhK7Z++j8AyX/zs+ZwJ49V7cSyITTwnU0O/9n9xSzyMlMipDObIVvRZ8Ruvh/g5f5TBtq9lA
 IDk32RbQDFy703W5+33pa/d1jhC+o6J5odByuWaegZNf9Ra+C/bJlinDlpS9heyAPvcQlCLyJax
 YShTyxEylwoBIwEFWS2fYayxgsHcJEferz2rIoyBRagIXzS1iHCOramwZIQbT8q0vbAaLAvNdhO
 pFeQP94AcPDwK+EVe12zpDh4FeHoMJSTofLln0ff+5EMOCzw9ol+d8NL5K9VL2FFx8huH4cg8uO
 0VjVFMP1c9avMaxLlJK2/nhQntHzWzcQl16uHnf1CEv3q3wawEIC7qHjMye/zzWlpEjZRVhyQ6I
 1kWr8W73EW6cvOAbo4g==
X-Proofpoint-ORIG-GUID: iTGstv8eqp8BaidVM-yFz5D8_frFsXVA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0NyBTYWx0ZWRfX0Gvs4iep49/O
 1SjCmqeLX1hNmihxsi6OaRvwChfsYREAH/ST0vGGdVGgzNc18Ti5e3MkhFF8bK9EjbXRpL0n3j6
 EY1MqCNi3saJJXCQJIIylSpMwPa9k1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150047

On Thu, May 21, 2026 at 03:47:56PM +0530, Disha Goel wrote:
> The file_stressor test requires a 30-minute timeout (1800 seconds) due to
> its 15-minute runtime plus setup/teardown overhead. This is significantly
> longer than the default 45-second timeout used by other filesystem tests.
> 
> Move file_stressor into its own subdirectory (filesystems/file_stressor/)
> with a dedicated settings file to isolate its timeout configuration. This
> prevents the long timeout from affecting other fast-running tests in the
> filesystems/ directory.
> 
> This restructuring follows the pattern used by other selftests with special
> requirements and ensures proper timeout handling in CI/CD environments
> while maintaining the default 45-second timeout for other filesystem tests.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202605192100.DvRgEGZ3-lkp@intel.com/
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
> ---
> v1 -> v2
> - Add .gitignore file in filesystems/file_stressor/ to ignore compiled binary
> - Update filesystems/.gitignore to remove file_stressor entry
> 
> Link to v1: https://lore.kernel.org/all/20260519104210.11836-1-disgoel@linux.ibm.com/
> 
>  tools/testing/selftests/Makefile                            | 1 +
>  tools/testing/selftests/filesystems/.gitignore              | 1 -
>  tools/testing/selftests/filesystems/Makefile                | 2 +-
>  .../testing/selftests/filesystems/file_stressor/.gitignore  | 2 ++
>  tools/testing/selftests/filesystems/file_stressor/Makefile  | 6 ++++++
>  .../filesystems/{ => file_stressor}/file_stressor.c         | 0
>  tools/testing/selftests/filesystems/file_stressor/settings  | 3 +++
>  7 files changed, 13 insertions(+), 2 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/file_stressor/.gitignore
>  create mode 100644 tools/testing/selftests/filesystems/file_stressor/Makefile
>  rename tools/testing/selftests/filesystems/{ => file_stressor}/file_stressor.c (100%)
>  create mode 100644 tools/testing/selftests/filesystems/file_stressor/settings
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 6e59b8f63e41..d87fafc6aef6 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -34,6 +34,7 @@ TARGETS += filesystems
>  TARGETS += filesystems/binderfs
>  TARGETS += filesystems/epoll
>  TARGETS += filesystems/fat
> +TARGETS += filesystems/file_stressor
>  TARGETS += filesystems/overlayfs
>  TARGETS += filesystems/statmount
>  TARGETS += filesystems/mount-notify
> diff --git a/tools/testing/selftests/filesystems/.gitignore b/tools/testing/selftests/filesystems/.gitignore
> index 64ac0dfa46b7..3c44753914a6 100644
> --- a/tools/testing/selftests/filesystems/.gitignore
> +++ b/tools/testing/selftests/filesystems/.gitignore
> @@ -2,6 +2,5 @@
>  dnotify_test
>  devpts_pts
>  fclog
> -file_stressor
>  anon_inode_test
>  kernfs_test
> diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
> index 85427d7f19b9..7d342755aa3f 100644
> --- a/tools/testing/selftests/filesystems/Makefile
> +++ b/tools/testing/selftests/filesystems/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  CFLAGS += $(KHDR_INCLUDES)
> -TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog
> +TEST_GEN_PROGS := devpts_pts anon_inode_test kernfs_test fclog
>  TEST_GEN_PROGS_EXTENDED := dnotify_test
>  
>  include ../lib.mk
> diff --git a/tools/testing/selftests/filesystems/file_stressor/.gitignore b/tools/testing/selftests/filesystems/file_stressor/.gitignore
> new file mode 100644
> index 000000000000..1eb3f40077d3
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/file_stressor/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +file_stressor
> diff --git a/tools/testing/selftests/filesystems/file_stressor/Makefile b/tools/testing/selftests/filesystems/file_stressor/Makefile
> new file mode 100644
> index 000000000000..88c8231ac144
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/file_stressor/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +CFLAGS += $(KHDR_INCLUDES)
> +TEST_GEN_PROGS := file_stressor
> +
> +include ../../lib.mk
> diff --git a/tools/testing/selftests/filesystems/file_stressor.c b/tools/testing/selftests/filesystems/file_stressor/file_stressor.c
> similarity index 100%
> rename from tools/testing/selftests/filesystems/file_stressor.c
> rename to tools/testing/selftests/filesystems/file_stressor/file_stressor.c
> diff --git a/tools/testing/selftests/filesystems/file_stressor/settings b/tools/testing/selftests/filesystems/file_stressor/settings
> new file mode 100644
> index 000000000000..b675ca93f936
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/file_stressor/settings
> @@ -0,0 +1,3 @@
> +# Timeout for file_stressor test
> +# The test runs for 900 seconds (15 minutes) plus setup/teardown time
> +timeout=1800
> -- 

Look good to me Disha. I hope you've tested this on the setup where its
failing to confirm we are able to reliably pass with the patch.

Other than that, feel free to add:

Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>

Regards,
Ojaswin

> 2.45.1
> 
