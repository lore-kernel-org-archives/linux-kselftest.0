Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE5237649E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769729343; cv=none; b=HIbXdhcdZjH3K9bkHRMftiE6entWtWCvsvv7pzSwcAIZbLW/fF6MOgIt+uOsmL3xgFDdl4SNfKjlIb+ed2/i1s7z2FqCzIN0DeY4G3makR2QGT6LXRh4EGG7A0Jena1wicJXzJIdD2fCg1I+rc69gHrBuwvjixPBpiMD1OIbtG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769729343; c=relaxed/simple;
	bh=+Ao85fypcu2LNijyP/Yd5fo6qd6PkBX5yK78fvuZH0w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PHK4A9EEJI2MwX5y2BX+xAwmiGHRj5B57csBvHDg0ie1Ne6qkxZXK02rcHYIo5GtF/ot5l8OJwhH0gKq0plRVgMW0lgOlG9Ao539quoGYO20iSux7fhqtArjYaA3o9FlQ/K41Fozhj8ah1dC3mOnpW1UmpLpgyBn8xKE8xB5nvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=20pkHTul; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="20pkHTul"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a0f4822f77so40959805ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 15:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769729342; x=1770334142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1eDEoFXt8XkhH54WsqjXw1OZHZdHjK/gtE/fEZN/Ec=;
        b=20pkHTul9/hGC7Eh6DAkoGPNFr1CkJm5J3ZAJ74gzu46g0/+2EGO8koOftBtqvBvP0
         D3W0QHJT2zJyk3IuZvXL9MfnBfbc8ugMG82Z7c3foQkZGhxVAr0Mbg7J6RUowOYXwNOC
         xltUkJvNNuf1cVXR9Mi3QTw8/QnWTqIeHSK5+VHu7DLVkfbYeIIdLxY39Ep9yxkSk4nK
         DGClBLOHqMjvrvqM0cjauuMK4Zz+A8A8XlG2HbJL31y6hucbpUl6fvfqlbnuNIQAMT6U
         KWFo/caqz899Rx+v21s1XfynTujrOwj9FeA8bR84OstUfJRBsBxfBi9+T5ErZ9pwv0Kn
         rIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769729342; x=1770334142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1eDEoFXt8XkhH54WsqjXw1OZHZdHjK/gtE/fEZN/Ec=;
        b=NY3/LQkrRCt2ZFxL36tQjDVHm3BU0nz8LXCuKO/9O8ex/MQrTcCLClWBO1OfIHxhef
         XzbUDxFyqCuxuOmnZ9I3CsbJJX/mUi5Dm2OJYLPf6XpqzLVhpTJSmEBzWDyZKEIZa27n
         rafiAWIlIC41nkc75ZAlNM1vJB9qYaDi4wWcoarwcSfoRDdNy1kasW5YSfWn4ilRc2/C
         WEQE3WWWrbCAvYN4p0xyf2Xmblaz0xOZBIzBef5jPxQP9xA4PzHEHvRINyDBfeSyIl1Q
         Cd28QnArBwZL4Wt1mfwn8hZFVRg+feMaaH3CclzkBDgW5MdSih98os5VM6epO7tJQTXt
         kq4g==
X-Forwarded-Encrypted: i=1; AJvYcCUiyU9ieMDPJQ/5iqbmhwK29ZajZkgshXvmvEyWXNDsiT/k2+LqViz+mYc1q3zDazJ7jh/+4XEoKnAU5B4oMKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt+TMWcxM4sP02gbvVmOoRZFkITj3ICJXGD6KnkotGKV9I89Nf
	81ACIxvp2CaFDsHozrjJHtrFvJtnzOGKhkQuOmgXgP8m4xBiVRIj4pbxqVgxdNTLn55a4mEDCJE
	o82dNQapkd3RaDQ==
X-Received: from plcp2.prod.google.com ([2002:a17:902:e342:b0:2a5:9a63:12d0])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f552:b0:298:5abe:4b1 with SMTP id d9443c01a7336-2a8d99469cbmr8037505ad.52.1769729341586;
 Thu, 29 Jan 2026 15:29:01 -0800 (PST)
Date: Thu, 29 Jan 2026 15:28:06 -0800
In-Reply-To: <20260129232835.3710773-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129232835.3710773-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129232835.3710773-2-jmattson@google.com>
Subject: [PATCH v2 1/5] KVM: x86/pmu: Introduce amd_pmu_set_eventsel_hw()
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

Extract the computation of eventsel_hw from amd_pmu_set_msr() into a
separate helper function, amd_pmu_set_eventsel_hw().

No functional change intended.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/pmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 7aa298eeb072..d9ca633f9f49 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -147,6 +147,12 @@ static int amd_pmu_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	return 1;
 }
 
+static void amd_pmu_set_eventsel_hw(struct kvm_pmc *pmc)
+{
+	pmc->eventsel_hw = (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
+			   AMD64_EVENTSEL_GUESTONLY;
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
2.53.0.rc1.225.gd81095ad13-goog

