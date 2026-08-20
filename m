Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571463806DC
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239503; cv=none; b=SDeMkfb4zW3OFRBgE2v9ZF/T6pKVZz88IBp6IKFgN3gZaj9a8YetB6pq6lwIS2wB0+3345COARDScZ4/bnIRZCmbYIjMcEB5Lui45R5e/WZ2mvYqaXN8E+uViznhTAJyoWb3DskmcGy+gMB50M8Z8zw8UfZRMX6+X4LnCcsblBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239503; c=relaxed/simple;
	bh=eE53d2jyXSz21PeM9cf8CETUbAt0aFGmDm7pljVQkPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAGcHtXQnyj0Xyvz8fwePR3aYatFfPXjbPXnc5qTgtEa2YXW5wASaBkUeI1U2PuQgwPH1KOS/3EMoHEmfi8sVyhTG5mPT8Ne20SsUM9git+XhxcaYhLbhZMajSSjU2LXtjRe9vJfZwQoqtY0WIeW/qb2EP6pwAvRywoFb2d89Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLvniwF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwFBAMgm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLvniwF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwFBAMgm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7tgD3235102
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 15:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKu9p2Z6HFGUhuOsCYesWd6I664clFOsS01M4s75MYo=; b=fLvniwF9CfjfvCno
	Kpea4ktuJH3jo9088z/57hk3AztBhPUmc/MDLMKczVlKEdfqs81bADdb9dq/WVh/
	18R0pQwUEA8DxtPp8yR//KAi1fbzcYVTk9BreMEPkpN0kKbZ/P7wgq7R+nQdHmsu
	n4PFrQOrrF60YT+fBZMyQqqYr8/QAhDsKzpLmVBfefI2EQuYNxn2N8/NIjrKzM7e
	KT++RYiZVSNEEd/Khr+6kTAW4L15QiJZDDDhFXU6WtL8klczlmvUpqsSMidwylFW
	J82hszgTdt/FDUFMsn2U9yUb9KnHKN1ZWkYxN+p2uxZzbM1D4An9D/HiG+lZ6gsn
	LDB+ag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv9m38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 15:25:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dd69b00cfso23958971cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787239500; x=1787844300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKu9p2Z6HFGUhuOsCYesWd6I664clFOsS01M4s75MYo=;
        b=kwFBAMgmq7HzrKp44d5oLoQtpHB2pvc80BII2ectu+vRpP+wPwNyqWU5oxHH1ymC/j
         dB9pn/BStU8JB4TmCSyrGUkTo3hSK1orGT4GaCcMB45FTViJJUEObjAY0mHlcM092rGi
         w++/ciXtUDVE7Be4mJbUKfB2LE/3SCmwuFJJu0F0DfFKrIesYhweQwMWu4x1a1SrF0y0
         g8OTqo7Us6gHqE48pFI3tWWDLS4s4YvdMsDCN1WWga2BcXsb5OE1/Bv1AHI5fnoqLo56
         vha6X+c+GDUTKTiIdnwN4uABzlbQcPvyEAnJOboefTJVVdywigAzrs/9kR8j5klHXV8A
         KZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787239500; x=1787844300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKu9p2Z6HFGUhuOsCYesWd6I664clFOsS01M4s75MYo=;
        b=kOkveMvFPRjo71wTiK8dB87Ut4/+b/CGXQYi1dfe2enYl1XUhQmAStQxvaLr2vfVN+
         YT5GHYUEljp/QgnRXcLp9yAjMIQTxDtfkHxUK9wlnwabYuDxsukeInXscCX0AB+UzeG1
         ete+dVr4iSsTMflBjECt50eeR2qGf/FKhU0ue4Pg9ugWN3Ys50egc/rYNCEjKSu+Sg/c
         crkWYJ7BWdquBrn78R+Q8JBn2TrzrwLE8wuskQ75Dh9Lc75XbXyH9aiul+kk8evPEd1C
         V/OeZdsFV/58Ki7DZPtJfN/Ih9hNyCzRxZFlezHzJ7Ooy1Podi+y6XZEeGv5VO9gQVv7
         +GXg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz2sqhpNkJOt6hYoR5UzrD3/8ozqLFE8hHMfBlYjW79m0PLij+d66uRnQWFfC66KJ2U4bkPBMSKTX0l4pEkGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JNiTxEIQmSm+sIzrEgUuRQ87WoQNCET3HswPFEg5+oy6OZuR
	umTy4N+4OBZBuGgz14dyMT54OBJP95EHte3Kr2VZ9ZLFtogTYb0O0WVR0RZSh9hSjPLIFUjWVh2
	a6PLZkM9+8vryD0CSTpmO7DgwN45OVQ5m41qzxXwJNmZmivcGQtdB64QhIo8hRk2iXmS1N8gL+Q
	yjfuM=
X-Gm-Gg: AR+sD13N48BLUYgdHPSvGW1EZ17xP20jmA9VZu29qgGtmbTwFGslS8eeSQXu44h0hEr
	TswGKDqei/YKOKgCrAl+olLqcNfcxjjLA3M+r1HhkzkxGlaCKrqDE740XbR3xfFh0HOOy2LQrI+
	b1JtR5CsRnZ9A5o+VdK1NUUz6c+7PuYcWXBmK92MqKt+W0jUP7Lw0vZs1hPzcbY7ZpcyUHuJxvk
	6MTRG4Ub5H4C1tTEQiVKobK50QASnMUA0Qd12cm0VQx28FGxpgfNBhZfkJf0ZNDjqa7/83Stejp
	Xyck85NupCLHG1VFQDPvgloqtPTbVJ2TqdYXZHEny5K2/Y27U0Na6O844tEukk9vkdtcY+4Hb6/
	Y/BRLHtPKrY1SfshhNz8MkarLFyQw+NVIJvy6jDnA3eNOOGQz9U+Fpe+PPUAEN3i/
X-Received: by 2002:a05:622a:116:b0:52b:6543:d8b with SMTP id d75a77b69052e-52dd5771dd5mr127086961cf.12.1787239500431;
        Thu, 20 Aug 2026 08:25:00 -0700 (PDT)
X-Received: by 2002:a05:622a:116:b0:52b:6543:d8b with SMTP id d75a77b69052e-52dd5771dd5mr127085871cf.12.1787239499755;
        Thu, 20 Aug 2026 08:24:59 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b6b1sm32758131cf.3.2026.08.20.08.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 08:24:58 -0700 (PDT)
Message-ID: <41d88b1d-38a2-4a34-9cbe-4a2feca29999@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:24:56 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tools/nolibc: hexagon support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Brian Cain <bcain@kernel.org>, Willy Tarreau <w@1wt.eu>,
        Shuah Khan <shuah@kernel.org>, linux-hexagon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        rob@landley.net
References: <20260819-nolibc-hexagon-v1-0-6bc3be591f09@weissschuh.net>
 <9b5eb6f7-3d30-45c9-a00c-58d28db4c442@oss.qualcomm.com>
 <944f4ad4-6473-4058-b0da-25f9ed45cfae@t-8ch.de>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <944f4ad4-6473-4058-b0da-25f9ed45cfae@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a871c4d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VTue-mJiAAAA:8 a=EUspDBNiAAAA:8 a=9bBJL4KCjqmvrfcZtnYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExNSBTYWx0ZWRfXxcswhmy23wqY
 DrsadFRPeu5sGGJ4Mt9hl7grzO+h3i+a8XE538+Dff3XlJJk7AuuQQjmktUgI5ks0iODKejXOeD
 azslCiFcBYSPS+RxwOeM0VKcUmkkrU11fehdJNMuZh37G4QHcyUi5yJ6GIKrIq1Q1BLQqQM6tAm
 kQ3VnldleR7q3u/zcI5Otdt9FmapN9zKpsUTsedzNiCPryEslVEdzmGMXG6SD6vro0bpWJkTWc+
 P5rABQrrGPMipKz72o1pd/vcKOlFqAQ6kt83gatobZD1Riu7QodbataXLnu7kOgClTqmCyzuDIR
 zlg5nbmAOmmdjK07KAa5pZXrvb/r9Hl8WFlF+gUydJrW32GrtuFcdYLWCWmM7/wtDVEHdx52W32
 r9/OZb54OBYkO/PwW2S7Rl4TQ7XGe7VRVG9jIRn4tH6cKHfh7knU4gjRcc1Nj5qOLReKx1tJ2f6
 bgx3REe50Za4Jebhe4g==
X-Proofpoint-GUID: VF-Z7xDr-LHFKd_XwKhaS_nhNO95mlp_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExNSBTYWx0ZWRfX1F3E+SLgeyGX
 26jmTJMf7TjmTyqsmxns+eN3GB45EbJzVcbeUSnZ+RaN8GZ/eAFMJtzI39gfZq/UmBysSOdglMQ
 BnKzTd8pVoxCiMFP+sIeuP+CiCxBTgw=
X-Proofpoint-ORIG-GUID: VF-Z7xDr-LHFKd_XwKhaS_nhNO95mlp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200115


On 8/19/2026 1:30 PM, Thomas Weißschuh wrote:
> On 2026-08-19 09:18:08-0500, Brian Cain wrote:
>> On 8/19/2026 1:31 AM, Thomas Weißschuh wrote:
>>> Add support for the hexagon architecture.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>
>> Thanks, Thomas!  I've got similar nolibc patches in my tree that I have been
>> sitting on - but I like yours better.
> Out of curiosity, are you using the hexagon nolibc actively or was it
> just for fun?

I have some patches to enable booting the kernel on qemu-system-hexagon 
and when I shared them with Rob Landley he suggested I give it a try.  
So I did :)

>
>> Aside from the copy/paste error Willy identified, LGTM:
>>
>> Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
> Thanks!
