Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A24A43E1
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999483; cv=none; b=J9404wYzuRArMCxDUFYkDZcWTaAjAfqvFjqwQUK8WUcWtCBAwHZmGmNHB0bbpgfRZzAcGIeqZV/lMmYfpB4I9uHo3Wo80PeDY/ECS0wGpXg6M8a++38L2aFf+h5VI8FFBicoS8EoMZxw9cASSe2UpXqJvWH56BwVg8TmAoRB1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999483; c=relaxed/simple;
	bh=ie878rU/JdV+WHZq6reEkW3LocI09006Gd3UryYGcEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dX7UusGzZ/HLCKhdMzXjnOHB3YmzYOZX79Q7nqp6aNwyesdYLtTWR8GO4zzHTmQr6NSRdQlyVOMwhWQXsx/6AijdHBMRpJeRUjAhqWEl/CkrEpEnV6eS5qS8BJp+xbmTDBWvrXN82JjNwYy4SOtCeV6rMtAZhaMOYoigXPRr/MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ym+yjfJS; arc=none smtp.client-ip=95.215.58.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ym+yjfJS"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ie878rU/JdV+WHZq6reEkW3LocI09006Gd3UryYGcEA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789999479; v=1; x=1790604279;
 b=Ym+yjfJSNoAEEYEZ8nF7MSCaOlkglFvG2PXUFTZUSCR2WK5OnYpE4u5G9is82wrKVkT62a4N
 3BKH6UbTddmpZt07+o7ZsSKH+CNw6hyAPpGlQybfsJ5CmBCRHD0QRiaeTp1SU8NtV/OZ11iSrDi
 U11Fua0vRpoxEyOe7hpcnV+U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad4db469fc531011;
	Mon, 21 Sep 2026 14:04:39 +0000
X-Mizu-Trace-ID: ad4db469fc531011
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: selftests: Test a timer set past the counter's wrap
Date: Mon, 21 Sep 2026 15:04:27 +0100
Message-Id: <20260921140427.2211373-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921140427.2211373-1-fuad.tabba@linux.dev>
References: <20260921140427.2211373-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Program an unmasked timer whose cval sits within long_wait_ms of the
counter's wrap while the guest's counter is at wait_ms, and expect no
interrupt. The guest's counter can't reach it, but a host that applies
the timer's offset by adding it to cval wraps the sum into the past and
fires at once. The one existing case with a cval past the wrap, in the
sanity checks, runs with the timer masked and can't see that.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index d9c9377a63256..69986a7f0d37d 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -787,6 +787,30 @@ static void test_timers_in_the_past(enum arch_timer timer)
 	}
 }
 
+/*
+ * With the counter at wait_ms, a tval of -(wait_ms + long_wait_ms) puts cval
+ * within long_wait_ms of the counter's wrap: a deadline further away than the
+ * counter can reach. Unmasked, so an early ISTATUS shows up as an IRQ.
+ */
+static void test_timers_past_counter_wrap(enum arch_timer timer)
+{
+	s32 tval = -(s32)msec_to_cycles(test_args.wait_ms + test_args.long_wait_ms);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
+		sleep_method_t sm = sleep_method[i];
+
+		local_irq_disable();
+		set_counter(timer, msec_to_cycles(test_args.wait_ms));
+		set_tval_irq(timer, tval, CTL_ENABLE);
+		sm(timer, msecs_to_usecs(test_args.wait_ms) + TIMEOUT_NO_IRQ_US);
+		local_irq_enable();
+		isb();
+		assert_irqs_handled(0);
+		timer_set_ctl(timer, CTL_IMASK);
+	}
+}
+
 static void test_long_timer_delays(enum arch_timer timer)
 {
 	s32 tval = (s32)msec_to_cycles(test_args.long_wait_ms);
@@ -806,6 +830,7 @@ static void guest_run_iteration(enum arch_timer timer)
 	test_basic_functionality(timer);
 	test_timers_sanity_checks(timer);
 
+	test_timers_past_counter_wrap(timer);
 	test_timers_above_tval_max(timer);
 	test_timers_in_the_past(timer);
 
-- 
2.39.5

