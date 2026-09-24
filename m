Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11C4BB286
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270998; cv=none; b=dIVVYHuHkTRVavTjWecDGmytwnBh8dVkXIy8MO+82lUl65SnQo4p0K98Ejl8SzuRudbVVjoD5Lsvxb4nrZk01OW/6mAxXZPPA8xTqravSPKnlCGyz3bFf8bFC5EWDS9p99emNEzDzedsPkHl/oGNyFXALxvZDse1SPzZfPeAGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270998; c=relaxed/simple;
	bh=dPoD2KWcJdBMoqLmCayL0dkgGb1iTFvhuDn+uK1Rbmg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N6QdccY1hFN8g5SvYTKIRjosaeKGSwiPoSLZPQOOZWbIFWsTaKdGnjHHGzvT3+dxEhLytV4cTf57eS+kv6Gus/FSGdXvNapvIZ3j3Qq7UAbzdqcyA2BSXNXIhXLNV7fhpTuFxaWaK/Jz+0JSkE2EQLD1jjCQCm7q9ddOlDTG7Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kZiwh/yS; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kZiwh/yS"
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81482599b3cso22565a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270993; x=1790875793; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=;
        b=kZiwh/ySSQrU6W/bNKo1lPMZb6KoSzwMT61prSIxuoaKDXHTAVQxLok9xs6hHrxSI5
         1kUPOaeM9jp2ovuLdszGGpkuTUERqFJHvkepjHSA0KibxDX7BXeoJLSypMbQMVwybPbx
         RsfT3NETtj5EzkgmvhUOlaMLb9RhWU/LtzQhwHs6mSxcSH7Cc2xlfkXaZVayvfIFWddA
         FH9PLxPvXBF12BqsW7jQvz4LGE5qpPNQzXsyLXVwDNHAUotF3r3UFgbEe/XjmRqpPl+A
         8/x62kRyA59J3MxlL1XKs/PHb/EPG2J0LU73sOfWOOUglWe58Nv7mqhDnQnb5edyr3XR
         fu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270993; x=1790875793;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=;
        b=nxeK1IANo62MZNrzgWBT2WxjjHCecLhikE5dfqoCnTuwnGDvR3UyQedkF9KcPDllXz
         M5cHspdVrsqrDmHffC7dpYY/TlBWWA33aRY9WqWpCoH1d317Cj4uZNvTCw5jEOm9kAO4
         9e+yGX8v67L6qoVe25bHAaojl/br5MHE35aO5ngxxLCwyBj22qyGWflHMer07e163+Jr
         59rOEPiFSxSpccvLAM2kh2F4e72a6hMM7xbC5dGLFo/qu7jJxe5GzoGekpZsvHp4vCIC
         QZItGKkdtJCSLPZigID5dcfW5BmjCN9Io1vJpxNDPimBQ3XkqGNbYfZr19XaMSNdnjac
         GrQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcXBu/CO0Z/VrOvamnY9WeI4QJcPbChkzx6uYpH8bNptU4snVlgDs28i3SfrMrQ61iIEkVd9vSLSKEjJqKCy4=@vger.kernel.org
X-Gm-Message-State: AFuF++ldEgaXKC3NICp7bi5/YmRevDp31Ycctmp0zYoUBCJm+KxKrUmo
	eP0eweUvbvA710EDntgOkoJjjPwdIzECpSZdlmqqdEVbUr3XCGLYqbGSSf7qmEcwtDID7bOu5ct
	kA4cmbzeY0lU08Jf6wvnTICl9Rw==
X-Received: from ilbel26-n2.prod.google.com ([2002:a05:6e02:501a:20b0:50b:1d1a:8453])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:199d:b0:4d6:90f4:48af with SMTP id 5614622812f47-4d72e966ec8mr3960018b6e.49.1790270993044;
 Thu, 24 Sep 2026 10:29:53 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:21 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-16-coltonlewis@google.com>
Subject: [PATCH v9 15/22] KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to
 resync filters in process context
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

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 6f60f86fad387..a8214ab52fcb5 100644
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
2.56.0.rc1.310.g51773c2048-goog

