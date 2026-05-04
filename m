Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1163F54BA
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929518; cv=none; b=nq9cU33fyPF7NQAiAcDM1yMj1vnwoDUQe2horWOQrwOGnvDSKl6X0CbZcCJryxpJzOsEs++hc1u+VMAfuoBUajwR/1XSy3GyxE0T81MAkyzi78M93ODrXLTwi/JTKebsCKM3xO33zp3nQrj5BPHqml3YSFRrMdaTACgosPF2mmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929518; c=relaxed/simple;
	bh=Kt0JxjDXw64yyFAEbn3FTtOy6aQbbH4PD8HMmdQ27Kc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QYavhy0JJm0pvuMQkMuSf82aGLnf2VcUIQpmTEx+ZKIvEuxBvWwu9Eh0+uUjEP/L0haA3YD9C6fdCV+PBHb5WGyv4Zyw/UdGVGkeN9YX/bMWG7y1BUnXbZ5586N6U/kTQZPQf2yh2p17VJ7iJLpHkmR4lXKk6namCGpTlQZxQXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HlhMW9VE; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HlhMW9VE"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7dbd4fe0e15so10350967a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929514; x=1778534314; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZCDOiFD5ADpp1wKWAJRO360JAEeKFaw0Z2nRZPnRE=;
        b=HlhMW9VE0NFY70PhISGn17Oofl80Z56pJcbBKpIluqSVljhaZ8buUUJO9fzngWsVdL
         Fy+ZafFrc0cZFRXAvUMSfROgONzy9Nnd6OZmVBN4PIAw6cUdb3yPkcjc364kUKimMp7M
         RWp0ahV1XdNXjbmIU1+DALrzRCBW3eiMpfsjzd1gNNZmcWCyQyu5Iu0AXnAOnf4V5W2h
         Vnz3U95GVyzS0bSiEL+zNk71PrescclXwHhvqe5PRchMLvr5mFxPcvhcplqcSFF9e9y7
         iGjcPAW+flEX1gE79anaXR2MLqwoSOvp86M8He78uA13Aw31nspLJOoYx4mjNMnfQnkH
         3/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929514; x=1778534314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZCDOiFD5ADpp1wKWAJRO360JAEeKFaw0Z2nRZPnRE=;
        b=stZX9J+eszT/wlO5dxdVWRAPbGcfFZScgBx64pbtTPGt19P6R7aR1Pi7yKOtN3GiUS
         gtDO2yopaXyuurzvpYOVXMd1M48U/96u1nXNS7MbBjG/S3A4AkkM1jgF0TeOOI48yN4J
         ABexzXyAS12J8AVQO8ca69baJCk8xuExzpmNVR6SXmeRUOBdnujdUuM/jSFYVVIyFQ1p
         8mza3ziwSkoVd4Hf1rM4IAHV+xqkGeeyybXUxDHilJeWVzeBxy0n2I434BCVxYD6noFJ
         ZFnOx+cwzzN6/32AzOeh2nJXhjqefuT8I7hSrEy67pZlKOzg7VpGfsw1TLDtYzbS9asM
         A9AQ==
X-Forwarded-Encrypted: i=1; AFNElJ82eRjT8V7aedGqC69XlI0Czn5FbnbtLd3Za0MH8TUDVjqjOopABh7Xny11Y1d1rA1Wr4jttqvNBRxNrLLlXtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW0FvbmLfis37z/X5HRxaJvlf9geS8P6I7f7I+i6i93bM8u7If
	I+pKHNeo89KYGwm5ngTPv5XG5Bdwvt6k7obD2tHMovUmbln0U3t2pZqvB4VYWCFyr8dLUCy1abk
	Q+qLX9hx9zpxAmF+gsnV1WdGm7A==
X-Received: from ilqa6.prod.google.com ([2002:a05:6e02:1206:b0:4fa:1fcf:cad3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:99b:b0:694:8bfa:7817 with SMTP id 006d021491bc7-69697db8330mr6011884eaf.53.1777929514318;
 Mon, 04 May 2026 14:18:34 -0700 (PDT)
Date: Mon,  4 May 2026 21:17:58 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-6-coltonlewis@google.com>
Subject: [PATCH v7 05/20] perf: arm_pmuv3: Check cntr_mask before using pmccntr
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
the guest and will ba absent from cntr_mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1cceb1f614515..7ff3139dda893 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -993,6 +993,9 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask))
+		return false;
+
 	/*
 	 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
 	 * since it lacks threshold support.
-- 
2.54.0.545.g6539524ca2-goog

