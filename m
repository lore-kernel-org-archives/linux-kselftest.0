Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF349364B
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141482; cv=none; b=C/9cnOBrSVCnx81MYuiSDG61R+xwDX+PdGjmQhCnh75vFl6lLxzGht5EFpz1ha5j4E7CpXSOD0Fwh7VCqNdx3Z/fm73MoYEH/Dfg8WQ183W4UnlOWEtOdgRXvvaJA5nhDXGYZYMOJGCb3UTPkiirfobNJYB72zKDDFmGvVuxfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141482; c=relaxed/simple;
	bh=lcR2Fhlxl4eRvKV2aDV7+wbKm3ijM4c8/wlYtrzXmuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C58SmY5FhkBqrJfrMyAyrXNXE+MnjChfR9Ue+/o0WZ1fwiDv5P6usN6to8s91JqgUp/MMxINdWUcheRw9FUKOw+bgFf+DD4OOiNAZ5mTf5q5KlVvDYNEd7FIlfz1PPTY8XrpFjzrTLZfjY2DSFi6wV/fj7BvIpO50MexV/0X6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ed86Ehpe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6o0C2v0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ed86Ehpe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6o0C2v0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFAIiJ659053
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1DIDB+x6TVxI9bR6AVmRa+Nh/rJ1EKyRd7jafxRodU=; b=Ed86EhpemUWHPrpc
	A1/sabt6fK8VXcL0QXO1psVFVXBtxgBOqiMOVVKTVNUbL6Ix0S5/uSN8lMRy5o1h
	bEp4bcgFBK39K1/AormBdaeIxzzMVytLiw6SiFs/+qfw411lM150nI3LBz6IzFrO
	dpIWtLuA0y3K9YW0RecQN9FmyaH2S73Itfe6LJwvcApclFutva5MjW/VMkZFqet5
	D6w/JNsd8sjpH5qqxO6z7gfZu8NG5Xk8Lmi2dJqOWZpaajC+7sqfg+G3ew1lkLSD
	dPBs2kEFeS9SJCSEvw7CENnRzGYlq/zWeTM9o8YKJvJMA/TyrgjmFNiNP0TWOvY2
	1b4m7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r4rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:44:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7443e0f0bso18306985ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141477; x=1789746277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1DIDB+x6TVxI9bR6AVmRa+Nh/rJ1EKyRd7jafxRodU=;
        b=G6o0C2v0QDxhlbjG0ZrIE24e9Z2aiVf3dIQvywz+CSKKGRrH6ORq2FFrZaOD1U0p+6
         qwYEE7m+FF4Fa7Cki2qtSdFnLbkR+MIOp3XWmPiODWPa5RCVqQ5ori4dzuWkQDHIyL4r
         Rx21yPINF/qUO8/ctbY0exeYXIEYV5VYG8U+TfZCqNK5SQ/ytsTTfknGF304cuqhrsnm
         loBJJfWauMrNifLYpIbzPmFNnSALv6JwYa53Ize3jRCaa/yS9ONrb5FyXeYgX3VICHat
         KIWD2KwJcCywVizuGKXZVvHyZk2OOYj6jonZDpkngFaVWhs15tvmtOyJpxo7axx9L/jo
         xc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141477; x=1789746277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1DIDB+x6TVxI9bR6AVmRa+Nh/rJ1EKyRd7jafxRodU=;
        b=SCk1g8ctcuOs0s2GHXgt4nLRAdOaMHEJdlQFjD97a6bndqGbm5n9hCK0QgoGUeGu6h
         tsBYrKWESwgmdXZCM6GsKltv2/PPnBtAuB7tp1O/LYfCtnqdUhenikOC7cWXh2m9aGJC
         FcYEUZ2g7sdsMjvJYIVGlxKa6sBU9Ll5d2La9Be0BFQYdYSDBY/TYJ+j3xCffCPdy6Pe
         OcsGeBoJvZcXkDAJ0+/X7yWdkej39wjyrec8zKVkIkwLs+XiGeiZBt4psVQVJIp1urUw
         3O963FzmD3C0G95UtzuKK2ZZaRDfoFo5UU+y8k0qCzsTeKy06nnSdGq4Wfvx+p2owG4z
         Xggw==
X-Forwarded-Encrypted: i=1; AKwUvBzGnBONNazQ6ddJO9CXATfW7fyRx03g88NFpZEEueFAf3rgz5ebB8+kKxqwkFBDM2nTdOflKN0IHauR+gcu9lA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1TiNufrpvLV0jEIMu27jKQaiN9INtmXBc4S1yVEcf7wj+FcUZ
	fiPCiVfw/Mb5yWBJV1MRqwA6GrKc3DEY/X/6j/fQ3dUUd+DIYSDPYo4Euun7VsAAldMSGFsNsUK
	gPQFyZaG6FQHMje439K7LvQ3x/D8MxGhim45N0M3t5NnIBySx1gG5og2xZ8EzRRjSVvmuKbE=
X-Gm-Gg: AYBFou0F++hBTqGYUw+DOwtxlsYXRr491z0kmLMfW1RA5doHsfdGrGU7j/VSwGRA9LS
	m/lGnaSJm8gwoNkBHdl2ZZPIUCiEoX29siY/8OkHvYbhAiQARTOBEuUgZBZCZ4xScR//865Y0oO
	YdRlQ0M4/xHx7zsfyBTS0uk2C/Nclub2bUgMiM0Vl+UaPbBlkJUOLQzjBJUIlxzDLtFuKmi2dWV
	tjBaodC39SYs3LTGLWJ8uzxJeQ+uMDtKXoLG2M2zjTOCb1aivfQJZELFCp0o00Pieub/Ag8HvYC
	ErmRCHD/PIwItq63OcqOOGQfepe6PTo1uXcQ5/v554D8gNrPWz6BqF3YN8o3i6yhTJvSQxAIRJO
	OgQPXCbKi1z9Hme943cPil5RAheCSAsEadw==
X-Received: by 2002:a17:902:e745:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2dd2a3502demr87243865ad.16.1789141477437;
        Fri, 11 Sep 2026 08:44:37 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2dd2a3502demr87243315ad.16.1789141476868;
        Fri, 11 Sep 2026 08:44:36 -0700 (PDT)
Received: from [192.168.2.5] ([183.83.172.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfef639sm13357245ad.71.2026.09.11.08.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:36 -0700 (PDT)
Message-ID: <908bb1c3-c9b2-4275-a8f5-55b51ac84988@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:14:32 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and
 selftests
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
 <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfXxZOidEp1nNH7
 LwUlx8yZvBTAzOsGLPaWjyczKJe3iyfDA33lVR7xxn+DY/khazZAfga/how+OUqKu92wceWaU1f
 7Y1lPZDeE1P3QzuX1Biwn1RqZzmkPExy77XN0xBAqQrZhcgphPPhVXuNw91wSpyPa3YRDWYACoj
 6Ky7lkQxFqWsnzZBI9J/1lMmGnQQbp7LOkisCniU9tVLU/cKD04cGX5zBVZ3Cifskjk0fgbF832
 jAAx4IivLOtLXJHUZifHyVidcf23V1O4nKLVjDygKaL4AnmtA0SvMb3BeZOaJDORzRscJ5ld7bA
 bve5j19XM9uCOiIa67wKOClaVLlEeYEyVDTb2wBMhT7BVE32ITha4mxNUSWpOlkdJN4w+mGozSp
 T914PIlCJzE1TmD9cirkz/zKXGUcMGELgxO8f0nDofjukEYsPaKxtxMM27HpDpIR3X0efqZpUWo
 BZ4aINv2oYVhEOW9vug==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa421e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=OBv5q4clJIp12fzIbOuMAg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RYFYpSSLLWBHpy-p7LEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: QHLX4yRkj-fmckvwawzQg7f5p-dTXqOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX+ArSjqm1fhIP
 sh3TtJ7/ZMdc1JXTZWEToLTcaYe9NB6RZzziBot2vYlO705PgbYPtyD1dv5naHN1m2YmSYM083R
 EoUdSFA4nEw7JOap/DICORJ5AqPlNBw=
X-Proofpoint-GUID: QHLX4yRkj-fmckvwawzQg7f5p-dTXqOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110219

Hi Daniel,

On 9/7/2026 3:33 PM, Daniel Lezcano wrote:
> 
> Hi Rafael,
> 
> On 8/6/26 13:01, Daniel Lezcano wrote:
>> Powercap controllers frequently expose a hierarchy of power zones (for
>> example package, clusters and CPUs). Until now, each driver had to
>> implement its own hierarchy traversal, parent lookup, error handling and
>> teardown logic.
>>
>> This series introduces a generic hierarchy description and helper
>> functions allowing a controller to instantiate and destroy an entire
>> powercap hierarchy from a static description. The framework takes care of
>> duplicating the hierarchy description, rebasing parent pointers,
>> creating zones in dependency order and performing the appropriate
>> rollback and cleanup on errors.
>>
>> The series also adds a kselftest exercising the new API by creating a
>> synthetic hierarchy, validating the exported sysfs hierarchy and
>> attributes, and ensuring that all resources are correctly released when
>> the hierarchy is destroyed.
>>
>> The patches are organized as follows:
>>
>> 1. powercap: Add generic zone hierarchy creation helpers
>> 2. selftests/powercap: Add powercap hierarchy creation API tests
>>
>> The API was primarily motivated by the recently posted SPEL series and
>> also provides a migration path for DTPM to use the same generic
>> infrastructure instead of maintaining its own hierarchy handling.
>>
>> Link: SPEL cover letter <https://lore.kernel.org/lkml/20260702- 
>> qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/>
>>
>> Daniel Lezcano (2):
>> powercap: Add generic zone hierarchy creation helpers
>> selftests/powercap: Add powercap hierarchy creation API tests
>>
>> -- 
> It was easy to migrate DTPM to this API and AFAICT Manaf was able to 
> migrate also its series to this new API.

Yes, I rebased my Qualcomm SPEL powercap driver series on top of this
patch and migrated the series without any issues.
These APIs significantly simplify the driver code for creating and
managing the powercap hierarchy.

Tested-by: Manaf Meethalavalappu Pallikunhi 
<manaf.pallikunhi@oss.qualcomm.com>

Thanks,
Manaf

> 
> Is it possible to consider it for merging ?
> 
> Thanks
> 
>    -- Daniel
> 
> [1] https://lore.kernel.org/all/20260819165605.1398880-1- 
> daniel.lezcano@oss.qualcomm.com/
> 
> [2] https://lore.kernel.org/all/20260702-qcom_spel_driver_upstream- 
> v3-0-434d50f0c5b0@oss.qualcomm.com/

