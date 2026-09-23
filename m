Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CD51D516
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171225; cv=none; b=vB0kux7PE5tOFeAnNJICITyoIflgiRWrH9zuApbV8VF6eHAB2xJGmhPDm8yfzz/axtuCua71lROVVJeMbc8y0icQAiQPg9zMnCHnbClzQAq0DB/u0nWlatI2QByh0d16wiI8Tiisdi/kUTMHwo12RPF4HLkbryi1qHVwxLordE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171225; c=relaxed/simple;
	bh=r9wwZRXRDoUzEDe2iV2KAxJurfwIq0DoD0JkxEj7dxM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=an7StqoebzxyfNwnW9EMg4m8iAJBG0Qlkeab1VNy7skV0rrTB4mtlnDJYhxW3d6yZkvRZJT/ITHxfZMbSd9BroSTPrFrBxRekyX4Zyg53YvItj+c/FeqCB5LsoWzKuo1orZNOTGdwHKLit1o89/ZoeDtC3fBVT68yQjPGAhvI2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hC1fnalI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NftXghvT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hC1fnalI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NftXghvT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbRSX3295417
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 13:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geGcssYpsGZNMSCzxFuphi8z+WGP8Ft2ZgUpm885Dng=; b=hC1fnalIMy1vVG3p
	oOUAFoNdlRl4ndu9uMbs0/6DUW3ySALDqKDq3OeWRAKhu5I99YbK59fn288mdRTp
	f8gAZrc71pqO6vh2UQH2OYCOA8rC2PizmOykX1pVULnKbwP0WTkjV2mJJeRYNOua
	uqSiS5OqFY+jR+kEdbq2L0av7uJE+QBKMy6FkoLVOA0kzoN9rrTG3ipCW6wsXfFJ
	/dwTmCYm48PDj21QJLXDpM2JG6mve+zLffiIqKORAUWYuVEFoY79/acZc8+ILkP/
	Z2cToeL0cObFC3gX5zHxaClehl0Sv2qxnJY/PkbN5EzzbYBktS+IgDVghCsH4EZ4
	5xvR2A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm93sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 13:47:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a9378b844dso341243137.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171222; x=1790776022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geGcssYpsGZNMSCzxFuphi8z+WGP8Ft2ZgUpm885Dng=;
        b=NftXghvTNG/0HlWnIeB35NZ7mGX/WVs2ohbSGSfwm41f5tMfGUKuKBxTlJrY/QnXwy
         KJCmgnDX7qQvw9HKOjFTHgcbi0UspFGQAXB0E1PC7mFQHykwXXC1PbYeJBsstUvHhGBC
         bLK1ZZ1DBCtUvlUhR+/8pJ9Ca8qn622WO8olWMx4dYFTfbVDtsZin0Hw0BuDOzTBZoTs
         Lt7FdJTbBXcJ6Dn+fdbs8zF008lhcv/kJbiSJVEbnpuER2ACDBbNu7QipgCZtN9keKkE
         L94oBu6eY2Axi+M1AWstI5kUtMb9+M5DTs7DibPbwj1liX2biaC8gieJq7wcXiHnPiIz
         +kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171222; x=1790776022;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geGcssYpsGZNMSCzxFuphi8z+WGP8Ft2ZgUpm885Dng=;
        b=ekHy76qlJ1kKTDxdg8X29ibFOjlqtYoDjFaVpr/7LIQIb+D2086C4krSfBRqdJdb+9
         rjHn/GO1ksPN84NY2s8JyG1GsWTGIW/rTG040em3TPO2wdmr2bSb4isq44RU/QcE3OdS
         jvmUPo7ZwDo2vidYXO9Q1m6ikneJrQDs9mMUpqmGGo8x5qWfkJtfldXqxKrwKDGVlPU9
         pYRZpP4GLr7Z5CRWrSh6d+0rkw6668IQtGQiGO7535DaM29+o+Pp1V1hiZ2G5SqpMx49
         hGMZoLYtT+qpm0sRMpReLtXJR9Q3KDNW7WK5kJueA3lRukzay1FZixxRgATE/7LnJq5K
         6BpA==
X-Forwarded-Encrypted: i=1; AKwUvBzeE1yj5bSudIGoXlkrfaCrsjS20HQWfnSRJWLbyDuvFzfoCEjAR8PraqXvkgxZXdB4vVuFG7jcqze4Vc3YM/I=@vger.kernel.org
X-Gm-Message-State: AFuF++kzsVoL6SNi3xzE6HldXVtD6bsE1l6SNn4Z3Ni0hCBo2Xj8ZRhf
	bz1we7vSWw6cg6JE1tim/YaXuBWL5MVHoGAdjJTX8u+qLQUSN16vtNK1oXzUsaL1AQlZ24mLAeE
	KSQD/NAs4dIAWD4iypTYungprVHTaalnKOp4SLqEPczmC4nsPSjL/z7/eVcC/hM1Nnz5HZo0=
X-Gm-Gg: AYBFou0+ZqK9Ju8nnNJ/cbgLH/x3F0Erk5s4iBoXgAMgarii5uEog0eTzRqQODZ1o2Y
	BSX/zoPbN1GMqPAsJKfkq9WdYs06SWTl4WU1jXkIRMUFeGzBlLu7yKrU5qghw52glWfAvcft9Fe
	S+CTOwbMTZxj2ZEuzCGE8zn3JS0aZsRM9oj2B49wgoIVSJFcXH3jZHFGamUcFYkUctBbRLprp0m
	pysE6NZD9vyemUi2wKvIigUejidoD7PLwbo2+81W9PANV6DjZFlzctb6CHxXJor9TcwQFhUe2fx
	FpuwdjptZZuLQk1QknxqU3/bHlgC5fUDrdbDJYM5Lmurwjo3JcmZwa+kMR7a1OLh5OfFHdmoB4W
	4mogIx4eY69fbggMjs2yJBE4Fzz0OYtW6VwFJ8crCzLytRgXTiLbGpZOgiEiNmPO/1ZjWS1+Y
X-Received: by 2002:a05:6102:578d:b0:7a1:f980:e938 with SMTP id ada2fe7eead31-7ac1cca4150mr2099968137.20.1790171222541;
        Wed, 23 Sep 2026 06:47:02 -0700 (PDT)
X-Received: by 2002:a05:6102:578d:b0:7a1:f980:e938 with SMTP id ada2fe7eead31-7ac1cca4150mr2099948137.20.1790171222130;
        Wed, 23 Sep 2026 06:47:02 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c5c41asm48190155e9.4.2026.09.23.06.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:47:01 -0700 (PDT)
Message-ID: <f1019e70-f3f7-429d-90e5-c74234dc5cde@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:00 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and
 selftests
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
 <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
 <350caba2-4a95-4945-91dd-0be89b2d3e22@arm.com>
 <71932f61-5721-4363-b163-427432fedab4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <71932f61-5721-4363-b163-427432fedab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfXw9fcp5jiWQOd
 462QwOM+kHdwttDYeQLHXqCUuk9p7M83C87zAVM6Q/PY+CwK5r3GlWuK2t5RAOyq9nHgkWant3A
 eYGiS4NzFvJKto3BToffNK3w6w/az20=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3d857 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=-dodW9W5Qp4Lww_EinkA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: iAUGEKf2jidvWqh5pXSz0H5Mrm96UVXb
X-Proofpoint-ORIG-GUID: iAUGEKf2jidvWqh5pXSz0H5Mrm96UVXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX0K/pCzxMx7jS
 w6hL7LFMMmumNsED/Dvq8IfL/YI1zW4LR8CzsJremLqD3Ty+1vr0bebXshnT/gjcFLroPhYTC0S
 /c+nDvr9Z1P6kXL1SmYWtyzkwIBEtWcijpNY3I1AqWxZQVjXgPM82f6bmud+GDiddIgiK5kPM7o
 IcVnbzm6nEEa0H7HCj+4gyBk4/vOc24ViMPJSNATZqNB2MMhCa1s8IVJAumnr62wJq6Oh/Enif1
 +I4eiYUeJMAc3fZ+rB+MX5fVDhzK1zzYx5Jhe1C1m1fuEQb8ntBAYy4bKIxeox7GrjFkQtlmpYs
 3zjHa+0hPnpCLetgB5DjysipWapcMMlLdhQ/mZojidKz4JiCS2Y6W6hZUM2p5son8Hm4lQpxvay
 uxgfMs4HwtLZbmZt3xFKEFvWJz2OUoHCkD9qlM+w2FHRmo8fMM5M0Kizh4MgFFd8l/JWBqnzF3S
 ojGIGejCVOG9IADSgKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054


Hi,

On 9/15/26 12:54, Daniel Lezcano wrote:

[ ... ]

>> I can see some potential improvements there.
> This patch is a blocker for more changes: DTPM, powercap cooling device 
> and SPEL drivers from Manaf.
> 
> It has been tested and there is a selftest with. Is it possible to 
> consider these two patches for merging.
> 
> Given it is not a fast path, improvements can be proposed later.


Given that there has been no feedback so far, would it be possible to 
consider merging these two patches? They are currently blocking further 
work.

There is also a selftest covering this functionality, so future changes 
can be made with regression testing in place.
