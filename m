Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE63F1640
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172408; cv=none; b=BmgyqQvX7ivRELFZEccdUK2+mqaYIHoxOkPHbG+8zhedi44JL/5Zr1Te2XcYdKaRpFgM6kp9IzNb5+OH0BbvDkJ0LLz+k/wCUsjw4qGz4fozd0fktG0rUsGqEKrI7l1lWz+zmlDrVBAxnKeC4JzMKmhafugd9hDnSfXJf/2tHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172408; c=relaxed/simple;
	bh=W5NN4WE/PtSRSXtIHu2m8oFMP7RB+f45+NtyKYO291w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbFZWhJpQKreztbmAmLyiXz8v2I+0xdRxMBH1f0OEDacMOqk7fQPDv0ENLQqSYlK+6QB82l1JUpqW2t+I/8d2KqsXKmHVQ5kmF7iHwmqW04f5SoVuL4Jv6gviUb+rKYAVQAYDDG8HJic/noBDq9E8oN/+RkKnDFZtOvYpO77t5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAWLQl5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J40AC9QA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAWLQl5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J40AC9QA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUBT2637893
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=; b=fAWLQl5A3BrA3sQg
	RTqfA7hzstMWLo0BbO8cWY/374Uuonh1jwMGdtexkcP0Xrl/jIrcXoEt+c7Zc7sH
	9X6LVsnP2gr5Im6Fs83JlE3cBtQ3mmSmEjfSTRrj71oTE1kAnCkqi+A2gGhrzOtk
	83g5vkpBj4EpwjdIANsyLmq2NA0tt1Ce8cIY634uncSF0/QYi2n9QrQyBeXP5BCQ
	6hl/2f0thnysdWZRtWv87I7qdBBa/Oigrhl12TuCBK5jD5+AxaGqCQZaUOsBJwAt
	o4tqfF4VVA5692N1nnLFTMDldPanJSEfEqFAWjdEZCna2RKNtyDm+erGjCyeOpdX
	T7urCQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhxmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:06:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso168819241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172403; x=1790777203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=;
        b=J40AC9QA5qKhnbD+A/WvKWNY7ie+i6ah81IGis8aomi5LPAzmJvPeZpwTE9sQhLooI
         LQmCenc6lVbn0qpWXPhfukiqgzuzYt5QuCXUu7NnYVodY3pE4Ift9R9PVOPjjSgu7kIy
         6PtDvcmeQMf3Fg0Lc5HSp1zvqgtPq+q4UDBhY3POwS9wqfZ5GFaS8X2wx9qPJu1mIeVl
         /+c2ErLys+HgyI1t9xuM/bgFPeCKS/ErS5NbOw3SBu9ZhljOZlSigDPy+3WEeGWaVDlS
         G878/+HXKSKIOKbP/y+hKLsMxRSI4VBxjI6Ht2yY283NpOOkKciC7jJlpNPEVoVAcX8n
         rB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172403; x=1790777203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=;
        b=qcJZKQeq0gbjK04+Jg7he4faAmVQL8mk0fLnScZUB/lkRLOdmB0/iHSy6EyHiZVi+J
         cy41WO64NqphIRgsyieL73t+dQ2/7kpv4aMQI8Z1AM80Kl4wGp6ZqsFEJ/PcqrzQ9QiQ
         x+hIgxvXjqCs69OvZvPh1p/S9kIFiNctDmcCL+xQlO/k5fqi7+M2wjSR0tkCZhxdHKFV
         mp0wI+aycerQWA7m+dFz2UYOPCWrYODexmW4ICcNnqvoiMPdBrO3zioDKIDZhl5xJ/UY
         /7ecMoFws6S+WJOjwSCCAOY+4o2xmkacI7zj8cATuDNngfo4GL4Pt0V5rx77kgvfIX4Y
         bS7g==
X-Forwarded-Encrypted: i=1; AKwUvBydyNuix2aQKycNUql21fvVCUCvDRrn1vVCn098u6R4HHV0Tq93vpjRlG0zcY106LKXZHjiFRR0AZ3gpdcn+Yo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltk19DhzWUi2Dfdp/TglC3rp/DUCSIbHZU0mMXLmMfTMB7lNyh
	IyKBt/FYg7FxbBUtMoVRXMTgI8ZDwYbs6iHB0iHwGnP/IKk4nQB0vT7auQwVPUgQnKVnc0rgEac
	SX/Zb1wuRg00mKR7b5s1VQeVPf/BItEgxmuNFQJ+mzTr+Jw7lRqmfGVDITBzeDK076wrIkoc=
X-Gm-Gg: AYBFou1RZfBWsjCAmxWxjsaRy8qcSpSzyzQZdNdiGH7WJoeh87JBCU0GQtHdtgLtSTL
	xcDZxo/59GBw70+2dlZje+Iev1aH1ayiEiRci/OSiCTN7gsWL3gKK2+O6JSBsw0Is/UN6QpfiR2
	IhWiihVqjk53m7WF8/dAbm4oT8BIsotvyhhOG4RZPLZFinJLTYFmkywGsWUhPKMSDsp3iU+JFpN
	gPasXsPW551/CteylqPowXkq50gC/YXjMEyv1L8wL+GwQcAARmiKhWkYnMgkIkh9s//ClxqIySq
	Uur6S2D9jsm9B38oYCcI2/8Z72VMjm/OVBw++9ozNa5K+lXt5emzdOgJzcYW4E6ZNwm/lf7NbR4
	AQdZewmXHNbYBunOegvY8OleRTq+WhpiGeAgcsbGPrrwQOiaG+R5swm8b7VL91Q==
X-Received: by 2002:a05:6102:6b0a:b0:7a1:f7d2:e83f with SMTP id ada2fe7eead31-7ac1bd45ed3mr2292152137.15.1790172403299;
        Wed, 23 Sep 2026 07:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a1:f7d2:e83f with SMTP id ada2fe7eead31-7ac1bd45ed3mr2292132137.15.1790172402812;
        Wed, 23 Sep 2026 07:06:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d978fsm71645165e9.9.2026.09.23.07.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:06:41 -0700 (PDT)
Message-ID: <90d07176-9550-4abe-9670-c7c0c89d968a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and
 selftests
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
 <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
 <350caba2-4a95-4945-91dd-0be89b2d3e22@arm.com>
 <71932f61-5721-4363-b163-427432fedab4@oss.qualcomm.com>
 <f1019e70-f3f7-429d-90e5-c74234dc5cde@oss.qualcomm.com>
 <CAJZ5v0hcqkeGzuhar7e1zdcAEKO6Q3btuSjF9tM=rXv5f5xZZg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hcqkeGzuhar7e1zdcAEKO6Q3btuSjF9tM=rXv5f5xZZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7V5gL2iV8HrqPhVpP1BvcA0bYxglBWYj
X-Proofpoint-ORIG-GUID: 7V5gL2iV8HrqPhVpP1BvcA0bYxglBWYj
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3dcf4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bBP9mPAd7I3mHMJdqGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfXwbEr2Hi+Gu0J
 LHZd5hpdCJE65/ZSayAJUQh2p9X/Nbr/Vwqc1YePRY27bWi6mjxUqKC5kb50kcqFaYuH587JHe2
 nWrT/ZBxC7rJ73b7dvJXxhb6nK7haRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX3hsEp6h3ws60
 nRBklReyNh/Egt1q0nQoGGCHczU6h535vqXDTBvtfXqVCVnLqirFNVCURSukXUyZXmqOFbD36iP
 6LXvBuJpoh4vegI8setafCQesIx3G0L6Rdtz9Dbkzr2C3dm+FKqBWwcQBQz6iV2+WSIl8w/t14G
 1vv/wtyey3EpHE6PAuq5c9q9sz2wALNBD7tlSVU6UrMzopxZKhfs/zofxIWeagNVOAqSQLemxjL
 zmLKD9aOvZ62qbzoDO4WNHNmfw/BHmDzUDjSdjNsiQU92856VV70iJscRd1rFrgZSV+rvovKv6D
 g5gPIXBpYgiGU0m8u4DmT6nb8scTEE5sVujqrVUa45+oksDYUrtBSZE6WC7OLKzmdcYek/PuBR7
 hwNZHtZtRqnfrjjmVyHwT7UwGjqiY7SFwkwc02og1AMtsb2LwrJwtoRjXW9jtMVrIc1ufgMoUdb
 Hz9JEvs/v+zqNtGKKQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056

On 9/23/26 15:58, Rafael J. Wysocki (Intel) wrote:
> Hi Daniel,
> 
> On Wed, Sep 23, 2026 at 3:47 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>>
>> Hi,
>>
>> On 9/15/26 12:54, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>> I can see some potential improvements there.
>>> This patch is a blocker for more changes: DTPM, powercap cooling device
>>> and SPEL drivers from Manaf.
>>>
>>> It has been tested and there is a selftest with. Is it possible to
>>> consider these two patches for merging.
>>>
>>> Given it is not a fast path, improvements can be proposed later.
>>
>>
>> Given that there has been no feedback so far, would it be possible to
>> consider merging these two patches? They are currently blocking further
>> work.
>>
>> There is also a selftest covering this functionality, so future changes
>> can be made with regression testing in place.
> 
> I'd prefer to handle this along with
> 
> https://lore.kernel.org/linux-pm/20260819165605.1398880-1-daniel.lezcano@oss.qualcomm.com/
> 
> which appears to be the only user of it.
> 
> I thought that Lukasz would send comments on those, but in the absence
> of his comments, it would help if you combined those two patch series
> into one and resend.
Sure, will do
