Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198504;
	b=ZL7jOOuAotR4q65ghIgHpeYvidsvnfQRuu9wINFCGt1klnZ6hQvgHsqEcOoUv9oc/29O
	 wwk8Jxp+DeNmtJ2cwkqYtKvEPEsEHdNFYwnXRS+bCuUB0vIUcaNb26AfLq6p1ZnL3Q1RO
	 psEgnijnY415xyjtByuSu8H5xXDbM3Qbki3ztT0kNYCYmlv0M+IJ9VpAhs2noUPqBOORD
	 rsB+vNXA+8WEobBkCn8ABfVAfuFwFPsjTELS//4CH15c8GFAQ/1Ot/aaIptZ/A07GJ4lh
	 dry/kN3EUquVIzRMzHDA98wFN73ZcqiTpg5HK0FYQeMhSuronH8Y+8kOQ1vipyKkfbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
	b=RrZIwNwIG5gnj1aHj+4Ht6YhGXB3BPzahUWg0NgsQzXR30Xo4O1dyiNUKhTy7DLcIaDE
	 ZAhHVuYO+lWaDorTW4S4BgmONo3z2iyPpNd5O/SgjiKXyCdpf0o08YqxorpLhRMkSIhK3
	 bmnrCeUNM1gY5E1Ll2riJFnITWrm/RuJPMCE3/WOVwxJaOHGXqiLWrKke/HXfJja+6sYJ
	 yWqZ33fm8phCbO2dlMp4M2GhIBOb6Sr71KEdykdn0HOU33o6jR0XHL7extlth9kTVF1qV
	 LjF9fqhlIu34mcZvZ+IWkZocFyD/+zvugMJAwyt5JDIYGGrCqt4K7ZwSl339FGJfEFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK6P9sRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE2iqtn4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33952606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 14:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33952606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK6P9sRl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE2iqtn4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGpe995024
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 14:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=; b=QK6P9sRlLQRXw6DN
	5y8otHdGrG0lxl0Y26kfdeAF0hp4rr10saNLUaBdlF4GUhI3ELvHc4HAnnpF6hnz
	msyjQAT5ZSqRqyADyOQolglwcbUU0614GTZDpLbZAaWs849h+4+EvfUV+2usdeDm
	m93j32xYU8ZpK2tOOaZDCgGbkkfXUiiaCLDqdRR5tkAFfyxC9buM5dU0SzVtNU8B
	IVxhnfWAvRDfqer7AgM+0Sl1RqTbGYKnZmCNJMj8K/fdj1TTE04G8g/MxH7eUZ9F
	nJwr+XtE1K7FI3kX/LVcI2OAvZmaABsu8lCpO4TI5M7xxUBO7SQjZBlJiBMfJwJr
	MaKsXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttjqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 14:41:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso9222705ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198493; x=1793803293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
        b=dE2iqtn4jyxZogmzG6xMCFssuZNzBJCTBOFSvjRZkIFS0mOC3kVBKzrljCoC+SQpR2
         eDwRi70oNzQS7iYq9Upyh1ohmaiQ5E4853fcqgvrNRlOOInk9DLPcdXGx8werPWgIg1/
         Ej6SoTdNezQeZ3QsYoy06BJuQU/zYO3ag5iQcdXtiTCuwPPfA3oz5BFQVw87AtwEq26K
         0zzI+Hr9IpOOZ40/bntcI/t0tvn46d0OgTwNwlt8FLSMS0af4Y2FpMsLFZH8NdQ53ZXt
         ZUgcXj37/jiS8eLyvylpRaTOcWVAEPbjA0ALgirgLHtJvZSX8cA1y+zP3+5KKixHYtOd
         kDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198493; x=1793803293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
        b=dC+OFhskhiGb8O2UqHtDK2Un9QgbeTgePhzFjJlACF/ZQgCsMbGCP7B/ne4opL4YDP
         rXRUJlH/8xZtmF9obxi9G6/qLtG5XdGzB9tCP8Fj/+KakN5fwfIv1skD4uaGSUBp4lqp
         UdbZSzO7guTxtCQZPxuy+CuYLYJfJCFOjB7SSwY0yLRrpl3ROY6XJrusITIlZNk04FT6
         MWP4+t+b6cC3u3zHqqjwNxQiqoYV8isosJ9aAOReStocNgYLJ3QiDv6UumIOMxrorITq
         gRyhl9/+79SQQP9uQxgnBXgDF35N0eiNFB7oq3QOu4OjCZVYEletkt1AfnxR1pgZDI8o
         BF1g==
X-Forwarded-Encrypted: i=1; AKwUvBzMY0DxFbv2M5jssJCAjEY64mKjNU2iYJQXrgn/Oz7ydDzMVTH8usnfvfV7nd3ev9mYCynbtVJ2vUCdYExDKaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdDsYAUj3NIdtH/ic0SpH0Q4W3BlkDKhwbYijWbFj5rdk1Y29c
	rp90ig07oBFGK8gGnz5/1nxwOhpAYLyEO7v0joS1kT08E4591O3PdYWIcc0QMXBOCRcdjny1q0o
	8dINR5C971cUSiAji6APuNo6yoFPBX9mYUTzxY1vj4wVCGzZ06WEls09dMADiEcMPd6knnXw=
X-Gm-Gg: AYBFou0+WFoCLZcn7eA5uM7al1XxwtqJ1bMlIc6t2Ny0rQfdoQIosZmXSRFTy92P88a
	mqKmyia3WxfVkVMjIZrQ7lOxT1IUHAamIeOIMFoBWWIkgNkuZ5FWpHagGSKE75mPJ5vJJaq4rpI
	KFSM9fg5PY9Id4Lvm0YK3TV07+94j7v63mYnuTTjlStasoJ+gh6p0ZKGEKsPGLNhfp9kM9ChK5q
	YTOXxi0Ik1WMyL8CrPyRbmvyOEM9hB7vRJ9a0YUzolF+nfYbTs9iTpH672izjDOInSoLYVfAm78
	xwVY3JE8djdx/fCkq9831gHSWmBK0pMQdsfNSR53WhzHpxjYK4fBGkSUsdmmsqrkRb1LvR/rPLO
	4RqjEaPlT1o/XdvCfxEMioyZwqUcb0WTa0Yg2RlorstjP0bzgxXj0yBvtS0rAGhn456+6HpDB1j
	7CIZBlT7ypPES5qdteCJbHhQ1CE9R2xzKFE3tPd3Nmarom
X-Received: by 2002:a17:90b:2296:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ae57e2b787mr1494811a91.9.1793198493204;
        Wed, 28 Oct 2026 07:41:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2296:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ae57e2b787mr1494800a91.9.1793198492549;
        Wed, 28 Oct 2026 07:41:32 -0700 (PDT)
Received: from [10.133.33.238] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5839besm3357980a91.11.2026.10.28.07.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:41:32 -0700 (PDT)
Message-ID: <b228d3c3-ac4b-43df-8829-edb9c459860d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:41:28 +0800
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
Subject: Re: [PATCH v2] selftests: cpufreq: stop CPU hotplug loop after
 cpufreq update test
To: xiong yining <xiongyining1480@phytium.com.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn,
        zhongqiu.han@oss.qualcomm.com
References: <20261028100241.189085-1-xiongyining1480@phytium.com.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261028100241.189085-1-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ucHRRN-FQeLVtIlLfZlxMs2j_x_XEzbF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX65xgiCwKD3k/
 i63FMVKcrF5Q86svDsNbFntBVH6SDmwAiMOHsDaB8Aj1q7Z4McAByxg7TwOJPV+szvmG6Jk4FDs
 iSHUogTi1wPDxIR2PBw+9FY9AfYYdbA=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae209a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Vt2AcnKqAAAA:8 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=fgrLqfBXAAAA:8
 a=rLnwe5TcSjkNIz7vCUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-ORIG-GUID: ucHRRN-FQeLVtIlLfZlxMs2j_x_XEzbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3ptLtw7uOr5l
 XtdYJ1R6VEd/3Ar5RK6YUW2jTA5pN1vcHi7JiObVRg9A0GdJB/Q5E3LKG2E821WnqHUVljVS1qI
 sr5OrXPc4eD7jRjCyQ+FYkhCaDS68g7uqhRlGBxGLG+4/uqDcZEvh8J9eFkKl5GFr7AGtd+bw6n
 w5L8uUvzuSugTygl+4SFcNHHlUQKnPnNZnPYw28Ox2BEZZ2UyryamIhweoEEDKXZTE0Jzie9Amw
 WmpiC+KfK8TlxqHktWwWuIXS1kEWI+MAhgEIknWvoxXWO6fv4JsDoC8RPnd+I6kOsLvrv2mqpu+
 bPQXYCvRe03RBpQMrz9t7cA64pNUWT+j/T4LBYL70mqfo8MfdGy8fxC+cjEvac7XuCuQwuZ6nhR
 nGXHfVbesuDXZYpeFfJg7Qm+wvqEexpzwq/O1BgkbqMCx7rrBWUeBxK5wQXU+avxWBMeLQ7OCde
 W7kLBxIdF57rjz70iOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Hi,

On 10/28/2026 6:02 PM, xiong yining wrote:
> Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> for verifying cpufreq synchronization between CPU hotplug and sysfs
> writes.
> 
> Two issues exist:
> 1. Background hotplug task keeps running after test completes, causing
> redundant CPU on/offline operations.
> 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> before frequency updates finish, which breaks test purpose.
> 
> Introduce a file-based stop flag to control the infinite hotplug loop.
> After all cpufreq updates complete, create the stop flag file and
> wait for the hotplug task to exit.

The changelog still describes the v1 stop-file approach; please
update it.

> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
> ---
> Changes in v2:
> - Stop the hotplug child process by signal notification instead of
> a stop file, avoiding the predictable temporary path.
> - Add an exit trap so the hotplug child is also cleaned up when the
> main shell terminates abnormally.
> - Link to v1:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2662696.html
> 
> This addresses the security and robustness concerns raised by Sashiko.
> ---
>   .../selftests/cpufreq/special-tests.sh        | 30 +++++++++++++++----
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/testing/selftests/cpufreq/special-tests.sh
> index e87ed7c8e5e5..b3ebead1c52a 100755
> --- a/tools/testing/selftests/cpufreq/special-tests.sh
> +++ b/tools/testing/selftests/cpufreq/special-tests.sh
> @@ -16,6 +16,8 @@ source cpu.sh
>   source cpufreq.sh
>   source governor.sh
>   
> +HOTPLUG_PID=""
> +
>   # Test 1
>   # $1: policy
>   __simple_lockdep()
> @@ -92,20 +94,34 @@ governor_race()
>   	restore_all_governors
>   }
>   
> +hotplug_cleanup()
> +{
> +	if [[ -n "$HOTPLUG_PID" ]]; then
> +		kill -s SIGTERM "$HOTPLUG_PID"
> +		wait "$HOTPLUG_PID"
> +
> +		HOTPLUG_PID=""
> +	fi
> +}
> +
>   # Test 4
>   # $1: cpu
>   hotplug_with_updates_cpu()
>   {
>   	local filepath="$CPUROOT/$1/cpufreq"
>   
> +	(
> +		local quit=0
> +		trap 'quit=1' SIGTERM
> +		while [ "$quit" -eq 0 ]; do
> +			reboot_cpu "$1"
> +		done
> +	) &
> +	HOTPLUG_PID=$!
> +
>   	# switch to ondemand
>   	__switch_governor_for_cpu $1 "ondemand"
>   
> -	for i in `seq 1 5000`
> -	do
> -		reboot_cpu $1
> -	done &
> -
>   	local freqs=$(cat $filepath/scaling_available_frequencies)
>   	local oldfreq=$(cat $filepath/scaling_min_freq)


The background hotplug loop is now started before switching to ondemand
and before reading scaling_available_frequencies / scaling_min_freq. If
the CPU happens to be offline at that point (such as single-CPU policy),
those accesses return -EBUSY: the governor switch is lost, freqs is
empty so the update loop does nothing while the test still passes, and
oldfreq is empty so scaling_min_freq is not restored. Please start the
hotplug subshell only after that setup is done.

>   
> @@ -117,14 +133,16 @@ hotplug_with_updates_cpu()
>   		done
>   	done
>   
> +	hotplug_cleanup
> +
>   	# restore old freq
>   	echo $oldfreq > $filepath/scaling_min_freq
>   }
>   
>   hotplug_with_updates()
>   {
> +	trap 'hotplug_cleanup' EXIT


AFAIK, regarding the EXIT-trap-on-signal remark from Sashiko:

https://sashiko.dev/#/patchset/20261028100241.189085-1-xiongyining1480%40phytium.com.cn

Bash runs the EXIT trap on SIGINT, SIGTERM, and SIGHUP, so I don't think
additional traps are necessary. This issue occurs with Dash, but not
with Bash.

One sample simulation script：


#!/bin/bash

for sh in bash dash; do
	command -v $sh >/dev/null || continue
	for s in INT TERM HUP; do
		out=$(env --default-signal=INT $sh -c \
			'echo "$(readlink /proc/$$/exe)"
			 trap "echo EXIT-trap-ran" EXIT
			 kill -'$s' $$
			 sleep 1
			 echo not-killed' 2>/dev/null)
		rc=$?
		self=$(echo "$out" | sed -n 1p)
		res=$(echo "$out" | sed -n 2p)
		printf "%-14s %-4s rc=%-3s %s\n" "$self" $s $rc "${res:-<EXIT trap NOT 
run>}"
	done
done


output:
/usr/bin/bash  INT  rc=130 EXIT-trap-ran
/usr/bin/bash  TERM rc=143 EXIT-trap-ran
/usr/bin/bash  HUP  rc=129 EXIT-trap-ran
/usr/bin/dash  INT  rc=130 <EXIT trap NOT run>
/usr/bin/dash  TERM rc=143 <EXIT trap NOT run>
/usr/bin/dash  HUP  rc=129 <EXIT trap NOT run>


>   	save_all_governors
>   	for_each_non_boot_cpu hotplug_with_updates_cpu
> -	wait
>   	restore_all_governors
>   }


-- 
Thx and BRs,
Zhongqiu Han
