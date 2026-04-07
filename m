Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2AD3A75BC
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571119; cv=none; b=IrsGuBKVSU+9aodoI4KlxlY7YUAu6CdyCruw6n/7A/P+21JrkLUlMLLTYNe1GhSZ27EiVP954HUgckk2MM6YLURBySwocs5iEM4ZOGlE2hcXa2eCMLWFCYz06Vau5YGUNEXTWmgVgJ7ZPfn92DU+VxCaGfU7eoStX2t7x+hpFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571119; c=relaxed/simple;
	bh=624X6/K+kgyo0C4thZehhHav7UKWtnlQD288uj+uL6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uFPFm9yWlpJTH5SCGdg8Md8ZczoduvrWepHGVQDsbqe6bwSpSO/zbPSCCy6MoLkAsmxwGJytC8MC66p2Rki9HhMDCVD+qNzD7IRIqBZumpvKw37ecd1KpApL87uK9DUTff43LKP1Um83mU6U17Y+DppGT/Bu+OiJytQSCCV3M0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJlEMdZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIrCixAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJlEMdZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIrCixAn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CwcDY2328763
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 14:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGcNFNedzdiEGRO8TH8xwhPWgIt8dM0Q8kkq+ED+S3I=; b=KJlEMdZ1j6dK4EeS
	GaibaZq19kvJtF8MuX5qRwAl7NhZ+ZIN2ASAuwGAzWkSImV/A5sGPD3ZnN65/O1D
	qps8kLW0SmI73H1a6DSJ/g5RJlioEfsd1SGUdYpnsVCwrFP8y841xVfsYeggz8Un
	eMoypk0BxhxW2tGeH6h4eyDL2X4TOuITBa4hiVfGiEjmmuEPI0II1vx0YFxZXVnJ
	qNsrMb+E3Y0pHWOZCAO34ScxpYfdq0AAYLDVI7LKMoe6AIyGYm5VtyXthV/sHZ+B
	PFvqSpCe+dChXGTPgzqNC8BoUqjmxyDnP8xcPvBSNuOuyKpI5T9YvPf5Yc9Vc24s
	ItAmng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4u1nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 14:11:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e45271cso50747785ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775571116; x=1776175916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGcNFNedzdiEGRO8TH8xwhPWgIt8dM0Q8kkq+ED+S3I=;
        b=QIrCixAnyW5TDAS+EEa0CYbwM0mmBjckuvcVYz5GO0zUjnfE8+s99p2Tb9cLW2xGhf
         tWB/fBEKSm9zMhbuYN0/Y2TtfssznFyE26yW68KNMyXTlp61DLlaNvlXtnuPFRQS7rfQ
         5RZI716EehhwYOOTkKuoMSDIOVyfij7UjsOjo/zEGPL0IKP6lvwmxqeNDJXianDNKi0p
         UZdEzRB3HS5EiLC4LNJqPjs5e5UYA+Jc/3DkO9q0QLljTrJnZJW2+1AJJvdk+zJaqb7I
         /N/6w39u+MO/9nOTnkGMWnSuGygfjSw33cQ0eBX60E+XWbg2tKTkq0EWyvlYiBiEMbHF
         k/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571116; x=1776175916;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WGcNFNedzdiEGRO8TH8xwhPWgIt8dM0Q8kkq+ED+S3I=;
        b=ASXlYuZkSDrBDN6KgyJKozQaVS5fo+g8IOAoi0yABB4EEtCwokQRz68fuEh2k7hhXg
         f8TCluLdcoJGlwWZ4YTqhlNYBiDwaRMqE7C8RG5PZw5l7LKeQVhS/w83iw3cSW1cGlLI
         jRsUZghoeRHBUZo2K3VCyAh8DSzp23tcs3pPm4M2QF8Qth4fbPfbfaMu83exXTLtWNLx
         zvwBxvwS0zmNu0Fe0c4FATb7SCWAvyqKFj3F4c4tRxLhi4g857+5eFT6/ECGJzwp4nhB
         m/TMSLCjge2kWHIfOumVJ/I8zHt96CkEu6gyr80R6NrLSAiRoisGEdYH7cu9ftwq3aKD
         Qp/A==
X-Forwarded-Encrypted: i=1; AJvYcCVox9xvlpN4KMlLb4u08nGgysBnuY9uJwclDct1PuraheYowQanyR6sJ8EAyi3SicD3UpoDa5VMk/gZ/ibHREU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQz4dAeWH+3MILBScai4VHkS7T1QwceU46zIl8fUWyu9isJDCj
	m3bJmTe22lHMS4sYMBGUFVHxj0VkzJn1oIlJW2dagxwNquYXCkE4W7FLvTwW3jb5O5Ixo5gFyZN
	wmgy0+pTVj4hXbmNdd7o3TongVZtToW1lpbn5KPMFOfvEHrHSOAgsTYKyS0wsI7LWt2dn7Wk=
X-Gm-Gg: AeBDievlJY72C0TyRD6vDKbZTC08f3H+QZe6vv56VCiJ/Wv1ol/wip5pgGOiAN6TBcm
	HW9/NsO7nLg9lW2UlgZNt3+xTKPaN1yfKcyqJVcw8aE8hjN7djF9x8BCyony+8CGb/+qA05kHNS
	2OU4mg2wdniXvrvj6p9168briR+J1pvcpMW0Rbpy1PUjAyfGEGUL+GDdthYs1wPsyylIA+Hufjx
	yLxQzrbV5Ni2Gy332p+fnsbE7nEMQNV4cLlYpK53S+JwTQv1wAreHUEQcsD1lq7dYuAz2U/fs76
	+M8NXa57Z7aGZ3ioyC4VpL2r7WO/jZip5NdeBVT3YKZAaDx5gWUf12UnOB5WZgBAIIHqQSCHpq6
	kyTDlNovp5IrZvPLQffuI
X-Received: by 2002:a17:903:2a88:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b2817a1cdemr196407495ad.19.1775571116410;
        Tue, 07 Apr 2026 07:11:56 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b2817a1cdemr196407045ad.19.1775571115807;
        Tue, 07 Apr 2026 07:11:55 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.133.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274f8867csm180026375ad.54.2026.04.07.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:11:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Koichiro Den <den@valinux.co.jp>, Niklas Cassel <cassel@kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
Cc: fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260407-skip-bar_subrange-tests-if-enospc-v4-0-6f2e65f2298c@foss.st.com>
References: <20260407-skip-bar_subrange-tests-if-enospc-v4-0-6f2e65f2298c@foss.st.com>
Subject: Re: [PATCH v4 0/3] Skip subrange map tests on DWC iATU allocation
 failure
Message-Id: <177557111043.286575.12032515827207230571.b4-ty@b4>
Date: Tue, 07 Apr 2026 19:41:50 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEzMCBTYWx0ZWRfX/HuWamcORe9D
 iSfTCxky/JpWKknNdDntVcLBrcDCeeW9VlUTiGJU3TuKjH/GTtJX4Djk6gSgOuvhv0xLCEXHicy
 xrYzxBQh+fdJ6gWDXZuXhoVOn8xRoB3aTTe3UZ3yfCeE23KnXDaYiRpwoqLBcE6AYhjYaf19v8w
 pTqIWlWLsr4Yb3EGSU0GtPhOgoHUhlwHplJ2k5lNQyV8knUcpkxYHd1/7aXDmjiXOA9NHofT1WJ
 iPGSFG8x4GWMN6R2kDIr5qAidSktjRI3XDrjLavSy9F+AfuLGgICVOanDGcE0SQW0wI043l6ael
 WzAD49U0RCmVWL/dgrqaQRs1mR/1TyatPNrQ/DvmOeZzsDzRmNZKr73/nlpDHkIozdcLir3mJsi
 0VCg/wO5HHnxMS8vJ63Yt4oQnekez3lvZaNZNf9nweDCCP4fXAENoCyKfmx5OZKRkkblM+x0fGj
 R9GEZOj4lurUDBuXmcw==
X-Proofpoint-ORIG-GUID: iGVBZOe-I8zy-pxVfhv8BLyj2118a-7h
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d510ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=yDxY/ZQAnAaCL67VaoekCQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=dxHiGLMGkjoLnCvgJk4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iGVBZOe-I8zy-pxVfhv8BLyj2118a-7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070130


On Tue, 07 Apr 2026 14:04:07 +0200, Christian Bruel wrote:
> For platforms with a limited iATU inbound window entries, pci_epc_set_bar()
> might fail to allocate the ATU entries for subrange maps requiring more
> than 1 slot.
> For the dwc controller, this failure is reported with -ENOSPC in
> dw_pcie_ep_set_bar(). In this case, the epf test cannot be run and needs
> to be skipped.
> 
> [...]

Applied, thanks!

[1/3] PCI: endpoint: pci-epf-test: Handle -ENOSPC in subrange_setup
      commit: dfac277624c82b361dbb3e0fc57f577a270bebbb
[2/3] misc: pci_endpoint_test: Handle -ENOSPC in subrange mapping test case
      commit: a51c75fc48c2a0d2ead2d7e8c521de0423ec8dec
[3/3] selftests: pci_endpoint: Skip BAR subrange test on -ENOSPC
      commit: 2b729b7721bd4d0640b26790ea6c360c85a4af8c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

