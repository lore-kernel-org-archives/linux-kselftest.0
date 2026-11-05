Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892745;
	b=BXZiaWzxF1NyQMKFMmz8VCHje3sEpXJEWQNnTD/9OF/ej03Sd/CH7sA5Iv1A8UDSZ/D3
	 pzPYCSSR0LqkvRH6U40ylJbVKgwEpLJSgDzlwuQYZ9DE0cqY/pBZz8Kc7XrFRo8sW99gt
	 +EFuo2y+bhJKtTMqt3RpdutOEtjokvA/fkZH2epqRFORfw4sSGUXUVJVgz6JGPpSoTS2c
	 CoigSs+caHcAChV5l1Z5CXvbhYd9+qm6KRRsKYMqpII+MUFkawvrmF8TrvZU8ist+fB87
	 B4KdTKkBIDZkyJ77v4S8nxgjNCa+ZKjiOYx6/I5IrC8smLIK+MImjT/gjjeciWeHoww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
	b=Kj4ZGmVDDjUdadNSo5cSLu2e1/dThIy0enBoUyfhICkeydhXwguApHwRIEK94GLmnzQv
	 gQfU/VhwKgYYMOutwUdCVDONhjyqStAReNo3QL9B6Xu6PE/yWTXndoY/wS9Sj/z9pNBSn
	 xsmCAyQSN63owxjE+CgTJdg2+9rfhdrEVYbYZgJ56bgtt5AQKmUZo2LipRbLHncKQNG1+
	 7ZcdPJWu1HdhrTrmAVtgD1yXa+wg6dS/DEf33cHXf4PUhzHOFYMPgDRvPFvkLqSp+8ly7
	 NPW4ur6SawseCxogLfJ2o3KeMbXU6Y1+hB2grefGYS4VXCxFd3lekX+xob9ic+oth1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1ILuSim;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUsEEJqA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87179606EE80
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87179606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1ILuSim;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUsEEJqA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EPrSi2081285
	for <linux-kselftest@vger.kernel.org>; Thu, 5 Nov 2026 15:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=; b=p1ILuSim5deoO8ja
	3wphI/7Nsrgrqxx/+9uzSfHc6ihiO0isa17zG0dIcmjBGWCIGX3RU5A3vPW0Of+Z
	zSGCJNAB4ydNwylGt4IqRlyIdK772pN6VFyPJf+TIvRvvzawMEqD48Zufsy500lU
	VubhVlKSarv8F6EkCPH872vYZ3cSJoY89UoYVSApubdcnd6RDJO2UnKeGFvYYICp
	CuKFeG0Ccl/lQpZv6Fm8y6DNZpuRQfpmwRav889WXfIwZFdWPmmFg7moo53X1wDB
	OTdiorrPAVhsTwtpr+ft+Tf/Jg4bdcg9+1ooCmuyqK2aaebKn8G69z80h1MuY+9P
	Sgg0Gw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraas70u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:32:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac4de614aso1731279e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892744; x=1794497544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=iUsEEJqAEQ/1hYUc1sK1t45AlgNgX4bjkphvJjO01DQCT6acITHmMj0md6xEKoCZas
         uK7NDeTE2VIcycrkpkj5meWzPhLKE4SPp53B/gCvWovvqwUpOo4/ZJP15skC6tUY0mmR
         cjuIvYXg3LrCXWFRncgriN9gaOhy0gKCKCMf6jGW8rDR7jIKUpZHZQLwv+i/N+r51FOD
         kK9gfTKhoxPrMhQC3mQ+XlXshbAgCF5xFmXqAXc4QvCSKj+xkDcwAIbnmCx3lIieu0/t
         zMeAXMH7KHCUXam/0rSxx/3wn6On+YlSQdhdoQ6EhTON1VTF8ZUgDjim2SZQafAEpkTc
         NwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892744; x=1794497544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=aYQlQKWBNugE4IU6pFaOVWpKvB8y3/PFYtHfs9BmoVeumUzfKC80T5hLRlMiYBPeTd
         SLeMca99AUvnLH8YLm2emXyYARlQGVsqRtm4RoJ9A+y+dnMymuB8UwqnH8RJw2/ndctU
         +D2Kmw+gccA2kLO1Ttma5LpsA8xzVjcrm9r5CJVFuAbpTe1eW7Ojv4tH8A7GGOXnw+3y
         d4a1XVJj3/lOnB5gHMn3hm3vw9r7uw34Ht8FSdUsXKv2IYGlbzdlGerU6Kq1xgSq4s+a
         6n5QZGFhKsL/qErDHQtbckR0K92JQL2uNcMTR6fmUpcfRHqWRaHzdABlPCd5LfinbwUU
         RQuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvVn2mhBSQtFJh/hlMBWDlVgQXOpGWUrpD5QM1fmGO9smLMSeMK3dxWWDduLC0vZ6EjvSNDzs83oT54mVJk50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tBJv8qonmoO7AiERc5Bgt23+clM4OjcH+6jI1p7rk9MfmtG1S
	vbheMDnUYmbf7VPzVSCUOwDoabRPz+H1XN4043wvqIutePvj/BeNm0HAIpNJFG9zov2vmA4teCj
	y/SpqwjXmjLjXyHIKT2EZHMSC40jaGy+hz9KIMm7YFBa0rNiUxzaIjPDnc+83uQNrkdl/xaI=
X-Gm-Gg: AYBFou3FFFqCI4NxXwrT12bOPsgAacO8D1nYkHkJvKHda+oXySLO4bPo2AE4JZoTg8M
	l3jZyVUVp/UJ7EEjuSkNPi9G4KPzbfC4ccvzonR7WM5MZzGdpqUaep0UGYFJBR8SIV93ZWWE+O9
	B5hdFIgXnbNP5NGeFSgX0OKxHExSnr8GNMu8CibhaZkfz81XutiEUCdvSPCOhAxRg0HMH6tQ8Ac
	A6TvFeCbd8tvDn1EI1IAx+6YRxyrsEhnG4UNbDMRnA3oEUQb2q6N1kUn96QxtNmypVgrT/aRB0e
	RUvFJxZF+YhpyBsRFQQqMtk20IljyaZn8UjDyyzbBEV8k9jQOoCLv/3eTQ2ZiIYf1M4cc4gky2H
	J/Yj+y3nYacvp93gsA4scIvSTNLeqdUarh5VhkSi5Z64BFnlDLIG/UOcba91pZ+fpki4q0QxcE8
	cMOg==
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780601e0c.3.1793892743672;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780528e0c.3.1793892743105;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm70424915e9.1.2026.11.05.07.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:32:22 -0800 (PST)
Message-ID: <6740e6e8-6b77-47dc-8b9a-b81efb557664@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:32:17 +0100
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
Subject: Re: [PATCH v5 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <d33ddfe789ee42a00d3ff3df55e0c4011e69debc.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX+VOS0lr0quuF
 zuHNVss6UZMbgASc4SIAlUkESbzc9N0AzLRuFrLVOP5aOf3WpzujbGcNzBrG9o5ikxlJPFD8dKT
 sxpGhJc0+8Nma6NpmOLaygfiInB3Z4I=
X-Proofpoint-ORIG-GUID: 4mRwqtEreqoeOhIE32DnlhZDLcWd19Ik
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aeca188 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=49fcMjTkyU320Q8Jtn8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX2C2yi3JIM3Qs
 Vr7cV17bV9iIIjOFRvdLxmv48VdW+rHbYYGT3GLT+x3RQH7kfUcqyQM0pbbi7YVr7FYjeBcFbMn
 gzYzF6ZxYJFsnyUBLNzPXb7E48EAQtrQdQmFXu6j60D9kCuGC+9MWohNYviIgPVnM2h5I7yGEL5
 VdhTcuSS9SgsI7TPxVz4x67yPzJoJo50fZfQjeqn9KqEIqHvR7kD1Q0I3FxkDdvG9DEwWvPHRSA
 Iff2PZNcsAuyCAzsITCbSXxcuGtfcjcj2RduFy87l/UBxfJYs/mH7jJpBOqHyYP/FhL5rSQiKGb
 0jBt0C9ZC+HrgZLS3zzm08YNLarWAgXgQno25FEwWnbFx/QJMFoEXAzbxi9FygyXphrgvbVUF8t
 yRfUu0YlpY7kParY6IGEm2JFT5K57juI1mmqWr3gGkQyvuWAYSU21ryqZBQPOfGsfWqauNgSw6o
 NuBBbOuIzVaZ5t1x4RA==
X-Proofpoint-GUID: 4mRwqtEreqoeOhIE32DnlhZDLcWd19Ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050061


Hi Manaf,


On 11/5/26 10:35, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Daniel,
> 
> 
> On 11/3/2026 10:18 AM, Daniel Lezcano wrote:

[ ... ]

>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
> 
> I rebased my Qualcomm SPEL powercap driver series on top of this series 
> and migrated the series without any issues.
> 
> Tested-by: Manaf Meethalavalappu Pallikunhi 
> <manaf.pallikunhi@oss.qualcomm.com>

Thanks for testing !


