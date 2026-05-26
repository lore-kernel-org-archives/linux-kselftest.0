Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A833E7BA0
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839705; cv=none; b=cXkbV0H5xhFc5Burv9RkvTXjKWEpjYQOeTwmS7iO6jq7S4d/4E4Vdtst1OcP6LrlFyk7YoJt8nM0kInWR6XrFKOLzxwVJmYi3YQD6UiVMuzFiindPS2jaRKEwU9mna861GCGY7rWHugeydz6OoODBOloO09lqJrBZqgj0v6spUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839705; c=relaxed/simple;
	bh=VQh9ycIq/sQw5zQ6MT1xTqUvZGeINgII+2poi1PGM74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QXGc7+mzLqBzPGMDYFgehHBcuKpX5QAxqpMNXA//43PewVBC+7LMYvJirKeQXKnB4A2xCoiuAvhiHjcFbWz2a3k8zRJ/Qt6f/BJSMvRLK44wRJgPfZCyAN1nmZ7gi89ShsSByXyfhyMP3aIOEJDYlTB/3X4zg0zH0wlckwsWigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8UJUi0R; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8UJUi0R"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b99eb06178so11931435ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779839687; x=1780444487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YppsghfGH6D340aJjNneB6gAMUs9CtxpsUi5k9VDxXY=;
        b=h8UJUi0Ru/muUsLXmZ+orfDCx2wEXYvLVgp5F4nH78rTraYscxeGuDc/LLYhMdeoQm
         Zxz2cpxZx50XqqqJc53lEUTQFlUhrOFaAF/Vz/jdvAPVRZqRMocHkZroUOKTy0B5X2b4
         xSZn7g2jniog3TAfTSy9/t4q+06yv7ZeA5DXfQPGgTFA/Hc9oP8hJjukCS0CtRTN68rp
         o10anZL8TvMsvwvRYLwqoqaFjLxLguC8pnG7law1JtZZNep9MMzx7rAkC2ID/XPdXv3i
         RgGQTAzRROugsP2wTY1A3F5I0pdTOpygImG2RuF8om63tZ6VQ4GewK/7Ngf5FSGDnhLF
         8JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839687; x=1780444487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YppsghfGH6D340aJjNneB6gAMUs9CtxpsUi5k9VDxXY=;
        b=JUSg8v7psqoAY5Jgv2UE67p4hrDvo3fmA1tbAFpNR6/NaMCVXeOUa2FsKjGQZf/jy6
         OK+Vziwg/aBbSJaqhMKDlyAvtbRQZ7Khr+85wfdc9zCHJ8SR26TxDC1SOdT9Nb2oa69S
         G8kQvVr3y3PIQzSlrCj9P0U/SpGe+FkWga9oMvTf7VIvUiXHrtm3ot/NwmoiDTiFJibI
         +JDHbzuJvuk8TLAnMAuJv/tR7OOjAdk7i7NoWQzGOKThWcrPIJeuHQvxjVwQPfMk5bju
         3JL6ReW1XqP29siC77kmZ4F4fJ+iq7O6+8M9t+8i6BGPcI96SnRhsqbcIAoGPulgSOwG
         YMLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zpZ49QBN2TviOjVYtiFhigh31OZ3Z9JSyYs4A+nY692LeLOpnIGAPdxJ0W6udHRUve3WAR46fKEu37zQWWL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRPTGc1LVmTiPjXjezQtf+u56k1yhMLVMfSHPncI+qcan8uQS
	cnlBuMnGoRVihMXqxGuUfD1/GwWdWnHSkiSF/zYDmCrK9Tz45lEnHZT07LIuEG1/fJu9xO8yGGn
	/xU6sCV94
X-Received: from pgbbk8.prod.google.com ([2002:a05:6a02:288:b0:c82:cd84:79d])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c9:b0:2bd:5ab:af95
 with SMTP id d9443c01a7336-2beb023584amr217494565ad.0.1779839686876; Tue, 26
 May 2026 16:54:46 -0700 (PDT)
Date: Tue, 26 May 2026 23:54:12 +0000
In-Reply-To: <20260526235417.2058313-1-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526235417.2058313-1-jrhilke@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526235417.2058313-6-jrhilke@google.com>
Subject: [PATCH v2 05/10] selftests/vfio: igb: Extend memcpy completion
 timeout for line-rate hardware
From: Josh Hilke <jrhilke@google.com>
To: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

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
 .../testing/selftests/vfio/lib/drivers/igb/igb.c  | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index a8f2072b6820..879c21780f5b 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -403,11 +403,22 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
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
 		if (rx->wb.status_error & 1)
 			break;
-		usleep(10);
+		usleep(1000);
 	}
 
 	igb_irq_clear(igb);
-- 
2.54.0.794.g4f17f83d09-goog

