Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B63D3D09
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125409; cv=none; b=Eo5QYeQFXyl9wSrdNzOHrA26BrGiZtdGgkRfd0RVuerdQtJKZOB7iqVJWvZ8zBBIJlJapfiwP0UDAHYXUncu1nTy1n7j8CemUr6zPhT1vEivHmerBJjSV4k1d5B3d7Fhye0+CfcuYoHw/+YjoCkyM+thilLiztDVqppaiaK/3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125409; c=relaxed/simple;
	bh=nLS4MJyMMwQ2WYFmClH5/ODmfyCS3vaEK2/pUfWjWpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=je3vwJ1ZtfWg8Bw6Hu7IocxVgEuTzhw0bj+QGSybiXzsz0FMnlMf73aIyV0yIWVg4Q/tGO9cS8pi2eZl9oz8gDH7F2mYHDg9VwbC4Bl+LwE+zpu8LtozMXxuN5L4/BSQgwjS95C6TrpfmW+ufpPtGkdYouyI4+WST/MPF7Ay6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlP4958g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZl57m7b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlP4958g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZl57m7b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327A8pV3044878
	for <linux-kselftest@vger.kernel.org>; Thu, 2 Apr 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpy
	Ts02c6Ms=; b=UlP4958gdS9gDtGGXlkbTIAwReZ8obzELD2H/85Wb9ZPv/YSXr7
	bhVmtqDH1m7FsugU0zpLe2/bHjqLPGfilTh/A2VG4/QuNYEyrcCUBukDdElQrBpz
	2EguKES2Lhn3q/LfSx+tq+8LtQR2SikmyENdnDvusozue9F5cmIUNb6kNdap+3B8
	nZ0j9oZFNh7C0JeVqITCR0jiI4BktJ5D8Px+qLhCoJGVm3INZqHUff0q6hgE/0fz
	cuetOmdYSyRlnCYNC2y302YFVKyR5EvdhTue2NgWhdGG+SRl147r2DrqeRGbApeF
	MmwoywgB/S30uGO8BJjHA20sb0cmqVHo3Mw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483vc9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 10:23:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c8768a704so424703b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125404; x=1775730204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=cZl57m7bbsoK5LSVrlq8pQoWKxLI4fSwVBCNUQerS4oem+U7HM/sL42pnIy2XJesFR
         AFDA2upM1yktDfk5NFquMd7dyqVII1sf+fFmzUGqi3OOYk+HHP+ZeY+NuREX1oOGAfs9
         +OXpY61VY5QNYys6w+iDMx7ScFd5Vykfku+dwzmzpfjLFwdyO2G/WDsNoz5zYKAnMosb
         z30FH2OUktRtaf2G1jaRs6Ly1iDaiJjWQg3WQbg1Ui4MCfjJmZVSB62EAwiemkQMLap7
         lG7hzEiKZKlJxq47tOyYCuCCr0GdU+mGMBRNJP8JFTAJlG1Wb0OIvQiXxvK5cTlejrAN
         sUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125404; x=1775730204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=NHlt5pRlaNs0KJ+KWoaLe6Jt+BIUF2WUQ/6H9hUv0c0ZrXbw3UzwEnwPPGfNysTJRr
         Juaq8yqsj3vm3E0CVYjmF5FS3/VyplueyYefytlvpgnO2Mn21+PqVUnQ+vUg12c20eSE
         bnm4iSqUJrO330RsstPDXqeZ2GtyfkdsWUMG6cx+dQCPSWDYwDKN8Fw33cgDzBOg+YJa
         T1ZEmR3VoK37khqzkgm4TZ8xWQTgFGq1nbcXv/PZEzWpx7fkQdqIR46ACXSuIMlMTq1h
         X9eqtJKbFdkEp+I7WeZYjG0u6/X0MqyV3ZnKiXQHwVVz0C9B9Q4PZc7OMblrHzptPUam
         WXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVgzw0pkJLvvojLO4jEIZwj7ZHh7KAtoF4Syz48gpCGZatr0wPcoxX77X86uAR1wMHAvCKy1nWMobAF51arnGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyU9PSjHuQIIF5HZjmmL0oo9Et/Y5OG0pXGZW7472XEzj3mXGn
	GS16AQyWeIpiY7bc1u2W9eX4BDCENa9aFQ+fIsxO6WWEXyzfc8EKQ7+fA0nEVSKvHpyAnADYxOi
	kKPYExb1UZIjNk272JagXAVOP2pl0Ck7YkyYSIOnpHotZxvkLCHv7M2APOZeGmvxWoIyDtEw=
X-Gm-Gg: ATEYQzxym5ZGn0Vl3JBO00G6xdxVvVv7cVOxuWa1pOcbn/QZwbYeqK45cHddjVTQFlk
	71WHscM39X6gps5ZPrxHHufacEtxLgtseP1OucFo6SxVr8PQpQmop4dZvWJZVkrEOkkmUKjuSvJ
	2aAwxYyd9uZkdIvvIH+BeKu2WYfWNt+L22jFYB3Z7aHIzD2S3KofSLzPR2s4c8OWBUlwCtWs9Ho
	+cAw+82cm19arcPYAgBnyUZQ9cm5AqQ9DvG2zYoSWrfjl7YU7febAhWtECBvGOEp4oWez6JZncA
	4gIwR2hsWXTjXgv9NXvnJz5LBVzEV+p55IodLwVLFZ/zSZjmkGTBWNcOnH9w52uP6rTfX7DKinq
	MWnP9T+3mfvFhauYgp3c3q7F7AWtHKKattAU/Ia2foo9PQeV9ZW0sxezGi6w=
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940221b3a.55.1775125404005;
        Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940195b3a.55.1775125403534;
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
Received: from hu-mchitale-hyd.qualcomm.com ([202.46.22.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm2643160b3a.29.2026.04.02.03.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
Date: Thu,  2 Apr 2026 15:48:14 +0530
Message-ID: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce439c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wNTC72m251yRgy6-mc0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXyqryeCFj/DR3
 QmTSz4x0deeAOh3TQHd+C00beT1X4qiGgKoPBjdEE/e1oVWOJHEF5BcM/3ymdGSFlopTrjZdGSz
 0e2/Jemv93zJuiEJ+PNjcGDzZ4Ixzb4iQ+o9LAjL+RT6rmPWVMCtXQFgkSE/UlBy+IF+TspXw+f
 6Pj3znn0e8sl0DJiEq6EDDeUwgX/8frc27bMfuwaj+6Z8nwnVdA0s+gT0/gOMHFqF4/vrWdTcdJ
 P0xZAOEig7OwdaRmi3L24DyOc22j+4q+YeljlnFlTC4w3cuAh4gf7WCVouKl7T62RNy64ac8blD
 E3Ja4cZwJNyWXjZNTc9iiftFmELzdjN6BuMXtIOjMFzEcAgUe6FPukUOZeEhX6qNXSo60tlB+tq
 YuhcNmt1GtlcpMORcAG65eW2ZfazGHzinKjIiJGoecFYB4qa4HNnCgf+6a2L6aaCcLLPh+fRZny
 OtL+Reru2uxm7tkVBKg==
X-Proofpoint-ORIG-GUID: FGP_IjdZYlz5F1GLZrtV5yjJv9Wji-L6
X-Proofpoint-GUID: FGP_IjdZYlz5F1GLZrtV5yjJv9Wji-L6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093

kvm_arch_has_default_irqchip is required for irqfd_test and returns
true if an in-kernel interrupt controller is supported.

Fixes: a133052666bed ("KVM: selftests: Fix irqfd_test for non-x86 architectures")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 51dd455ff52c..067c6b2c15b0 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -566,3 +566,8 @@ unsigned long riscv64_get_satp_mode(void)
 
 	return val;
 }
+
+bool kvm_arch_has_default_irqchip(void)
+{
+	return kvm_check_cap(KVM_CAP_IRQCHIP);
+}
-- 
2.43.0

