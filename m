Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794870031;
	b=XruGMAP32/0RsvwSKHQwfXYg4BnqgQMVJRIXAVix7wFy/tXgKQrW+Hh8c5dFqZuloSMo
	 nmUzz1S6vOve9jCCx/EGu0gT77XeSHVu2BQXACpSyJIiZsSmsKR9D5DwrPUZv4rx8o4Ew
	 TL/G9CZPxXs5hi6yF/8y6Y1LFFvGgJ8pT8Cn4j/nd48k4JiOqevwkICnzd560HNN7J1X5
	 VyaxJQQRDBmxmIm3wzQ5O/jTGlY4TsyZmI6Ie3rAOK2rstRsNjOpC0bT0MK/phZcAeoYN
	 /MCMV87688jyzHpkkG+GuuDJWpKDlgvQA5ZBdJtkiJLIubxTLNs1nGOcGLbFuF1YkSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version;
	bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
	b=zzwSVQHtlD665ytJG33LvduRqZRubxtyozRtYeMGOuJFVV0LuBGps8XVFI6hRzxQ2jTR
	 dVNdbkMbI+2tILUBl7YCNEhmo6TofV8dCvZ64MNqoQqQqL5t4E6rmjQmNwOKWp12qzL4A
	 OxhAU+xxUt2m+LdYtH78LS7x32o+4uxV9llfphLqmqBCR5kwPGr09U/Ft5qix1l4CRLuK
	 JtbqTpkZ6nNipCsN1ecYnIoM+FK8MqUvNYtHPUYzVICefnTdraBezPD/DEoGE2yN8QHub
	 zM9C6UxZkAKAI6iPXsZebT6L6nJJcl878647s7GPYEFq05y8oQ7jTyPEkJpt61Q7WgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508C606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 23:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5508C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM2AN63139165
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 15:00:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=BCHVgfl79qs
	gOh8V2QC+/phw3otd9S0rQogMC77mTS4=; b=bqSqU6yF6qU3K0lBCnujplBnoj6
	Qk04NCwjHPY89A0kUMgZtt+BMSnHZZMbjJQjUfXSzYh5Rl2q6WmEZGiohyprZ/uK
	0Kqe7TUQiVFp6yOTrdaSP049p3IvIPaw7y+dJL7qKbHtdYYUSqQmeTFpAB8X+3f+
	ET32GeE3PKZduCdi6ipMtFApojz8LlJYmXdq4PzaYQuCXxVbRdGTC88PNbebbR9S
	b9GjBWYtvzkNTkjsDZ+lSj12/5ZbOh0dwt9I0ENG3loyFGBqOnytPf5rM0td7IZu
	iME6ei8GOC9CAZDOvKPUffcdZVdcE2zIxNWapMTB+2v4zIUjWcdL9vCjSOA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxpbfnwwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 15:00:29 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a079256596so2894332b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 15:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870028; cv=none;
        d=google.com; s=arc-20260327;
        b=UtGnIftJEgctduKXpZIk/cq+rv27H3aqj8kvQ3yReCf31RAzejJuxRWqGCPzItxyDf
         CSnCdfKXXXUblGQTWJQXaO0m3bdR276BcsPoALbl8UdWRgKAJu/Yx+4p+Ru93OK0Iohw
         GUK1QbjxiNnIlPK31LvmrwxWvns7RFIBpYR61p3r0owIFrE6yvNIv5ZHHP9z65qGWYGf
         5oMNGtqqUgbdkemxC/6GUffYl8mIGob0CC96kBQEfBt4V9feeYGWpIuFJvvfGqjXqttj
         gWT7TaI19x3d/sZ7V2wWkYdcJOaqF8+JIoj/O4tbMLFrh+eC8SRNwUK3uaAJHCH87mor
         0POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        fh=YrC9W/K7R7IO1SDg6zoiC+wK4S3s7KAhz+JO1yzrny4=;
        b=dmJH9gy2wPQCMLY3dxF/lPIqGVuU3PdtW/o70/M2IjumfYQyNQhs1ju1Fjbr7n3ePw
         AdylLQipya/h4Y0O16FYfLljCRka9UP5xEr4BmNmxZ2iHu7T9cI8tzaJrBoeoH2d+f0+
         3aUCdtAzJRn/XQ9iq7NTYuhwdTaAJK6l28tjBoaLmRAUHV2jAeIgJZxfsXsvKiNv9yLl
         LtyttFa1g6Q1rWwPFIevDbK09KgxmojwGtdTd+MXxD7FwdIXBejvbOqgSL3dzn8Xgnhg
         VNk77oVrGqFebJ6MI3xSW06gimuewqfXuCRMQy8Jzku/hGvzk4A47+Mwwg+tBxtG85LQ
         Vyog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870028; x=1795474828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        b=P1DDZ+6dVHZM9I6v0zxfC+KhCKa4TeUa+Wy8N7TQTA0kl33ujd6i1OBMP7LklKXC/B
         2sTzws/YR9ebOGvso3kTjrghOMcI8UltNsjJaFt+MgKQd9LeHhc4LhPGh8nl7jk0fKQ5
         rz+kDLYcqHJSHb7Lo21VAl08FiVw9P3IK92g8afp8zzsajLmYVErKtSTYEny1WbLBLpc
         e8jIJKZwkNXAneegZIRP5LKGbMUE5Sias3ifchoIv1MRbbyjeQGNfHXNykskTZqKhJZ9
         NbhofcPV4YvkN9cf9dPvEizE2jboYcKJLeJbzeJjABeJ1Ipsldoq4beB8fWe/UP/4Kl5
         7qoA==
X-Forwarded-Encrypted: i=1; AL+hErFw33LMyJ6K2UtQRKiPTgTsglEk8rbNDpxuGr1fKwvRHpd9aOwHvTGkfpQXS1NicWAI4K1DXN/7QIBVWS2pgvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nv+Y6Nuy9qcqRzDquDmCBW0F8CMarn9iwT9XbaBl66R+ERhZt
	FJqwWJuF47600n3knkguBfdpXGA+TANNgMI4nkZhzLz2ZJ5SbipD3gpxpew8OuoE7ZFTLY/nlgv
	/T6cTMmHOUdxtD0NXMN6lggK0/wiBQHj1eBxRZhWOvDy9mPIrWON8q8EjZL+yufK6XGUPzgbX8x
	ffuVcyCoWgdVBx9qi/tnryPoFQpC1V4cq5axzSGtHdfes=
X-Gm-Gg: AYBFou2PJxrdUo8cunTFjHhCMCWqyMs6wHrIdxW212YauvcS+aBg+IASqXlYS6XQAZ5
	gSGaMNyqzSvmT+jcvbTipj++I6s2Ggc4BtY3rku1xatM8uTCunNkzzqbpo2SLSpHs3IwgU4T8y6
	y+/qjG0/YddwQnXXmu/OM9lO38gDEgUR0g4AclU5We3BrJCpEJ5AaxsYu4H2fX4xdVw0gYgTCZu
	6h/hi7x8qI81VdlzzD8lv0LVcFOJ6wDUWO2d05qwnFqByUJqA8=
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id d2e1a72fcca58-8beb6193d24mr11011938b3a.28.1794870028054;
        Mon, 16 Nov 2026 15:00:28 -0800 (PST)
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id
 d2e1a72fcca58-8beb6193d24mr11011901b3a.28.1794870027525; Mon, 16 Nov 2026
 15:00:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-5-toddfreed@meta.com> <179472727079.2199510.11728930190494845454@kernel.org>
In-Reply-To: <179472727079.2199510.11728930190494845454@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 15:00:15 -0800
X-Gm-Features: AclHuK8U0c5vpo9LrE-LUBEl9Mos_YCScdKBQ9e4Pj3NM_Kna-AkoWmo3RzMn5g
Message-ID: <CADh2yMz==oX8OMx+dqNXort+h4vUFF6LHLWmaZJMTzoW0f+Jvw@mail.gmail.com>
Subject: Re: [PATCH net v5 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: -ICgQSdKWzOlhpmxNkk0wxQQdHOxFBcr
X-Proofpoint-ORIG-GUID: -ICgQSdKWzOlhpmxNkk0wxQQdHOxFBcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX5oEOkm8n79Hr
 xboaRv2rhazREbWrUT3akIZXRMco/51ftNnZBg4aguGHUC03D6GguzD72czjpGzXbyrsdpthgwm
 txIzujrbCcvjV8zNYAFuTRNfjt2XbFas0lwxCK4NZXl3+RXr3KsW6/Mm3lfPzYJ2qMXx2xj0HFu
 zb44UDhOSq2+9BLtpqe3Jpw0L5mvucf3IxEGscdAMGHO/TDPadwwgBkESmoaxUmJjloRo6xQwvI
 LZY6sYg9kZAEfq4/nkNl3MDZfn44x4igebCFpie45RTSY2afXeug68n7er0+xYDWcBYg0MQKf5q
 aCn5L0vRLNtMjU0li3HT2OVQH/UvXb/UGOtm8FgPjgqEDZpljp5gyDh40uEurdbAZ+hm6HEii2p
 A2WLwhZDj1dMv2ca9lH3jmAAYfztAbgT8AaBWZUmOueIOxq9acGG1t5OCZfpT/rdCJRGaIib41L
 vg3Q50CzYFdV8pmCHzQ==
X-Authority-Analysis: v=2.4 cv=boLZl0ai c=1 sm=1 tr=0 ts=6afb8b0d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=voM4FWlXAAAA:8 a=-ThzyT3jwNi3vWZZJl0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX7d4KcF7sMrVK
 XS9WBOxs9kNGwolENmZwbo5Ui9VHto9HesxuJHtqVnBxMK41FH6Lqh1+LOE9r/ZyVMQxfhL+uvA
 bHx0MGm/6ZMZQ3H+OojAplIKMY6ddjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this check cover every reject path the commit message names? The
> commit message says:
>
>     a reject rule (iptables REJECT, nft reject) sends its icmp error with
>     icmp_send(), through nf_send_unreach(). so now, a received packet which
>     the device decrypted, and which hits a reject rule in the INPUT or
>     FORWARD chain, is now dropped without a reply, like a drop rule.
>
> That is true for iptables REJECT and for the nft ip and inet families.
> The nft netdev and bridge families are different. They build their own
> ICMP error and never reach __icmp_send():

This is true and I will improve the commit message in v6 to explain
this more clearly.

> Should the check also go into nf_reject_skb_v4_unreach() and
> nf_reject_skb_v6_unreach(), or into their callers?

These paths are covered by the netfilter-next series "netfilter: don't
send decrypted skbs in clear text"

https://patchwork.ozlabs.org/project/netfilter-devel/list/?series=533037

-Todd
