Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB13C1992
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721222; cv=none; b=LppK+mlTAB3+xwNeVIUJPX/lZ56W2sgiXy1uc6auLljNMKQUFOd+BryJM39WtdIvpB3IimMw5uNND0Br9MylieIMQn0ebqNoyGK9Ay30ovwXtTPEOFPwQNyGCR4mo2waw3X3g9qZ/nzsi+8M36DOmSacz/2Sfz3PnOgvYew/fQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721222; c=relaxed/simple;
	bh=SXAt81smYsMjpJ1Hk7xiJa+jsCj2BWcuvU8qe14+cQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cPyNuvgYgveL0AV1XXXwAfWLejRkEM2NKFBAyKrE/5aAKHMtqWm017BjBleLGHgvURfMVrLaY63ndSj+2uaw8fFwCm9fg+AyZXoCKFCD5cRBGzEcJjBU4RkN3C0UGgclOTtCcQG0BT+GLMwBJTlIQkySnxuHgTzfUrh+TRdteAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vC1FtfGL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vC1FtfGL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c89704da8c7so2057400a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721214; x=1784326014; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAmPzMMi8nVYfxKQwUu5xyjvBwQx6jMp227xZZBxUtM=;
        b=vC1FtfGLUwbhp16EFnYEuFujOOJk3ebo6xbvo2i+0S8l+izjINWLGhvJUUB+806h/T
         hKVMll+uG9pYW1pRUmA8bUXtE2l57ltL2HZxusTR8Vtz5J9ZpSsjoT/unTAr88c/72qa
         xHaLuOYZan5bHXXw5HU+TM80xIxHmZEgCSaitBWwpTPvzwUXiuZPifdpTOPGoXe8U2Il
         bmaL/N8MpQl73zgRt+K1t9PURzGWgeXXVi/+76pnMyABClJFgph/zIUlNaarekEiwTSu
         aKj/lnymceqja07Z0Upu3oC4SmwrTGZp7lyOw/bsYrYszDcrcM3iTjVDNeEpEewuF7+D
         XmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721214; x=1784326014;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAmPzMMi8nVYfxKQwUu5xyjvBwQx6jMp227xZZBxUtM=;
        b=sOCQFO7enPr2QmBj4a3rUCwRGb2cEab67LUdTqTHCbnsaxyoK2eKY7l6+O/YIm1ceH
         8OWBUxVn8vP+MjjC5JQsDXdiBkWds75aorLeuBcpTX3H6EW9PAAdTb5fKCz+eHq/blsr
         YTvK824OqGBdZUMByGyG0UyDUdYKEEhB57213Do2pH+LeheAAs3WmtdDRUYlgUC2anwI
         htTCNVVx2ZijifRU3Kb2nYmbUDi7P8Ws+RC6j8TyVox9mbpDtVFibY5+JP2nEHMUBOgF
         azx4jvgixtfh4ZqDdjVOs+MLElYRKA0DkEmKCyMw1xRI73UrowxMU3T2foK9eRTYTKRC
         PM6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoO4jfzjk9qcFQtcA4bOgFd07mveLoNOZFXDPUsyz7oNoITMnJFtE44dF4ZHxOVMaVoN03V9n9Tj/nV5CH1knc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX54K0z2SBGInfLAAszgZ5HrFVOMvcG/RgB+4hiC0oaBvuyoX6
	BUDM+wqgTQNiVMUCJxTUE7p5fVFJVBuCKyn6DSDxoiNMZFc6+zJjnGcOCTh7dg/9AYXPY6aCtGY
	IB4Vvnyqw
X-Received: from pjnu12.prod.google.com ([2002:a17:90a:890c:b0:382:a16a:19ad])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a4b:b0:37f:e8d6:72c0
 with SMTP id 98e67ed59e1d1-38dc73c3657mr700004a91.1.1783721213576; Fri, 10
 Jul 2026 15:06:53 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:06:49 +0000
In-Reply-To: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721208; l=2461;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=r1Tao9/LBmC1l3hkg5OeTapQHKhzjrz5/X4dLEtJza0=; b=9gpQVJ3/qOt3GGhj675mIHg27FlGJA4S2fNW+p4SxmalDB4d4r2lKHsONY5BHCeBbGxPk8w4k
 kNfZT5M7w1PBErVq3bvZbp69PBaA1r+RY/hPMR/Voqv0CTweFx6D1/L
X-Mailer: b4 0.14.3
Message-ID: <20260710-igb_v3_b4-v4-5-56e7e2576cc1@google.com>
Subject: [PATCH v4 5/9] vfio: selftests: igb: Extend memcpy completion timeout
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
index cd51a72b0e7f..172c95cea3c8 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -428,12 +428,23 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
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
 
 	if (status & 1)

-- 
2.55.0.795.g602f6c329a-goog

