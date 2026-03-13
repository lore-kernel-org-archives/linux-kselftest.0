Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0B34751C
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411278; cv=none; b=p6cOn6fusMtNa5ZbHoqiAibHaNSDA0gXj4BlWDDBXoIBUwFDv0qwIJ0AWGtkVndIYp8JqOe0s7S1oHPuvkS/I2zRl3BN3u07gi2TL9Nx8Epf/hVveSSo0ybebR3QFmlLvZg8q5CDo3kLIg/BeavmBxi79qtzmUnavfjR+4Vw6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411278; c=relaxed/simple;
	bh=/OKDtZKpe4kTubZ+QPOidPenFpNONaEESyITaSAXb1U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MahZlGbbqbuCdb1Nc88tGQNWiGjDcx8GTbeKi1TvXKahLoKq/Xk7i6Yl0bpKGYPWxF4TsbOft4XoThT1zdItITVbwKPUme4TxitV5m8TvEaLKGPMxLhJAVpmHUl19J3P9jSBzQYF89vrzcWtvFxD9w+5OUSncXneY8xP5XmOuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIbw2Whs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEmR0Bik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIbw2Whs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEmR0Bik"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAn7pI2393503
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=; b=mIbw2WhsYb6OPwUq
	6cyyk5xfsBmRsyPT+GcQe17MXyaIHACsQ7bjCNpfVFpXm9gX+79rHui8VDQdh5ZB
	EWsRmjO4ZlbFmpJb2To3lTpeUD4rRzFrGGE5cnUvleMYzyzYS1sV0XshX3HrWlfL
	9ylyBNwlkkO4dgrFtsC48J8UzPIhFKwfn5GUfBzD4Ea5blNXld6H7wG/OAmnGbBG
	AK0K5nBUEPcJOYVn5eA5/vlgcpr/08GRK4iEAq83HY7/FldBiVE/Y7bK5KhukRF5
	XtNM2zZb77HYHN/EuLYKAtY9u9w1lZk6CHxW9kLdKUKJ1cFlBt8ByeMZ2L37HoXk
	P82DlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8mkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:14:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1193816885a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411275; x=1774016075; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=QEmR0Bik9GElXutzvO8b2MSDv9Eu/Ty7Xj6WDp+GuaMaR/TpECjFMypk4JRYO5kv3Q
         JyNCA/RwPcKnpuhZ5Vc3K3nSu3BNQgWza0AHZfR6r6926+SiJKyWEDDhGhs8+V4NcITl
         ASED6kaFE6Ii/ulVDf8lEMSm1awPp1ZBWkC5K70mw8z2UP7wbe6JwNDgF+9W6WHhL1JQ
         aq2thOxBf5NPuo/ox2ksTIpBKb84Q9Go2TAHePkiAzJxNvTDHsULflvQtPIU13iKpP1P
         CtGIjIq0jFHZ+3a4qZeNtP3cheWrhsO2D5WPs5QA27TWxxBHB/nEXn8oCueA63ulXLzX
         fLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411275; x=1774016075;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=i31zXzINCfvuDXy/RfU4PJPpLWFwO6NzsxtDUgbHnqabNzK+9RhGYDmWf5iegl6WhW
         9JpAzLOU8qhS4JJd3BUP4dpEs7un15Xj5WaQGEl6/6LsY69r30bvGBR0YIKhCSR+H3S+
         Ns0jK/Dl1GeQqzi1Ty8pNYFCgio5cz5phgNxzmnLm/Ir7Vk89+vHZ1spzNTC/7nx5Avf
         FEKnMKlobxSTIDyX2Q5SY3gfPOh2F3rs/HcKG6rZYBxqv9kSihz3Y6jy0ZR7caZs47jy
         89slbM3rSNDryRNUJDubXDHRYZ6yMVa5NPLx2y7adFNF7FqPCbipHZePW+XJa5GneJec
         Qagw==
X-Forwarded-Encrypted: i=1; AJvYcCWkeh2q605OMQ5BtN47xvd9Jr/aw6Px3BGyDuvbgfvNBLIOp/UjuUlf0UyTWFC8kN7xdJS6iQjxeaUKGvLXjYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Eysz0ZjMIE/8Zc6hhhvrOrI4w+hW8i6gB74BefkFlkLmYJ21
	/oZldqrZn+nBslPfYRu1Rp7eGeIgATvHO/TyV8EmPj0Sl6PFXxkkyxdBnSBiFaMf8c7IrHI9nH6
	6BlD+l7Y5YH2L0Tju3+hqg6OySSAbSZyh/pw4Z6EdfQOsyDml3fDYq4Lh7BLBt0F+vr509T8=
X-Gm-Gg: ATEYQzxaH6BM94halQ4hohvFkKdhrdLJj5DTOuZ6JUi76Ad6j7MiFM4CPwm/v4AkTxr
	M4tSf7UFDRHzWMo9ZT1wrb38urE3/4vkMd5cHcu1sl/aNNEEeLcC7cFv4+6fNIiUHLaJ63wQL5b
	pU8sRoVpLTpzxz8XfmsetmMenqTueKDnDSmQVEs+LYTEMrWqaCnYrNO2T9VGgH4ypxOYbLHOcHq
	KIGgwkw7X3a3GPGwfzdWbXV0Nt2Y4fOj8t/Uoz0fmzW32XnWt10Mz4r+AAU00evtBdjdjskwvV5
	IVPkxaLY+2G7UQiNGrTbE4YmIBCo2lxyJpAuuBkTNlOCg4uqdpi37Q9x7kCpS71P2cE3NDG5kY3
	SVTKhWbZvtHN/tN/Zw4S9Z0h4Oxw4IKK/zXsYskIbmFO6jj+TNSacBrDMzK2D
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457592585a.28.1773411275288;
        Fri, 13 Mar 2026 07:14:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457584385a.28.1773411274689;
        Fri, 13 Mar 2026 07:14:34 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm44367405e9.7.2026.03.13.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:14:32 +0100
Message-Id: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xDUGMJ2BT-KT_ffVvQ1XCAFZMWmnawsb
X-Proofpoint-GUID: xDUGMJ2BT-KT_ffVvQ1XCAFZMWmnawsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX0w6yxHnX0FOz
 uUbDV/Bvpzi1LXSGDDxA2aYjFQwHMZHzQ4/iPGzR4p7a0GiYvtiTFKUmUgNeGrZS8429uEvs5TO
 GLQhBTUZGMJzuwruTfh1aDdGmy4WPGjsBwHBiA8FDq2KyVC8gpZ/oS8wUxU4kNCVQCIweS1XWK7
 niQiROxsiJNDYkL5cbnK13bmy/WnZCnbjyPemDGRkdrokmZCQr75+7eufiNs19jp+IhQyjXhgXK
 I4DqTMotRNSU6pmcZSMG0kp3qy/4vJZp7HyqmRiuaYlx0j8N86QXQwyVXeHICwKT7KySmeOaPk2
 J18MdIwCXAP9BAoxB3Kp51XuxXKZanW3qYKwNfaho3VivQiFMOGExu9jtABjxzy8uKcgb2CEfMw
 wnmwlqcnKEjbtw9y95V+RWzrvg2L+La9q5i/15z4x6+whqot3zFp3E+LnRBLvuRRUrB4hXKcEtl
 rS2mZTRkbx2/T4eA2Vg==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b41bcb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113

2026-01-20T13:29:51+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> The KVM ISA extension related checks are not VCPU specific and
> should be factored out of vcpu_onereg.c into separate sources.
>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> @@ -12,6 +12,7 @@
>  #include <linux/kvm_host.h>
>  #include <linux/uaccess.h>
>  #include <linux/cpufeature.h>
> +#include <asm/kvm_isa.h>

I guess <cpufeature.h> isn't needed anymore,

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>
