Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AA9393DE2
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552751; cv=none; b=krsxGBx3uNb7Qrv5iXXi3gZcCKabh9w+O3Ytly77wOSKeL06PFrvtL4FYTpYvZFESmA7L6SJ0ar/s8JjkJgGkui4BbaLROet+DLZ59RakoZSYuYKVA5rNBCx3aoYtLsuaGuea3gZxf0fEbjy3MDEUgsMW39To1BIN3mSksx0gJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552751; c=relaxed/simple;
	bh=SmOTQqKM2LnpCQ3qkSaRlBgr0/qFWrnik4exoetb/7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pa6P2IYsfiRKgKKvta59SK0GvjJ7P9ir4nAWneG02QewGtoyIIRFiIfTlyPCX05qBcqg8xX3Tt/+ZheIQQieXeg4mPkWEI9x+K7itqT9loIj6As8kz9/HK4WF1It+dQu1ZmvsJ00yAWVGUcBMNXy3Gq9OPosHAcXX2zXBlROG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EUagIjY8; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EUagIjY8"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8484739a9cbso332621b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783552749; x=1784157549; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PJLZYL8Klt10jL9cmKv4PdQI9jiNSyhKsIaX7UVWLM=;
        b=EUagIjY8wDurME6GBW/n+iRYC/boIZK0U2FdN1YN10cY8/ZueRL1wcTvOcr6ZjxWke
         bhBcGifAxRsih3B71eSUWDj3Z2pbMksPjTZVSvm4imO3XnRjMEtJZ2vNofVVHX7u6Bx4
         zcjkBnqL1SW/uXTKJOsJibLzpHv5k0O60kMSgMFqtnuniaWf3ocx/h+QA1ku29S5m0q9
         xoeBRX1W8jw9+OdHsjePGLQIvv4WN8vkt8f9ZptdveSobkyv58BhhtwZUpNLsq36w8vv
         XFsqDXLLR3y27C6+csIOQLbvIpxy1VZwCNaK1i88/sUTOtolDnMHxmauaTK8ZnvXuOHg
         F2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552749; x=1784157549;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PJLZYL8Klt10jL9cmKv4PdQI9jiNSyhKsIaX7UVWLM=;
        b=YjmKOEN66MRdAvxAgBpqCe+1qvzQvZASzCkl7hzdnE1dkUXnRHCq1z3twYtcyUA1L9
         akar2ozE6SpJevCNBGbFHydRuM6DPAz8UsCLlDWuFe5ZMBYcwv5s3Rrwbm9TetTKmWwU
         PIcQWG7tKMS7uOcOoFKWAYuoQ8o/zw78P3HwqEslPgLua4hwyvIq6WTIPf2mTuIq1e+P
         KTsFJl2Jjw+h4UIGJ4w2vd6XeqyePHVVKUrcsZK8N8HURgQb1zY6ifVB16BG8NbAxmvu
         IcsupovgBfYTu2oFSyIVE7JrD6LGjtaeb5nnHBBC2jP+x/uAh6Nxs5oGom1leW/MIF6+
         pIeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZAHE343QLSoFPm9RYYRg4EYBNtkuLKxsGIKnHyKw5HSehJMgfZKoEiPrUFL/nODTSaPpLkEyZGtFRulW6QY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1jZcm5hehwc7SVc952Wc2ZJz0C7actK9Kin8VV9ivJVw8wRa
	WAnb5UdIh82VSENCoNOjEF3Cjf67Xh4ZUhC0k8YEtqg7XiVEEIYBEj2aKzp6ABP9u78FFFdKQDf
	WJGAkWQW8
X-Received: from pfbln8.prod.google.com ([2002:a05:6a00:3cc8:b0:848:48a0:41e6])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a87:b0:845:df5c:2567
 with SMTP id d2e1a72fcca58-8485ab611b4mr316027b3a.25.1783552748663; Wed, 08
 Jul 2026 16:19:08 -0700 (PDT)
Date: Wed, 08 Jul 2026 23:18:56 +0000
In-Reply-To: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260708-igb_v3_b4-v3-9-1272650ca614@google.com>
Subject: [PATCH v3 9/9] vfio: selftests: igb: Recover after DMA-read faults
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

From: Alex Williamson <alex.williamson@nvidia.com>

The mix_and_match test intentionally submits a TX descriptor with an
unmapped source IOVA so that the DMA read fails.  On real 82576
hardware the resulting fault leaves the descriptor engine unable to
service subsequent valid descriptors, so the next memcpy in the same
test iteration times out.

The 82576 datasheet (section 4.2.1.6.1) describes CTRL.RST as the
software mechanism to recover from a hung device.  Empirically
CTRL.RST alone is not sufficient in this state: the visible queue
registers are reinitialized, but the next valid memcpy still posts
descriptors without any TDH/TDT progress in the same process.  A
fresh device open after the failure works, which points to a reset
scope broader than CTRL.RST being required.  The 82576 advertises
PCIe FLR; VFIO_DEVICE_RESET drives FLR and supplies that scope while
preserving the selftest process and its DMA mappings.

Add igb_error_reset_and_reinit() implementing the recovery sequence:
issue VFIO_DEVICE_RESET, re-arm the kernel-side MSI-X trigger against
the still-valid eventfd via vfio_pci_irq_reenable() (this does not
touch the eventfd, which test fixtures may have cached), and
re-program the device via igb_hw_init().  FLR clears EICR and leaves
EIMS=0, so no explicit interrupt mask or cause writes are needed.
igb_hw_init() resets tx_tail/rx_tail to 0 and igb_memcpy_start() zeros
each descriptor before submission, so no ring memset is needed either.

Call this from igb_memcpy_wait() on completion timeout, preceded by a
10 ms delay so that PCIe/IOMMU/AER error handling triggered by the
just-observed DMA fault can release the device lock VFIO_DEVICE_RESET
contends for.  The delay is heuristic and tied to the fault path, so
it lives at the call site rather than inside the reset helper.  The
failed memcpy still returns -ETIMEDOUT; reset recovery only ensures
the next operation starts from a usable device state.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
Reviewed-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 45 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index 46207f018358..196905041338 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -432,6 +432,28 @@ static void igb_memcpy_start(struct vfio_pci_device *device, iova_t src,
 	igb_write32(igb, E1000_TDT(0), igb->tx_tail);
 }
 
+/*
+ * Reset the device via VFIO_DEVICE_RESET (PCIe FLR on the 82576) and
+ * re-program it.  VFIO_DEVICE_RESET tears down the kernel-side MSI-X
+ * trigger but leaves user-side eventfds intact, so re-arm the trigger
+ * via vfio_pci_irq_reenable() before reprogramming so any caller-cached
+ * eventfd remains valid.
+ *
+ * FLR clears device-side state to power-on reset values (datasheet
+ * 4.2.1.5.1: a PF FLR is "equivalent to a D0->D3->D0 transition"), so
+ * EIMS and EICR come back as 0 from their register-defined initial
+ * values, and igb_hw_init() resets tx_tail/rx_tail to 0.  The next
+ * igb_memcpy_start() will memset each descriptor it touches before
+ * submission, so no explicit IMC/EICR writes or ring memsets are
+ * needed here.
+ */
+static void igb_error_reset_and_reinit(struct vfio_pci_device *device)
+{
+	vfio_pci_device_reset(device);
+	vfio_pci_msix_reenable(device, MSIX_VECTOR, 1);
+	igb_hw_init(device);
+}
+
 static int igb_memcpy_wait(struct vfio_pci_device *device)
 {
 	struct igb *igb = to_igb_state(device);
@@ -466,7 +488,28 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
 
 	igb_irq_enable(igb);
 
-	return (status & 1) ? 0 : -ETIMEDOUT;
+	if (status & 1)
+		return 0;
+
+	/*
+	 * The descriptor never completed.  On real 82576 hardware this
+	 * typically follows a DMA-read fault from one of the intentional
+	 * unmapped-IOVA tests; the fault leaves the descriptor engine
+	 * unable to service subsequent valid descriptors.  CTRL.RST alone
+	 * reinitializes the queue registers but leaves the engine wedged
+	 * for the current process, so a broader VFIO_DEVICE_RESET (FLR)
+	 * is required.
+	 *
+	 * Delay before requesting reset so PCIe/IOMMU/AER error handling
+	 * triggered by the just-observed DMA fault can release the device
+	 * lock VFIO_DEVICE_RESET contends for.  The 10 ms value is
+	 * heuristic.  The current memcpy still fails with -ETIMEDOUT;
+	 * recovery only ensures the next memcpy starts from a usable state.
+	 */
+	usleep(10000);
+	igb_error_reset_and_reinit(device);
+
+	return -ETIMEDOUT;
 }
 
 static void igb_send_msi(struct vfio_pci_device *device)

-- 
2.55.0.795.g602f6c329a-goog

