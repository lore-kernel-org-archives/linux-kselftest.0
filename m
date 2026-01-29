Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4336C0B1
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769729811; cv=none; b=qByRLFtlDSJhfaZegUVhuFlP2W6PE49Oi64Is591WF8fUJeLAnpTV0Q1aApCycETVBI0aNfhfe3n3fc80YHO5i9kdmPin6kr3d6KBIf5Rtb/+qsDk6kohPUigNrBQ7XoWxKOCjLAYIWkOz81PmUzTR/AtFmf4BkDWfgYtzmHrZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769729811; c=relaxed/simple;
	bh=P2gomgDRGmJ4vLTkCMnRaUel1qN8UOZyfcbTRRVQbSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DHwVY7VVohA9oCRNZX6I32L20XgiI5AFMoMg1Y4IGOYBLQRyew4DfBtbWo0161gjCxABR0AOyZZSsIrO0LT5bEN11TDhkIA0IgJasRAnLYpn5ASLoeLPOtLRsqPgZeGuI6n6+167BlpBogyWDaeA7CCShAeRP14t+Xg8fodzlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NblwbJ69; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NblwbJ69"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-9483c49a63fso4208378241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 15:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769729809; x=1770334609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9edmz9F0+Ueeg69+oBnQppllXkvN4AaYJE9iZBV8Nzc=;
        b=NblwbJ69fx2MkAnjBOVP7xZekR9hs2BR4TEbw2IxPD57txLUk4qpArM9P+ch9J6q8W
         7dYAHI+W0MLlx6+ufJb+lyubOrLri9seqOp5fH+0YQ2mIUKUuF2fdcHbi4i1XOrsLY6o
         6RImw8Gs5hFqOWqdzK/XN7+1OtlYKNHP1PjEPEBRYqq/MEqeBztPM1gP5ZobxWzsR0tN
         hxMCWYJMLDWYCt6VBjs6TaPrYyWp2R7Oc9lal8VckNJcdCg+eix1/4W7xgr/zRkDwvtn
         G4Pn1kbaQZT+XQGhXckfbfEghb9wWFWRBpQqpif5FYcF73qQw/FqTw9bFj7KTWelLNnp
         6Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769729809; x=1770334609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9edmz9F0+Ueeg69+oBnQppllXkvN4AaYJE9iZBV8Nzc=;
        b=cfdrszbJ2SnWou2MbEh0P+5AY+wXnF5YJRksRyMTTHFiqw//SxmkEMFVNiIgc2hZnF
         LX/cjUSDZL66to6CkwsRTRTHTdiLX9QqYeSr30hyGEon2MCL4QDa1ImBKaY7UdPgVIav
         144e254NR/R05w0Lw9lRnZSArFAfQ02AmW69SH8NcVPeOhaLt58/iuIluyUbTy1q7rfJ
         I8cokFkR0dffV2MXkbcgIri+rlLbFXXPh6j1/5sDlKbMoDFexLhN+axl2C5NuMaIxO/T
         T2wo3ns44zpfLFlSTyUtMR438JGVaIpE5paRWgoAMn91imap0n5HSfy/fNxcqdO1M+Ha
         gUdA==
X-Forwarded-Encrypted: i=1; AJvYcCWaphMMdOhdYkmm40ACLlWT2Ts94ukzAagHmu6pUQrLQMltz/9McgjBaHhpdiaX8lj8NLzvdK1Wa+FTo6gC/d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiTfTuhNkUnP28PwfL/gjrhJsn6dVVImV9iAHqHttuWYp7jR2
	aBVoLYHLz1AmdEtsb1bj0ZTnrDqYzQS10Yioh4Jo1ZgKky6GpNxJfUhwt210GeVF0o82kyxqfE0
	Z16TcKrC1425peQ==
X-Received: from plbll8.prod.google.com ([2002:a17:903:908:b0:2a8:759b:173d])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d485:b0:2a0:9eed:5182 with SMTP id d9443c01a7336-2a8d96a6b54mr8177095ad.20.1769729346081;
 Thu, 29 Jan 2026 15:29:06 -0800 (PST)
Date: Thu, 29 Jan 2026 15:28:09 -0800
In-Reply-To: <20260129232835.3710773-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129232835.3710773-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129232835.3710773-5-jmattson@google.com>
Subject: [PATCH v2 4/5] KVM: x86/pmu: Allow Host-Only/Guest-Only bits with
 nSVM and mediated PMU
From: Jim Mattson <jmattson@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: mizhang@google.com, yosryahmed@google.com, sandipan.das@amd.com, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

If the vCPU advertises SVM and uses the mediated PMU, allow the guest to
set the Host-Only and Guest-Only bits in the event selector MSRs.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index e2a849fc7daa..7de7d8d00427 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -243,6 +243,9 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 
 	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;
 	pmu->reserved_bits = 0xfffffff000280000ull;
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SVM) &&
+	    kvm_vcpu_has_mediated_pmu(vcpu))
+		pmu->reserved_bits &= ~AMD64_EVENTSEL_HOST_GUEST_MASK;
 	pmu->raw_event_mask = AMD64_RAW_EVENT_MASK;
 	/* not applicable to AMD; but clean them to prevent any fall out */
 	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
-- 
2.53.0.rc1.225.gd81095ad13-goog

