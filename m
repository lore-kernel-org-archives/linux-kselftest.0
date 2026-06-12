Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B363AE184
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292558; cv=none; b=XL1RyS7EDn/2Yl4GdEAhlLaA5xrx/AjwbOWvW6RYkr5JxAy6Rd4VXBkMsemw1hFFT4pWeljuuetQscjBYeK/3peRPqpQWJxf/RzV89jreDGLxkiZn4z+EU1oz+lrLa5MGj4ohLZ2to0E/9KHIf8rSpDeapN8INp8X7SJM25WpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292558; c=relaxed/simple;
	bh=06yjw3p+ipuRaTZAWCI5G1pBBjTnmA793yGUK4DpqJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lEfvsBCM90qH/yqeAxnJjibHtLoJtkZl71wNg3W6p6fPROYPZuVe+1RhOLps1B2RsWnu0cyypz5+SA4XePnom6tyOL1HVVzHYP23nBEHILbVd4rOoJP3GoSHAXX/4VYt8GTQQdNWWlvX5c4gvjqMCALsQ52IhSlA/bwSUOmEXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qt4zRkD3; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qt4zRkD3"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-48687df43c4so2054142b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292555; x=1781897355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=qt4zRkD3P79O7CMpCSgk2omvpeByXpgYK9BDRDYhwAC8+FHRR8aGBq7LgT2OwxcuoU
         PwPKAiPPDUmcZyakBXMBHt5xbzkAyuwYYVR388mFOdByzJkudKL3psOSscsWulusiIOC
         Br8SXVene6LB43AzjyN7JDdft61KRpCxslVBWRa3ZsAduCrt3p4ztm3NNtAZZiu3ipQX
         3j+2fq85DkWaFF/y34kN5cpPYuATR3h8HakRWBcVgHlzN9iZDoCOspsFGGOjpslvcipm
         FgrQUGSgAcntqR6Txf4LGNcWg0mkC9dNcAHrz0JEh04lpgLotX6ynmO59E2pEn09Riwl
         B4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292555; x=1781897355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=RRd65uHXw3ALF9665Gc4uuYIWLWlziLmBtnM/7nftf5o8jxWEbvZUbT2ZiWwHMRkEg
         2y+HgKvqx3BUQWzCv8wVmwpgpYY/iFpOc4Y+cC8DvK2AdiRnoku3gUnXQJmrFp04bBaA
         Mvjgb8Fb5rQiodhrhNU29bkoNjXm2/YT7h1+4VdrBp+3sISmy09wY6FsimenrlUgWk3n
         GOZVd8euMoH9/UvkT8pknyNcO+FGF+QbRlYO+ARtzOVnS7RjMp/cs9iI7NuCcUNoTz2Y
         DGFH0q0t7cPtNMb4DLjQjZR9saxz4vcMDDzdvlD8OgwA5zOxO8HMWXj2N8oV8uhyi0uj
         aPIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9ZcJibnVUQ+a7dkj4hXI64VeGLa3GbqSfVgxII3tVFB67O28MvOrdQY3MCqmTZaVR2BNokqYF4QOXQ1tTpPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBuQ5C7GCTP3ik8PETDXE6tJK91oxbzGC3Zk8SeJQ2S07C4E0X
	xUTKAF4UBcq7XwW+Wmv2KEhTg3Tu8sgunmbnDdk1GGfPpwNsZbkqVBBkM20VS/SBOR2wY0ZYzgF
	x41ysS6BG24rSz/EjPCfQibNTrQ==
X-Received: from ilbdw10-n1.prod.google.com ([2002:a05:6e02:410a:10b0:502:1132:3db9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1920:b0:479:e7c7:dc76 with SMTP id 5614622812f47-4872f4bc1a3mr2488426b6e.26.1781292554890;
 Fri, 12 Jun 2026 12:29:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:53 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-6-coltonlewis@google.com>
Subject: [PATCH 05/21] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Check cntr_mask before using pmccntr to ensure it's available. With a
partitioned PMU, there may be instances where pmccntr is being used by
the guest and will be absent from cntr_mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1cceb1f614515..17bb1cfdc271c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1028,7 +1028,8 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		if (test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask) &&
+		    !test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
 			return ARMV8_PMU_CYCLE_IDX;
 		else if (armv8pmu_event_is_64bit(event) &&
 			   armv8pmu_event_want_user_access(event) &&
-- 
2.54.0.1136.gdb2ca164c4-goog

