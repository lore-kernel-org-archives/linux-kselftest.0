Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964DB38333F
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372635; cv=none; b=s+0r8OfN+Al+ctTsIOoQSOPeYrR7AmFm+QgjJbEapf1x1IAMoarsztKgINcLGOLas9F5RYZ9KFXgx9Kw7RYTGaV24SvWQ4aMroj2wroa88h0SB23PqIVWIT4qJPD7bdRDcWd7D0yqWvYNlQBR0gsgqfs5X5Ml+vtsl1SK/duyc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372635; c=relaxed/simple;
	bh=i1C+7GVwz8hqSxonETSP8Z7foT49r9/TUeD3+VkK9Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHXpJWfG1pGhiE+TtLSlkJMoFcIbFJF8JimKZAKNItsObioO99DUsIyPXkGrpF1vVgoTGbQC/IYi4ARha6tDyJPB+mvnM5TBLTNcEIJIcdAU8gJqXbdlo8lQkxHK9RM7tvqP5NDORt2DynFN/XHT8dpLHw1dtaTnuhuS6HQzK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kImBcS6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IicaYopM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kImBcS6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IicaYopM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF8qQW1234589
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=; b=kImBcS6EHxWaZhVb
	eWG8NPJ65KU3oR5iGbYrvJcA6jHUdsfeZgkAJDcABqT+SOK3ezsJxlL+/cChSysy
	TCE0700ld5UrGtJy6KUHekJbF5H1P+FzsQwzgPnYkwgOv1azfubaaUEgseT3wd/v
	rVB9wsjjcz80KJ0sqy9YjxRu/u9V3d3l/TlRtHgrH4zBFY9ujLcmGRJ/ER5nqd87
	J54Gfo8vVvqut8gWligtjGCn9QU5+X7HOZ2cT4ARviBXyNTfX03SEM7DDsszrI98
	wgBdG69yliJ0yuDcMr9r+NMhS5NS09DQrGtJRXLD8gHpHxE6tkKrfnVrCLyVJPAJ
	Qy2e/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffhn4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:43:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8592a62f32so974669a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781372632; x=1781977432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=;
        b=IicaYopM9yt+UCtWQBp2nw/ra5uGB4NVyrNl7s1hAetUP+NxZK1RIg42NxxW8csB0L
         1dgXwIfk7tyEuQyV5PbZYYgFVjfjemrBtJenhFwrXYRyUuKtZJRUa4ZVugspJaLNEnGX
         k/AtfU3XDII/QGlxhoHK49hJjWO+wjJQMdy3IADilgVTK4oLU+IlkwFxt0oTa1BoGr84
         hHiTvWEY+6tf1Dc1eeXZq0qH3GBtWuHfifYUDLhtF4F/1cejLOwIlHqOqtZi5mUyJsHV
         E2GvloeFFHGyYVZF9Ay+ID8ETum/ybiQ0ILnUFXeRHzkdKn1ATkAbPncaDHWHAr1nD2w
         cuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372632; x=1781977432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=;
        b=cHzq8/UjPlm9jsWTjkd1NXmLm7QUWWpQDwut+tuHx+z1Wvul5BHqEQxmiuA6C9YoQr
         vYa+K3H2Y1jabJ4Pb0Eju5LZ3obeDOhB4XtzN8P1QFbT1Q0VX0rMCNaTj43Nzd3XrsiL
         FKjQTSspznJ4kihH8GnRYhQCYxZyz5vPTOOLQ1IIW13drizbn7ib1CUNzqgBGzaV9lVr
         EBSDH+m1IaUdPI+YfpJg2F9PIeU2obyeMUrgDy1iCF2c2BdB0OcOhu7j/4ODVpolKlQP
         u5GYuadFdeOqukMHcYgia/aeA+aCmkynsGzuTXai7UBTYeBIX0OE0YRV5Bdhlw5quBmO
         85jw==
X-Forwarded-Encrypted: i=1; AFNElJ/RK9R2/uKL3SODGdyWnJA4lxfVSdKhdR5+K+beu2wTNoK8bkeus7NpPuresWfto0hS9rsivZHJXRBE+2RR3cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYo0TjexrqAjADCOH7/5MDGFzBw5RuXKK7lgdkLFBhlJniD1rt
	v854TH0M7kjxlHHn+W191nHRkbehq9RWUyygyrAHqgs7fXcmZpMC/MejjtGAYHIfmR3TFvZpNVX
	7u/v13JE7XfAiF9KreOzrn+VoI1RijhP1+VrCkamUgWCNyD7Rt0zWKOMIV6aWHa4f/SN2QfQ=
X-Gm-Gg: Acq92OHJx/RdG4RldlDv8WIheuewE7CBTibfBJbHD9IA4InU/MMg7cwoN8PSx4eVPeO
	BCQX6bhXg7SKKoTAgfxN+2yk2flZLaeS0+sxGklLrVrAwZQEIG8RPn2sppnGU/BrH1Dlh0kBiaK
	yPvDaFG7UNXNLFe8Rfsx44JoeqqWeYYTeE8VqMEqTx/noVj/DToLLIozqZzCp4OxKqxDe2F+FBx
	TZfdVUut988yfee0H4B/8lIkjJOAD7nGrqtkL3SNI91EZubuEzy9WENCv0zV1PQgrEiwW+/1p6i
	2y8B3kCZO7Auw5eX6Apn+TpmDVJiqyLzIGQ6o1h7EUwYCbTH2ULUexXja3H4minIKD/DUutvIaC
	1TF9Pr9Bkjh8ZFPMj+9rEhhh7a5nsSJzN9RGSzOmQRxB2wxxvwFUXqg==
X-Received: by 2002:a05:6a00:1f0f:b0:822:6830:5900 with SMTP id d2e1a72fcca58-8434cdcaeedmr7853509b3a.6.1781372631973;
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0f:b0:822:6830:5900 with SMTP id d2e1a72fcca58-8434cdcaeedmr7853490b3a.6.1781372631441;
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm6594096b3a.57.2026.06.13.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 23:13:36 +0530
Subject: [PATCH RFC 1/3] vfio/pci: Virtualize and scrub Device Serial
 Number from guests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-pcie_vfio-v1-1-09168188f3f2@oss.qualcomm.com>
References: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
In-Reply-To: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>,
        David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Pranjal Shrivastava <praan@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781372623; l=6577;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=i1C+7GVwz8hqSxonETSP8Z7foT49r9/TUeD3+VkK9Uo=;
 b=0WN5zT+Mq0FFfXU8VJ/YH6TO/KCuwKs/cW5LjPcv4yOeQbyQZTmTdoNW8qaJbx1tTpv/Q3RgX
 ZLlGyyE6HAuA62vYVsgUD0/O6tvmiALyVOt6/LY2rnDJb1+elDq4NvX
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2d96d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Sm3NOD-Glf8aR10cVYQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: CTHPPxZ67hpCtqpir7vfhwlIOgYWS8Rf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX+fTwSC49FR91
 m+kJUk+5gh2GyyKht7rtOdaATreF69RqB+5ptE+dzuJjL/79V1lBwiEcORRD6VdYHp9dxzxKRAF
 cL8eeijkulenZQhyPRK1s00JkS28FAc=
X-Proofpoint-GUID: CTHPPxZ67hpCtqpir7vfhwlIOgYWS8Rf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX1mjpo1bVUr1b
 22ue6afeinmAki5hIU3eIItyNcK1+pxItOwagGPwNrpdDME8doQrbMr3YKWa9/0SYf7jyjUDiOz
 eUkv5Ovhcwm5bS7JijMhMR68vMPPxYn5m9w923sFkhquz7uBCPBQHFGiS0LLcEZFx4A0oxpUKMx
 s+IfibNgOTBBHE20BDFrAjl8l/GFORRlIE6wZb+uxWo/H4a8ymFmQjn+62mVO4wU7AP/ET+WRja
 WPXjlxbF6SFLth4IlYu1eBfcn/xrSXNidkUgaHPLiC/HTOcu8hkeRh7amL2+OJsLoCzGrIczguF
 s/sqjMGZHoCrU+W/DKkv3o3RPGb6jZ1civD5NwijAuViYctFiXUjR5iD6svLMBq229zQ/ZlpmXa
 UOk2Dagx4Q8zo+pEsX/p2XKlLT7ZAjovC1wvI4lp6oEDdKG/QWTnABYhJrEFHMC9zYxSSfLB5Ly
 A4diq0RwASAh4ukIO5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130185

The PCIe Device Serial Number (DSN) Extended Capability reports a unique,
persistent hardware serial number (PCIe r6.2 sec 7.9.3).  The value
identifies the physical component: per the spec the functions of a
Multi-Function Device that implement the capability report the same DSN,
so a single value can fingerprint a whole physical device.  Root Complex
integrated Endpoints (RCiEPs) may implement the capability independently
and are not required to share their value with other RCiEPs of the same
Root Complex, but each such value is still a stable, host-specific
identifier.

vfio-pci has no perm_bits entry for the DSN capability, so guest reads of
the serial number fall through to the physical device.  This leaks a
stable hardware identifier into the guest that can be used to fingerprint
the host device and correlate it across VMs, which is undesirable for
multi-tenant passthrough.

Add a perm_bits initializer that fully virtualizes the DSN capability:
the header dword and both serial-number dwords (PCI_DSN_CAP,
PCI_DSN_LOW_DW, PCI_DSN_HIGH_DW) are marked ALL_VIRT/NO_WRITE so all
reads are served from the virtualized config space rather than hardware
and writes are denied (the DSN is read-only state).  Scrub the serial in
vconfig during vfio_ecap_init() so guests read a zeroed serial while the
capability remains visible.  Add the DSN register-offset defines to
pci_regs.h.

The capability length used by alloc_perm_bits() comes from the existing
pci_ext_cap_length[PCI_EXT_CAP_ID_DSN] = PCI_EXT_CAP_DSN_SIZEOF (12),
which covers the 4-byte header plus the 8-byte serial.

SR-IOV: per the SR-IOV spec a PF's DSN applies to all of its VFs, and a
VF that implements the DSN capability must report the same value as its
PF.  vfio-pci exposes only the assigned device's own config space to the
guest, and neither the vconfig fill nor the vfio_ecap_init() walk applies
any VF-specific transform to the DSN bytes, so the DSN capability is
virtualized and scrubbed for a VF exactly as for a PF.  Therefore a VF
that implements DSN (whose value is the PF's host serial) is scrubbed,
and a VF that omits the capability (the spec-recommended case) exposes no
serial to scrub.

Variant drivers (mlx5-vfio-pci, hisi-acc-vfio-pci, nvgrace-gpu-vfio-pci,
virtio-vfio-pci, etc.) build on vfio-pci-core and share this config-space
path and perm_bits table, so the scrub applies to them as well.

The scrub is the default because a guest cannot rely on a meaningful DSN
through vfio-pci in general (it identifies the physical device, which
varies across assignment and migration). The following patch lets the VMM
present a chosen serial where a stable identity is required.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 39 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/pci_regs.h      |  5 +++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a10ed733f0e3..24dfeb43cb71 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -1085,6 +1085,31 @@ static int __init init_pci_ext_cap_pwr_perm(struct perm_bits *perm)
 	return 0;
 }
 
+/*
+ * The Device Serial Number is a unique, persistent, per-device identifier.
+ * Passing the physical serial number through to a guest leaks an identifier
+ * that can be used to fingerprint and correlate the host device across VMs
+ * and tenants.  Virtualize the whole capability so reads come from vconfig
+ * (which is scrubbed during init, see vfio_ecap_init()) instead of hardware,
+ * and disallow writes (the DSN is read-only hardware state anyway).
+ */
+static int __init init_pci_ext_cap_dsn_perm(struct perm_bits *perm)
+{
+	if (alloc_perm_bits(perm, pci_ext_cap_length[PCI_EXT_CAP_ID_DSN]))
+		return -ENOMEM;
+
+	/*
+	 * Virtualize the whole capability: the header (offset 0) plus the
+	 * two serial-number dwords (offsets 4 and 8).  All reads are then
+	 * served from vconfig (scrubbed in vfio_ecap_init()) rather than
+	 * hardware, and writes are denied since the DSN is read-only state.
+	 */
+	p_setd(perm, 0, ALL_VIRT, NO_WRITE);
+	p_setd(perm, 4, ALL_VIRT, NO_WRITE);
+	p_setd(perm, 8, ALL_VIRT, NO_WRITE);
+	return 0;
+}
+
 /*
  * Initialize the shared permission tables
  */
@@ -1100,6 +1125,7 @@ void vfio_pci_uninit_perm_bits(void)
 
 	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_ERR]);
 	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_PWR]);
+	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_DSN]);
 }
 
 int __init vfio_pci_init_perm_bits(void)
@@ -1120,6 +1146,7 @@ int __init vfio_pci_init_perm_bits(void)
 	/* Extended capabilities */
 	ret |= init_pci_ext_cap_err_perm(&ecap_perms[PCI_EXT_CAP_ID_ERR]);
 	ret |= init_pci_ext_cap_pwr_perm(&ecap_perms[PCI_EXT_CAP_ID_PWR]);
+	ret |= init_pci_ext_cap_dsn_perm(&ecap_perms[PCI_EXT_CAP_ID_DSN]);
 	ecap_perms[PCI_EXT_CAP_ID_VNDR].writefn = vfio_raw_config_write;
 	ecap_perms[PCI_EXT_CAP_ID_DVSEC].writefn = vfio_raw_config_write;
 
@@ -1702,6 +1729,18 @@ static int vfio_ecap_init(struct vfio_pci_core_device *vdev)
 		if (ret)
 			return ret;
 
+		/*
+		 * Scrub the physical Device Serial Number from the
+		 * virtualized config space so the guest cannot read the
+		 * host device's unique identifier.  The capability is fully
+		 * virtualized (see init_pci_ext_cap_dsn_perm()), so reads
+		 * return this scrubbed value rather than hardware.  The user
+		 * can present a chosen serial via VFIO_DEVICE_FEATURE_PCI_DSN.
+		 */
+		if (ecap == PCI_EXT_CAP_ID_DSN)
+			memset(&vdev->vconfig[epos + PCI_DSN_LOW_DW], 0,
+			       sizeof(__le64));
+
 		/*
 		 * If we're just using this capability to anchor the list,
 		 * hide the real ID.  Only count real ecaps.  XXX PCI spec
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index facaa324bd86..bd0ae9decc00 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -768,6 +768,11 @@
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
 
+/* Device Serial Number */
+#define PCI_DSN_CAP		0x00	/* Capability header */
+#define PCI_DSN_LOW_DW		0x04	/* Serial number, lower dword */
+#define PCI_DSN_HIGH_DW		0x08	/* Serial number, upper dword */
+
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	0x04	/* Uncorrectable Error Status */
 #define  PCI_ERR_UNC_UND	0x00000001	/* Undefined */

-- 
2.34.1

