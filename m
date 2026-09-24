Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81B2E266C
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246305; cv=none; b=WbhTtdwT89GnyHwVdwYKtpOVVYg+CGnxYVxa/zwSzB0AvxjDQlOck690uMkGVKSt7oAVQlRz6FxSS/I5pVMdAxc7GAFWCmlJVpw9PH0T068JBfzIaLM9dV+Wn5UeTx4ESgLv5aDb/xn62XIj5IFTqzslsgSU/OfINxxUj7rsvJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246305; c=relaxed/simple;
	bh=iRYgEa0QAMnnHBbeXblwmyNrfIIZOdOkl2Cx5CFRM0I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kUZuq8suW0o7fSgvGnWEBhJ4zFXa3LmKC2l+G5YrqM9Kn1+Jp6jtiI8t5C3SsvANflrYTNZJKYloQsvGGJMaRPQI/b88w8kqLlHNWHnvBrYqMwswI5p4Juh/AxnlhHAHydCgEyvjCdl2fy56a3y/4MlNZmnHlwPdRIinTzi4HqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz+aEYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5pl2Oyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz+aEYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5pl2Oyg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9OxnI1063479
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9heh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:38:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8696b921ac0so1528024b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246302; x=1790851102; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=K5pl2OygxqDbmkrLa7YOuOxCeP3OQIQppYMEpgSQJFuYDgI2nHOSvurzm1MAxZVX/M
         WQWdLnLZpJzroc+Ctg1E1e9owkXCggPc1lT5rZFQ4hAf8Ji3bjyeZJaikCi84o+FgpMZ
         dF3yFmruy8qwu1jQEVe6+Deuas1bpp2RxxmqEnJEMUAJZZPK4QObfvWpfm/bgP248Fno
         YUqyRfEZj0nnpUfZgJtwxf0JluR7umNLOhREaGYo+/5xSnMoOgjqi3sVk1WRM6O88JtB
         XD+FbuVhz8wdR0ZFHySwxbsmn5Sg+dg7nS81tComyS/WRy466zzeos+KWCquFlRL3+pw
         1tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246302; x=1790851102;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=nLotLAVBwBU8whtGVT1RCN8GWR4Zd2FXUFluW9G7vymzPJnRTsUBFSIg6pesPiKww8
         jqk7/HY3l4e7Oo7XCRwNU+u9xzVjJoVEV71S0dYiXVkbqV5qNzpiuXOoYBZH9wU74g7I
         YGRzO49OXUwaZG0X6bsWXepKoI8WQJVj04uvOzBgtrqyBimWtz6prZj/i/8J+da0yGKm
         885QNywuXZFXL50XumefMm8nDF9XCrisz2+U+6gV4cYmiBQf5WfGHVbfHx9RP9itpoA+
         i8FkjQwafUQGZKR4CBnSpONknSTtxTOurAAi0Py2Ix/JZjTdsLhnfJ2ah54LwaBVUM2i
         ELkA==
X-Forwarded-Encrypted: i=1; AKwUvBy6h6TgQSz+z4YataKGbTOG8PBq1jeW/Eg6lpGRYBQXTmCbS7ZFIAyK5aupXKDAxuqbTdrWhLyjs9x13zfmF5E=@vger.kernel.org
X-Gm-Message-State: AFuF++lJt3yQCApTT9E4/TWZwEWhiip1xTU97WrNfrHqaCOkFihVLJSV
	PYIaZlinlmmJuGDdvXL//rgO76D52m2hbB3KuokDHEKtn45KffjySL4Ha3qb7NKoKFypkfr4mH6
	noQspU6/qDKXZNIypoGq/e5Fo6r1wPrNeq0hiGvwv5+ApN706DMSd/tjf6RW7lgKK8ExQzmE=
X-Gm-Gg: AYBFou3Oj76p1Jbjkp3yP2HlSeYmcDmB/Wk88u60mYakFwYbV54E2/6fht/k6jz8ggF
	hQcg8YN833rHU3Ui1ST0lNgmqnENFCQEb14SG4pfj3R3BRcv8KSeo94OrdLP3mdCQUwmhqRapn4
	cfRVRA3y/Y683byntwSnwsVVRvjDdvDgF51DIDmrbh9VEd6aeUZUg9AY0N5Wwj//jur2u1xB8D6
	NaTLPwTDjLo8n9vCaiRgY90btk/DsFMQ182qRFqr9Ywm3WN6saPK5/d7x4OZTp2qm7a3vlQZEkU
	HyaeOyvDEReCrS+zGQOe1tGc7xXMk+L7lDRiZ8CsIRbuuWLKQqhMdin8
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904801637.22.1790246302072;
        Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fd9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Jse9-C3Ywh_Zufs_w73HZkx4xGG5xnqi
X-Proofpoint-ORIG-GUID: Jse9-C3Ywh_Zufs_w73HZkx4xGG5xnqi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3Bz+Nt0GUqaG
 bpi5lLt4vFXKvfjtBe5ri4c0+5DKdDBi2L6FAae8s71aEfnERqH0yegfO1WC5pO+etw8nSNF+u8
 DeDMzHa8z/XzpVCqDab45pN5vVzMEwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+hdM31J11ZLy
 1p6Sv0NOzl04rdFxkzMFMbdpVK6aP5PypsLPMHz5ZGvGlUbti+QdPLHao4DN+Iak3mSxJnylti3
 ch3Y/XuCFrIDEbfxn4FKs2ewTJcT/R9t9O6zIHPfPplByi3Ew8unGGuG4wJkslZmZVJNhl/Tvbe
 X9cEnIX5ZhFGpAU5P0cmtTR1OyywMoY7Xu8ne7qX+mpBLOT9m6niixsEBxxieaAkx2tYaN6LB/J
 ui2JxwjLsPGcPBbT176tgUmM+i1PE9eB/eplZ8TksmnHrLItliHumLQ6w2bjZObovVdodNrxZKB
 Qz6ZO9ewnXWyZn2WYMuOgUyxEbYgVLKSKn1aIIS+l4D+1mhe6F9DqCyCP61Ckg+xtk1+6xL/sHH
 ON68CizOXn7HOSy5Rcl45bgdpxNzEyQ4Jg44w6TsIbIeoxWWeJSltVJ2RzuNA7NPOVaGaTfZ74T
 tf9FIB/BCP0Li6A555A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong
