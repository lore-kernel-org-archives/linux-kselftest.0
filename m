Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114358;
	b=Enzjh3mkpIGgMVEughqFQm7G4kU8jTxP61pgShTnTX2hCO0jzA8RVyfyZlVDgRSoO6Er
	 LJe5lX5q2TJmU9N9/xaJ+BdP30tUjSogibZ+yVkw2+thnxaIxs50Vhy/nAjDkGHbQZGJ4
	 Q8cfYhA3h6wOGkPsQlZs+S5m+bcC0OP/ZA9EtaxsTYtk6XeHGbG36wBxn7G5AuJMlPBuo
	 nwFEqqevCitV+zltQG+xhyEOOr3YIdB8QW1q2vGnw9MvQSbvidu3NVgHftcZlsSXHlqou
	 VQTpGrVajcGZuvqgIqNm1RCLMmnASR/21blUSs/v701zG2/of9u2ZF//0p4JNn2T55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
	b=QKuDoVnpHTRDC4pVflXVxp5F37nk/GIhowa68gqn1y98VfeNLwPxDPQdPb3CzA285fg8
	 7MYQMYd6CwfaapjO8TWdkGs21nKd+F2fEGFMoL9745zgpkL8UyaStEZnzMgvxBRP1zROO
	 1fWB2sHktCRlV/08GKL8dN5crbHvUfb35olfmDTELxG9HmtZrSSOgpdkUMFyXOKzjzFcf
	 sWh8cthuXShLhTDz3CJjlsX9dmHWD4f26P8wTJSUq+VuphIenWKVovFFyGCN+ZCytMNah
	 n0I8O6iEmh7CMg2urj62/TzmiD6Wr9NKH9rX0bnJNCRrPyTY1e8KY7VIZDuFeB4XjTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=djTQwvGo;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2C606E8CD
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F2C606E8CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=djTQwvGo
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5727b04b81eso93998b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114357; x=1795719157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=djTQwvGouuLjxkWqR3c9bPKwN/fycxEJsz46gazrcL55seCy00j+IlwKtjdnHf423Q
         nDqhlPtjai7dC7ZgHo5qWbK5qUAefvDOdgQ63QdA4Yngef/ylXyu9KPSipd6OdWGf6oN
         6qdA2OSrq2S5LuamR8CrJ4IgvL3krCF9KruFSWJed3J5qHLxH15nreaOEc2auIvqb4+w
         R8mav+ERdQ2k2IcsqRDdXiicDyPX0bz0Nn56HIhrS5jMhVxVjzFcOuFB8maAUzMBjDwR
         /3w0OAvtg6Ey+mYrIIB7CtSMGY6zwpkOXXemuz3r1IWrr7q90Sbkye6vss/SyHrSO7Lr
         EWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114357; x=1795719157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=EajUK5dALZzHI5SqJR7l5PoBVM0ariMHTkftQQxVRALCc2IItuayLBtvTmOY1ypmBS
         14T0ffc76arLvJa5DvcV/ImjphuHmmzf54iRcjCh9x4jTl1LTL2cy6K5dcpeDgCpMdcZ
         WGVGWjv7sOUwWxMrndNzdijC2rqCj4pM+ZLM9mK3CizE4J0YoyNlxv16CJyL9Eko1zb6
         fwZ9Hyhh/Eu1nt1Nn2emZ3GssqcCLJXRd67kErz35Wvi6broQ4/TrnshGnIpIYyHFI+a
         PBWgRaNPXi1hoMiIpw4L88uJqOGaIfm9aRw8pepdrte/DzHImLvSt3ze/ems7MXJs975
         gLIg==
X-Forwarded-Encrypted: i=1; AL+hErFwBTYWjSc+KU59Z696EFpkF+tZsCiP6Wg6xosjD812S7WVJlEwuCUeNGlOUd1Z5vkv88OqOVQzC+ppdGz4gEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cVrps+DtFBpDDqMNx6nOfQS4iijgrFZwgGsphVR4f2W+sKtXz
	FFmrQB91DV/CX04oRQbArrCWU+U86rz2D5/glciIJflrxI1mLom0Lw+qtQyg9rM6E4NooD0XPPt
	F2xvG9tsZfD221gRowAyY7JVYqA==
X-Received: from iof12.prod.google.com ([2002:a5d:9c4c:0:b0:9c4:b80b:7605])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1384:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-57a06a0da3amr989109b6e.6.1795114356571;
 Thu, 19 Nov 2026 10:52:36 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:03 +0000
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
Message-ID: <20261119185215.632334-22-coltonlewis@google.com>
Subject: [PATCH v10 21/33] KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to
 resync filters in process context
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

Previously, kvm_vcpu_pmu_resync_el0() only scheduled
KVM_REQ_RESYNC_PMU_EL0 when called from interrupt context (such as an
IPI reprogramming host perf events). When perf_pmu_resched_update() is
invoked synchronously from process context during vCPU load/put to
reschedule host events around guest-reserved counters,
armv8pmu_enable_event() calls kvm_set_pmu_events() and
kvm_vcpu_pmu_resync_el0() in process context.

Update kvm_vcpu_pmu_resync_el0() to call kvm_vcpu_pmu_restore_guest()
directly when not in interrupt context so that newly rescheduled host
perf events have their EL0 exclusion filters applied immediately.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index dbbe219ac874f..d3fd438a57b09 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -213,14 +213,17 @@ void kvm_vcpu_pmu_resync_el0(void)
 {
 	struct kvm_vcpu *vcpu;
 
-	if (!has_vhe() || !in_interrupt())
+	if (!has_vhe())
 		return;
 
 	vcpu = kvm_get_running_vcpu();
 	if (!vcpu)
 		return;
 
-	kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	if (in_interrupt())
+		kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	else
+		kvm_vcpu_pmu_restore_guest(vcpu);
 }
 
 void kvm_host_pmu_init(struct arm_pmu *pmu)
-- 
2.56.1.708.g77570a6a1d-goog

