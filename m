Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509851F91F6
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149096; cv=none; b=DZnF59dQZq7da0tcuxkNwpjnBtmP9otQOsZKZ3/9ZEz9BrZ2rqy35vts0vios7a/tivjiATju/DnB2XaTYBzxQy4slP6BvA8JLKNbDvTJT4IOgNAZvwtEpzLO2HlH89ljzBu9mY9UdZP6mesDWafmFXpS/dk6MIdal0aKIGUX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149096; c=relaxed/simple;
	bh=9zxh/CJLkVP3OrrEtq55iqxQYKe6qEcvytj3jfZDZac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFRrBQbjltuTMcCMm232W5APYB8qAuWP/dGRe/L3G94ZdKzm3ZJZexzCp3P2pK8o5CQa5U8LVMQSolTFPl1estsS0jAv6xA+Jp50ORBgH9bfypc3nzmUO4h2yI0Bj0XdoQvrXsqAQab8Kn//U48i+eh8Ei8icpDgWSX+ReNyrlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4jedMCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isvopcDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4jedMCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isvopcDf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JDLvZZ399520
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 14:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2BwNGSka6tvRzxG+P4cIb+djFTtZDTW2AfHp99NNAU=; b=g4jedMCZrw5YyQfr
	FjL7hpU7e1I78hr95CWVtU054Cw4PPhU9pHOLYQgaj6Io8zjebsfzJZJkgAUsBb9
	ZcPLyb8KIO6r0gOFzjJYL8LVf+tS7I6VADlgzQxHNvEpAvxeZ0p3jYei/tOKMzjx
	CHiS+qMRu/h/neTyaRm278EPT5ZVcJG/omORg7AouRaiatbGcm4phkmg6I/3XYJe
	8W+UTAmQeXVPkcLfqVBKeTSQ8EVYZlXWpq7diFpKL8l5ok2ggr5s7aYVyVGqeurx
	QxH4GE+ZlT3nDuVEAxdz6EPbl2prdTK/GUeZdNIHLc550oNlJEyXL5loQSgnWYNJ
	zw8BJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa08kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 14:18:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936a796a23aso98837685a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787149093; x=1787753893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2BwNGSka6tvRzxG+P4cIb+djFTtZDTW2AfHp99NNAU=;
        b=isvopcDfP7pT1mXg4QxaUv4ptZ3Jd4zqKirOZ+bG4Lp6ooo3kyhRC5ku6PMSOPCf/o
         tCmrK8iG9LCoN5psuA0RmAD8DDH3pxaamx8vKcTMooBeZ5re0Pdo+UfdwvRTJpdPOLkS
         gNAP3/h854htFA+1F/+FcwD/Higb3X8OSGhL7SjKxcbjIWObf38bcPJu3nCZrRdEhJaY
         vVsMxjLByZxo2VemnMI2n8Twd5cNwn3uzlxb/E0HzmG197H5knxdR+6CspH32UWcynr1
         neDb+7HyCYU2n97SakITZyJzdTl2fu3LZz25IOTpQ2poQ1o1nJ6ZtmBQbKM6cqTdVcyf
         9sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149093; x=1787753893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2BwNGSka6tvRzxG+P4cIb+djFTtZDTW2AfHp99NNAU=;
        b=lBE7h2Nm5KTRQXINKeWN/lkByI0Bk4Mru2UfvU/zscCOgp9Sko2Ter3EKS96b+4E9X
         e9ySMSRK+EGVy/vUvHxK6++ddBQePEjH/DBTeFdE8zGIPG+RkDGV/z3frCrFlt6AjgJO
         Y9SU5hHFEAbyMuAg5coQaQNUTBb/X40Z8KGnH2iHW5dB2pnRfDzYPeHDrQNZl2gMhqDp
         TVZLhr+W1RmLZFfo3BDgcchhL3A0Av1WVmk05GipwbPJcEOYRBjQ6aKAXQiSnJS6QrWd
         YzV4UaNiY7hZPVp1tM7gIx8xxX+0W2+N/RyqdIUlFzXtYjiVGGs5XTxbff/lA/gnZVjL
         Gajw==
X-Forwarded-Encrypted: i=1; AHgh+RqwDf0twGxqFgqr2SGQDXR/2MO7U4DJUHDSrpgdha3ri3KvmWiogiWtScZQZZVslAmPym7CqfVE5tndSY1jJd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoLueEsqMiFr9HVUcZNkS2llUmfiUU0odNQVbmIFsDlUIsPpV
	dGeTpvtKK9m99H5Wxa4F4hm9jFH3CEXkF2RdHMvSf8EnZp6HaU8/xs94/iLtf/ehpVEJOLFV8bP
	yZJYxgdngrPMj5AetGdH89LlGKgXngJzdGdRDgvUIWqPP8znGkyE66AlttOM47wlI2Kow/ts=
X-Gm-Gg: AR+sD123P6UlL6c8Y4BOcoE+TxuheBgaXqMFp7jBBNuk+5z97DRWrnQW/2Ua+6B4hNM
	PscVUXy7J3U7qRA1lRNN23CjyAlSZp8S2/sPLSBHum5echIZ7lpAQ4HJ5ZoTVVc/Nup7UwMXyJa
	ry7R7gZNOpK51P+KSLymCmsOy59ayv3ScnXFlvu+Vr3lveau8caCXgVMkN7VEr+Q0N9qIz2Ll1X
	yGHhQKp11IGnhxWPFkWMtuK1Av7mL1fRIsA+EBJB5tnOAhvzOSXDGgLyC/B10ysy6msrtT6QtZW
	nCfQD1EWU6sjp8sbGe0lEziVeY6Z4/brERxzlvXP0htNOso3ls+hHC8q9QqTLkF+3f2VhqV+VPj
	K6xQbdcr/UBSuoxiGkl4AC9kCH4SnTLkSBTFg8R5BRUzYtIG0Akx8AUX0ujTwd9uq
X-Received: by 2002:a05:620a:319e:b0:930:1d55:a0ca with SMTP id af79cd13be357-9371e67ba8cmr384717685a.39.1787149093567;
        Wed, 19 Aug 2026 07:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:930:1d55:a0ca with SMTP id af79cd13be357-9371e67ba8cmr384711885a.39.1787149093085;
        Wed, 19 Aug 2026 07:18:13 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788dafcasm576648e87.41.2026.08.19.07.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:18:11 -0700 (PDT)
Message-ID: <9b5eb6f7-3d30-45c9-a00c-58d28db4c442@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 09:18:08 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tools/nolibc: hexagon support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Brian Cain <bcain@kernel.org>, Willy Tarreau <w@1wt.eu>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260819-nolibc-hexagon-v1-0-6bc3be591f09@weissschuh.net>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260819-nolibc-hexagon-v1-0-6bc3be591f09@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85bb26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VTue-mJiAAAA:8 a=EUspDBNiAAAA:8 a=9gZS5Jy_wUGHwPJKxtAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-GUID: P7ZDf7-xctbqJumd-mRW5lwNlB8Z48dn
X-Proofpoint-ORIG-GUID: P7ZDf7-xctbqJumd-mRW5lwNlB8Z48dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfXwOZhzUr0UfBn
 dmOxKHFsw82JJaKMLeTz5mWm1c9+dxSuG8rSJE1mzfWDQDBxSY+148Q2QUlwkVysk9oU7u1OJ0O
 cpPe9HvXY6onEy88kTBX4uOgrnSI4nI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfXxcXEQDVDA+2U
 93h1L/T6wWkjGMe5uP2JYBgbddY0esy+8IcnfUb7wA8F+31Eu/CAg3arnKBZ65YLOBpHa57p+NJ
 PZIkuwYpKsY7tRQozQ48Ad5JnEie8Ca+pD/2pT29qtsVSNEwDQhcMA+SBIPhwmlCtH+bQC31SZj
 ONUMw61bYj71t92q8dsGJdA4Hb3n5nu3fIIxnQvtMPepL462anMjbDIy6Tnzj5Tvc7wq1CZVjFn
 qP80MEZ15hd1HxUupEb1rbzR6GN8y+GrFOr1L4GHLBjPtItAtNRA6l8s+sLGKfP/1aJ0eTdYJZF
 rdXmvy6pES9KAt71D7DahN2N97DIG2mgb9YHv7ZJRJUTZAEZkJiQFSWKx8hiFIqXXVYvu11yYGe
 Yvj4G7xOowCIPx7YNfnMBfDLDLxcJY8h0ksg2vq5cAYtf1w4EzXDXhM3F+kshZsqOUV95mjNi9q
 1Ux1wzx2c7LXHUPvRVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190111


On 8/19/2026 1:31 AM, Thomas Weißschuh wrote:
> Add support for the hexagon architecture.
>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---


Thanks, Thomas!  I've got similar nolibc patches in my tree that I have 
been sitting on - but I like yours better.

Aside from the copy/paste error Willy identified, LGTM:

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


> Thomas Weißschuh (3):
>        tools/nolibc: split the architecture list into multiple lines
>        selftests/nolibc: prepare for clang-only architectures
>        tools/nolibc: add support for hexagon
>
>   tools/include/nolibc/Makefile                  |  18 ++-
>   tools/include/nolibc/arch-hexagon.h            | 164 +++++++++++++++++++++++++
>   tools/include/nolibc/arch.h                    |   2 +
>   tools/testing/selftests/nolibc/Makefile.nolibc |   8 ++
>   tools/testing/selftests/nolibc/run-tests.sh    |  20 ++-
>   5 files changed, 209 insertions(+), 3 deletions(-)
> ---
> base-commit: b58afc8d1cf85688601b8d7e271125fff666f661
> change-id: 20260511-nolibc-hexagon-3f8891f4c7fe
>
> Best regards,
> --
> Thomas Weißschuh <linux@weissschuh.net>
>
