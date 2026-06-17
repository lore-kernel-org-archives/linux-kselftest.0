Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7933F394;
	Wed, 17 Jun 2026 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694903; cv=none; b=mvSHLTnGer9fS3umkHviyLfutUO0oTVJUSIW6kIUBaAAN7I4bngBkUct5DFKXf6awFibEa+fDBoUCKTIY44wRWyx8RokeE6wfx5d8XVD/q4XevEnkJeIsCiMqd8T8s360cwqgOFQbPtVcK/diDoXCkDScDjxtNq5W6Xnl9tfLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694903; c=relaxed/simple;
	bh=LsSRCw8mMF0QQTky0GKDebwpoEkxezie8OYrIVX59Fs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AgWiGOKbSshj03h/i9ctEJv4hNwhD3yoc3YVK7vtNSlZ3kUfjBwAhSiMXK6K50IFClD1vnjUGh01GfxOytrGOcehcwZV5yiyA9u0RHqudENQWvxSgt4dPDjbxYerrHCgUUrJY3+6OmBQQcXMzTGlOGUg7/K3iPuB+Gvmrd/yh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AVEhfTT6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AVEhfTT6"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8nQ844023014;
	Wed, 17 Jun 2026 11:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BySxfq
	cZoat1eKGVtgWCMu5cKk91+TKlf2t34xpKf/I=; b=AVEhfTT6a5ZFYXOF/V3Dm7
	7cuX6hQv3HypUPQzp7AUKXQIZV7ON66+5nbOj4b+fqsQbDJhlM0QAbWqv9+dvSu2
	M6kjjPKdkbXKbfrBX1ESLp75o2lbFnvbxKJC/2YOF1yPgjCzxGsbYkm39QZ/VYRm
	L5UHhFhw329k9EkFf9dLJOehJJrINSRCXwfVVkYy9upUIM3PcgHrNh6JEk70yr55
	5R6J+GKeNYbeW/zyvpi6ywoYZh/RPMNBGmEBO5rB04vDX/R0cwPURIwZAT4ntn6H
	CMTTx9O7ijmiQztE/q9uYyXdbx6ZWjOGBPvMbPFOSCJo5Wru9d4i0ToXvXMP1yfg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqx2hqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 11:14:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HB4doX013746;
	Wed, 17 Jun 2026 11:14:56 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eudvaaugy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 11:14:56 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HBEusY2491222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 11:14:56 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7BE558043;
	Wed, 17 Jun 2026 11:14:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3EB558059;
	Wed, 17 Jun 2026 11:14:53 +0000 (GMT)
Received: from [9.123.6.235] (unknown [9.123.6.235])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Jun 2026 11:14:53 +0000 (GMT)
Message-ID: <ccb2f794-8728-4ad5-9032-915c2d5c05b4@linux.ibm.com>
Date: Wed, 17 Jun 2026 16:44:52 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yeswanth Krishna <yeswanth@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] selftests/filesystems: Move file_stressor to
 dedicated subdirectory
To: Disha Goel <disgoel@linux.ibm.com>, shuah@kernel.org
Cc: brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260521101758.14639-1-disgoel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX7vJ8oqFzBavz
 T0ZtiE51LReqXNt7HL6jZ5Gkdu1IhTt8Be0TjOByRvyIB3OuDTD6sTIqdvgWYN7EMLw3p2hKpfo
 6+Z8MHgaohqAqV1tOG5GEnQBY49bVctNhWHie9zvYivNLbvKExBIUo4kt8oL1KunjoN/qm/CLNo
 XiwDRjdC8GOhgBtV0cFM0VvkWrrGLBCJkdaBfTkv6qW8SvA+M8m2QgTBOJgbhY8XKX0qNr+vRNk
 PlEYQ/wP4GoONC9YUeEnlFLxz0aFvsTrJn/tYsttWG8XwhYLWCGI5Jfu2fN2BH4ckuy51IUEKKz
 5en66EmRT7CJB+7bRiyeYw8CXQCdC1seZO/DRpmpw1LJWPhbJ+0BTNLOcZpYoZosAOMl9t5Srcd
 Wi2FlTCUcpuaTDK8EJ7TEtO32vjkoykzlicwQOVn1pdP1c8hEY44zQtdx4TyaCnNIcGm+9Ro/1e
 mbAhRHZYk0ftf9qaVYQ==
X-Proofpoint-GUID: 57P1G-IKIp0vPN5HzqrVwWUyP4olhWzn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX9VOfVTDvmG/I
 NAy6LThrDnDcsb2Y38d9+5RchkxJMm7+cjtm4bgT0vW+G9getZbquB0TrjsYUmlPbFr13SAQCYr
 mLJ48us+Rb/Fa3vdye0GxIAsOQ5Vsag=
X-Proofpoint-ORIG-GUID: 57P1G-IKIp0vPN5HzqrVwWUyP4olhWzn
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a3281b0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=w3ySOVsQRQwAp08LaXAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170102

On 21/05/26 3:47 pm, Disha Goel wrote:

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
> Reported-by: kernel test robot<lkp@intel.com>
> Closes:https://lore.kernel.org/all/202605192100.DvRgEGZ3-lkp@intel.com/
> Signed-off-by: Disha Goel<disgoel@linux.ibm.com>

Hi Disha,

I have tested this patch on my ppc64le system and it works as expected.

Test Environment:
- Kernel: Linux (mainline)

Logs
====
Test Results:
The file_stressor test executed successfully in tools/testing/selftests:

# make TARGETS=filesystems/file_stressor/ run_tests
    CC       file_stressor
# timeout set to 1800
# selftests: filesystems/file_stressor: file_stressor
# TAP version 13
# 1..1
# # Starting 1 tests from 1 test cases.
# #  RUN           file_stressor.slab_typesafe_by_rcu ...
# #            OK  file_stressor.slab_typesafe_by_rcu
# ok 1 file_stressor.slab_typesafe_by_rcu
# # PASSED: 1 / 1 tests passed.
# # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
ok 1 selftests: filesystems/file_stressor: file_stressor

Please add below tag.

Tested-by: Yeswanth Krishna<yeswanth@linux.ibm.com>

Thanks,
Yeswanth Krishna

> ---
> v1 -> v2
> - Add .gitignore file in filesystems/file_stressor/ to ignore compiled binary
> - Update filesystems/.gitignore to remove file_stressor entry
>
> Link to v1:https://lore.kernel.org/all/20260519104210.11836-1-disgoel@linux.ibm.com/
>
>   tools/testing/selftests/Makefile                            | 1 +
>   tools/testing/selftests/filesystems/.gitignore              | 1 -
>   tools/testing/selftests/filesystems/Makefile                | 2 +-
>   .../testing/selftests/filesystems/file_stressor/.gitignore  | 2 ++
>   tools/testing/selftests/filesystems/file_stressor/Makefile  | 6 ++++++
>   .../filesystems/{ => file_stressor}/file_stressor.c         | 0
>   tools/testing/selftests/filesystems/file_stressor/settings  | 3 +++
>   7 files changed, 13 insertions(+), 2 deletions(-)
>   create mode 100644 tools/testing/selftests/filesystems/file_stressor/.gitignore
>   create mode 100644 tools/testing/selftests/filesystems/file_stressor/Makefile
>   rename tools/testing/selftests/filesystems/{ => file_stressor}/file_stressor.c (100%)
>   create mode 100644 tools/testing/selftests/filesystems/file_stressor/settings
>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 6e59b8f63e41..d87fafc6aef6 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -34,6 +34,7 @@ TARGETS += filesystems
>   TARGETS += filesystems/binderfs
>   TARGETS += filesystems/epoll
>   TARGETS += filesystems/fat
> +TARGETS += filesystems/file_stressor
>   TARGETS += filesystems/overlayfs
>   TARGETS += filesystems/statmount
>   TARGETS += filesystems/mount-notify
> diff --git a/tools/testing/selftests/filesystems/.gitignore b/tools/testing/selftests/filesystems/.gitignore
> index 64ac0dfa46b7..3c44753914a6 100644
> --- a/tools/testing/selftests/filesystems/.gitignore
> +++ b/tools/testing/selftests/filesystems/.gitignore
> @@ -2,6 +2,5 @@
>   dnotify_test
>   devpts_pts
>   fclog
> -file_stressor
>   anon_inode_test
>   kernfs_test
> diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
> index 85427d7f19b9..7d342755aa3f 100644
> --- a/tools/testing/selftests/filesystems/Makefile
> +++ b/tools/testing/selftests/filesystems/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   CFLAGS += $(KHDR_INCLUDES)
> -TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog
> +TEST_GEN_PROGS := devpts_pts anon_inode_test kernfs_test fclog
>   TEST_GEN_PROGS_EXTENDED := dnotify_test
>   
>   include ../lib.mk
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
