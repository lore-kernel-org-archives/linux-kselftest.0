Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014D39A805
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552746; cv=none; b=bHuRSrJ+8gaOWK+NPNSZEeQBQWVvCZu8FGJQwMg31hejNnJN4165Doovo2jwipXCerCQX9fXAO/MFNWXeE7eDBB42wjKIAUffBijj2EOPNvWucIR9AWHLC1Mdbt0n3vKNoqiZRZ64orTQxFkW10pB/C5bOmIOIqakUP+o0SSvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552746; c=relaxed/simple;
	bh=Asrc2jqLWZ8McUsNCl8V+brf3DaScqJp6GiYRksFOaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KR28GzuMmc+tAqwT9UkN0RYVvvjx7TafVxk36PsfNBV6Iw2xKHYUaOpnmscF/lbDrcUg6/SDRP5u3DAyS1jSKczCfBguQruo/FSvztT6ROlydwhcL+1WcsPC/UnC/rydtezUKnQ2z02+e8+WRIFWndxaBRPIcIW6Fo/CQLu1qjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EjwnSatQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EjwnSatQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1251679a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783552744; x=1784157544; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpna3TQ6YosBT2JOPlPkJdlqdBE0UdDtIn99NEOpE50=;
        b=EjwnSatQHkj2A7sy+jEbTM/pC08a2pWtAdU7a3iEi75NS63Gh41T2Lj0GaIjBZfosW
         hFLWBNv00ChPHNrZIzhRGT0RVnaysdI3+ND++yLHlNncUSktqkcyrJk7uB8uFTSs4egE
         0c7dLgK30S0Elp9LcDF8OnbEZcyhRlLYjyqunuH6a5pkLFsaazJsEVqbuVFEHrUyIOQR
         dxGZwS+rg7UvbUTZX2lXJ2xqbvf3ORjlg3X9s/cXOONzBt7TQFCI+3MwnZcdHFYC5o9f
         xvzw6W1dLNbyOWdMlN1vbWHvoMTafHhzOf7jqHU44Yi6ZAXLDo4dgOG2M1TfiG/HZ0Xt
         G7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552744; x=1784157544;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpna3TQ6YosBT2JOPlPkJdlqdBE0UdDtIn99NEOpE50=;
        b=mIocxOt4Fz1QUSomwLZXbb51O1TWSsmz+I2bGa1SHfbIEZEWwWyu3FHcItEnqG+0SB
         spiZ7C3DYUfuH1/wCmhA/ZWiY6mOmJ11s1Od0GLnGhYKqzWHFUuG42Qdvpbpjw+v5vDJ
         dL0rgACIrZ9vILWX8L2ZsXWhN6PEhw57D8aU/uBb9V7joAuPWi4AOXGtTTDft2HG+O2t
         x98MLkIfvB0EvmPUYeyrFX+60dBQUfpbyROHSw3zv7Dz4SxrRpy4Ph74AhakyXdp2gic
         PaTLIln9i6QBRya49jXrz1bAbypvTnYzRIyEtFkSlnsgjZEFyjMT+IqHuCbF+w2fFWUR
         ixDg==
X-Forwarded-Encrypted: i=1; AHgh+RpX6q2/2SGbyhwxDnFtzmf6g9C0ugGnnS4xXgnPg0GqRFgG3cFGwt9rkzNuOOV4gpjZWlY/2d0AGCQMpQ/AuEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWynAg8gxqbJNt+3TJ1zbTliwjScj7qn9W2gOJasj1SHpAJlnK
	rSEyr8OlIZCT2IBxxMoFdcX4gct5lWoXE3EOB8fq/6mRzEhvIeHKC92yJwChdUvVJpxBCuh/oIX
	tYmgNg/4v
X-Received: from pgjf11.prod.google.com ([2002:a63:dc4b:0:b0:c9a:53ea:434a])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a394:b0:3bf:6c04:a812
 with SMTP id adf61e73a8af0-3c0bd159be5mr6111912637.51.1783552744017; Wed, 08
 Jul 2026 16:19:04 -0700 (PDT)
Date: Wed, 08 Jul 2026 23:18:52 +0000
In-Reply-To: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260708-igb_v3_b4-v3-5-1272650ca614@google.com>
Subject: [PATCH v3 5/9] vfio: selftests: igb: Extend memcpy completion timeout
 for line-rate hardware
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

From: Alex Williamson <alex.williamson@nvidia.com>

The submitted driver waits at most 1 ms (100 * 10 us) for the last RX
descriptor to be written back.  QEMU's emulated loopback is synchronous:
by the time igb_memcpy_wait() runs, the receive descriptors are already
written back.  Real 82576 hardware processes the descriptor ring at
line rate.

max_memcpy_size is (RING_SIZE - 1) * IGB_MAX_CHUNK_SIZE, approximately
4 MB, split into 4095 1 KB frames.  At 1 Gb/s line rate (~125 MB/s),
4 MB takes ~32 ms on the wire, plus per-frame preamble, SFD,
inter-frame gap and FCS overhead (~3%) and descriptor fetch/writeback
latency.  The 1 ms cap times out long before any valid transfer can
complete.

Wait up to ~200 ms (200 iterations * 1 ms) for descriptor writeback
before returning -ETIMEDOUT.  ~6x the line-rate floor leaves comfortable
headroom for host scheduling jitter while keeping the intentional
invalid-DMA tests (mix_and_match) so they recover quickly on real faults.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index 637d05e872de..1848be6cd46c 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -412,12 +412,23 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
 	prev_tail = (igb->rx_tail + RING_SIZE - 1) % RING_SIZE;
 	rx = &igb->rx_ring[prev_tail];
 
-	retries = 100;
+	/*
+	 * Real 82576 hardware processes the descriptor ring at line rate.
+	 * max_memcpy_size = (RING_SIZE - 1) * IGB_MAX_CHUNK_SIZE ~= 4 MB,
+	 * split into 4095 1 KB frames.  At 1 Gb/s (~125 MB/s) the worst
+	 * valid memcpy takes ~32 ms on the wire, plus per-frame preamble,
+	 * SFD, IFG and FCS overhead (~3%) and descriptor fetch/writeback
+	 * latency.  Wait up to ~200 ms before declaring the device hung;
+	 * ~6x the line-rate floor leaves comfortable headroom for host
+	 * scheduling jitter while keeping the intentional invalid-DMA
+	 * tests bounded.
+	 */
+	retries = 200;
 	while (retries-- > 0) {
 		status = le32_to_cpu(READ_ONCE(rx->wb.status_error));
 		if (status & 1)
 			break;
-		usleep(10);
+		usleep(1000);
 	}
 
 	igb_irq_clear(igb);

-- 
2.55.0.795.g602f6c329a-goog

