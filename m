Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373125;
	b=KD7PWHSqLW1DoPi2LkzTXb1puVg2i4gjyrTbG9vAtDq3yimvmxYbGE/VU5efDASCJDrl
	 aBa1wMBCwRp482Qev3J2HeXL1FAVJpo3KAVADY+z81EiSHqKuvyvvR5Orl8riF8ibJXE1
	 jFs8dJ4GJt3GL6RL41mncavgG6fbMvuxiPCDdzSzoEWMjg8R6tyT00g9juTu4QHrPc+Sg
	 t5AtlNK5c3phZ8ULMsNXxqGI1tprYtXmmf5lmsNm3VUyq/QRmueZ/VeHlWldRIhdNLFRU
	 rrc1/KdSXVWufTdWgbxwHth8oIg6rMiMruoE5+ZJzrrw07qyeHxvkSKRLWq7RWZcGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
	b=kocsuEDdH8jMs9LUggeExH0gNPjnKjVPvtCpqCVdsurCVhNcRPcnd5ZB5zUpG/qly7Ke
	 6V6jdFSoI75auayZI7Ja3zQV7URkDAz5pha81kwRYEn3afdTLGr3zKHuerArYdOUyNG/R
	 aMZhyTwjYh4gb/qJ7vNo3wyyJ9c3E8q6U4MZtSrIYgMM/Mkg5ZMBuWrj9ouTKZEOfVHnk
	 Mc+aJ00gl8satHEFARKOMwdcHnhAZXy81Uf//rAdJBSZuEHAzR1GfGX1m13HFJjrZ3Dxi
	 E8HQ+FbQxURez62DhgXl7OISSnmScthqsoJjZVz+kCvmphAB1DKcme1vn607rmLaHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BO0y8/fH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gb5EwUNn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8ED606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0y8/fH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gb5EwUNn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEijsP4142560
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=; b=BO0y8/fH3gLQSh3E
	LwvuppWg9czyH21+fMKkV8oaYpToY3fS3rmoGfx2EVSSlBMfxaqRBCcxG8WMysf0
	dRVUKvZtpoTVQFJDRpwAQcFhvsnCz6oQEOpkGjSrq0Cfv/DsYEwMuBN7EqaIoWsV
	4oIdvSlkAFLXOtCs9ACPMhlB8okTuZlsjj1swpJGYZm357OQhx5HfwxpssxAfO60
	VQ5X5lpvSVe5RUyrVs1ggORrwUaDRXpM3Ld/oJbMJjGE6lG5DXoMCArPQJwnRVnm
	u27BQE83Lta0EyA9Qkzio+6p1eVaGXr00Y855YyxGPnJ6M5I3KzS5KMSdXiVoiru
	fZlHJg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkp4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:12:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso1002180b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373123; x=1793977923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
        b=gb5EwUNnguzxGhdzT/ZIQDbt1Q9EXZnYVVtlPP8lfJSJkCEweAVzLnAH93FfRsFdR8
         6j9f8PHm4JupaGvhQ2zwngU1YCvRElxNN44pKGZ2Dy5s1S8JLGxaYyPn2SKmr2NKOGMs
         M7km+dl+QKBOsC6wo9SyXdQJfm/0RPXGxPAOk2zvo9zh9H6VXZcJJrsFID5l+WqHookR
         I4zTLS+Hzu0n4tu+2WzbQEyodjtNH8nLxyqAdBGxSWbk6Jkaz4wPFEkiDECDbcl2Uazz
         M7xNR3119Wa6K/wZBxLMPxbm2UTE8tKGHVEEXn2WUeJ8gi7Niokt3Np7KaAPuTf720RS
         5DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373123; x=1793977923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
        b=JsCUIjmu0/24ZAOLr62xSAYTwNLX7KueLdZpOt+c92SyxWVlgiw21//dmZAUC2f3zS
         1lTZWyBA+f9E6prtWTyPbIV3F3Ve/6SSqNF+g8VTNMUdMqwAcM65q85ybtYX6tegYttb
         pu6QhMjO6hA3lMVOY5keMZEa/aJfzYoiJkqLo+GbXewYpBhbHh7ZJJ6f3MN/iZjq1iE2
         OjcDKo0jDJnTkrv2P4OrXxhmwpHQsxZ3ertZeKarKuJWv4WDuDZr6xeAyCP2heXLimqc
         Iu7CDi1JseUmXO69FF7KlXowrnzNvouvhNxa35bOkRuknhwVvBIsrSZDOpOw/OaBuNnN
         kxsA==
X-Forwarded-Encrypted: i=1; AKwUvBzAXG1aQi8SMjR6l2GHu7X9I62n1MHxWDoxk27T+i3e8XFni+veHnIQzYvWUjXnqHQG1ktH85V+y5E1Wb5ywE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOSFQLi7k0EiK8BJm7fMHsDKqT+iuGPVm36FzkwVkJZwqelyC2
	DujpqmxXMhqnQm+I6m38Bb8UoR+yngD8nSMwdSlqFmAUHf3GOVIgdfHSqMeORXmFJC6VEdeh/5E
	ZeNxtjibVYRd1I0FPxL/beMZtuyxYv3Q7/pa0Vc+dYPm13/HJ15NLk9JgEPoz6CVIeM3dqlE=
X-Gm-Gg: AYBFou3dR0FQnramMRL+cLFv2zwxECZxO2dSk13raVJ5vW8cZLe5sOHRX2gdTrfxeNT
	TwujNoDfliQN60xMqp/oMYnNkksNQdJWo/lA1iImvW/y+V8QBs3atM3R3g64k9yzdneUtG7oi9d
	6EI4szHKsIXHOfsTohaZU1j5teGHLe1ZOFZYz9psBmjeVNmW2WOt831r5RiL41BG8bCxLCFmS5p
	Yu022CcQAGXsIAZecslTjH4+6OkiEz+uBU7jbDaCC7EkuRbJAIunit4ZAuXDpZpdtn9s9qMijoa
	FeopsnMi4O5GxTeKlrZ5YB5/tuSOP4CvC64HqcCpCwYbKaUxkPdATNSRm+wr6oaPMK7bY+Lpmof
	mHQCnYynYBZbXEh7XZt7QyjGwZM6lm3PmsMRqaao7N7qr0QZQMhx20tdMVMzaTOCln4VrFsC7Da
	T+pU9EkysHqeRv7vVqvyUkPoBp8ddkql7YX4s=
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr2282958b3a.10.1793373122491;
        Fri, 30 Oct 2026 08:12:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr2282935b3a.10.1793373121972;
        Fri, 30 Oct 2026 08:12:01 -0700 (PDT)
Received: from ?IPV6:240e:478:ea8:4f7:3946:ff2c:1750:9851? ([240e:478:ea8:4f7:3946:ff2c:1750:9851])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm112820b3a.36.2026.10.30.08.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:12:01 -0700 (PDT)
Message-ID: <a6840be7-bd50-4e64-af1b-0ab9334d8ec7@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:11:51 +0800
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
Subject: Re: [PATCH v3] selftests: cpufreq: stop CPU hotplug loop after
 cpufreq update test
To: xiong yining <xiongyining1480@phytium.com.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn,
        zhongqiu.han@oss.qualcomm.com
References: <20261030104213.2030283-1-xiongyining1480@phytium.com.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261030104213.2030283-1-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MCBTYWx0ZWRfXyi3wEd/Z5yfj
 cSmW1bR5km8iWdGB9QzEi9UphSpEje4sCAMYFyNKK8FaRjFo7vvHVvFns0XeIOeslMLGnV2S+bo
 65go1sKdFqzKHCyTS5HkRD+8DKrPsy+MMqF7hLjr/kEFUaIxqzplgE3UDSQ/g8RyzFr8mLWNseD
 p0iOhMeBuHPbuhxDCV6zq+YA5TG1TztJraULRipqPzLaL9XSk9cD4rW9fNVW0uTUytV7jMf0rYj
 OpaOxXEr6Sl3nd7VWVkTKIZNKNXUJbY+I1ajRGrc7bHq85qookbZFTQXkRjNFm3tIWUJofRt0eB
 0IaY7omo7iOXYcVy1CWnSJh0mpHtLbuvVU17AQYHdZ5pTiX0W92dd/sPwU1rYUzpXJGlifxtiea
 k5vc8UNOEnMTbHHb5ali0i1MET9cISN3HVbcHt+PtFVGWM+H/9RkLBvnQFXQfzaRl1sQxNJ0r6T
 u6x1RWOFOyHZCHFe2mA==
X-Proofpoint-ORIG-GUID: UdFP3Y5-SHiMenDRS3125lo7BcSMlP7z
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4b3c3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Vt2AcnKqAAAA:8
 a=VwQbUJbxAAAA:8 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=xRBUsY3wTV8rGD2bDtsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MCBTYWx0ZWRfXzfecyHSYxvvK
 0H9SVVcctIBwQBlHDW2SFW2pkvPTdyACMQZziNkrb4cvpjFzKEc7Yb8GzR/4ARsMDdgLNG0lYC3
 jE4m0WoTd65prkbY/lI93atB43aryUs=
X-Proofpoint-GUID: UdFP3Y5-SHiMenDRS3125lo7BcSMlP7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300060

On 10/30/2026 6:42 PM, xiong yining wrote:
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
> Use signal notification to terminate the infinite hotplug loop, and
> add an EXIT trap to clean up the hotplug child when this test function
> terminates abnormally.
> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
> Changes in v3:
> - Start the hotplug child after governor switch and sysfs frequency reads,
> to avoid -EBUSY errors when the target CPU is offline.
> 
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
> index e87ed7c8e5e5..0665da8f2444 100755
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
> @@ -92,6 +94,16 @@ governor_race()
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
> @@ -101,14 +113,18 @@ hotplug_with_updates_cpu()
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
>   	for j in `seq 1 5000`
>   	do
>   		# Set all frequencies one-by-one
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
>   	save_all_governors
>   	for_each_non_boot_cpu hotplug_with_updates_cpu
> -	wait
>   	restore_all_governors
>   }


-- 
Thx and BRs,
Zhongqiu Han
