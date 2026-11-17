Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947557;
	b=t8sGFKkQ1pP3HxlAsP6DCQrbL59FMHs5NzFVC7O4of8tm1ee2syeG/ZASUo2ZGffZ0kE
	 PTAPxMW1YOifXsXTRcb6ovpU/hi77LbRGdpkCQRbamxJaYOLd3SlpD+oJ0Ls9NzRSskYB
	 cltMlpG/9/jHRAuKlCIstTId4Y0Fo744k3KbijoB8sVscX//Ln3TizCELJryDhyTKRPlG
	 oje+2MFxW9+KmErmrV8DBKJBvMUFijExT2W0hT1P7mJT6hMEZvJolbZgUru8qlA7OYZxS
	 ZJbNzf3SyDHMQ1NahbWFH1iBBxPlHCx6tOYzbXICzTgxJO5EDJUFsLa+sW5eiR5u80g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
	b=CLORMb9dtrfSrIR+ZaidcjIpZvAvfwiiMgs6aMqdepaHMWnfcyjDc9iMCKzg0MSAGoWZ
	 g1kZW3/Rf2cipcBuT3FdWBZ6WLlO1jedUGTOohGpvGpH/VO0wwSTjM8XsNw5vq7F0XDBx
	 tgJ99JZM2HJBwCER7FXu7w0lKkwZ5i9GFhEjUJxKRW5PU/uveUWMtXzaeQ6RXUXDo0Owq
	 QkMrvDM59LHtrU3gVCvxr/0E7tf9eQ2ccts8obb1VwEAaU9c9xplPeq7gQmwb97P7kY+o
	 6X7xaMj4dAlfcvjenG/JNu8rnPEOUQb6AmlNhuiPR/fI77apfAOWDoYGI30WmV/JcIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="S/cJHIGQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41503606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 20:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41503606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=S/cJHIGQ
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ9SA12418613
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:32:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0kZrkgBlVJ6
	Br1d2+SootkU27cD8cvHld5OQI8t8s/o=; b=S/cJHIGQUWCeVVmYPfyE/H3OXIr
	C+FScFtToC7kEonJ53c6uQzVRAxI+YJlYPGEYds54+MNSr4IEMD0mKcHYDxXAdrE
	SEPPGDvtNUrayxoC4QQ0HERmpoGw2nbQFj8i0wXIDSkLcC48lml+1DUk+GS04s17
	aKXAK1VVdtpBWIznDhE39mOnzZWejBo7iGvPAusT2us4vlKH6wzzDmgv16k1WOBq
	7BA6KrN4q5VJd3ggyZYAvNrpidhK0IacxKYfeeBTXagj9wn8nUmbKXCRAx8g5+bB
	DxboWdy/0RNdniQY/cO3+s4SsWdcJ2VbpTOWc2QySNjCDjuPU8XHOnM93MQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hycj016pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:32:33 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so153552b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947470; cv=none;
        d=google.com; s=arc-20260327;
        b=pojZrU89wOym5HT1alW5/xHkcrHOadl0m5Aad8AgHKA8vBGtCYr2r2VfZkHSzwQlZ+
         RXgyyUlhYsSBcVSBdDbh3oN5j8U49IgkZl9+LYTBR5EO1Nzac6WGbnRa3ppNBYoSaPWn
         kwy7a5mEIjcZUkO02XrzYHSFMeIjBQ4t1Uf/HqAKhgbkl4XczAsPjF+ngyyuA5w1/X5c
         H9i0SXSAt3IqdlN2Td4rcZt/LAgoRx2QwwegYiEubAeAoSIcOCe2pqkYCeIrNcs1DDBk
         4QDm0l4i2jy8OWzDdrfq2ZaL3lCmDYO1oYqCXFw73b3vf377mItwnRGs2mNoM3jOZwBv
         NaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        fh=P1TCOD9TDbXL4fK3Pwa063BfNugt+RjojXXTcgRYVs8=;
        b=rZHNC5tcDCp/uwMoCVySpvuTNDYF7HV/Cchtm8YFfYUfK6lc57lEQvXwkl9aK3NnV4
         SveSBIWb7YaOf5fdNx0+VDp8ye6ONKm/QKM7U7YkAQsj1wJsRmIagFSdYgQ4ayQ8UfRb
         4qr4Iw1F5LS5Dz+IQau3QfQgSNDkdbcp7o+ywG/LNtBltrw0QF3pcOTmJBaD3Q7NDgkg
         ReQuA0tO5wh0x8WaK0d2ECanYztXOeKDtxo3h8Hnwcfwi8rdZcY/EPrDRSPK4MwZEeMR
         kgr3ESm2M/hl779erLVR8Z8zXpxXZdaU+7JoqF1frcYanwPZ3oKcYithe7XmZulOJvJS
         3Uuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947470; x=1795552270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        b=M9n4t8rIt8VNUqknuCeLxO1mJX6APf2pxrxN/iqJax0S0XPmSSVe/n1hYI5KNm1cVj
         Wxq1aT9+6NA/R+8NEXGYnqOj/CbZZuqi9BhVK4+Dx0gc/jY9vwsU/6yUhmu37Q8j4ErT
         6hDj01xeAMsTohpeuyi1cxzlEqL3KIOxDL9K7RrUcWuEjE4l9sWnDBcMt0mM3dNVwBVo
         qXThf00lSq3wJEoEsxC7Grz5uOiSIxHGW1HBxuAy+Nl+y8BrvLunJhtM00E0eqr2AiWa
         m3PIZO6nFXnUuHXKkUNmNwYlw6AnuiZ8aFCj0SI/uJg5j18J1uGJ2Zq6IuVcHSo8Awvy
         EyFA==
X-Forwarded-Encrypted: i=1; AL+hErF5XDGgFfbfqWx629D3LbAPMT47tVxfar1FR4pAWk+QfNT9V+mUryfguu5WrWUHCcJOAaqFXtjTHKGo+levBZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z827xsJQAW2rLS6rUJ9g8s/axFcF/VsXXATnDTK8bN1Y6t9gU/U
	0mu/+3LO8xuOgZU47swmwKIQ5Tw51Wg8k1TF/lpyod8OAmfW1wlL1dGx1HZwxdo7aoYUDPAf7Rb
	ODjuLu8I8LpXgFOMWBGdH+8hgIifJ5HgQeZ9hkAN5vztpcVRz1DPFDBXsfPRNj2whidsBEV14++
	eluOCNSMmGZMWfyJehaccNGUgJVV4nRekT1iCfw78+OP4=
X-Gm-Gg: AYBFou31sNbkRknqloLMRx8+Zk8Lqv/o4/wcI0QbIvlf8v9bxlyOMUA53DUmP1j6XVA
	QjuMeM/3Ka1RQBmYbx9M8AzvqJnEB1GUFMQQHriMwIqC4GBJvGPEU9oogd+N7mDbt0UJNOYiosT
	KU+DKSsSKKUttbFrnG0ol9JITsUsct5lWtoBHrHuLnLjUI9lwshSB19BHrTbqtUG7ZF3nMo2adq
	WVo7cKBF7IzIeObu+25E2M/VZASr3hDhWuPpOrxEH7fU1/VbRg=
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id adf61e73a8af0-3fe976e2e5amr393696637.38.1794947470143;
        Tue, 17 Nov 2026 12:31:10 -0800 (PST)
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id
 adf61e73a8af0-3fe976e2e5amr393672637.38.1794947469714; Tue, 17 Nov 2026
 12:31:09 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-6-toddfreed@meta.com> <179472727319.2199510.15887061947101112689@kernel.org>
In-Reply-To: <179472727319.2199510.15887061947101112689@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 12:30:58 -0800
X-Gm-Features: AclHuK8h__y1ykH_oWn3mQ1fV3WrPBL6thnn5AjT_UEvICUWUOHi7PKgkI-L6EY
Message-ID: <CADh2yMyYxVE70K1BnbqzDB5h+7vDBzpL7r-yxnhq=7Wgb4480g@mail.gmail.com>
Subject: Re: [PATCH net v5 5/8] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX5uEoRZXuY5JQ
 qEwf+VVqgdLVapHqVfrV3HbqtvPOenaO0t8wWf/K0d9TpEvbamTlIar9i1o6rR6FjmYBQCuWILU
 VNJRl0bmKM3sO9f1wgtMYBjv8zb68k2eJKj34UkiHEI5wdkw3mTTQXZKYZ9JH9CcR/zUDPk9rCr
 CI/LaCzxlx8CMekjDSJHn5WTMhhKTLNI40MxWW4zqY08JpPcbLvb03o+ZVYZ38Ounu7TmFRpJ7O
 HqI4r8ymZMKRyVwWU09EnZKDDiakh+LnOYxMMfsiC/mW/OQOZtn1OG1X0mIH1+L8NuFJXLaJmw0
 Y08L3YoXRyR0fD3Km2hTnjbRdC+yWpbuzTVKl4zTM3bX8UARXQEvfcG3+emQ8FriKLdo6W7kRjP
 USmb7Ot0sA1tHBhayfcAzKb6PtiudRElmRojXVgPtKSR5+rlleMzMAxGcXQOEhpeHM2HE//XPWi
 VQfHnw3jSvo8moXRgrQ==
X-Proofpoint-GUID: PYQ2En0r5KJngSGtEXFMkp33EBkzPdVT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX7+7cWANoho38
 AUNk2MfrT3b1vvO8q4Nz996FENSsaEh/5enRzxBllND6/n7eg00yNRY4pbRhRnGkY/QjBRsffyj
 BfFglbdVwiAhKOikHfAX86+tlxAwThs=
X-Authority-Analysis: v=2.4 cv=Q5NHcI2a c=1 sm=1 tr=0 ts=6afcb9e3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=Ve4a7iEx9DEsMjZA-ZQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: PYQ2En0r5KJngSGtEXFMkp33EBkzPdVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this cover every ICMPv6 error builder that quotes the invoking packet?
>
> nf_reject_skb_v6_unreach() in net/ipv6/netfilter/nf_reject_ipv6.c builds
> its own Destination Unreachable and never goes through icmp6_send():

This path is covered by the nf-next series "netfilter: don't send decrypted skbs
in clear text".

-Todd
