Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370415;
	b=fEGw5M62sm1ydkznA4lWgS6tJbwYsvsejjYGQJh2pcqFGyfB1A97b5YMvWRVZsm7ORtf
	 0Img7gUobPnwpGCF5WBMLdO01BP04mC0eX2L3lx4GLZAqGGfoo41x7SkBe0wgHY33lZDD
	 VgGBZYUJ6P8rwOL/pkkLygfHHTV7j851HhQUHEJEhzsyVBkHvYZd+tKcGTPVdDrtjwgix
	 MrE/GL57Z60k2eum660KkaNMc+WJpdqQqhAem8gGrBjyXNdYG/lJVk9/qyj7wTOra2l/U
	 juQbWJqve/AqcQhVemQXqW0DaHON2G1HaOa/nmmaF1/hnuyoz58sr/u6tHAHokrzYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
	b=2Tj4bVsK+Xg3xKJKBMJrwnyzjtNQHCtFevdp/YhlS/nDON8WbNu6tukMK/sv0g6P7dPs
	 CVzHoq9g9Xi+YBPu2kaZTOuXYP727IL6EkZdunvMt7ANVBSpTGV61HlnxckLP5X4iSswm
	 xyo3IWmNufrrnPmnpQMp8vuw48459K0X7oZYwZozbf8NLJZvyK5/hKm7CT+VD9t1MS9yq
	 ls4jP+ZaK25EWh9KBiH31sHYffNXWxb/ol8FWSymvmPqklZely5YSpO8ne4de6xw3qJ4h
	 X+2hQPJtUAtLHS2dWy7PNBfshhcAl+QBJ1ofafMTIYn0Cb9e9VMulMZzdaM7+Qeh03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCeeaCFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g3k47dtl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E6606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 14:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550E6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCeeaCFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g3k47dtl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn8Gi3122905
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 14:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=; b=DCeeaCFIyfTgBGCE
	VrKDaL/o5zAiqilZKMzWNepzRLy0Ntx+36ld4Y6UcQxW30rZQ3tZqqTl3wIkRrzl
	bS7Mw2TT7cjBqqeswY7Tum/ERLdJ8i+J3ze2hwBqIi9f63hBbFe/yO5XdjupoLtR
	+YCNPoI+MspCwd4yDgkmfSGky9mkRlRdx43BRlGlM1Mobv5ueMVwp9l7iZbpwPCl
	6xyzA1vpY0BKLjMcZx7XKJ8HAOc0qHHUjhlr9jiAVK+v59LgRi3TX+ShE0zQWKHs
	x1kpLW9XddjkYRrzAK1bG/1cWi9Dt48JJek27KzKa5jE7S3cyqZZwVYACsjVRFTT
	lGBvGg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkfb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 14:26:53 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67686ccd1b6so1125485d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370413; x=1793975213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=g3k47dtlfncoocsbmYrCW4WPWowWq8VxUiFTRSZw0NVrOkC+BwJJlNee/JecSL0lhR
         GG9gWxelLH1J/glDJjH/cU1daS8GIzkzplExVO8lkjJmHrO9v56YdtlESNOKQgNolxTt
         D7miPoDpDDV60dXdLsIDXie2HcvswKhCrSYGqlzRA0syCWFJteu18JZzH3qL0ocvuHUE
         HQojgAeVPhK2elxRl+cqvuYwRtzdtft84PA1irvMebZtsnypZu89rnpiz8LB0gwES+Z1
         6/lCue0E8y+LJkJ+FltlkVaPN9HwvmjTcNkARflJnx6aIAHWljJxjh+C6RR/iJmGei6t
         jnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370413; x=1793975213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=SX5IuMMjW03cUUQfXPjcvyKgF7yB+qnezcFimgUXsAvDaFE5+aysipEldEtsGpnn8O
         CUSRvGsnYf4ixs9GmW2W0AKCl+EC0DfmXyedGQXQnMa3Kfs+t35kaBI1xesnr7+kutQS
         q5OTDRccO4vD1r5A54uTjNfa87NZ2Z2R7v8yRiPbWPPQd4wAKsphhU9C3nHLVzz9d+hA
         d+5kr0u5tTVdMFBaQiGbWl/51c+SP4+ZIsXHgvOXJQBJfFrSU8kai/5rprb+d9p/s9Qj
         AGoJHRlx9w9+LOFh1rNLKyrhZ1d3YrptO09NV8ewhqQggd3lKg0HsWi6fRv8ks2iMCFq
         gEJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMWGVZGZjywFzNK4WlIszcqhvin7wtUuW0/WtQRG/kIC3V8OZkQV+Q3t/I7KmR0JsxTGSaEhNpXUiSxDpZPrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeodloHvIo9/3GD9xr2vfy76ovUf0F3U2rdWcbQpXsi3/nGcCW
	rM7PsBMRozi85RfRiXe/C7lLt/0OsHzOYr2++aHfUcXQHbh2vK1RXZGP7aFgIFdKSccy7n4/r06
	TZpEtNeph8jiKtyKslo47tltV9vB6JDKntT2cjB50oAWMtlfOCOsn4nJ5hgF4dk9O9v0LOsw=
X-Gm-Gg: AYBFou288kRhCIj2YUshRlU5vIBy/HRmFALjZQmEmzD6NDeKospfhzIxuxrTRPdifku
	Ak8lAmxs4S3TxrhcbLqsBOset0KBG9Z9g8sDw2lj3gK6ghkTz1uyyFQGl+0w1FTq8jypS8BvkA6
	YZFWmGEtji996xTdc2A/VOqXO/MoFFLriDA8DQiGiN96HYqxNeXuD1VyKmmnePwoYWtSfbV33Qf
	B1nH5vOabOZnZTuZo/xFThOs2EPA7ZfHaKzB3Y7SNvZT4ZnU8Jm7cdqSWnwn+zS3i3HLB95BPJo
	ceTYcV1/9e2cjlVcTanb6vQ2mINZmt0pMLDfsM+byMp8ynIt42qvm5kapeauus8mINr84JziJSu
	TPUi9NBZIkKk8Ub20nzDe4Uks1kcZs4VK5ztALRvseVV3okMVvkvFeir4pKns+NQp6TE5AQN125
	otMYpSAhqNekZt2+s9CbaNCbYaG3hh4q3XO+U=
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391842d50.4.1793370413207;
        Fri, 30 Oct 2026 07:26:53 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391821d50.4.1793370412652;
        Fri, 30 Oct 2026 07:26:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm3456455f8f.43.2026.10.30.07.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:26:39 -0700 (PDT)
Message-ID: <6b1a831d-299e-43fd-83cb-74a64f844d03@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:26:36 +0100
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
Subject: Re: [PATCH v4 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Lukasz Luba <lukasz.luba@arm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <78abd10309b51ffdc3304997376d58e55b29487c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4a92e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=jVzW49EHFVz-FHsPnZwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Ep-IMYElRrvS1ABbzGPAqy0_886CeQRj
X-Proofpoint-GUID: Ep-IMYElRrvS1ABbzGPAqy0_886CeQRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX1jfU2IPZ2dDX
 EvoM7avfnTUgstJ7M07xTgD1g3Le+B7VC+IqfRSCpks4zT/eSoQ+hKJyztUYtGsFGjFh5Ox2zJg
 O2JAsEnhqnccILtDfNmwPbzMHGzV3ZY+nyWN0IBh7K5xcDUeMzZlokEilFQ2zXOu3SuWQP5qLXj
 0VX/XMV3tC7jYPsD98iTBde61jMK/XvNbCp2ZMSSORQo0o/SnB36nQkL/rv4zX7Y6nnO1jpXtWf
 3QJfEepE4e7+C56ghlScFB3MjqyDC/DcMfvGdg9KKbaRzAex82RW5rqI9xK4k/kiDBpQAGwBqLP
 /Bllkh23J1qutf0tS5EXBsKl3uXnXfCSfS6DUN0wAY6Wy2QfW3klI+ZTaXCZMUAFk/987gFSDp7
 v0lF+kP6B4i1q9J0JZVSTsJ4+fjs0r+oyjSoo9GKsB+4zxxPphbjlQvPLXtODZ94a5g7nMPQj43
 N1K+tfjto2+CLPnCabg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX6QkeQfoh6i2B
 J7bLkKxaTe7nz2dhnLlaZyJTD2YdLlwn+YD2AW4MyWe24+qpXN7lXja0xldBvVRb6PBVsmVihCK
 sx6rDCLaYbplH4kiDZi5381jKRs4LuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300057


Hi Lukasz,

thanks for the review


On 10/30/26 15:02, Lukasz Luba wrote:
> 
> 
> On 10/29/26 16:56, Daniel Lezcano wrote:
>> Powercap controllers may need to create several powercap zones organized
>> as a hierarchy. At present, each controller has to open-code the
>> hierarchy traversal, parent lookup, error rollback and reverse-order
>> destruction.
>>
>> Introduce struct powercap_hierarchy to describe a powercap
>> hierarchy. Each node contains its name, parent, backend-specific data
>> and the powercap zone created for it.
> 
> [snip]
> 
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-2- 
>> daniel.lezcano@oss.qualcomm.com
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>> Changes in v4 (since v3):
>> - Rebase on v7.3; no code or commit-description changes.
>>
>> Changes in v3 (since v2):
>> - Rebase on v7.3-rc7.
>> - Add a static initializer and clarify hierarchy ownership and locking.
>> - Check for existing zones and validate names and parent ordering before
>>    creation; use zone for the runtime pointer member.
>> - Allow NULL callback results to skip branches; keep errors fatal.
>> - Use explicit locking and a signed reverse-loop index.
>> - Explain the controller callbacks, their arguments and their 
>> relationship
>>    to zone operations; update the description.
>>
>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
>>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

