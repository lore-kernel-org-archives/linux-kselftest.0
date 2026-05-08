Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D8410D00
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260049; cv=none; b=SCaPqpv5d1ULz/psagUSKFTNBOwZRwEf+OBHhMAP3SrPiTluDlMe/SBgIrp17oIRgG4K4Yqfw6oboe4shsPr0T3yzXlNTfbtna4qWYne7K+TzoRreSvDiJhSK42YVxZWe0qjHTjjUyfPPn+2ZGINKS+NjG3OsW/qCKB+sQNtlSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260049; c=relaxed/simple;
	bh=+26E9CbE37jv7Fg8ytpJOSAeNgt95r8WPVH7/l19efQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAKXmL4rswKqHuKdcB3VPxmtlNWpFbeRppHObtYNhtv8CNbtsmndj4ru4wqv1Fu+Yx0Y70ga7dJh9Vq7vFlVTA30sYHB6aUq1nQZmJITYrE7O6q6nlOvk1MXr2Kj19wVJBtvocUOG6KU5FEGFfjBBjX9coAOHAaL2vawsLAuJhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JUbccXuF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JUbccXuF"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8234c06a10so1165786a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778260046; x=1778864846; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQE3P6HpTGBqI9wxzvuYOH/BPNcSAUGenCPQXQBGxb4=;
        b=JUbccXuFpfN8x6JYnGudaDa7B9u2huAYx96yiME/J8Q7Cyrr5225S3lG72ju11ylkF
         f9Zy/9G1fRv702//9cCPaS+buiw++j6umwEO8cfw/esD28lbbhD+oGJLHe7/SWSSfAHd
         LL6iDJn0zOJiCbNMvRSThOA1pLG8rf/nnfJ0geKO5kz1sQH3EQw2WrlfVJ1ioLsRuDkL
         gxHmtsewZc9I5n1nRxNYX0Lyh4q3yYPFruDO+zfGrE3PfzknkY6fgVmWYngRU54ikPSd
         nMbcV7FuiwsjezEFQmCd//x14bMqdFBPPfHgO9oT3So0UpGZPJW1gOUuC8E7aSUqtWAI
         /R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260046; x=1778864846;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQE3P6HpTGBqI9wxzvuYOH/BPNcSAUGenCPQXQBGxb4=;
        b=WxT3VDdkcnc6lPhhhU9pCmLHUQKK3l0/Zs+VGQBrYHDUPLRGjlUrgQbV9WVrtZWulY
         4VT4Yr30u5GMLrEEWi+6lVleBo8t66e+6Y7urR7FHC8GIbaD3+8HQ0ciLRsy2dssisDd
         Datdykd71cpn8LW3yVwJo8Q38GLpkf+KpNmfUClPPN42HMuec8STlwAAgvM0oveiFuu0
         R0ARYH9Z7GES3P6Q/OdPkr7TVyUEGuFh+gQwveqOi4SXxFMNCBopTsHDzcTg51+qyrM+
         J8mSFUW3cFNjmRtNacnKBfMB77l9++5x7+n4xm6NWAGcAQ5+Dp54zhNOnvVEIZ4qSKbs
         RQtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yV3L5/D1RbUAmTSrdTO1w2JvAyaqgBO/h07jPmlQYjx8JICqQ29ALdG6MMAbzO1GLk3oWFVjRTjbg7vq1j8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHZjpHYk0LEUJFiPjuGH9fje9YTaNLPpS/5lxLGSyFKjlHGh7
	+zpedEZbOTBQL9g/QYpjs1spn9sypBayu+e9qZP/5+4Pe38pgwWMhlFVirG+LBm42HSaABAFNaq
	C0Y8vlP7B4C8aDA==
X-Received: from pgbg18.prod.google.com ([2002:a63:5212:0:b0:c73:bdbf:6a66])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7d86:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3aa5a9b09admr15325660637.32.1778260045679;
 Fri, 08 May 2026 10:07:25 -0700 (PDT)
Date: Fri,  8 May 2026 10:07:04 -0700
In-Reply-To: <20260508170714.489136-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260508170714.489136-1-jmattson@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260508170714.489136-4-jmattson@google.com>
Subject: [PATCH v2 3/3] KVM: selftests: Update hwcr_msr_test for CPUID
 faulting bit
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add BIT_ULL(35) (CpuidUserDis) to the valid mask in hwcr_msr_test, now that
KVM accepts writes to this bit when the guest CPUID advertises
CpuidUserDis.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 tools/testing/selftests/kvm/x86/hwcr_msr_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hwcr_msr_test.c b/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
index 8e20a03b3329..5357281e6e4e 100644
--- a/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
+++ b/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
@@ -10,11 +10,11 @@
 
 void test_hwcr_bit(struct kvm_vcpu *vcpu, unsigned int bit)
 {
-	const u64 ignored = BIT_ULL(3) | BIT_ULL(6) | BIT_ULL(8);
-	const u64 valid = BIT_ULL(18) | BIT_ULL(24);
-	const u64 legal = ignored | valid;
-	u64 val = BIT_ULL(bit);
-	u64 actual;
+	const uint64_t ignored = BIT_ULL(3) | BIT_ULL(6) | BIT_ULL(8);
+	const uint64_t valid = BIT_ULL(18) | BIT_ULL(24) | BIT_ULL(35);
+	const uint64_t legal = ignored | valid;
+	uint64_t val = BIT_ULL(bit);
+	uint64_t actual;
 	int r;
 
 	r = _vcpu_set_msr(vcpu, MSR_K7_HWCR, val);
-- 
2.54.0.563.g4f69b47b94-goog

