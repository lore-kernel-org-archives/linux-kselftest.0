Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30230C619
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929127; cv=none; b=K+p8hoQNoknLJ46mMAqkzk2hQyYBcX8FXAQEIUsAc+3IfMXIeMZiJs6GCtSRXRXnZBu3BiTIs8IunsgwjreGsx7QLdaWFDODz+LRen8iRMWh3001qo1m4JJcyCRR1LclG49FzRipVxz54fL4UfHnJ6LoDeP+eGZjrjhJAEhoLVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929127; c=relaxed/simple;
	bh=3DEBZkXGlWeTEe1QBrT99gAsCgDLC6FM8EAUW9UvXoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z2cQZjUS2pIZLObd727A0ndwC2sjqzT1b4l7FUWg0fXJTACB/QX1pgU8OM7wDC+1KaunkHD1FH6AVDOCRDe6vOjMTegn2VUm0U6i7S26BgsuEiaL3LjVCLCJEYqEbllUReTJqLigKSvhkLngSxNUiDTq2ex2gyYQNdxNXuBYy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDXQSqIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOs5iGe0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDXQSqIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOs5iGe0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFWZx057265
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnkpqFAwGHUOG+UZQGRNUVosIrCxLVLhMWwiuXlXtAo=; b=hDXQSqIcyJ9v+WGE
	nbAcVCxh3gH0C4VSsbQYlp6+UFctDcFWPZuOSqr+8ttPMXv6btpAX6UVluc5sb9V
	7iD9xLLTl+QlI/nL+LH3lmjbysjR8ZaBEE5qf2ojRU9dQ+7AGrUyOYqW//GEnP6L
	NuLOHx52dwlE/kxYX/NodaaIghBKeYANZvZLu6AACY5ylEpat5VnCuYNxJQtRSzM
	Gpk5sK1+Tf1LJSZIGckd2TwU1C67PwFr8r1AJAmGscTlze/B1ppaY8vGxhE338zm
	StKeBeqVZEtBh/Vmbpf7UFMuzSpVNlG5JE2WV/+Dzo2p04plIp52nXQzNCHoCAg9
	TA5THw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa83j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:32:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824b5637daaso2702771b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929125; x=1772533925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnkpqFAwGHUOG+UZQGRNUVosIrCxLVLhMWwiuXlXtAo=;
        b=dOs5iGe09UQ1z1OXKZbphMme+SvnEX1O77aauLpVVJFhpByE835dyM9JiKygEOVH5j
         3BAbaibrpV6Y1W+lurlMdhsy6Tyo+LGURk7Girei7LY+ecJizviAkdY+/b+fzdns3ajk
         z8OdCbCLhmylKKpWIgQ+722cC6ii4nU+1bzAix7vC74RjzAOHtem5o97lvFouWsLG7bQ
         mceRiIixzmdkMN863unFYO/fQF9J2o2kjl7bGcsQSvvHxfRSMurRAVyujzI2xLGKDway
         AdmPI2gEHLh4PkX1bwKaF2rc/AJIEi6BbdL0LXVkO06ubED9oh5WFc6Iol2lAOC6SoyV
         u9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929125; x=1772533925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnkpqFAwGHUOG+UZQGRNUVosIrCxLVLhMWwiuXlXtAo=;
        b=Th1zkFEItGZs3oz8SjgdxYopcndcpCx3HSuoab8D4uM8GYJHQOR7xX5FvmncbxXn1H
         VE+zqs0I28B8EofpGPb91TGXeCsWJKPUecamby/fO5LFGsD4kTaQeF54YGqGTOBDwK1K
         JSEmM8kNx3Wb/z9DIVAEmRva/jderMWfU9fgrNIfcqcDhWROgKZiVfycfpLip0IaV7FJ
         KW2cXmlffUT2ZcWXkxKt/he3Ox527NHRFA/mm5gtL2PT279DCDFCzY8EP0qD2OPMrVCz
         8iJSl+za+gPhzKMnkh3lRAOfS0iPWINMw641ROwBtT/SiRSFvWRhrqHlqmEkUxXOr8tm
         u8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW9kJvmwJHyNu3Ar05tDRvdGqDT/erM4lRZpoBLa17mKxrzlhkOhcy4y3HwoS9LATYeIBismm8EjnGwZym0wW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHIZjO6HR8jnc91QuquYu6F6DEJFyxwNFKoUYiKGOJp9jmJOJ
	u06gjgVI0gW8zesPhCtK+OdTVFWP2Jhv7fFRCjnXb7iGZOvT6lrRhQsEZct+Ml9ZkPnsxPsd5pA
	iKmuMATTEqQn4GEn0W+VEeAJ8R52/DgyvhQ9cTnL1hSzcrcm/4wfDGbdyx58wRT+n6odrwuM=
X-Gm-Gg: ATEYQzyB1BZXEbDp7IekamKyg6Bjbm/nQ2F2YPgUiMvZjjVReJlQ621RrR16dbaLT7e
	IiqmmBomtdYPuxgVaWX5tO/w7zN7bk2lWJrZYUq8sPWxuZ9gh7NThbiOz2qeyRDYeBCdCtkZZEg
	CCB9EhuKUl6ZJCrbeckh/mJ2R2O9hpaFlAlH3Dk6JZACTigi+WuABOD0JwGX8T4DZiZaBFcW6mi
	Fg+YrI+y7JAoIG24sE2P8yIxCHDtgAUTj4auY4lEItOWRSCUsAVHTBBvvsfxZfLkU7F1AZpHLDG
	JxSBgUKzZN77JX5vOtJLjm3YZ/ggNesUxgp+UBwRdLnK2W+WlUm5Aymn4vt2xvzIhxh4JSPoa9t
	9a6RaCbyO4bX5OhN5np5pAZs=
X-Received: by 2002:aa7:9a87:0:b0:81e:8e66:38d8 with SMTP id d2e1a72fcca58-826da8d7c38mr9481546b3a.10.1771929124614;
        Tue, 24 Feb 2026 02:32:04 -0800 (PST)
X-Received: by 2002:aa7:9a87:0:b0:81e:8e66:38d8 with SMTP id d2e1a72fcca58-826da8d7c38mr9481518b3a.10.1771929124124;
        Tue, 24 Feb 2026 02:32:04 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:bc82:a67f:ae4a:6d25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8c7535sm13166606b3a.56.2026.02.24.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:32:03 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: kwilczynski@kernel.org, kishon@kernel.org, bhelgaas@google.com,
        shuah@kernel.org, cassel@kernel.org, Frank.Li@nxp.com,
        Koichiro Den <den@valinux.co.jp>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
In-Reply-To: <20260215150334.3391943-1-den@valinux.co.jp>
References: <20260215150334.3391943-1-den@valinux.co.jp>
Subject: Re: [PATCH 0/3] PCI: endpoint tests: Make doorbell test
 capability-aware
Message-Id: <177192912011.11680.1586624827283604642.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 16:02:00 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NiBTYWx0ZWRfX/gcAJG8hC9AN
 3VJSq3Ys/w005XEDjkY0CfhzLU0AakFxGErMdT+lFhe2x7ewfSjhdHWOnqIRKQepLUcpZ7q/Lj3
 3Jas7wZHuGZkCfReyG6JlwhINq0GDgDVVtWXsa4ICpyeeqWzFUnakUK9s2ZDoUTftzUTMpCVVWn
 lGurS40XLBfpDdfKexlDbGwl7vSnFmIc31ow6bDJC67zzZz2g3CIwHhFtDBnSlk1woVasChbFqJ
 LNsT+gMev1XQUKMR2+6gt6obIYVSy3ctdeo0lNExd7L4ly0emulQLwkxOrXHBIbxU/fAoHwTB7E
 ydBP568z3HR1k/cOsfDWxc9zeGra8Q7qrpr/KMqS4L7Se/rL5lUx4VkxG+V1940w4sNRj5OIo8c
 e8d3Fx2Hwjd7L2DTfor1QGzC25DFCgPKF8UJMtIAURDEarvpsqxxn2fLHiPMWb/dMhvHAkmu4dl
 naUR0WOVgDCNf3izFsA==
X-Proofpoint-ORIG-GUID: ok7jkGPApA9XEPzHmXymsTJNZyLC3psa
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699d7e25 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EWLswNdyUk7addLI1k8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ok7jkGPApA9XEPzHmXymsTJNZyLC3psa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240086


On Mon, 16 Feb 2026 00:03:31 +0900, Koichiro Den wrote:
> The pci-epf-test / pci_endpoint_test doorbell path requires the endpoint
> controller (EPC) driver to support dynamic inbound mapping. Without it, the
> host-side test can run anyway and fail in vain.
> 
> This series makes the doorbell test capability-aware by:
>   - Advertising dynamic inbound mapping support from pci-epf-test via a
>     new CAP_DYNAMIC_INBOUND_MAPPING bit.
>   - Returning -EOPNOTSUPP for PCITEST_DOORBELL when the endpoint does not
>     advertise this capability.
>   - Skipping the kselftest doorbell case when -EOPNOTSUPP is returned.
> 
> [...]

Applied, thanks!

[1/3] PCI: endpoint: pci-epf-test: Advertise dynamic inbound mapping support
      commit: 9a940a3d08b25cf8e864785ee06b65756d6e4573
[2/3] misc: pci_endpoint_test: Gate doorbell test on dynamic inbound mapping
      commit: 51fba4aa66192fa65a31f213218167d9af326f1e
[3/3] selftests: pci_endpoint: Skip doorbell test when unsupported
      commit: b4a31737679576dc8aa6de43d3c10bfad7d3f57e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

