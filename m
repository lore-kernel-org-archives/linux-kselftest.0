Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B13563EB
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411744; cv=none; b=FwLIyS8pBmllomaJ8lmGpyMLV6lvBr5NwVtZVGozuoP5uS79U451tUgL/55RZDKrlOANOgAM9M0TxMa9n309EGhpdQ3WColpMe4jB3Ose2LkxEEdLLnxWVkj825NyQ7uMWGjXQcJkRdT/RPkLeGUAADToba+qkzQ0fnNmd+UitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411744; c=relaxed/simple;
	bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TeQGmh6Ni5TqfL/5ecP4eFqa3ov850Mohzq2cFHI0nPYBvjBXU53y9dzbCUtBhWOgeBxCS2vsNIGUcrq5yt6/Jjzf4IftrZH6mRzkwrsX3osb4BClukkDoecpO3FoaVJSkC/vm1yMb5Vg99yRXac9zwMhQbj28iKF9wGg9+LuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csiaSIRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+9rvb2L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csiaSIRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+9rvb2L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC02Ri4140725
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=; b=csiaSIRJZfSYLPYA
	OrDIRC1jhNz96DNbH4FgjgNtXEk06/yjZyfbyDL8yH+010LGfAbN/1SJ3/Po24YE
	HHlDtbCDvHuxPyoZitbxXcFzqaEzrCFwcNcf3oJGiS4HNZaZC95RC/CVRzgSSrxL
	n+e3yegRuYAVPYp6fvqm4RDOmCoDhdhByr8kx2p9eOBCYHzb/sQhogV42oFLU8z3
	W60tQTewvGrjRV+dmK0/cKLFk8fGCQr2uWD39SmQM3gXripaRMy6ucknAoHYm6CQ
	2UaZksqdljY5jERkLaXws6E57GU7ooZqzWtRe5wlcCO4Uy/dLoO1eWCrs3RAWtxg
	Ou1FSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29y5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:22:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1219007485a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411740; x=1774016540; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=h+9rvb2LxHk+fo28jtMJLv0o3l/L//rkKb57DKr9ey1s4IKkl9sQhp1gA3qKpkrcCH
         pB1g4M1EommcFWrl2KuFZd48tyo6yJsBFeSY6QOH0MXgmzeHTS+Fyugp81+3ktZzSdBX
         KPcjxQRmjFI82VC/YwuzoA81clw7OtwUU23v6BkD7/o3RH4PUexn9RouFBYPNSRDbEza
         3tJC4K8u10/CO8hIVWuAZYh6oE7+XUE8ARd1GC0++1O1aiuS8G2BOADCpxhgyihnLzg8
         /H4s0HqSp/Rai0sHD2Re5WcTWmFTTPhvkDVcVnmIipakfue4O8HgyDZEJJVXKupVRVW1
         7gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411740; x=1774016540;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=oOMNx45zWZ+BpRna76KeP5/iz+2h5r/QVZQykrpzLvZ+337X5EzeVuWa244LVUBPQm
         /6qNcze7xbAYyrAm3sEDZq6ApbVJSGCDgwVkOFQIZ73m25jNIMQ3v91MleblQSxODa6O
         85e4fHCJCLAuUEydLJfURXL4eE5sHfEWQuYnReTW3TrvZh0B0eVDuUe8yqJsmhTF+9FQ
         x6U+6uv7U3fE7qNBLbKWWZnl4UWcvIjekGi71UtNspCuHJVVH7jX6DzRrhV0jtZT8WJ2
         SlGQ5lbFivQOkzHlAZl6PK9BPptcpBNeksxjCd/m6VgKOEl8BgdABkKpcyiqGbOBFOlZ
         nFPw==
X-Forwarded-Encrypted: i=1; AJvYcCV4rAlD5oqnLTTL8obMBRJBVqZuaZUlkUk3KqVwyn6I1U9s7JM2k/Y+IbAtTwFIfTemWYG0hT+a1UYCIk28Fsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpp+wtNp/65a5qtZ124APZbQgITMpAypw6dcFrVgzVw+SVeQjr
	xvmoD8bmQteYBidLbCjJOrAW3PZ8SkvSMU37M0wWbh7jO19NXUozISsUm3uu+jkTRmBHwdsRg1J
	2oJn1AaTLMWgwdw8qkBp9EZXOK2yk/k6ZyzbyjByprh42S3Dlus+sXHBOlUsHHau0dSfnI3Q=
X-Gm-Gg: ATEYQzy1THr+bj41NG5sCGAglIAWmgeU2uVSUGfbUqf/sRvEr1jsmOsF3/3raEkyZXl
	w+2aj21Au7PQ57+F4w6LHnVjm4US/g1dgP5025nU3GuV3RUQRvT9r+52SCtjnYZdMFQus6wikWD
	2sCx4MkTEFm9aXBRZ3LZQOhwhRr3NtFy7UazeAx2TtrbsUjo6THYcypXWgRMiUSj8OjP38qTsld
	V1so9BkiPRaqiQlG8/VhUdEykYWJVf5S+DmUUL8CDGt7DDjSTN+wHxPFRYNxdO39mecizlW1e0e
	vj2qVunck2gqqWhkGCAyXiwuBnVJIsZeHIDTOZyI/zzsOdbswuLIWs5K5PMzxqEaxfuFFeCrVrX
	Az3/Fi5QiAQ7NEHUuhZYGsRqXa3h8Y7g0+PkeOEGwA8ErIVlmzPQQzaTxPFVK
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328968985a.38.1773411740459;
        Fri, 13 Mar 2026 07:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328963685a.38.1773411739954;
        Fri, 13 Mar 2026 07:22:19 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a73494sm25547505e9.13.2026.03.13.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:22:17 +0100
Message-Id: <DH1PZT7KCZE2.1LC6II43GX0XT@oss.qualcomm.com>
Subject: Re: [PATCH 04/27] RISC-V: KVM: Introduce common
 kvm_riscv_isa_check_host()
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
 <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7Jxud5LAzYwao3nRjkjaBYGxhXcUsG7X
X-Proofpoint-GUID: 7Jxud5LAzYwao3nRjkjaBYGxhXcUsG7X
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b41d9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNCBTYWx0ZWRfXxShP4zxr+X4Q
 utjtgF3QTbR9ppi54XxLNeTgzz1SrHRu7AY5YGNkRjZLlUcq+X/9SC/mA60A7cbzu/iJVn0P5+U
 3W6zmnx7jhTYM/ybFkGsGxw8okQO9czcXGb+ckPXATwLuJjsbCfwovthy4x005fbdEY/lrBhvQX
 VSzm323r0dC3LTTlW7btL7YDC/3YTJCBMchH/RNp/qPlKbNphZIsJoE+jeeVqWKhxUhpC14LhTV
 phY4ZOdexaPSByssfT980gGBT1HE6CKmlvARFQa1SIzz2IY+Nj/xUK74ErWgtQnWJU2bnhmNz0x
 5yOz8iEKDihS4I4yEQPNXXX88hPSUFGprcwCyEV0G4CYJosS4BpUbsy0NUmQuVUzzBFF9YVL0vy
 SfSbCKZ1W//FKRMWMAvAF0fUlms6VQydI6SNT7RQnziH3ve0nIqnMF8ELGsdjpFi4CHU5/9bTXE
 FfyCt/pd8sXKVeX2RVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130114

2026-01-20T13:29:50+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> Rename kvm_riscv_vcpu_isa_check_host() to kvm_riscv_isa_check_host()
> and use it as common function with KVM RISC-V to check isa extensions
> supported by host.
>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>
