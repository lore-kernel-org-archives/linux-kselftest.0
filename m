Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736C3A6F1A
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552745; cv=none; b=nt5G+vLhvTg07iqvU/UlqBWTUffyJJkew5gNLefQTZ+/ifEhSI/pbjFrCcuQHMWOaqk3SgPmHT8RaVJyRKZgr7uacoL6Be+fdeaAnIrt1Ki46bbNZ4J7u08/AQ0npmGs2VKb7uKoPu07rGMD9FT9bXK4+sZ/NA7m9okBzew37rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552745; c=relaxed/simple;
	bh=2tY+76ukECworN4wCu9OxDM17aGgI9A188pLFTqTnxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N3SdTQbnSjLRO8+PPHOcAOpE2bBZHLs19cLMJas5xOvJ0/XG4lmI7QZCYKH6D33ghTFrrTGLMK8A0glwPjgv9XdlcmrVUpwzTZAqVYb+BEzA7//r7wMNXJewem5CnsOQOXGanm4cORzx8EizvsJjU780+/TCfeMmGIo7Tf/Ykvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qzP683QS; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qzP683QS"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-84842381150so425299b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783552742; x=1784157542; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8I6UE+Eb+CqubsAJ6tNuCjG0jnUp8oSU5c+H+yk2pI=;
        b=qzP683QS0wRktcBz4c1JZH9zkv9aGMWIYcEde55I0ZUZ5qc3+x6Aaw8hq6g3Aai7o5
         kpzRfdt8e5ywVi+ZDc3yMvHpjmz00xCKnOvW/NDpgvgiOoD7PpJyYHode+DpZYXLwxO9
         qHMf9LSRqx75FPIInLcEasRvDezZlIz7qWKmj4kVS2/KrCuAli66nagNhhKyJ7jYRCAI
         lg5ro8BgUVbLcin/B/8/JImI19ZhZG/iiefKMG4cRARlXM6Mv3OnmLHqOIU0Q+muXkX5
         z5+KyAkI4Q4LFatprg1mcDo+wHppHRp4reaqd4bfSO2d/B0NmU1qHTcy4kscTGM2RwsA
         InkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552742; x=1784157542;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8I6UE+Eb+CqubsAJ6tNuCjG0jnUp8oSU5c+H+yk2pI=;
        b=L35bR8U5igGagQMtStLrsOvWrEsBm7lT3myIq5zCNGkVhdXlibvHFgN4WdZFvf87z7
         U0mDFKAsEl9H0JxDU1xs+aK23HK7dbkrOC2UKDGmRWYkEBVdK/0BfOVQoreiJbUdbCj8
         t7hTlRpvhVW2ATcDm9i53B/Yo+J9PtJgFUS2L5EQzz7jPjuSUCKsitM5n5v7rf/x0dP0
         7OEGwvhx4xw7y3PiHKiv60IR55EWK+w1UV0V7sji+6wKVv2cQR5AERy0UiYuiFYk7/zj
         +umUDzZ8VR9csX9eq7kbv9mVVMopBrOnChxPoBDAGYvgblFqfvbeUrQ4y6zna107f7QV
         9BmA==
X-Forwarded-Encrypted: i=1; AHgh+RoWO59k2Cj3iRJaEo9uA4Pd7dXoiZG5ynpTi/eM/F6YI9MwhEXsi8sF1DyWS7WYo05kRiMng1DUkOgzzUy7gsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEi5ubTeOIIrCUNYhjmozdI62dBf4+PXcfsDXxXsp0Eo485LiD
	ZwBFjphT/Kx7SMi13fvBmH9xQme7s/q/Cl9FUxotRl6KLrVbZCceL/BMfNrlqneSo42uqbd1BNf
	Z2b23BdRz
X-Received: from pfbmc20.prod.google.com ([2002:a05:6a00:7694:b0:846:3c78:e2e8])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:448b:b0:847:834d:b6a6
 with SMTP id d2e1a72fcca58-84842fff014mr4796021b3a.62.1783552742305; Wed, 08
 Jul 2026 16:19:02 -0700 (PDT)
Date: Wed, 08 Jul 2026 23:18:50 +0000
In-Reply-To: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260708-igb_v3_b4-v3-3-1272650ca614@google.com>
Subject: [PATCH v3 3/9] vfio: selftests: igb: Use advanced TX and RX descriptors
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

From: Alex Williamson <alex.williamson@nvidia.com>

The submitted driver builds a partial legacy TX descriptor (just
DTALEN | CMD_EOP) and never programs SRRCTL.DESCTYPE.  QEMU's emulated
igb tolerates this by treating descriptors as advanced regardless of
DESCTYPE, but real 82576 hardware does not.

For receive, 82576 datasheet section 7.1.5.2 states: "SRRCTL[n].DESCTYPE
must be set to a value other than 000b for the 82576 to write back the
special descriptors."  struct igb_rx_desc matches the advanced
one-buffer writeback layout, so the test polls rx.wb.status_error,
which is only written in that layout.  Section 8.10.2 places DESCTYPE
in SRRCTL bits 27:25; program it with 001b (advanced one-buffer).

For transmit, datasheet section 7.2.2.3 describes the advanced data
descriptor with DEXT (DCMD bit 5) marking the descriptor as advanced,
DTYP=0011b selecting the data descriptor, IFCS (DCMD bit 1) asking the
MAC to append the Ethernet FCS (without it the frame is dropped as
malformed), EOP (DCMD bit 0) marking end of packet, and PAYLEN in
olinfo_status[31:14] carrying the total payload size.  Build this
descriptor in igb_memcpy_start().

Remove the legacy CMD macros (IGB_TXD_CMD_EOP, IGB_TXD_CMD_IFCS,
IGB_TXD_CMD_RS, IGB_TXD_CMD_SHIFT, IGB_TXD_CMD_LEGACY_FORMAT) that
become unused, and add the SRRCTL register offset, DESCTYPE encoding,
and advanced TX descriptor field macros.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index 58c6aceea63a..f4f6d2ee262d 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -235,6 +235,17 @@ static void igb_init(struct vfio_pci_device *device)
 	igb_write32(igb, E1000_RDLEN(0), RING_SIZE * sizeof(struct igb_rx_desc));
 	igb_write32(igb, E1000_RDH(0), 0);
 	igb_write32(igb, E1000_RDT(0), 0);
+
+	/*
+	 * Select the advanced one-buffer descriptor format.  Per 82576
+	 * datasheet section 7.1.5.2: "SRRCTL[n].DESCTYPE must be set to a
+	 * value other than 000b for the 82576 to write back the special
+	 * descriptors."  struct igb_rx_desc matches the advanced one-buffer
+	 * writeback layout (section 7.1.5.2), so polling rx.wb.status_error
+	 * requires this format.  Section 8.10.2 specifies DESCTYPE[27:25].
+	 */
+	igb_write32(igb, E1000_SRRCTL(0), E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);
+
 	igb_write32(igb, E1000_RXDCTL(0), E1000_RXDCTL_QUEUE_ENABLE);
 
 	/* Wait for TX and RX queues to be enabled */
@@ -330,11 +341,29 @@ static void igb_memcpy_start(struct vfio_pci_device *device, iova_t src,
 		memset(rx, 0, sizeof(struct igb_rx_desc));
 
 		rx->read.pkt_addr = cpu_to_le64(dst);
-		tx->read.buffer_addr = cpu_to_le64(src);
-		tx->read.cmd_type_len = cpu_to_le32((u32)size | E1000_TXD_CMD_EOP | E1000_TXD_CMD_IFCS);
+		rx->read.hdr_addr = cpu_to_le64(0);
 
-		/* Set to 0 to disable offloads and avoid needing a context descriptor */
-		tx->read.olinfo_status = cpu_to_le32(0);
+		tx->read.buffer_addr = cpu_to_le64(src);
+		/*
+		 * Build an advanced data descriptor per 82576 datasheet
+		 * section 7.2.2.3.  DEXT marks the descriptor as advanced
+		 * (required by hardware); DTYP=data selects the data
+		 * descriptor; IFCS asks the MAC to append the Ethernet
+		 * FCS (without it the frame is dropped as malformed);
+		 * EOP marks end of packet.  DTALEN is the buffer length
+		 * in bits 15:0 of cmd_type_len.
+		 */
+		tx->read.cmd_type_len = cpu_to_le32((uint32_t)size |
+			E1000_ADVTXD_DTYP_DATA |
+			E1000_ADVTXD_DCMD_DEXT |
+			E1000_ADVTXD_DCMD_IFCS |
+			E1000_ADVTXD_DCMD_EOP);
+		/*
+		 * PAYLEN (section 7.2.2.3.11) is the total payload size
+		 * in olinfo_status[31:14].
+		 */
+		tx->read.olinfo_status =
+			cpu_to_le32((uint32_t)size << E1000_ADVTXD_PAYLEN_SHIFT);
 
 		igb->tx_tail = (igb->tx_tail + 1) % RING_SIZE;
 		igb->rx_tail = (igb->rx_tail + 1) % RING_SIZE;

-- 
2.55.0.795.g602f6c329a-goog

