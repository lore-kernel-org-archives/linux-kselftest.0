Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FF3E8C49
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839711; cv=none; b=V6+7qqEF+ZIgFDrDnSDIviE5AUPJ8ns4OESeNY7Z9StPyF4UYHKe2EBauL9mMroXrAbPxanQMxkUiUhWgw/lwYqy6ZVfxd2Sc7yAsSV9K19RNe8RZsiK5voXX+Kr877MlDmGeF33Yn/Np1VJKHyzPg0CC67jHI48CzOF0q62s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839711; c=relaxed/simple;
	bh=CkH0Vzpqcgvxa7Y2LQJUZJmUrJFwjbVNSoXMV7tcqZE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zy0cUmI6hBLTdz758N4U1ph+Tl3EY3044XXZhc0ddZO0696y7bReB7ky9DMaiIw9JZB2moekJaqinemlkCR2KDY6vGb4TBzJK+oTlhWOvEjps+15HYBtnIB/29HeqsF0HB/6qqqZj+mnM7Mvod/449NtUQuBpuBCPBRLoNY13RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EHms+Axk; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EHms+Axk"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6525810b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 16:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779839689; x=1780444489; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W0Hu/D8rAuWKbGc4lHoFkn5GJfHnwhou62SLjESXk+s=;
        b=EHms+Axkefp8PwSTahgdtD2/Sisow1YdDbwPFldOw1JaAOZe6OILHgqMiAx2UiS1Z6
         Qe2cr9VG6d2ayLtpZjMVdmmQPRkBpcdptEEmwrnBZxL2wpvKrIsZhcHr3JN9j6uRHj/V
         g3iLtT3Cm98vhM1R+9G8O2E//zWCtNwDSLs+saijUrRq46xD9EqhpPsRdOXTDi1Q85UC
         D9PlRs1r1Rqjqiwcac5cktHVXoXwzVSrZNTcupgntUB5IMT7jWDRYtStCzkc7GNszs55
         8qiDoO4EMVh6YI5uFfuLNflxqdr+psbOSAoT36T6nCrdFUfdPwc2sn0exV+yPUQ8tkMV
         duIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839689; x=1780444489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0Hu/D8rAuWKbGc4lHoFkn5GJfHnwhou62SLjESXk+s=;
        b=fFV6WtINAe4AZdNHlWpYz8BzeWjw4XC0ouJqcYixsMSJkvevJ5BbYaGDij+ONu7hVY
         rBp3a13ICNMUsUYACpsPyEVM//xKhhg3JiX8+N/bIDbnbeJ5pMjyHMo7Au2hgcbfwtyu
         qnAbGdQ1hKJML/J7mrADTpaHoEpC7TMHgHjY5bdA0LoR6nrH9GfMm61V1AMhU8LbVlgp
         bnDa+C1WSg4f8pzJvzMKvXSfq/hnYZWIP+SVSho4NrWK1rK1cEbxEdZ6Y1TGH0uXjq0K
         Uvt271KqaW6vZEuOgMuJB7RNke9rGTtf7m0+OU5LoFg7HPD3u5HLXsGLydtZKN45mvy/
         7M3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vXggQW/HLqy31F5obgiTEKsVAEpErd/W2D4GheMVo2UqP1zfCOk1qcb2FHTS1nr1L+4URWhfNuNHRg9aOEpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6P7JOscGdeJPlUOS0U3XoxL2X8rFb+T0+pU5cjp9tH2RzK1m/
	kEPEI00nG72OEDGLOC8f4LKlzoWwjjGf6/rnWWtjz3XipsjSzipbWrjZqswOKo38NiM7zyootWE
	t8c3Za3uZ
X-Received: from pfblu13.prod.google.com ([2002:a05:6a00:748d:b0:82f:ad57:40bb])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22c6:b0:836:900e:8743
 with SMTP id d2e1a72fcca58-8415f35d58amr21464806b3a.36.1779839688895; Tue, 26
 May 2026 16:54:48 -0700 (PDT)
Date: Tue, 26 May 2026 23:54:13 +0000
In-Reply-To: <20260526235417.2058313-1-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526235417.2058313-1-jrhilke@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526235417.2058313-7-jrhilke@google.com>
Subject: [PATCH v2 06/10] selftests/vfio: igb: Disable PCIe completion timeout retries
From: Josh Hilke <jrhilke@google.com>
To: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

From: Alex Williamson <alex.williamson@nvidia.com>

The mix_and_match test intentionally submits TX descriptors with an
unmapped source IOVA so that the DMA read fails.  By default the 82576
re-sends the request after a PCIe completion timeout (datasheet section
8.6.1, GCR.Completion_Timeout_Resend, bit 16, initial value 1b).  On
real hardware this turns a single fault into a stream of retried reads,
keeping PCIe AER and IOMMU error handling busy and interfering with
reset recovery.

Clear GCR.Completion_Timeout_Resend during device initialization so a
failed read fails once and stays failed.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c   | 12 ++++++++++++
 .../selftests/vfio/lib/drivers/igb/registers.h       |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index 879c21780f5b..89537f8345d1 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -209,6 +209,18 @@ static void igb_init(struct vfio_pci_device *device)
 		vfio_pci_config_writew(device, PCI_COMMAND, cmd_reg);
 	}
 
+	/*
+	 * Disable DMA re-send on PCIe completion timeout (82576 datasheet
+	 * section 8.6.1, GCR.Completion_Timeout_Resend, bit 16).  The
+	 * mix_and_match test intentionally submits descriptors targeting
+	 * unmapped IOVAs; with the default (set) value, the device keeps
+	 * retrying the failed read indefinitely, which keeps PCIe AER and
+	 * IOMMU error handling busy and interferes with reset recovery.
+	 */
+	ctrl = igb_read32(igb, IGB_GCR);
+	ctrl &= ~IGB_GCR_CMPL_TMOUT_RESEND;
+	igb_write32(igb, IGB_GCR, ctrl);
+
 	/* Configure PHY internal loopback for testing. */
 	if (igb_setup_loopback(igb))
 		return;
diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/registers.h b/tools/testing/selftests/vfio/lib/drivers/igb/registers.h
index a133a208ed08..3f04bcaa44ba 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/registers.h
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/registers.h
@@ -73,6 +73,8 @@
 
 #define IGB_RAH0 0x05404 /* Receive Address High 0 */
 #define IGB_VMOLR0 0x05AD0 /* VM Offload Layout Register 0 */
+#define IGB_GCR 0x05B00 /* PCIe Control */
+#define IGB_GCR_CMPL_TMOUT_RESEND BIT(16) /* Re-send on completion timeout */
 
 #define IGB_VMOLR_LPE 0x00010000 /* Long Packet Enable */
 #define IGB_VMOLR_BAM 0x08000000 /* Broadcast Accept Mode */
-- 
2.54.0.794.g4f17f83d09-goog

