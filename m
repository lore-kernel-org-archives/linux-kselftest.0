Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896913403F7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721217; cv=none; b=SwU4QbZoYpCDBPa5RBz0RG9m2hrtX949udiCUmF3IcJYJS4RrU9Hiy9VmNRPr3zCP2q4pJeJ9ZbWaCNUVdIybGroC0G2l3EDD0/1LvbTYwxk6wsw6D+xJARLZY6rfVNOlmu60NZNizMTpI0oyfXuAKdAL+jwCOkLh4uFTbDjUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721217; c=relaxed/simple;
	bh=Rsta8vLB8hK9R4p5vcxEA3vQvmZfrYl7dCQRQrmn55g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=avCqwBU2GtQZWD4wwre23BQCelAGQJ1xCc54rA0qsHq7qiwUOwzQBLaXnB5RfwU4/SskvoWFzNkFE7Em6tvAtV6CCXPt4otWK+jU0Sni8HACUxrg39w+jpIDemWsJP74ZrRjoAZA0IgkLkYsP7tA+xCNecIa8ysFMAr+joyW9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QXyu9J44; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QXyu9J44"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so24112595ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721211; x=1784326011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1VBUyR4cccUA9/1mGNxW9MUPChjoTBoxCQDwJfrrNQ=;
        b=QXyu9J44fHlX0PE1NKW2KnlNCAmgpz83UjU2oA920k5nlzJTg5Glwa5JnMVL8Qbs34
         HrGGGmALXjTtyYSY0eb5Y+fzLxLkuOdqgJTns1p0S35qzxjiFyK0tR5jqwB4zC7ULkmW
         oOyOVQ+gD+v6gMcgytV/JTmkaSbIdlhC8phrUXHWvNu5hzfddA87S4OtNARkoCBT8x3o
         r/3GvZ2lAway7coVbybIkTWXAwdZHPHYqovmY1W0HTnqJNh7L++bScQDvJ3qNP2upOT1
         CZqj6WK8P5+dMEYTlbXHCGBC92S38HknoHcfb5ITojZ8RccTWVnPMpxzy6k4vKddcyIc
         Od/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721211; x=1784326011;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1VBUyR4cccUA9/1mGNxW9MUPChjoTBoxCQDwJfrrNQ=;
        b=kWfDyfv5a4IZx7y7WiBIArPCr3Y2GAa4DmmU5F9Fxfl03mECU4esuksC11BArFtbWw
         Xnk8kQo9j8sMX1aoroNrzbAhZhhp8E1rLvV2wKq6GoUX0tgiHAZ0sUbCSD+yEfM9PaTI
         ku0QQd/7mijFm9ZVQjl39nnBgeoiVsdhAlTqlb+NFuIKsXI2pimOw80IY050Izoq3A+r
         bhKfm6jFCXthZZTZftdynndzkpH2df8qtMPlVjgxXJu4mpZmX4zwsIpTcyLWUzRBj8er
         FUzQ0aLXyvjux1kvMoNNxW6p2Cui3zaB6yefI6/AE5k4Xh38Pxn/w34e8ePhn8Ro9FE7
         ndaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXieoZyaDOte0/rsilsNuS1LZM7kS/g/JwdIwb3W27+mZYcCZ+QnXXtOF3mJsJTWwzfGRMuzBEQ2MMUCdwM5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiH35qki12j9eEKWeFMRyykKYw12p9fcVQfCOoG3Xt1nukXNS+
	pu88L3pSH7agiq9jUzW5s01XwnXADMKlwAhO9xqpwmOGE8YzAPnZ/DvIc4kIPDsZFJFUpmCHs23
	j3lXjcgbz
X-Received: from plnm6.prod.google.com ([2002:a17:902:fda6:b0:2ca:b48c:5a92])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2410:b0:2c9:e6d7:fbb4
 with SMTP id d9443c01a7336-2ce9ee163e3mr7804965ad.31.1783721211262; Fri, 10
 Jul 2026 15:06:51 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:06:47 +0000
In-Reply-To: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721208; l=4221;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=+v4iP4weLlHAsUthkQ6zLzOJqWm3vZ17kiKiO993AlY=; b=JMgox1Ej3OO54RInUmySHh8kP6O6ci8pddhJ52t3tQadEOkoVJkI/pX5MXcCqzgtSGqtlLYwK
 gqXG52xG7+ACKoFiR8QIgofX/LJtDhI7r9R3N66iMtOxigNlvXX5NL1
X-Mailer: b4 0.14.3
Message-ID: <20260710-igb_v3_b4-v4-3-56e7e2576cc1@google.com>
Subject: [PATCH v4 3/9] vfio: selftests: igb: Use advanced TX and RX descriptors
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

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 42 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index cccaedf86e32..033997ad45e0 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -246,6 +246,22 @@ static void igb_init(struct vfio_pci_device *device)
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
+	 *
+	 * The direct write also zeroes SRRCTL.BSIZEPACKET, which is
+	 * intentional: per section 7.1.3.1 a zero BSIZEPACKET falls back to
+	 * the RCTL.BSIZE buffer size, whose reset default (00b) is 2048
+	 * bytes -- ample for the loopback frames here.
+	 */
+	igb_write32(igb, E1000_SRRCTL(0), E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);
+
 	igb_write32(igb, E1000_RXDCTL(0), E1000_RXDCTL_QUEUE_ENABLE);
 
 	/* Wait for TX and RX queues to be enabled */
@@ -341,11 +357,29 @@ static void igb_memcpy_start(struct vfio_pci_device *device, iova_t src,
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

