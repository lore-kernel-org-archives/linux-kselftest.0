Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30D3E8C71
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036115; cv=none; b=avi/WmyTuKKms1J8xC8sBfpY/5e6uLQjujKSdL1vKBggxSGc51lC9NLFlxMM0sLIFCqUUgOlPBTT38gc9tCL0ikrEo+eMtyxQT1jG0jraLN5zCRkP0Xs7TAsBrmEszm5dR3C2SdPXNFAcWQdbJIsCtHqgtMa63yXieZHiqgPkQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036115; c=relaxed/simple;
	bh=tr63TBX3kw3rhNLR4KkCTKohb2Q3vQr3rghbN731DHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FJ4Fa/2klHR3ErGjHbCdm2uKpQs4+Sdo9jQDst+0qHsTOY6bl2TEnaPJV5b8Y22NN8MMsRFayZ8xW81a8dBxXyPdU5FXz6wZVqIRkIjnGoCICk0CxZXSVywZsOwJo8Fq2zgtbFBVtmWCcbIF3U31ielgKcE2s234CjxSARzL7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YLlXm7Gh; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YLlXm7Gh"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c213419f5so226851a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769036105; x=1769640905; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QXlvlmMGjx+7txGDPivw+jyaPXiVrEUwOPpV1iC4Qw0=;
        b=YLlXm7GhBJImVFMKSkMbyFKW/777Amb4LuCYph2aadlPnPuxq4qnvJYie8/hmtlV/L
         ccxOATpxh0M0sKf7nESKhgsMSfydkFhyD6Oxie3RDZ+FFuKs+4xlk0WeHc6PgFYQQrVt
         WoNpBW6murp5L7+W7heZGeOzEx5BxjemmltKLS9rFfrdX9fe51k6S3KRkx7vY/pYExFr
         ZmJ/iEKUDZ3ydf+FgkyKes9Ia+09bU1f0tFxue9x38S7Coc8t1MuVseB/XSydmfHUhlL
         Enr50Uj2rwIFMgniqXN2YXlXFYUhWrESnBFaiRUxJzELwAbeRCnLsS31b+AzmLoDOtwT
         Pz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036105; x=1769640905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXlvlmMGjx+7txGDPivw+jyaPXiVrEUwOPpV1iC4Qw0=;
        b=USupetORpVVqegrBQhb63dDtu3RHR6KVO3LZ2K1wTlC8rHPYH8hZsevP2J/DNw7YHQ
         5U78sE/0WT2WaJDkpShU8fm7kt7Kfd6GoFC71XdvbtbrPhgy49e6NXEoD3yX/P40nqNc
         pRpKToRsfLmb11dz5mwQ6vn5++02ODnjIh5Aqnu5k9sC698TH7Ezi0MnDJ3glk5nhA0a
         cXjp7Gku/RXGpYPq01WAejYmHFt+L7RgQUcOrZk3Qli0q4x3wZ1ZQZS0RXvUDdUQlb3i
         5q1zeuG3NXVSgsgcoXUq8ceZSU5rL+ENovkGouMQYw4rl0EEzU5tUCzn3N6KOqiZbFda
         3XjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1t+ku4NQZuMt5vBeNR1FK/j/OJos6xm3ySIjGB6CNj9PAB1SrqFWMsCtpSHI3AVP6l9YbZ2GhvpBRFzFKRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFL6HHBfs59kkCW8S/T8hv2Lyij+2BksGjPJD8YpibplRK+AvU
	hcaJgDNy8Hru7dKj7gN73u7WIeKZPHdpuBNQvKvTWW07Wsl0KDxkRfPxxzmdfdVrq5SRs7jIU5a
	1xNaOE+IpLftjgw==
X-Received: from pjbpx10.prod.google.com ([2002:a17:90b:270a:b0:34c:3c14:d369])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3fd0:b0:33f:f22c:8602 with SMTP id 98e67ed59e1d1-352c403aademr5934916a91.26.1769036104764;
 Wed, 21 Jan 2026 14:55:04 -0800 (PST)
Date: Wed, 21 Jan 2026 14:53:59 -0800
In-Reply-To: <20260121225438.3908422-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260121225438.3908422-2-jmattson@google.com>
Subject: [PATCH 1/6] KVM: x86/pmu: Introduce amd_pmu_set_eventsel_hw()
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

Extract the computation of eventsel_hw from amd_pmu_set_msr() into a
separate helper function, amd_pmu_set_eventsel_hw().

No functional change intended.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/pmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 7aa298eeb072..33c139b23a9e 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -147,6 +147,12 @@ static int amd_pmu_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	return 1;
 }
 
+static void amd_pmu_set_eventsel_hw(struct kvm_pmc *pmc)
+{
+	pmc->eventsel_hw = (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
+		AMD64_EVENTSEL_GUESTONLY;
+}
+
 static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
@@ -166,8 +172,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
-			pmc->eventsel_hw = (data & ~AMD64_EVENTSEL_HOSTONLY) |
-					   AMD64_EVENTSEL_GUESTONLY;
+			amd_pmu_set_eventsel_hw(pmc);
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
-- 
2.52.0.457.g6b5491de43-goog

