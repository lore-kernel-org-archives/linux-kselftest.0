Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627F2380FFA
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372630; cv=none; b=AxoS+1t4QRgem+90/BuxA3N+NWqE2VDbkARYMPi5boonIwRjrb+AnnG0KRdzU9Z/1ZHMm7aTyIe4SkMuo0qyRUhoY8OUCaRJQmMivs/NXk+fwuQLdVoc4yNo2bsWfpJUFvrIwQIxzZxLlNIlNBlLY0ILnszfQOCDigKn4r09j0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372630; c=relaxed/simple;
	bh=qfSZdPmwBhywiRrKL1QrGMIdCfETYR+AOs72sM7RPN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UK0HzeB0jahhd61QE7duMLi7mAAtGY5CaqFNKpNN8qdfIjHAvGxjEvbewBqF4f3cMT9H1omANcDQxyLrb1j3uSzsjkpO5wxIbKJCcIfBL2RCCytIk4XQGvSS39F/jGwqgc4X4bDC24Bv/sdFBm1WDc/TSg+DXAeBNVQ0ZVAlT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKXZsLuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4tu7jAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKXZsLuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4tu7jAj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9P9S2784798
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=plRqMq3yK9Gvk+pbVnt+KD
	Y+x/K8ovZzlsQsgimrdOE=; b=OKXZsLuZw1uLwCy9wlEQKLoLrCSLPORTIs4pYg
	ackQWrlEebJQn4hX8E4P4xoEIfr2zv3GKNmunXBMoj4QUurG0AUkJoT75/iRBdPw
	r8uizcWTxANrBucYJ/lyE2iFrf6AI0MeiPZZDNv80ytCI5DBkmXoqbHqRQ5Jc1kY
	eUU9fNhCpabRgloPKhvJcGxdfb8Aqu74ncD1dZtWyDA/mDGqXbSQ4pxBzb+6hpos
	vllClEcjzwZ64ibosP5+O4k44cMldNlN3oaldjEt3el6P6RIY1ZtkmRA+WmZDn/R
	NCMdIpa95WZK+zXC+g5oYYqvcKYdH0GEYUWwSI8jgLKDxikA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cghj9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f544944so1428910b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781372628; x=1781977428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plRqMq3yK9Gvk+pbVnt+KDY+x/K8ovZzlsQsgimrdOE=;
        b=i4tu7jAjg75I3psvQVP3j9KipjErxzq4RMEOe7AZjbtC4NwvSUS6H10m24hPuaYDL8
         nDpAN5eg4CFZKVaIPPrurS5tILbW5O7aK+fGed75vr8xR7BebEmPXFWokIsFeWoc/EMQ
         rH9L0b3/Fka3QiU4WndYe6ojPeAPGF3P/7yTryUWRZkvl8IW9RcirnTuCNSKGrFN82oz
         MGPP6pJVaR29K/mg2JM8DV0FKfGGxLqxgcucLxbwGVKOpACTjkUk3YPos3X8UJdPPthM
         U4yhHxfmEg312vLLJQR5i5Glv3S61qLP68NEbU7CelZNL0sJMGrJCGP8bPyNN5Zo3arI
         qxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372628; x=1781977428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plRqMq3yK9Gvk+pbVnt+KDY+x/K8ovZzlsQsgimrdOE=;
        b=N65/uxLtKJMBrk3xogHl27iKJzz6QgyldGzsMqePkBlJRNsukdXCEJe33mMjWJT/57
         7BTKYoq2ucIRDN+r7Sqgjqiqz73sODgSygyLhTF9y3yPnz/jCnlLDbbs2APH2hEmt2g9
         dgWJSPTjHftc1yZ8UEnNlq+SNPClXWYMllXfQMeF5xKpvHFM/8PJkeWV3tQlENxwN8Ju
         EzE7gmLa3UneGJoBY5Be+wkooHPL5L8Sb5gGD5f0+7KsCwIIp/cXXRqsanvaAmdQ+jVR
         e7k685yM4W7jgBqQ6PFPscquCRdytzERS+fwSJvNOoONg6DqabVuhvOxbhnqGTS5A+Ic
         sGkQ==
X-Forwarded-Encrypted: i=1; AFNElJ95lH15P8V1d3WiI44zNaxE1YieLgqg4qNV9FmGxgNol6VLb4tFDynrsUHVNoU4391tRAlxf339P++9uEaXv6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YytwoGmksQ5h93kocAz2sRp0ZB/jQG0X44K8E3GaMri8S5TIvaA
	geEZw1e9ZTuqsQvog3WUYNBaF7E9BfkuAV7Lt7E8Q9vGOZKB4rNZkAX02wTL97yDA71o+phsA7k
	j+91YT1tp+5VST4rymvir2jHFJt6lglLlVrCfkCturmGg1FIBKOik1rNZXsXxgdScD741Tb4=
X-Gm-Gg: Acq92OE1hODn9Z0tAXpzUJHLkgL5Hq+jTSqPZZEjPLA+vQo8oIkxDrdprLjy/wF3m5C
	2yt2umnW7EnUvfH0eoDrDeOqe9sSvCUbcVxEc2MnrX8ay0CXSegjtGnqtNYBIp48zQjm52eoSJV
	ooMSSHvQtsV9/d5MVA+KuJzKaGCqNtj0DaULU4v9ZmrEWodKlqYRh5dJstgv3Ft4CthR/i+NBtZ
	G5XHZ/MgEgMRRQx8iErj342ohhD16CTx6+SILsNDdqdYs909RQ1CHrWx0aKGMBwjSWBujMOrhWF
	5rpLT1x0tDl6uq8AkQDqMd7QaZOmnT6OJx6BgbPlp9hjbX6uQHXImST1OUssCI2DEJgMaNpDxMH
	mk2c5Objp6dWehTJZtbrxxXkeeiSayo6aPvX0uB1yyq8A7+x310FrkQ==
X-Received: by 2002:a05:6a00:238c:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-8434cdfe0ffmr8593306b3a.14.1781372627780;
        Sat, 13 Jun 2026 10:43:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:238c:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-8434cdfe0ffmr8593287b3a.14.1781372627138;
        Sat, 13 Jun 2026 10:43:47 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm6594096b3a.57.2026.06.13.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:43:46 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] vfio/pci: Hide and optionally override the PCIe
 Device Serial Number
Date: Sat, 13 Jun 2026 23:13:35 +0530
Message-Id: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiWLWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nj3YLkzNT4srTMfF0TC1MDMzMDo9Rks0QloPqCotS0zAqwWdFKQW7
 OSrEQweLSpKzU5BKQKUq1tQAPURXkcgAAAA==
X-Change-ID: 20260613-pcie_vfio-48506602ec6a
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>,
        David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Pranjal Shrivastava <praan@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781372623; l=4732;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=qfSZdPmwBhywiRrKL1QrGMIdCfETYR+AOs72sM7RPN0=;
 b=rLXoafxrZr8d972ebckbTQWraOKdDA+HhooMDSSLb5qy8ZwtwT764phTddP7x0mDhD6/QsFBC
 y1y4QqjZbnWCxmX/Kg16h6VqIo2TdZWayWFEBY5tWsCYFlR7mtWfb3z
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-ORIG-GUID: _qANs4_h_4oILfgTO73AKNAkU0mu2tsG
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2d96d4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vxAM7KqD62Chtjj2FOQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _qANs4_h_4oILfgTO73AKNAkU0mu2tsG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX3gtLr/nEzHhz
 01+onM1uP67L6kv56rpbig38GyUZ9KtuymMKtrSKcc9hHVZnWvFgP4oculIs6sZX6+mPkD7cbRe
 FwgdjHNAmgOmLugfUmm/0iXiT9P7iSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX30RUDk+8Qrm+
 v5Y8SHOYgA1z0c8gFuvsSTp089nG7ioZkoqtG+uVA0NZ5OkTgeIw7Lx17CnrKQ286yrey5okby8
 7x1SV7FobfgIhSCssDX0j6GLUnH6UweBXgC3GsVaWOgsCJfWiiB9aQ6jXGY1ZtMOgiI1VpNPfYI
 btW7cG0LktK37L/9Cq4zZtMiey++Q/iXuCE0FR4/DVupxWkWHBZx5yhPAwlZBGHCltfjP9hesDg
 +aezW0tbIp3eQhmiE3kHMURkU1XBE5qk11vJecYAoQ2e70nV0WtwSIT1y/ahCd4Myr131yTjW3a
 cK5eUt1BqxaYTkjVaYgoPbVIT4jZv3w+qQfwZS8fkq80mo7F00U+lSyfkYu8tfuEfPIuwlWUm8n
 jq2P35pVBu433G//Eu4WFzrKY6tEiBTx30NrSKJ2q3z813pRJhFSn7xut9djSCdwee/daTi/QbH
 +zK983OuFvqTAlI7Ygw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130185

vfio-pci has no perm_bits entry for the PCIe Device Serial Number (DSN)
Extended Capability, so guest reads of the serial
number currently fall through to the physical device.  The DSN is a
unique, persistent hardware serial number that identifies the physical
component (the functions of a Multi-Function Device report the same
value; Root Complex integrated Endpoints may implement it independently),
so exposing it lets a guest fingerprint the host hardware and correlate
it across VMs.  For multi-tenant passthrough this is an unnecessary
host-identifier leak.

Series:

  Patch 1 fully virtualizes the DSN capability (header + both serial
  dwords) and scrubs the serial in the virtualized config space, so guests
  read a zeroed serial while the capability stays visible.

  Patch 2 adds a VFIO_DEVICE_FEATURE_PCI_DSN device feature so a trusted
  userspace VMM can GET/SET the serial presented to the guest, for use
  cases that need a stable but non-host-identifying serial (e.g. across
  live migration between different physical devices).

  Patch 3 adds a selftest: scrub-by-default, guest-write rejection,
  PROBE/SET/GET, set-twice, persistence-across-reset, and bad-argsz.

Position on default-on (the main RFC question):
  I propose scrubbing by default rather than opt-in.  Rationale:
  - A passed-through DSN is not meaningful to a guest today: the value
    identifies the specific physical device, so any guest that keyed off
    it would already break on migration or reassignment.
  - vfio-pci already virtualizes/zeroes other identifying or host-specific
    config state. The DSN is an outlier passed through unfiltered.
  - Patch 2 provides an explicit escape hatch (VMM-set serial) for the
    rare consumer that wants a stable identity.
  If maintainers prefer opt-in, the scrub can be gated behind a module
  param or a per-device feature flag.

Concurrency:
  The guest config-space read path is unlocked and reads the DSN as two
  independent 32-bit accesses, so the kernel cannot make a 64-bit guest
  read atomic.  Patch 2 uses WRITE_ONCE/READ_ONCE for per-dword
  consistency and documents that a guest reading across a SET may see an
  old/new mix, exactly as HW may tear a 64-bit read of a register pair.
  Serializing concurrent SET callers is the VMM's responsibility.

Lifetime:
  The presented serial lives only in vconfig: it persists across runtime
  FLR/SBR and is cleared on device fd close (per-open).

SR-IOV:
  Per the SR-IOV spec a PF's DSN applies to all its VFs, and a VF that
  implements DSN must report the same value as its PF.  vfio-pci exposes
  only the assigned device's own config space and applies no VF-specific
  transform to the DSN bytes, so a VF that implements DSN (whose value is
  the PF's host serial) is scrubbed like a PF, and a VF that omits the
  capability (the spec-recommended case) exposes no serial.  The selftest
  covers VFs when run against a VF BDF that exposes DSN.

Testing (under QEMU with full VFIO device assignment via IOMMUFD); in
every configuration all of the selftest's cases passed with none skipped
or failing:
  - x86_64 (intel-iommu), e1000e PF with DSN: all cases passed.
  - arm64 (smmuv3), e1000e PF with DSN: all cases passed.
  - x86_64 SR-IOV: an igb PF was given 1 VF that implements a DSN cap in a
    realistic extended-capability chain (AER -> ARI -> DSN); the VF was
    bound to vfio-pci and the selftest run against it: all cases passed.
    This exercises the spec case where a VF's DSN mirrors the PF host
    serial.
  - The SR-IOV run used a kernel built with KASAN + PROVE_LOCKING; no KASAN
    reports, lockdep splats, or warnings were produced.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
Pranjal Arya (3):
      vfio/pci: Virtualize and scrub Device Serial Number from guests
      vfio/pci: Allow userspace to set a virtual Device Serial Number
      selftests/vfio: Add PCIe Device Serial Number test

 MAINTAINERS                                      |   6 +
 drivers/vfio/pci/vfio_pci_config.c               |  98 +++++++++++
 drivers/vfio/pci/vfio_pci_core.c                 |   2 +
 drivers/vfio/pci/vfio_pci_priv.h                 |   2 +
 include/uapi/linux/pci_regs.h                    |   5 +
 include/uapi/linux/vfio.h                        |  18 ++
 tools/testing/selftests/vfio/Makefile            |   1 +
 tools/testing/selftests/vfio/vfio_pci_dsn_test.c | 206 +++++++++++++++++++++++
 8 files changed, 338 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-pcie_vfio-48506602ec6a

Best regards,
--  
Pranjal Arya <pranjal.arya@oss.qualcomm.com>

