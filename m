Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5745F4E1C87
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630033; cv=none; b=CASm5RLfTrP6larGWK1i60GS94c6DKCrTS8WswcGHbkYxeKku6dDjB6/O7ptqTPV4qynorcbNe31QgFgInAVoC9umJQQn1nRnk+eD6zy4EMLC4v5IXnlKt2LbZwhuEbl0AwDWUdmd2MO+Rve+8N67vOF/xQoYbRaPBEq1AdlTeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630033; c=relaxed/simple;
	bh=P5L4D7b0DgwzH55GIDmJxW7XWwPhhdMjQQhJQLHohuY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gvNyMLFzMucLAOTiHBThy+mmcE69V3UTtoCQ4OPYozwUFWGd8aPM5kfkVwwMsQlP/+751Hbp06WhYgnJDoFJbljh1D9xrgdoRSHA4avodj9L6/h3Zn6A+9oMfGqp10GtI0zvVxaDoh+wlj9OBNlhW0+/0BLmx85QuOq0EBuxiRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElHMIasg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqJDNE5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElHMIasg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqJDNE5/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHwUQQ1941026
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 21:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IzV/IBSShZ4MUiO1jS1RtbXx8+cT8mcQQSxay4AXCY=; b=ElHMIasgcoWtec81
	3XonYLFaXwfoNl70XfrXu6ilNBG7PlPa9Xn0GyzTsuK/WCpyQtxBjy7Zmrc7yXm/
	7dLE/5GYMjYifV6ijFiCgDFpdZLK1AKkRmc6srll7n9nJNaYVuQ8tfaMCoLZSgB0
	DI56EdKOK48inW2ixLMXwuFptI8bTnL+qyYXUwLV/w4XfMyyU8GKchIzx+I3E5wz
	DTqohJBDZ6HKGJzhXIT74vsqqnT+D6jbAczE1Bop7X0T8CBeuJowFmLxVLIiB49a
	UA+HT9106VzHNWlLLkji847eOvSkPkQILxXZVWBCrWk/pxYb19wrdW74ObwohJ66
	8xR5JA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mucyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 21:13:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso745462785a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790630030; x=1791234830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IzV/IBSShZ4MUiO1jS1RtbXx8+cT8mcQQSxay4AXCY=;
        b=iqJDNE5/POKPkKmY5Nh5NOErszSBYjCnu2PzRCL3z4KEWyY1xXdnpbVec1zGGbLCXT
         W4acjw6me683lf1SzvXLtZo2oo8RPMSh3vpk8WpolYSLzQcyoQnTGe6T6JBwnsmcH2xS
         n02tgTnZ0bErg3CRCpLH1nZBgiylM0CX2neNDbKDuwn0NF7NnRGROqGpxV87El5bpr+c
         tfR8wHFYJYZQJjc4QKjHC3LG3yAe292hta9mbUdM0lR8/VsDzmfvbdOoWsHj/5T/juj4
         Elks48pIM79iHP7R62tpv/s3nPdI7yQGp6VPG6JIOfrrxUJ+pJRcV/uFemKBGn2+/0Mm
         x2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630030; x=1791234830;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IzV/IBSShZ4MUiO1jS1RtbXx8+cT8mcQQSxay4AXCY=;
        b=ElrXVMqqUJInTHROzkt0uWQNB08Svp0KewEXAZnVmmGWJNES4GuuRs1sX3dxyp7LHy
         45TftCMmHrZf29JDWaoUGs+lZl+R+iL0KVe1kJClI+lZSdfnvRA9F00oN2/W6Chnwvc/
         3a/ILG7UzQHamTgAVggOSQFvgrNgp11YQGpzqR6aaTBUvx2teGWQCMg36WaPt7rosFpL
         m4Y75tbXjKUJYWrTRld83I/Z4aGyOCzOoXTqRBawjvYRXxGWXju4k+TbwFfRqNJY5xIK
         At9LHyCDomteYvfEC9XqRofb0OkuVQWJ3frd2MRYiUTl+2vOwt4MX6nlVAWjTtXKgffE
         f7kw==
X-Forwarded-Encrypted: i=1; AKwUvBwhp/ARiA0pdEioRXUdyE7J+rGjxGehQ1z2ZHG2JUWlvDryTcVNW7edAQVRCawc7TVclbxAbHSDn6iPY48yXEA=@vger.kernel.org
X-Gm-Message-State: AFuF++nEJKeiq9hVICxIe+yUX+46g/SVVdmwtXir3L0L+DiUmrRA6Vws
	/ty5U+WUm1pMp7D+54PSZulyiot+KkSIrlR8H3+hQ8aSPwTSn7SHPFvS2/d/g488OS6v8QpVRDK
	/y2osZ562pBMTJoFezUWXbBvS2RhD/Q98hKnL1uJp0Fx1Rp5dkKFwdGRuXTWF1lwQqzVvaPiCWV
	Pq+4g=
X-Gm-Gg: AYBFou1zmk3PJc5aftSwXjuhYbCTpQP6AjEDwLQozggGqA5M8xdaguW8dm3n9VDeuJp
	8Ump6Zu+scl/UhEOZYwIy1UiwlyxMi59fvKxZAD+e3uSBeVVMmWNB6b74MUDlFiAT9p9UgCAd8w
	rg+eXqQQFzaqkLiEvOyJmQu7ImH9KWSA8e4GQ8QVBvVQabTBsLMv+2h2xGtyGEGTh2whA63X+rk
	FpbCnU8fXPswj5SlAdlb85UTzJ62LC3bpqnQ0WjZZoYKumhhUfX3zNgtUZjPLcTv9Bh4NMjb0hR
	1kzT9Kn1HoXsQGr5CEZ453MFDIsFhbWnyYh06ryWNs0ZSRL/1pB0m/BpgSqnVcqVmYwx+VPWSsu
	aMYE2AiZl2t93QTpnVAFn4fF+q8932ebGKzUXkYYrc1KjK/zaV78ANpvDtWNrtg==
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id af79cd13be357-93c43c9db58mr2376025085a.31.1790630030555;
        Mon, 28 Sep 2026 14:13:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id af79cd13be357-93c43c9db58mr2376018085a.31.1790630030051;
        Mon, 28 Sep 2026 14:13:50 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm20969785e9.5.2026.09.28.14.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:13:49 -0700 (PDT)
Message-ID: <6a29116b-92a8-4605-95de-7372c9befec8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] powercap: Add generic hierarchy support and
 convert DTPM
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0n2kgm0k9srfz-sC6EMWThyjZloSHn-p
X-Proofpoint-GUID: 0n2kgm0k9srfz-sC6EMWThyjZloSHn-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX2jLWg80Mwywn
 8DjWFjg0vARfQkPCwNlKf8TiIU129GS9BYTqSVdkMjqT9FjmHmjeFHwBgl8vjG+RsMhydQxpOIi
 7evMdgsDagI6Z68i/hsRgT2UNqTtVvIj2D3ipbEfxfeJY7zxjT26oKwccHWeGrRx1bLiK2qIgT/
 51h7P2smNqOOWgSOnLLyF6+Il93Nt2Q1yJirvDMGJM60cb8CbQmXawVZK9f3uXfI0y3R/Oac+7H
 HRenrzp1vbI6Poqzf13otuBtBMzpREoDQb41UhgXi+3c5wbKRjqh8dMy5YdK0AWxR+R/2t4F8cJ
 7yIX66rvF1UNZC9BczuCLPws468diOPBvl8om++UUGWuta9lbbOFusJzo7W979OHe7W79YqHA9y
 ejj0oxEexK3e2zQGwnBtfM2Xxbgh4iSQkBnjeQa/LHKabAnvWSH5J/j6DsniR8X0/u1YRRTqzhh
 ojr3vhGewMxxO07INgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX5t7QlPkFvqx9
 iJXQSW2urVasmUINKcgU91wmJEJKvD77fXIck/usCkubqrqua8J3oIv9xLzs8jKofWx1r9SjnOM
 hBuqlv5upTU0rGXvsi0SsRrWMYcY8gc=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6abad88f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IyVTcIoXJR3s1VaE0TQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280084


Hi Rafael,

just a gentle ping on this series ;)

Thanks


On 9/23/26 16:34, Daniel Lezcano wrote:
> Powercap controllers frequently expose a hierarchy of power zones, for
> example packages, clusters and CPUs. Until now, each driver had to
> implement its own hierarchy traversal, parent lookup, error handling and
> teardown logic.
> 
> This series introduces a generic hierarchy description and helper
> functions allowing a powercap controller to instantiate and destroy an
> entire hierarchy from a static description. The powercap core takes care
> of duplicating the hierarchy description, rebasing parent pointers,
> creating zones in dependency order, and performing the appropriate
> rollback and cleanup on errors.
> 
> The API was primarily motivated by the recently posted SPEL series and
> also provides a migration path for DTPM to use the same generic
> infrastructure instead of maintaining its own hierarchy handling.
> 
> Link: SPEL cover letter https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/
> 
> A kselftest is added to exercise the new API. It creates a synthetic
> hierarchy, validates the resulting sysfs hierarchy and attributes, and
> checks that all resources are correctly released when the hierarchy is
> destroyed.
> 
> DTPM currently implements its own hierarchy creation logic to walk a
> platform-provided description, create the corresponding DTPM zones and
> tear them down. With the generic powercap hierarchy infrastructure in
> place, this logic can instead be shared at the powercap core level.
> 
> The series therefore converts DTPM to use the generic powercap hierarchy
> helpers. The platform hierarchy is duplicated before use, while
> powercap_hierarchy_create() and powercap_hierarchy_destroy() handle its
> lifetime and traversal. DTPM only provides the callbacks responsible for
> creating and destroying the DTPM instance associated with each powercap
> node. The CPU and devfreq backends are adjusted accordingly.
> 
> As part of this conversion, the existing RK3399 description is
> simplified. The CPU backend creates one DTPM zone per cpufreq policy, so
> describing every CPU belonging to the same policy results in duplicate
> zones. The RK3399 hierarchy is therefore reduced to one CPU node per
> cpufreq policy.
> 
> The Rockchip virtual node descriptor is also made SoC-independent so it
> can be reused by other Rockchip platforms.
> 
> Finally, an RK3588 hierarchy is added. The RK3588 exposes three cpufreq
> policies, represented by cpu@0, cpu@400 and cpu@600. These three CPU
> domains are grouped below a virtual package node:
> 
> rk3588
>    `-- package
>      |-- cpu0-cpufreq
>      |-- cpu4-cpufreq
>      `-- cpu6-cpufreq
> 
> Daniel Lezcano (6):
>    powercap: Add generic zone hierarchy creation helpers
>    selftests/powercap: Add powercap hierarchy creation API tests
>    powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
>    powercap: dtpm: Use generic powercap hierarchy helpers
>    powercap: dtpm: Rename Rockchip virtual node descriptor
>    powercap: dtpm: Add RK3588 hierarchy
> 
>   drivers/powercap/dtpm.c                       | 165 ++++++------
>   drivers/powercap/dtpm_cpu.c                   |  22 +-
>   drivers/powercap/dtpm_devfreq.c               |  22 +-
>   drivers/powercap/powercap_sys.c               | 148 +++++++++++
>   drivers/soc/rockchip/dtpm.c                   | 127 ++++++---
>   include/linux/dtpm.h                          |   5 +-
>   include/linux/powercap.h                      | 178 +++++++++++++
>   tools/testing/selftests/Makefile              |   1 +
>   tools/testing/selftests/powercap/Kbuild       |   3 +
>   tools/testing/selftests/powercap/Makefile     |  17 ++
>   .../selftests/powercap/powercap_hierarchy.c   | 246 ++++++++++++++++++
>   .../selftests/powercap/powercap_hierarchy.sh  | 118 +++++++++
>   12 files changed, 906 insertions(+), 146 deletions(-)
>   create mode 100644 tools/testing/selftests/powercap/Kbuild
>   create mode 100644 tools/testing/selftests/powercap/Makefile
>   create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
>   create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh
> 

