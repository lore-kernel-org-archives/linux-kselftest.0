Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05183C2796
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775390; cv=none; b=DOTIf+7UF6G9KBwKpD+SEujQtIg7HovfO9rHj+CjaC0Y/U11MrnAq4tGu/XEb6ZiqHz4SBA5w6vYOGUoyrVW68+Ly2yrfQlCQ6VrKcU0lZWlekWUtVucqg+JluNkKf6kvS8wQmaio/XyiHgbXC5GFd0I6RJ8ZdHmCoYIPLwC8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775390; c=relaxed/simple;
	bh=u858oefPAQOSDb/at8+AC4GTZzgA1wXI5Wvo+XpkcEs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=APrx8Ck5LxG7i+hDOaXj97AF730Sdl2Q/2Y6pSraASVhZ5paK19hE4oE020fcR4jWX0BM7TN38KuIZKTeORuF7OkTl48NbzvngEuLhey4hisIWG9Uv3DXQ+mb3o4mA+nT76U5+Ce+zktX8noYNu8ZkLzNH6oWMs88B92WvDc1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQRtzyYC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIlZTHUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQRtzyYC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIlZTHUU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bc1A3702403
	for <linux-kselftest@vger.kernel.org>; Mon, 7 Sep 2026 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=; b=YQRtzyYCoQeBsG1h
	AFgmG6KwSpRtxBE1bN2smpW6l7Bqr+MbeN/Y1OK415m1icVP29jqpr45n0zgM4s9
	Nw1CtkwBjwYnVHNPAqez/ktgS2VEP8mRSHiSzjPKrKTYjIYQ3U3T6mSMW/Uy/Hyv
	yYCYS+eutao0fPWc9afp6060B94x+udB4g9+v2wI6Xg0DJhWEVJFtr7Ex1+rBucF
	TEXBbDCjiArU5hoOUYhn8HLdSCRNB4ueEKp5F66PRbpBKsx8FFClebPahPCdR2rU
	Br7gLmhttZMF89bIN3D3TmeJOMfwG9q14sW9++7EzG4cf8holOHeLF+0qNWb4GO2
	OHkTSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66h8f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 10:03:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso562416685a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775386; x=1789380186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=;
        b=GIlZTHUUVln0yLTS6fvU/wBCfxairKfKmhBm0O/W0Nya1FanIoFSj//YyjCXlLWTKe
         1fnF3nTWft5a5SgFDmZvOAmbDepuen02oHahg3sQ8yhh4UIYw5ACUjcU7+yIcISdJZah
         Rw+3U+DyEKYvN2Fc/PDip8qmGWfMGaO1T1gb+jU7W9rQVo85wLQqgSuSjLdfVx6nGLwa
         cac/ee6PAnMlBPZijrHXbZJl0xG/msW7W/qFGMEo5/szbKQuls0RiB064m1fmmAfaRZl
         kaueh3F2RAfDcmDdzOygcc4w4Q/DP88JNJNjMqhN0///v3mTnOO8kCWW2kHhg9wc4M5v
         iWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775386; x=1789380186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=;
        b=ewKbY+Le1S9oiQgz5sS5YxGettpmvhm0zQozOo06OHwOUAGoaWT34wy1ggHKhD8Jf5
         lSguGD3HhDHe1ngCs5yvSd+fRa4VTo+WC8f1AyUlpEhghh3DojBowg+c/wqI7n5VWDE4
         7tUxs7XIDL+IVzJRJKIkgWNfnwNiZNaZq9kRq39Hpd/Is+tfAf+0lt/i0gyCT2o+ngeo
         F5fmDxahlnbbi5DxvKBHyBuv0HSCbwocpidZHurvIPs/81qWbHpTw2DcifxKMFt73YHC
         YrtCL+DASDm0BgertabpxWokV7zwtutPxS7Jiwm6snCnzXQKBGUAfhumIrOLfeWx6qb5
         3rcA==
X-Forwarded-Encrypted: i=1; AKwUvBxAjrPoXwnl8ipZtD4pdDTTqYzNZ5/o+3z6Jpl54H1skBsmqIlqTRdE/u05RnBx44urizW787FupioearpEZVk=@vger.kernel.org
X-Gm-Message-State: AFuF++l8SQ7k9dJTKeLaWsSPrY0/TL1tvPp4jQPHvLYORbMlKkzI75mm
	/3vQ1L9tivHcUrYIMFWa6Urf+sSSd0lQDKeo2roBHonv6XEph+bpkQGfyU9ZMuexWij9OtFAdu7
	VJ5XEPGfis+BZYnykkBQzbNqon1JknvhUv85zh7TqRi4QJLHOyv0Wgq/tk7EBrX9qsl4ZLiA=
X-Gm-Gg: AYBFou1Vk1PqVNgnT1hcKyGLL+mlM7KUJTEc1JfrekbIBKUs/JEWga3HPH3SR3MZAgd
	iIah3o+fGUxIQDl2d8goSI27i8VTZ5xHaSXvOPVc4BwFsXrJRop/ZJaEXAPjon9l4jU9hu8FYOy
	cXvWELWLYchshleFnkuYtPZGGj+EnSY00EIMhOhcAGgwuqD9Zd5DOL3NAVzaHziqvj8sE9T21wW
	YUFETfj+J1wSnB9j5Fcb3LK8Qrtl+Uo4XG8/EbZZbVkreY1NhRPyUj9urkhpbVLiA9fK57VDP6t
	UhHnE7pOXtrpz28rGWz2Y1v6hhOBV+DlOPqM1nsjOM+LULVxOq0jZGrPaOpIJNMMb33OvnVvjaW
	jeB/QKaUpjEyGs3yD1kM9fVsc78wQaWyxBaJy6sR76+WIZ2VmqkTQ2yIGkJ9yQ/o=
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr2208355285a.0.1788775386303;
        Mon, 07 Sep 2026 03:03:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr2208345485a.0.1788775385724;
        Mon, 07 Sep 2026 03:03:05 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5e04:77e4:65ed:d6d7? ([2a05:6e02:1041:c10:5e04:77e4:65ed:d6d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28042627f8f.21.2026.09.07.03.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:03:04 -0700 (PDT)
Message-ID: <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:03:04 +0200
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
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e8bda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sDQwJVceT08lulBnrQ0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Zc3AWwOv79Owx2SFZh04VsLthv-ouDsR
X-Proofpoint-ORIG-GUID: Zc3AWwOv79Owx2SFZh04VsLthv-ouDsR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX74EqBaUNVSem
 dz7bFkauH2NFb30iwyee26bqpxoxAT3/3QgnIWqwwn5/KBc0LsceO8dSWVeGMr/3HbPkbaghfTv
 SteALK5a1pRRV0E8TgI0AR/PDEB21uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX/2Ff4D3DncYt
 F0lN4LajKZ+b40hl01gsZ61i5/nFMf8magIjXvAKqIKBkcMBqjIcXeb1UyL8T6vJOD3OuhR+sY6
 igWVG/v9AuW8DtR/6hlCR5VUwPekh6KSVSL0k62PB6kfRJNWtuvp/mluDuxZOadDLi67Galhbj+
 8ZDjouoACHNv+kk+uCzmIaZScKcczKEzxxSj2SuTfURQyVY3RgqJoShoq7NuRJP3Bxr1AdOLJVV
 KR6Pf+TCM254P6OKckJk6uuD8IyW3mwJAMAknnYzAcQSNy2RCBf2KtVKupo5/ohko8/myLBB2AI
 JOSt4VpF3KfYH084fpBC7iprdKVABCva3dSpHyhuNu8f1QGSRPiJ5S3yHpQaAl4qcX7VTFU2cul
 hqB4DI8aUEJFdy9AnbgM/x+6Almfl+PieiOCqfb0egWzHAv32ixVWuaHCh/3KRhKVOUc7ENhGgm
 791TVetUmV4vgYmzkxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110


Hi Rafael,

On 8/6/26 13:01, Daniel Lezcano wrote:
> Powercap controllers frequently expose a hierarchy of power zones (for
> example package, clusters and CPUs). Until now, each driver had to
> implement its own hierarchy traversal, parent lookup, error handling and
> teardown logic.
> 
> This series introduces a generic hierarchy description and helper
> functions allowing a controller to instantiate and destroy an entire
> powercap hierarchy from a static description. The framework takes care of
> duplicating the hierarchy description, rebasing parent pointers,
> creating zones in dependency order and performing the appropriate
> rollback and cleanup on errors.
> 
> The series also adds a kselftest exercising the new API by creating a
> synthetic hierarchy, validating the exported sysfs hierarchy and
> attributes, and ensuring that all resources are correctly released when
> the hierarchy is destroyed.
> 
> The patches are organized as follows:
> 
> 1. powercap: Add generic zone hierarchy creation helpers
> 2. selftests/powercap: Add powercap hierarchy creation API tests
> 
> The API was primarily motivated by the recently posted SPEL series and
> also provides a migration path for DTPM to use the same generic
> infrastructure instead of maintaining its own hierarchy handling.
> 
> Link: SPEL cover letter <https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/>
> 
> Daniel Lezcano (2):
> powercap: Add generic zone hierarchy creation helpers
> selftests/powercap: Add powercap hierarchy creation API tests
> 
> --
It was easy to migrate DTPM to this API and AFAICT Manaf was able to 
migrate also its series to this new API.

Is it possible to consider it for merging ?

Thanks

   -- Daniel

[1] 
https://lore.kernel.org/all/20260819165605.1398880-1-daniel.lezcano@oss.qualcomm.com/

[2] 
https://lore.kernel.org/all/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/
