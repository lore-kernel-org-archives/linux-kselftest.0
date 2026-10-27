Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117889;
	b=sbwJRabvNwXkUAHijWNNV8Xn5pylAcSLg0EIKsqpnVjWeritfmGHg4KvmFiz1R9VjsZ9
	 1C4I0q87Lccfqvd0o2Bi/kgE7iQWNJYVUDZHJJ+pqwaia4KF0Lde6fEhZEpPT2WxKuQY3
	 9cqTe2sTMp9QKoqdcmwjxKGKRMMprOzzv//qFXJjYHnhNkL4wBeTWM6MHX07xwk2PjY2p
	 d9Hlh3NDPzymLW1NWJApOUhS1YT5a4So/FzhJFCQ4F0vZD5c0XdLXtF58SVhWM0tGwvBP
	 5ZEwux5lrG/8JHThZ7664kAatDePzlC1aw3id3EfHaIJx0ih1tKIOZ7KKKzqiAQ2kuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
	b=EEaNRDNMwQORwEYPKDhzaQdgPUrzAoBJg5D7hXDogZZKYIBF7B5HxeBKxNmcoF/s43ps
	 Y+bIKY3znXqVnvkgRy5B0tC3B57Rbi/iAQlgtm/5LvOYZogjr0fu9Fi9PSwcL5LxkLOLl
	 0IqjOEgMmhhuRnO3paufHbohNSLcHcw2R6vmYTmjxFOOaovissis0oZvp/RLygeMur0dk
	 xYZD3T/jmqXr2Sz7Pu0ZYXlzVpft3BgqyklQdQUHzZj/EIOES4CYiMPCPyQZ3HbPzH7vc
	 wrHrgXb18OHQNLm1EF7tcFBPhefktExaXVPogdwxTKuPqoLuiAXLaeVKTX8S8goi+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkLDoAVu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlLzR2In;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE3606A31A
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkLDoAVu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlLzR2In
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RG6SoR2157434
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=; b=mkLDoAVufykMfXU9
	b0wNwshi/OOFS1fGs2PUhkkdJTgKHecVqhmTkGvP5r4qVsM+99YVbuqYp42UzZBm
	2TI4maBCJKRfRPZLpK4EHZrA4GQCiz0sUK0TDussji1lhYQpdcZ+ik3hIJgvxnM0
	hZWRaYnTqGItcNiX0Kw7f9A/6jtt8D68cwLTH4CWc1agJ6uhZHLwqnGJA7wS3xzb
	vyELDZ4MGuWT4alpDXCC/oZm6s0T+j2wvi/ooq5od9IlQ9oV1WXkYa8UMu1FHjnR
	88tcaYIVwMLXmirQuw4xV27zS3jA/EgftwetVNFFnLWWu1MMo7IZQzPRqk+ELF69
	G8yO2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g01ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:18:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso1027619385a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793117887; x=1793722687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=IlLzR2InH2CS98YhZBCaotjhyEygpybW1CmPXgAkPnGDOyPDXOV3gh0D+loR79QpFg
         k0RNJHqPL35aU+JSC13lBbScU3nKaSVlIiq4h0WxDuJT0bAiQztzlTVd/Z+l32W5Em3O
         dxtqhznm4Ydsf8oLJitYAVWC7eeS9HGuU+WGJtGL4XuHvlgKMaNxuPPKvJ5f5Q8Zbjh5
         E21UoR/9IoYX8du5rXjH7b1bSrDqDYpTZLA6Gl6kUvNtYrd4CIr1taUCGxvCLbb9fVu/
         fS1Ue5Nw9IbMR/0vQS9LHKoEwf++0jm4PA8qlntLZV1rm0n9iClTMG5lGWeIuLi0poLT
         0+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117887; x=1793722687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=x7NAqQO0Tp2XEYaSym8iSfCi3gEFycKtMzz99lar+PMZ3/4WYZdVdnm+fbHISGwqJO
         YuuznYh23ncmAUlCqLv/qa7TSf4y7WX5oavyPFjoSarj+PhBg+9xJLtpnnofxRwiB9f3
         wO1KXXrvcTD7KN0q57ASC09HhuicaCHHrjqfGLEw3VpNAIdIjKO3VTUKZKPO04m8JymQ
         SbUzEu8snwUPKGEhZd7Ti5NrnpMx44h4kMb+M0WEd0d7s8eKccSjkB0oMOEbWOgauwi2
         6lPPfqgpg1f99rKw+jFzl9zlDUtk74xcXwEeJl4KJ/s6KKvVAq6KkDpztnCI+iDNTnKb
         cmHw==
X-Forwarded-Encrypted: i=1; AKwUvBypLOAX3z5lVTkFfrwxv40pFpH0wSenKvFVD/1Jd579nzrB9eloXnySUrYnuEkFubXUZjiezmI3FZ1KU+r46uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuY5mWCi3zaNNCpR/bzyy4KYjyKqPVMrgdbM1T2PfH47AEP8KW
	I8CQycCGJLdSATJS+W2GwzOlpe6rVl3l97C7uxkk6bWJnp/QwCidvfPDgSQ4S7DndTEOi3B2iwy
	ZP0zpbEMk2E2uyOeTHfoMmitYTJvevSIE+4QAbLJzqE4LxhJP/BpT6sTXfpA4J9eklul5KgiCNr
	93wuQ=
X-Gm-Gg: AYBFou017xfG/iTnrZxPHRqcvrgnCJvWk9isF0xPtnq2vMxwXvyCaHRj19Rf3pju2T+
	1dXCW8ABYRKjniO+Excqx6ZD9FWkC4e72DJtIlbWw86E5juAVnehb6rM8VeQbxs4ESgXMnYwygT
	+I8qbp3tK2A4Vnp9hmZlIObr16DmMWCqAJKM5NUH/UEW4x3hW2w21oP0LW/+ZQggNGujEd19+7v
	vgCl8UtlYVfJYqaB7dD5AOd6GDoxBlHU691jnSMmWC3Dgo3ISGMknG2eXJMiSsrXBhh3zdTnl+J
	pwTos2GnHkKQPhk2DzHoHdFDOrRHeSw4tSJFhd6TlEt4snv9lkL5f0m5MBIeS/K/uOSRalNI6Fh
	n16qmi/YQagIM24aE7ptAkcb0Mvf0IvQ80Xvx1Z6uQQzRDfPnIsOWsBHhaAsnBA==
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634333885a.48.1793117886924;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634328585a.48.1793117886452;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm25927477f8f.48.2026.10.27.09.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:18:05 -0700 (PDT)
Message-ID: <8e53d1a3-fc96-4d07-8be7-74f383ed3618@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:18:04 +0100
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
Subject: Re: [PATCH v3 2/6] selftests/powercap: Add powercap hierarchy
 creation API tests
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org,
        Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <83799bf79e85e9e2ab77140e632f11d96b17a04f.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfX9e2i7Ol+d+T/
 6JJNiW2RmyvnF9hswygSrSam/hvlIzcTuKjLDlhlPBq5fAttnEZ/BKh/BKf2vWGF4ODkVJM/h72
 FJgCMCDdGiByyCO2eGGv65w1j1DFmi4ByPCvGj40T3RU6lMVRnAxzSqTRnr1/LJ5OyocADbzAoA
 mJ0+5sj7J7Ao95sVzForrX/eBkxuORnUIO/iMP0hhudmx7nMWwBR9eEc+6PIkNwPWC+N8IFa6B4
 qy5jK0nkUOglGZFxMb9cnOh3tr3pz05TIdYpwoIEF0Vb83k7X9vN9Jo2TPHH0RL+2a6OrxjcsGp
 LkeqjoHhHNJpu5zN2dJYgLjAoWGVIab5C2zGyYaCcc/z8bcS0n0hQxumCNEbHrxZ0tgEa6syvGH
 yGwsuyngC24jIxvlKmdbxN2noqr9TNDb1xVNcS5mh5Lml2G+UJ7QY1b6F7pN97Y2RVTeioHEDqz
 XkVn804+jCWBSBq0sLQ==
X-Proofpoint-GUID: WWJH0T28_wRgS2igum-eQ8nVbN-jHapL
X-Proofpoint-ORIG-GUID: WWJH0T28_wRgS2igum-eQ8nVbN-jHapL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfX6Cyn8Xh8EloG
 V4piSQlEsm9dq/uUJjMQ9SKJS/XmYRZjNvkcI1ItAIHOerfmXRZxWMkgWFkefntHB7HymAYaueB
 j2bkLwUYEm0vtucJhFW3XZpBq9t9MJk=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae0cec0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=82gYmaJqspjqQrwE4UoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270064

On 10/27/26 17:10, Rafael J. Wysocki (Intel) wrote:
> On Tue, Oct 20, 2026 at 4:18 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> The powercap hierarchy API introduces generic helpers to duplicate,
>> instantiate and destroy a complete powercap hierarchy from a static
>> description.
>>
>> Add a kselftest exercising this API. The test builds a synthetic
>> powercap hierarchy composed of a package, three CPU clusters and twelve
>> CPUs, registers it as a powercap control type and checks the zone count
>> and selected sysfs attribute values. It also checks that the controller
>> directory disappears when the module is unloaded.
>>
>> Exercise direct static creation, duplication, skipped clusters and their
>> descendants, reuse after partial destruction, and repeated creation
>> returning -EBUSY without replacing existing zone pointers. Callback
>> checks verify the controller, name and backend-private data supplied by
>> the helpers.
>>
>> The test consists of:
>>
>> * a kernel module implementing a synthetic powercap hierarchy and
>>    dummy callbacks;
>> * a userspace kselftest script that loads the module, checks 16 zones
>>    and their power and constraint attributes, unloads the module with an
>>    attribute descriptor open, and checks controller removal.
>>
>> Use powercap-owned zone allocations so registration failures are cleaned
>> up by the core. Build generated module files in the selftest output
>> directory and extend the common clean target with Kbuild module cleanup.
>>
>> This provides a regression test for the powercap hierarchy helpers and
>> their integration with the powercap core.
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
>> Assisted-by: LLM
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Sashiko is complaining about this one now:
> 
> https://sashiko.dev/#/patchset/cover.1792504834.git.daniel.lezcano%40oss.qualcomm.com

Thanks, I'll have a look

