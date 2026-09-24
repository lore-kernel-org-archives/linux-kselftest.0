Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F944AB1C5
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270984; cv=none; b=QkjU0uzF41hNcFga0+29TP36ez/zVFPqmQB5N2dyMexSuAifS7uFe5gIYtcbJHcbzVOFl4JClU39TkPYVdyNxfULstU1nxo67ifE103Ey9jsALJ2cD4Ebhx4u/GILoRsiwlEqX3ptRFmYfURqYQ6taMIBPFvcqILBX3TxL4EXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270984; c=relaxed/simple;
	bh=1LHtdim6mNkq34T+thFsLAYrhEiLePXH9xr4eG5R5AA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sKtM6i2pMBSklhXNfZ58HCmXOknSCHhEGrjKa5xdXa+eM5J31Q3lJ+aqSTMZjnORmBvxUU8HJ7DRLLbIxWhGscZ/eB/MYZW6QXxxtV7kZggbD4qqSEutm150HPeKUU843Cu8CMEb0LwuYlyv/oF7ixZ0HO+BuLjwyhqUXFLAuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fptXcdb1; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fptXcdb1"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc691d106fso213172b6e.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270979; x=1790875779; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQOlA8B/24340sHjzOUl6iozs7o5QB8r29Tt5BMqrOU=;
        b=fptXcdb1QO6P89oiX5WQu+M0maT4mDUd2AWR0AnsOyfqQPzSpYmv87FjwSOVsDEKbc
         dAA343fLd0706yj9nalq3cLHwS/dN+JKusV5XcWFofrElBOh7mERHaUdy09bSFrf4ty6
         O4aicSt914wnVOA8J8y1Lf2I55m8+QfoaQ7Ep0lZLdYZKwHE1LXq4wZXlrFxLHErwnfP
         dBW87YrTOSxluC1l5jtwDakUaDShq+bVtiZHnTEQ8LAOBOZYvWbqhcAGPwMahusMc6+7
         HKhlPUVC/FSWY4XFIi9CvJZCCwPUGy1kNVryi+ZQ06nf//9M5yUccxapmw7jgGaI/ELf
         03HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270979; x=1790875779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQOlA8B/24340sHjzOUl6iozs7o5QB8r29Tt5BMqrOU=;
        b=u6+TZMymBPk1M+U2FrRiggpSZfuHZcYU/rDN25FR/HuQWhTat5SFtj4zp8I4rY4xNk
         Af3VtylOzjz9J1zrMP0C4l17nx5i9ztkj2QIVUZbXM6M7JK65H273mRbIHe0cGMOb07e
         nnteKEdOmQa6D/lm5bTsLZlRUVu3Mcr673MZ0T47be/k0ZDgZHEFRO3ODdehI3wz3VnF
         xI97WfrPmQlYQBHW6cSpMC4XT60Sb+MLDEJ8EM0OF0JLW89McGG7sopvlZ7Wl/zYIqwW
         vX+QqQhnsu+ZFbvfEKrDqP5qA22BK24RYWXIu9q1d3+Ettt6hhCmaOCAsJQHhSvbZc4J
         VcXQ==
X-Forwarded-Encrypted: i=1; AKwUvByoeaT2ypA5XWuydqdP4CaHpA3iumwRwXIEKz90VGWXXpcaIpgxA0ycX5Srdpctj7GRThdRMqAMvRZIDIZFJfY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/mZk2y0u6VICGcQnF8h5cKhjzldmCNFTCrg+rgN+Duw0Apz8q
	cvYEDnwAnB80hiiFHOWoS5Zet4qBBF5Qjfv0JY3PbxP87/bc+7K+wdhCSUivA/blHU+zbWQ7jwW
	jJhmTCxvtQjtwK1GICj8jF7KnWQ==
X-Received: from ioeb22.prod.google.com ([2002:a05:6602:2756:b0:9c4:2037:88e2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:670f:b0:4d6:90d3:e18c with SMTP id 5614622812f47-4d72ea5ea92mr3060445b6e.53.1790270978999;
 Thu, 24 Sep 2026 10:29:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:12 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-7-coltonlewis@google.com>
Subject: [PATCH v9 06/22] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When the PMU is partitioned, PMCCNTR_EL0 is reserved for the guest and
removed from cpuc->cntr_mask. Move the PMCCNTR_EL0 availability checks
(cpuc->cntr_mask and cpuc->used_mask) into armv8pmu_can_use_pmccntr()
and un-nest the 64-bit user-access fallback check in
armv8pmu_get_event_idx() so host CPU_CYCLES events fall back to
general-purpose event counters when PMCCNTR_EL0 is unavailable.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 49289e5993dd7..c15a34684137a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1015,6 +1015,10 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->avoid_pmccntr)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->cntr_mask) ||
+	    test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		return false;
+
 	return true;
 }
 
@@ -1027,14 +1031,15 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
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
2.56.0.rc1.310.g51773c2048-goog

