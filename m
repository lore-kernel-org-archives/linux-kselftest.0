Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954198;
	b=jA+vdt2p1F+IMV9G0Y2MNitkahJeLufVgZoF2sLKKaoh6yGGN1+p9ZX05/VBebbKGy6p
	 u+ZQa/C+z5Z4UUBPWExIIk8JNbTVWbaOI3YrEaubLnJUw0/EJop0gSHs9PT9RziWCm7p6
	 Bk8Q1IQJZcAMuELdd0ybV29SWEHh1uSlNnyjpZfkY5TRJChQDga2EmNRIbP5t18I5Ux6N
	 k9OC7YR6JYmDQQStU4Nm+vHpuRordo3Cb8tsYKtB/xtc/BPIxOL/qmokXVurc0TMp6Ah/
	 757LHeXm7TqMZS4gXmP5e8vjP91x6heinSS5YlIxd/Pf2/ac0HtFWosu9eY/eXaa5zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
	b=blfEHLxITKerp0Wjf+TQmml22yxpyBbeFX6NM5Ixbe3HG5kIrubXpEDJtl7wpmVGLH20
	 hEUebQ5jiFyc2+rlnggAmwUHLGEJlLlZb0DWjUMrJJR9qS5bhCDPMrFnoueP0q7CxqW99
	 Me7QMc27fxKGODNYQzd1chPrUQ6Dqrq8HYdwEZxmEyWhixRkWPBe3q73gLwflGuue89Jf
	 +9DlqC4s1JNZSu+YHI7DhcfiRiz1jlbHIT+TsLtpD3n1oPzRB3PMka9FNUcBsuTEhRvI2
	 SsO4uhXb7puOcEFw4ND8kaAqZoyZYmVYIR/jBi6qr3LTyYhtYv7Wa257M2PIinYD9PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03C606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E03C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1ov8579508
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3q13oIFHchX
	PM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=; b=PUEFdh7q5L2JYPw6JJBaFQxI/Q4
	sFzmHEq56Q7i7DCKlM+eBGQXCRALo2QecCYubDNvHctGTlp0t29rtrCt/ksnr/5v
	MYsaGrCwNt7LmrjIEzawBTBesaGCkpwbxnW9OMdlOtzRsR6B65xN5wcA1TYjTeNv
	lvp1H9CHHcxFrUxTA8y6bT/iQO3GLfcR6TTrPZOk+QAmiPz69IHcxbJ8rSYZuY14
	yvPAyZQf2z+g+EmeMCYhDgdvotkNIEvRlGd7J+d0+0Ok95giN7Lrl4QsrNYzci+E
	Ay8F4cJoZUYPPDUYjGUVg+o/we6jxKs1DNWxx2BDTD8p/yy0EZinKo8C18A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0rduw6jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so137523a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954197; cv=none;
        d=google.com; s=arc-20260327;
        b=KtwSAtmEcSVJoUFMZaLbWy4TdGELy0WmlBCHnBGfMw9jzmVbG3mxrechutzVA8GlSc
         Lh2375K3ldRDqIXIcChqu98q9rPmHI2HeoMBYjB/na0Am+iJwD9+H28WoPtxVL9W03h0
         qOOSCv4djc+HwC+b/tn/WLvdTdoEW4vSxdpG+oydZmWooFMiExkEQd7B62e9pmgCJkVq
         cWeXMfQzuOnjfi4tpdfxWoCxj3PDo+7lrHdA79/8FGBhMegarcW32FhbMdmqmbipO+vy
         K7MOCG2QySgocPRRluF2FWzeosP/1M0Pi99foq9+BRMnQ8Zz0SPvnJUnp8NeFc/SxG0K
         bKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        fh=ZKSAU0UFoHSngfsBsMPSghTRvk1ROJrv9Hdxs0UZfBc=;
        b=U6nJqhRtpc275xgLh/l4na2W4VsFqm1GZI8pzEKQhD1U/T+w+kjmpeCKxpbKXA13Rv
         7ZN1SRD+orgfWt1ydnNVytXfsm0BDejpJz6xojqC0tvpjlKqsiHd3cXFDO9SzpXy4jM9
         Ld4ze+3YSdWFDY3RF1AS/yAi2CM5C9KxrikdLhu2kA8LqIHTnzp/SSNzQGkLcNjM5BdH
         qOa6gY7C+/qpQ4ebuDX43f4PEpMexcArKdYRgy2Qm+/v872vwQXvw5QYC5cUzDt7oP+B
         6sBnI96my1UrZ6CDYi/B3FA8T6WXMCKZSzf5Vdj4e6IZsqfM3W9v55t22nzap6qd1nXa
         R38A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954197; x=1795558997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        b=AhVETupBmliNEAniwpasEMBVcQWKUIHpH8sZhefGkus+afXA3X/ggxAPEILjI9ly9y
         d4B0T6vWLq9Xz4Khvf3tEfLpV/GwNNNp4B86Cp27dx8eCOzXojoTcPZEUWG9GIJo4ChA
         leTfAQROfZEcOvnonyqQNGziPCQGk2cAXzYx5JrXSNd7I+rnibvO8Ci2/PcqJwjP65Pb
         hcVfJBPFqfGINOmIhaSjidf4kC+CVy6iUaNj9PAVcx6Vyp2BHxL/5j4XAkeJiJ9/BwhX
         Nh0D1ioVgv9XFK1grb48MFF08Df4Nca67u7oXdoHvLXK4UHghSez5ks8gkDPKDD7S2Do
         ZQVw==
X-Forwarded-Encrypted: i=1; AL+hErHW9MdemGoa/eW4FDtK/NDLw4kIjbwFmotGRbNs+YpMXxTcp45vTwTQZ+LMxBU2P+9eRWOgjXCzWy9F87cdOkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z80TnSpqPIy6zujEwHxGWFIkjcnvBM0pAwGLQ3uY7rGDIbOCWcG
	Tj+mTp+SNRfPcawLW2i5rFYyb5i6UCl3Czbr/SMeqJlITMD/aYq+krV/lBEdfX8VDRdOndW7yB/
	o/Q3eSV/9DrTcCVD+y0iROLnjRsVaCXlhCO2ZakGD9UbesvnVaYkEp8B6YP5vgwlaX01qWSCS60
	xCq3BBKdC1po98cybIJ+bgj6+e77/5AD5rD+2FzZd5CCM=
X-Gm-Gg: AZFdTZfpWBAeV91N2EyZEQAddEp7cr78w06Qx3Eeyss3qgLT8I5MYo/gibfNBtExoXA
	P/VUQWfOpRO3z/tFMVmabTGv2xXIP0LpY+lCLgb14NgDQWpbDqwpQe8yRjv7gdtz+2ysBOp7A4Z
	x1Eiz+gGBHe+L69OXxX5ZBZLn3nuZpwkoigY4h+PKJKP4KDEG6bS/qmYDxoJcmI6tWPpgquH46w
	KG0gOsXicYEg9FLap/HKcpiHAgAeDgoMjdmTtrCQ6tsgG+zb7o=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr668837a91.13.1794954196929;
        Tue, 17 Nov 2026 14:23:16 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr668796a91.13.1794954196341; Tue, 17 Nov 2026
 14:23:16 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-6-toddfreed@meta.com> <179471269695.2199510.18062590833471363525@kernel.org>
In-Reply-To: <179471269695.2199510.18062590833471363525@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:23:05 -0800
X-Gm-Features: AclHuK_fZNKIqR9h7_djkUI-3BJ-ndjBhRGAOYb0D1EyikjXTaP2ikjH-ZrZrT8
Message-ID: <CADh2yMzkbDDFt00Bnd50HPFJf9-HcKHA8BpfOikBUPHjmdZaAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 05/15] net: add METADATA_PSP dst to carry a
 psp association on an skb
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 7oO9fGjzjJEvRZT5XFhpp2LKsnzhXH_W
X-Authority-Analysis: v=2.4 cv=Apx7T+9P c=1 sm=1 tr=0 ts=6afcd3d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22
 a=27JUocoGZ6S1wOk3j1gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 7oO9fGjzjJEvRZT5XFhpp2LKsnzhXH_W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX2btB7rpXKd9M
 FlAf7vI78UiQob6Fwi/tGkKgVBuKyimzbklDKNHPtOIjkgnwEl1P36Ssj236skJVb+WK/FBFlzo
 j9AE1wjsc11U5HUwT+PZ0NjUJtC/yXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX8ZUXklqEo2Ip
 Y5diu+eQjE7WloNLn/kCqbRWP1S6975k2bKqOKT0kuVfzaW/AHE/CUlXsXKs/9o48661vI0S3l+
 pj5lSdziwHlPdZy5i57OEL/gG/xPrqaG0CBSBXv8o4hnvfM+U8n2R7evUYfXXU+6+p9iLGF9m+T
 P3avAjoTyi5f0/DoaXp6PUkZL+ANkOMzaIGBZJv+Syr6VEIUJpQuvk+YXKa3o/3jne5LeatgK7I
 zv45Hpcik+CT98ZWhfqN0eHof6mQUT+kIHibnR64GPJ0deZQ7URIURfwjEhXsspRNtidscmatNd
 nidTIrziI1kN36ur3U2K8jqGsRuRROazdLqUoGJZv0snNWuECzy8tI2TAGYRn2LBvknS1B8+m/X
 rKO8bylh8ihbD2nK6ESrGxaWIN0sn/DaosKR6F5NYbre2/bDEf7HTjDcPdanSNtEnigmYt95Xjd
 itrp+Q00Em+vcRZS6Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> The commit message says this re-check handles the case where "the psp
> device may have been unregistered while the packet was queued, and its
> keys deleted". Does that still hold for skbs that get requeued?
>
> ...
>
> Can this hand the NIC the id of a DEK that has already been destroyed, and
> that may have been reused for another association? psp_xmit_md() would
> catch the psd mismatch, but it never runs again for this skb.
>
> ...
>
> The socket path through psp_validate_xmit() was already exposed in the same
> way before this patch. The new METADATA_PSP path, however, depends on this
> re-check to handle the unregister case.

This is true, the checks do not handle skbs that get requeued.

As noted, packets of a psp socket have the same gap today with
psp_validate_xmit().
I'll send a separate Fix to net that covers both. v2 will narrow the
commit message
and mention this gap explicitly.

-Todd
