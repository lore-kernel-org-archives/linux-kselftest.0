Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114345;
	b=E5qLJ3shbUxbWyEfNdsOoVlv/rnmzRlHLu5LcbP+AtRZ63Y/f6G2z3M6FivF0oHzKBL0
	 rpTiop4pyAtplWWMJKHHXpJtVfcGsxhd7mW/TA7wslI2bp22mEnoWfXVDfa19mOAOyxeA
	 TXKxwWtJgc5ihx3OS5Q+xPh0BfKOQFf6U1CPIB6a4RJJWAMyFjveS/2l/XaaPNuhtQ4OE
	 JxFXiG8sTxl1YuUHr2dZH4x9acRv22VzeyiIlkgXINRqT94NM84ys0x/hovezTzJgb2+L
	 bAxludD4eNpj1bNJoU9QQbjFAGua/B98u6j2YBrV9gcBdbJwwVFlR7aOg+wZsh0I1xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=;
	b=lMjSN5EdR/+hgo3P/UjToAFjWtuUC8LhN8zG44WBiIFqiPCZYUF6Yy5NFIKZykKxA3tp
	 CSpUt42/BfNqBEyEg4MDmNsYGicFcsM929t1joHUSWYgBO4IEbL0ZkkP2daZsgvpzvBDv
	 Ir5Ph/2UHd5gV11uUXr62YC5AXxdJ3+JScZIsJBPSy9nT78kDKLVKZMcXk6mDNydU8Gws
	 SInPNjf7ypnEoryFFWpF7nxdK9z+vh95GnS2Jw2O+zT4T8AcRd8AYWN3Fqqvlc3fqVTyK
	 Zf6OU6xKSiILO0OAItlF1A8PiolQSRsGrFc/sBXKKqKseT3wB8aNg/ACa6Ftm//nUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mYp484Dp;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B960A6F5E
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39B960A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mYp484Dp
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso248114b6e.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114344; x=1795719144; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=;
        b=mYp484DpEeY/oHUMCOm9sqI0dW4VUQHG54G3nL6EO4NCkXEhChV94ldh9u6cCjxQRP
         Z2vtxQTgQfTSpUuPJOhDom2cN6v15ZfxEkSyujt4mZfM2xGJxwgj5ntKhOdaacfIMe5R
         BlCk4dgrSWqiGjS9mMRUwlAeEeup9ZKxqUMRRbM49mRrAuRTQvt9M3NHCoUUQP7OnUn+
         LOm9m2vnhuym2iWgvQXNYJ3xz/JOktcOSyBhXUE/sWr8Qi5NlbiKgufyd6Z7lAKASRWo
         SGyyVSug9La6Vt5wXN6UdHPDrJNFrQcaVs2JDNFjr6KzFdb8wJgvxNU29wTfnojXE3u0
         OXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114344; x=1795719144;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=;
        b=0s/Rwt1g1WHEGFEUVGx68QKpEHGDQrXxmQuzJfsbG8+p1ldw/LlyALuAwtRYuBNkL1
         BfjEW5ZqKl7XcTztcZS24PVItLVpQz9Ynnn62Wk01RZnAsXwK4km4BMbWcEsun6uFzvM
         7OGcgJI548EmZQlKwj/ah+AgR3YTfrbrcAHSMeP8QXjJSNyJK1/mKesabO36ZqK7lxj3
         lxAGXFMrp6pny3wtDTnpdu1lT6+ikcO+RJToJG0SgfjiiszbKFEIeqpCVKOWnxj4X4wI
         cGJ4o0YZqe7WeUoqXHGgHo5ZpR8aJ5fG22GndVtsxzlY0IxJXEbzKHnTKCO9JVF5fFHH
         vg3A==
X-Forwarded-Encrypted: i=1; AL+hErEbMe3sd5GptzRXaFKfMPG4ShyDr/53yOaOfSct7/qLziQyBdzJRtV/B7EldpcdW1JUjBjJdTxv6cdEKDdsL00=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iP51KQ6zZN5ij3XdcZBT+xYn2+08NkKRMvZzmycIMBJbCWhIp
	VQV62KTkQ1UTuSQVxVAfP8K3z8oY4vU1gOf9lzOr7ECDC3s6wfsq0D4H6IUqSzcoZ9sLPdbVSbJ
	o66esvDUJrxsnO1Mu9lIZ3DDwbg==
X-Received: from ilef19-n1.prod.google.com ([2002:a05:6e02:6193:10b0:51f:7667:1233])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3189:b0:4ea:18f:64b0 with SMTP id 5614622812f47-57a0c19af8amr826925b6e.67.1795114343396;
 Thu, 19 Nov 2026 10:52:23 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:50 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-9-coltonlewis@google.com>
Subject: [PATCH v10 08/33] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the PMU is partitioned, PMCCNTR_EL0 is reserved for the guest and
removed from cpuc->cntr_mask. Move the PMCCNTR_EL0 availability checks
(cpuc->cntr_mask and cpuc->used_mask) into armv8pmu_can_use_pmccntr()
and un-nest the 64-bit user-access fallback check in
armv8pmu_get_event_idx() so host CPU_CYCLES events fall back to
general-purpose event counters when PMCCNTR_EL0 is unavailable.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 973d4abcb3a6e..9ce915754b0a5 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1013,6 +1013,10 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->avoid_pmccntr)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->cntr_mask) ||
+	    test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		return false;
+
 	return true;
 }
 
@@ -1025,14 +1029,15 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
-			return ARMV8_PMU_CYCLE_IDX;
-		else if (armv8pmu_event_is_64bit(event) &&
-			   armv8pmu_event_want_user_access(event) &&
-			   !armv8pmu_has_long_event(cpu_pmu))
-				return -EAGAIN;
+		set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask);
+		return ARMV8_PMU_CYCLE_IDX;
 	}
 
+	if (armv8pmu_event_is_64bit(event) &&
+	    armv8pmu_event_want_user_access(event) &&
+	    !armv8pmu_has_long_event(cpu_pmu))
+		return -EAGAIN;
+
 	/*
 	 * Always prefer to place a instruction counter into the instruction counter,
 	 * but don't expose the instruction counter to userspace access as userspace
-- 
2.56.1.708.g77570a6a1d-goog

