Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3942EEB7
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036119; cv=none; b=QNlzuaeckiWLVF6tqQLZBwICHSEodLaboCb4L5etgiHBPicxl31XnWHXDrYTUn7TznSyzyzGi2n2Uqi4JnPILzeGcuUiChfyhBh9Hdh5wKDp4u0TE0R0uwylRPEjuD8BBN8hxjOsHx6mCQ+ndA9uJFAUlX15CQ+DtS4ZIJFseZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036119; c=relaxed/simple;
	bh=HT9+y8mKylFSQlO/MmyV5jBusINMym2xe/5Knog9zvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=adMhqgmw/NvkSjsHTc+Pgt3WPofSJn0D/D1nLpU9sEtP0uCeywGj5lSVj3dPG2ZQV9ASXf/UerVr8zs+YlKgcagWUw2/srix7GwS67ff5+YXhz8p1Am2G/FjT1F409v4vewMGq+dRq5v28YzLgdeylbP5+bVVswB8Sv7o9FLH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yy7bZ3Km; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yy7bZ3Km"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c38781efcso333266a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769036111; x=1769640911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XtdAHoCCv8MCt5Cr87qxdzWERLXvpLO0KrAAEyK/DWI=;
        b=Yy7bZ3KmDt6CU+V7lC4vawxDm8eZhhsR6NHwC13pltaD2IVbzDqf5WIp3gCR7RIL+p
         pXL5vF7WrH4z0pP8FPpJ6kMQ+PRAajrOof/weWsRvkbc8MLKpo7giPon+6U3wmuKgN7W
         1dCk+51IMdg5S+n74vsbO4HmXQnSUXYVQCzV/SH/HqyeyzrjpD1S9OLGVyS6DW/M4WX6
         B+JKTwh5gvzgmNOofWLpR8is0frizuinV0Obr+ksjCe42kUG1rN9X3yQsolZkywhvLYc
         f3XIN8moUu5Wi8onTZE5ZtbOLX97Nf27Nyzm6IUkYf0MstMaSDlXyt66ru1Lm9N/qWhL
         dNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036111; x=1769640911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtdAHoCCv8MCt5Cr87qxdzWERLXvpLO0KrAAEyK/DWI=;
        b=pKNvJ1DgVKEGRTXzsZXOJ1iY1zR98timJ7FknUrwMyeAA/l5mx6HGwX1COqszVEvNS
         YvoUuk7jFgRgtuI535g5Q3EJdsy7t5lbB3C6qgFa6DF+61gWC/nZ79KNyw7IypXTXoNZ
         NSFiIkzCungFzGrg4/060+X7Fr577cU8Hnleulj0V9l9V4FMz6M0/hyyRQqmKA7+rmJe
         eZeJ3RwKUYM2cdocLf5SwHr6PDMG+HQAuW0IPy4gABIEz0upV4/w1HEtxooN/DhPPQzQ
         QDGcYJQ7E0M40d0blklgv54nyNyVs7wxA+sDL3KJ/pSa1QHRVyuUDOZd03BzZWe2rO1C
         IkJw==
X-Forwarded-Encrypted: i=1; AJvYcCX+kZgiRW5gN2K5qSF2imKLcyNFAQYeAAIslLdt9PZu6g6s/6P21UA1EAbqtvxSeqLTb51r84Oe15gxquf/bFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxntT1/KsuPAbSYUPKLdI9RQdCW7kipbfaJKztFH9VCigNk3VpF
	H0QOsoaX1ePkapvMKyAVihSbxZWxM3whk0Rv/g5SBc8FzPgvLoJEYjzpg7DKO3F0EupNmL3WE+r
	0RK6H1EWcQFmxIg==
X-Received: from pjug11.prod.google.com ([2002:a17:90a:ce8b:b0:34c:c510:f186])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:58c4:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-35272ee0f99mr15487736a91.2.1769036111123;
 Wed, 21 Jan 2026 14:55:11 -0800 (PST)
Date: Wed, 21 Jan 2026 14:54:03 -0800
In-Reply-To: <20260121225438.3908422-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260121225438.3908422-6-jmattson@google.com>
Subject: [PATCH 5/6] KVM: x86/pmu: Allow HG_ONLY bits with nSVM and mediated PMU
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

If the vCPU advertises SVM and uses the mediated PMU, allow the guest to
set the Host-Only and Guest-Only bits in the event selector MSRs.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 85155d65fa38..a1eeb7b38219 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -262,8 +262,13 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 		pmu->global_status_rsvd = pmu->global_ctrl_rsvd;
 	}
 
-	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;
 	pmu->reserved_bits = 0xfffffff000280000ull;
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SVM) &&
+	    kvm_vcpu_has_mediated_pmu(vcpu))
+		/* Allow Host-Only and Guest-Only bits */
+		pmu->reserved_bits &= ~AMD64_EVENTSEL_HG_ONLY;
+
+	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;
 	pmu->raw_event_mask = AMD64_RAW_EVENT_MASK;
 	/* not applicable to AMD; but clean them to prevent any fall out */
 	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
-- 
2.52.0.457.g6b5491de43-goog

