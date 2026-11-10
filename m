Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316881;
	b=mEIkbc0OasKj5BV1Ta26fUPnjadkR8AL656zx2pdcPlahGBodsd1XM42q6q+untl0atX
	 nqSj6sSGJWwfkxr/dchfEoy3k4u/4j62XwIQjX8zDLT+DtKt72j86JB84jGRp+grtVf6e
	 Qt8pp4wP7aR8n1sbYN4JLjL9+sGM1p6OPKOMkwU0y7QF1zSMDLkHW4S0/tMBvALtHVTWj
	 F2LGaR5nI2mGdggINJeaLu9+tKStfFkxIIEpCGXr8lOa3lx1KwWmIJ9akZi4lKsTGWCh0
	 c3qy1Q/TlUrJ4IdLv29g64ZVogUkDcn2mue48UL5ZaUGoxtZyucTq6sy8DTC6BfLzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=;
	b=fok81xiz+7nsi72MmPWAmDFmzff2lKmqZqHJkAd4LWDOi1+M9/Tc4VL8RsJncBTkFOE0
	 03Y0cJFGyCnROM6vqDnA5M0Nca3xd8qiWN98A3u0VZeCbc96ePoGoT3XhQjE1s1uOJmxs
	 cBFjyMTJgnOdRUa19P5uhl8v69fdkTbiBIDMKPjHXlvNSgaxxehh3v4/jSjDjJqP03ioe
	 UVTyTICDKhkDxgYeKmIsFdKd6L3JGNSPoTqzFy4bYhTrITIgOVXnApp7GR8HME2uib5OR
	 CHZYFbByzxao5rw+aYL4OiNcFlf7w/9BRDumaK1f5PxGjshYujQsl7ffXPw72pxmhiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYkrWJgp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZD9wvhx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CC606A7C4
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1CC606A7C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYkrWJgp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZD9wvhx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA9og3196161
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wedbrXh177mbzmYM+3txzr
	4ofpzd2UDd+z7ICvagmsM=; b=XYkrWJgpRa06p1t340wdOzXmWXTRgyqCfNJFBl
	eWdpDzKL/23EU2D72H96WXxiMPbR2PHzscSUYks5STxiYudNtOMp1evTvt1/N2Sc
	QfCHV6+CbxCVV8/6JzHiHm95OHA/Yx5tUFNwxjTdJErtrLMqICsUPXQXonzPh8X2
	LaJPqNoT7kYM6eRXzREoL1nTa2At/FW6ar5UrUMvHa+q6lXJNr42URX47wMMUhUR
	qs4n04Vrw5VKURJIQCUqjokEjpjdcTE+MZfBvLpLXBbiPl1er6z/ixbREzrYi3m0
	Q1tuCmFQX7rZRfi9YXD/EoknlrYXpAXsK5jyaReIy/v3DJiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crwaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:21:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so226400085a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 05:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316879; x=1794921679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=;
        b=VZD9wvhxvM8ezfjARMcT9qLdNBtmUtuU1P9nwpZqPQSNf0HsAge7OQ1JkdorQLU50I
         3F0+7UyJurPVb5vhOqNUVHbScZd8DXtJ+A1qKXDsjbSpxRq6qBAQTZrhcjCl79/a12iM
         1WPczozEwqUuM5b5jRUeughz0Z9jdSdComV+62ZwV8V13hBvM9sMzyeDnRV6GpjEVcDI
         9RBdIfyPRCvZOg3KS0pKBtgvw0HtENAMBon0kjoAPyyDYSvG8IOCqit2QbgfxkL+Z3/n
         fs3jY1TgHbAhYJQR+NtJ3ib9l0BFjJK/dl+N74p17oBiUDRBczO0SwDb0afRbbpHbEGR
         qEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316879; x=1794921679;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=;
        b=qLniDHUou0TVBoiPNcWYudB/3ic8y8o2W4tXBxePqeC/CkG6nmzxLfMvddHkJzPKf4
         eFnhdcfbDUds2OHwC3z8V5IJ+KlObzc6UudCDqswSlG8mv6MkP8aY5J7WJhOFcQgu4bV
         u/Ce7LTMR8gItJZWpYdmzxAv2aaStAYB05EJqfW50sOtrwgTvMc9P5aK5nOJNTfdOEOd
         aDUh4TIl8cA5gZSsI0xhuiiQFionZ10GGNvuzMEB2TPFWzVYkLB25z3c2LjNBOaBMWDx
         AYbIKCXPa4KfQ7JcKdWzcl3OSLlhwaJqHjbUTbRk0pwiNMtsMP5p5y7C+JG7trw9aeEN
         //fA==
X-Forwarded-Encrypted: i=1; AL+hErGgYXiapSkM+BFmaEuCqEsPG4kBEOqjaGGj48hpR3+g8bN+Y2xCIWEZu1AJ2X4cxaBN9R/Zh7nHmWLG09vp70k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fS1a9D6j8+7bwUEq1W87Ixw1X7lRMBwslSZrZnyOEnfiG6PmP
	8rwDky2JUnmnRwbk8twrYdcsKVYFBA5XLRb56H3yoVwnyHBYZFdC7205zVhxMZzXQeDQKcNQ50K
	H0scDeimcTdTnybkm8W+v2mmZNEirIwl99yxNSwvuSw9BKXhSyPkLzRDxZcx62Ed3U3FLXKQ=
X-Gm-Gg: AYBFou12H2b7KvVXiusE+3UjnwbMsii0n7Ekm/mzv/lrg5aeiH4kSa9RRVF6w7Z54R6
	bzQdDDtlB7J2IOqEFI7Z616WTdNCP3wOXSgbIZ/pnt2QHWFSWypyIlkZRxQhkbDgmmkomr2fH/M
	aRlRfNnOEQtpON/PPL7YGRMvN5NEBS/KHbCAojCKVP+bQbJOGMmiMe1PRiHT5kUFdaRxSLfppkH
	I4Sn/84GEsCFC4YSWuwusMUcNfutiPMuA11tFYA+uPmfLWRXPOoWD5g5v9Ef+rGFlTlsE4Ea1HG
	6VqhCvJwtecgKQh3tV/+DSyS6X7z0jA8pb26hcbfAucX06Xntk6wX1RJOAfsx3bH5ug+GX3d4xj
	66wAL9y84aaVD5Zx1bM7Qz/6tEwb42soM8iH7GbKpYx5W8N2Gnp/zhlpM5Otp9TPgfvUHt6mcX3
	26oC/kkGg1vpCOqBSLeCaB2GIn4iOAN8ghxOg=
X-Received: by 2002:a05:620a:4413:b0:93f:a63:15f8 with SMTP id af79cd13be357-9479f1d71c1mr399919885a.8.1794316878674;
        Tue, 10 Nov 2026 05:21:18 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:93f:a63:15f8 with SMTP id af79cd13be357-9479f1d71c1mr399913585a.8.1794316878017;
        Tue, 10 Nov 2026 05:21:18 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:496c:dcb4:4deb:25e8? ([2a05:6e02:1041:c10:496c:dcb4:4deb:25e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5047635f8f.10.2026.11.10.05.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:21:17 -0800 (PST)
Message-ID: <b9ff4d03-61f7-4e17-b048-3cecee70f3ca@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:21:16 +0100
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
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Heiko St??bner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <Lukasz.Luba@arm.com>,
        Linux PM mailing list <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kselftest@vger.kernel.org
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: [GIT PULL] powercap: Add generic hierarchy support and convert DTPM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gQkXXYYpm7cyeBkzuiqFPVQ9Bi5OobPE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfXy9zXrSj31qTN
 W6SCsWZEQZXygtFL5nOhdWNWmw53Qb1hPuijpMXBuqcCchm3NXLNmnxr4/AH7nhN7qW40LIsTiC
 I5ZPZDFS3Gy9QOOjbY/iWIn69zuBDnI=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af31a4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GgbJc354ad6G5sA-JgAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gQkXXYYpm7cyeBkzuiqFPVQ9Bi5OobPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX9rfeacAFJPS8
 4e80AJYmIid9lXGvKreGzb1r5DvDauTx6zxdW4HluIQggsCW+dRB9+13uxL9jFxcidxvJWQmhwj
 0kmXG02u8rDjpUB4trpRYKvVuqnZkrhqtc8d04TQ6CL7/AyJz786UbduESh8SsksbgP4LslpGj2
 4EPSyBxNJ3D2bE1UjDfzWItz6DLKQzzCOHiixuvkTGMapiohoUf5N5e24pcsLa2KtV8gqLndDXT
 BI08AD2ec3e26UTF/GLh/r2mHb8CcbcxQXAJhTHWVi13KXsfv++dOCIKE2Jc6LprR6Vqy6Vmm2M
 R/O8/Gb7vCnHpfsjV7C+j75NNwo84p5Q2eRokAboCVJxNCwZNzfyC4l2V3LA30UC1Xh3MkNsoT3
 JiyfcitEEuJmZDF9hjGzsLT8wOfNK+ebqGDQOpXWk9CGn0gLVLKAbG89b7DO2gTG/slZWNheZvO
 a9ODB7CR6YgE/5UDedA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100053


Hi Rafael,

as requested please consider the following changes since commit 
6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git 
tags/powercap-hierarchy

for you to fetch changes up to 6ba41a1519ff1f91f96d90a6bf4f70131a8f7c73:

   powercap: dtpm: Add RK3588 hierarchy (2026-11-09 17:33:40 +0100)

----------------------------------------------------------------
Powercap controllers may expose trees of power zones, such as packages,
clusters and CPUs. This series adds generic helpers to duplicate a static
hierarchy description, create its zones through backend callbacks, and
destroy them in reverse order. Parents must precede their children in the
node array; the helpers validate that ordering rather than sorting nodes.

Drivers supporting multiple platforms can place each platform's hierarchy
description and node array in initdata. powercap_hierarchy_dup() creates a
working copy of the selected hierarchy and rebases its parent pointers.
All original descriptions, including those for unused platforms, can then
be reclaimed automatically with init memory. Names and backend-private
data are not duplicated and must remain valid for the working hierarchy.

The controller supplies creation and destruction callbacks to connect the
generic hierarchy traversal to its backend. The creation callback receives
the control type, node name, private data and parent zone, registers the
zone with its operations and constraints, and returns it to the helper.
The destruction callback unregisters it during rollback or teardown.

The API supports both fatal creation errors, which roll back previously
created zones, and optional nodes: a NULL callback result skips a node and
its descendants while allowing independent branches to be created.

The helpers were motivated by the SPEL work and also let DTPM share the
same hierarchy infrastructure:
https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/

A kselftest exercises static and duplicated hierarchies, skipped branches,
reuse after partial destruction, and rejection of repeated creation. Its
userspace script checks the 16 exported zones and selected attribute
values, then removes the module with a sysfs attribute descriptor open.

DTPM is converted to the generic helpers while preserving best-effort
creation when individual backends are unavailable. The CPU backend finds
an online sibling when a hierarchy's representative CPU is offline.
Entirely offline policies remain unavailable during initialization.

The RK3399 description is reduced to one CPU entry per cpufreq policy.
The old backend already suppressed duplicate registration; the extra
entries were redundant descriptions, not additional registered zones.
Finally, a shared Rockchip virtual descriptor and an RK3588 CPU hierarchy
are added. RK3588's three frequency domains are represented by cpu@0,
cpu@400 and cpu@600 below a virtual package node; no GPU zone is added
for RK3588 in this series.

----------------------------------------------------------------
Daniel Lezcano (6):
       powercap: Add generic zone hierarchy creation helpers
       selftests/powercap: Add powercap hierarchy creation API tests
       powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
       powercap: dtpm: Use generic powercap hierarchy helpers
       powercap: dtpm: Rename Rockchip virtual node descriptor
       powercap: dtpm: Add RK3588 hierarchy

  drivers/powercap/dtpm.c                            | 180 ++++++------
  drivers/powercap/dtpm_cpu.c                        |  62 +++-
  drivers/powercap/dtpm_devfreq.c                    |  22 +-
  drivers/powercap/powercap_sys.c                    | 204 +++++++++++++
  drivers/soc/rockchip/dtpm.c                        | 129 +++++++--
  include/linux/dtpm.h                               |   6 +-
  include/linux/powercap.h                           | 205 ++++++++++++++
  tools/testing/selftests/Makefile                   |   1 +
  tools/testing/selftests/powercap/Kbuild            |   5 +
  tools/testing/selftests/powercap/Makefile          |  46 +++
  tools/testing/selftests/powercap/config            |   3 +
  .../selftests/powercap/powercap_hierarchy.c        | 314 
+++++++++++++++++++++
  .../selftests/powercap/powercap_hierarchy.sh       | 128 +++++++++
  13 files changed, 1153 insertions(+), 152 deletions(-)
  create mode 100644 tools/testing/selftests/powercap/Kbuild
  create mode 100644 tools/testing/selftests/powercap/Makefile
  create mode 100644 tools/testing/selftests/powercap/config
  create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
  create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh
