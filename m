Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EAC1A6802
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489302; cv=none; b=EIUqed/niewoVHd4dAtqMA5KjJwMJJpwS2VbWIhdb3aJ/BxAeKaSHy1Abas6DdIk9x+4FK13rGBZq2VfKMaXRCev+S2x5dfor6JKR/mXANswYUmwotbSC+2jzE96A0oBkk8V/6CGnGXeiXM4vlMtjtvQVERbLjnuud4tlDD8URg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489302; c=relaxed/simple;
	bh=clTABuQ5nWAgbKLYbTeDNgxmJ8oOt1MKo7+nBuDZHxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9d3QOaxcrXYDedmCaG8DZ4Nd1MlAuEbhpVKa19d69vyMgNhxlqXCv/Of25rUNd7YTW0bl4UdzOuU32qJfmSaPDj7HQo2mHOP23whPdeDLm2mdVsTPxT2/CmkHpCjCqSDiFiW6jBnBlIAsqVx2JfllZ+ItFlVpmBUbaPWA8dn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD3V9X0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QF3auAEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD3V9X0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF3auAEx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IuV5P1186688
	for <linux-kselftest@vger.kernel.org>; Mon, 2 Mar 2026 22:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFlTulkTiHRUNVyM0yuMIYm1
	zlj17kVnR05A3j3KKwk=; b=oD3V9X0GhEe5gFKThb2dbOb327G4eOVgVqX3P1wp
	dp/UZ86q8QykjGUFi6SsqRNxEb69gly/McwN7KNqkIBQBfxOqaBRAHCPChCxr8Wy
	HRrDp5APKjbi7PaJSkvCLgngOHHIdeGqPL/VBbSKoj8wEbn32+oAb22fGki2N9tE
	uckjZffASObUusEP+/pmBeHrC5mI21QPgWFLQ8EgF/IeIFacMIMCQ3G1dNHZMylT
	+22//KWD9fsMUpdOEP4RnqSzNjQjGeX8xse2Fe5dh4acv4rrWyYWG9DlE6KxOM0w
	jnXsQ/EJDFCQmuCDa59W4RFtrevm2tnR0JcjTrpUfCD6Dw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96gj58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 22:08:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso57457957c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772489299; x=1773094099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=QF3auAExGeOd8kUoj7jnkabgQeQASG1athUim3hJ7EXLI7GX5JOWCd0sGRSn6YCJK6
         k2EDOkP7d7ylpAsZhzgUGJ7R0j2gu71Gm2wSceKZfgdCWKwMZKBHkl+trKAL1dc66i1N
         z2HW6UQvB728F9HrgN6B77pCpbNl4XP5eCo094V0g1BOHOv2Jahx5jH0ktMbs0z5HqRW
         lOjWUfI5smmpswtxUR1RVKPWzZmndTJGtWFXQE06ayQBRnX5xCrOqd0fVIoU+b8sqSzN
         HDy9/pdcpQHWPFkYhFzRxnjurJ7aec0q3oTfodSWrNnoqHiyAADud6EN08am02IBp9dj
         D8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489299; x=1773094099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=cBK8Z+GPsnSJuhuQl4qCDSosG2aDgOZ10Rsh/9Ukw1wTRSOBlvRt4KtB+HXh5KGRD/
         UhuQ8ZT+KJSrfrLOa0jbFgOQk09iip0xX69ioEfOCCXsEpiFk3e6cL8i+PxpBBr0VCDL
         /LCZFG2ymUnMY096EWfI3xH++WQhpT2p2/9B1gyzgsKa84ZWQEJwlPDVnEgDrKvyvdA6
         9Pc07+BUIYadweAUVWMxzZ0A1PgZG7qv0maVY+plfKROfiJvfKem8BcvgiR5l4wX53Z6
         YEDCUh9nRvqfVMFMt0OMpJHet0jUQ/2e4iyfUGL8+E5jl0ClHNgrZG/AIj3hntFKYXFb
         rn+A==
X-Forwarded-Encrypted: i=1; AJvYcCWeO6nGcL/E9drcRVXhQjfhrcIVknE675fW7ui+Kkf5zPBwYIoiYBLy/wyA6DJdBkTXKcctYroTdwURxY2TZZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTbizZBwxz71QTJ7goTUwftCpqJzAB/eAP6pJramDmzfnqpn8
	PVl287auAEVcymA7xJYWVjl/em6f0HfqU3aPwAbtk5osROyPHH8pdY6J9MJ18xSHf65sA7TRP5R
	t8cMFyMdy3cj/eYb6J6wTB9kx/yhE/PjZ9QkAndrCWUh77V3kAnfvsHXaFHIMg2S1iTauHYw=
X-Gm-Gg: ATEYQzy+TSFpewvE11oLuJxNEOvDOSIfgtsTPmE5lEBSVDU/5tNP8Exg7v87CDpzWP2
	oCk7JulAYW+TqsVVpAy7TA5XdqBF8WwrNUS0fEyA6H80BOAsxaeLa/GNasceCy7K9/bmK1IYrip
	rG/rPjojEa0pH2z+oxJsr4LxTqKhP0bUrL7pRavLXoNCe30CiZg+upuVO/uBPx5+FqrSUAL2TkH
	anEJ6tquliPQTTTSgcCdseC8IxarkDGkqaeYXj/pjh0j8Bse1AENCfZjZ2LIgiRYpkF2ZpiwWXV
	XXsvWn2Z2z9flKiyNdZqha/ETSexSIcIrr+RL3KY5mVe3vMzQu5s2GHiZnF74uYnP7LDX9RgN+Y
	02OWq6/xG9yey91eZxwAcYxcfrQd9YPo=
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472440c88.21.1772489298693;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472413c88.21.1772489298167;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm18367820c88.6.2026.03.02.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:08:17 -0800 (PST)
Date: Mon, 2 Mar 2026 16:08:16 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v9 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <xhcbisolsce6mbaoovxpzbsyqfdtptnny44uqbfcbte5udtg2g@wqgprootl7yt>
References: <20260228005355.823048-1-xujiakai2025@iscas.ac.cn>
 <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a60a53 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9KHX6hOa5LuH6kksGFwA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: cXevJQh3X8NfnS7G_PEE5GlYJvYAnc1X
X-Proofpoint-ORIG-GUID: cXevJQh3X8NfnS7G_PEE5GlYJvYAnc1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX/J5bGKoE97+L
 fqOnkoRQvZE3yI54J0tBrTkTPGpw3kVewq2f+mMt2bDAlNeEpVyaSV4t4LofxfHJprK23r50v+c
 C36gjjY8cC+I1zC223v//plxUVl3lsikECXHNcYzcMmq382i5iT2/7VTvWCOLkD4jiSrpMz5oXY
 cUaSjKR5oyEoTGbtO9PB7aTIKz9UUjAQQ/6PPloxVGuyUKNkABr5GycG8sYzrZwe3KPwe8tuauc
 xyDftNr6oNWd2DnDqhC7olBhwOAAtqZwV5tonRNwl+d1+kqmY79UALyhZN77CDTnLR8BDizrM0T
 lE6QgZAZ7nRhjz0od5ni7+TmuCcVtF1rexHwvY4BUJbhzFiX1vdnm8hSmskwtdYI+UZvByLPWIw
 TRrS0DvPDOiVMuQPDn6Qb6/XUzIHEeMVYEWSG1bI8e+76HV4ih2m/4DzlhAOkaucklyl/Pl1Utn
 +OM5xY544Ko+fJFkBwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020164

On Sat, Feb 28, 2026 at 12:53:55AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V8 -> V9: Dropped __riscv guard around INVALID_GPA, which is common to
>            all architectures.
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  2 ++
>  tools/testing/selftests/kvm/steal_time.c      | 31 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
