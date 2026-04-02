Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92D3D3007
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 22:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169087; cv=none; b=tnRKW4wuD36IV9ec8j0Xhnw9G4CyvMgg2uML0TpfuJgk5yi5vzAvxLnsUJaGAZ4IJj8hprJ4lWjUIaFvyjOXpVX6L4TIgyqFy560div24p6CbfM/kpSqJAhrOGycRb7Blh4c2K7dmu7HP4zwTr3yyAPW4P1g3Lf754sLXcS3iSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169087; c=relaxed/simple;
	bh=ZaLZ5gQqr0147GN/Lc0DeadSAPS83YIjQ9YpwTgNBjA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BG5MVzwm9tSGpBl9A7VSI2G+BtDtL8/VpHHyC+ak/I6bzaH+oVCg7h/J0GHV44ODEN34ENcoiI3/z1zlpR8+D/XZDM4wypvcAbtoWo2PwvKXp2jxymrqNM/ofhjk6r7sP8L8F3wd2ycnNrgUroA+PbEuJjjDX0IqZU6lRQ3jCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AWf0Ll8a; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AWf0Ll8a"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c7691378914so570505a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 15:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775169085; x=1775773885; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EitAmK80FnP6W5boJ91nHb8aM9ZxOtPro7KbAdjZ2GI=;
        b=AWf0Ll8aNN49x6DpK9pcXuU9v1V5wEBF1A4EJgoW410iwKEr9M6+RCHO/75NBUMksl
         Q3YLsMRykj4uqDk5w1rRRKgC5oCSyHkB5OqRclzS/gt7GfXFTFsTcPak7QvjeFFL1pDs
         EvleWaccyfLEh0MMz6wEioy9CnB1BYUTzCUOlGArfcw1qlRy5iebQqMhn2spj0pizvBC
         2CcbxboN5JpAAkJtLjt2nCVFV2Ro7ZzcHvUreMxU5DTPxqMqW5gmR31G+wNaALsjwFAP
         rKkhj0FRxV/1u4AuDTAM/CGKdEapnE2jEKk5qJITykMXjIseUIAWQyPKi0IQwuMTh+n/
         0X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169085; x=1775773885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EitAmK80FnP6W5boJ91nHb8aM9ZxOtPro7KbAdjZ2GI=;
        b=Tw4WlsT5L/uuMXyxZ9/TDV8C+OXW1TtlIbE9z7hfwF1LtKnY1cXMLVfxrWBN6/O/aq
         ++x6hhkdGvvj91s/mUG/kl61C6hxRmMs0EtuMbCW6gWRg35qhEN7KjBYl3kRBnr6ZDAE
         ZA9rZRA6io/0YF0T3vUK/4T58zliCu6KoNJoZ5PgbCM/iCL0VJjNpE794RvC+abhm6wG
         qL8gYVoz39/EsFRSaMmiLpVPYLmt/bInXp4cDxvgAAL+JLPvui7K1iqPb7aoaoO9leEf
         qsHyHab9JQyVuSJ29XLqu4cNiAnBz9p8vM75WlrBCCooPnlvzhp1t9Du5pw8B5OF8mSv
         zXfA==
X-Forwarded-Encrypted: i=1; AJvYcCVHPVHBdjyLA4urbGF4U+GdtGeI/1og6NX8ek961FBTq2QenZ7t99w9qw7v0oM3712QllMHDN1pCtTw8ifXNrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UL3milgNhzADpb6bXutrv7lWHlVmZZMvfIRrx5qzSyo2Q0Fy
	lHAbKaXqh/AkEEISpfGd26F8ZiZAqUuauQahgaz8f/dhifysIC5RdYxTqImG3nFv22XOc22FxU/
	PCZWqzZZcOb0ZnA==
X-Received: from pgbdn5.prod.google.com ([2002:a05:6a02:e05:b0:c73:fbb5:af1b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d9f:b0:398:b178:a53f with SMTP id adf61e73a8af0-39f2f07f434mr520986637.40.1775169084899;
 Thu, 02 Apr 2026 15:31:24 -0700 (PDT)
Date: Thu,  2 Apr 2026 15:31:02 -0700
In-Reply-To: <20260402223108.650572-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402223108.650572-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402223108.650572-4-jmattson@google.com>
Subject: [PATCH 3/3] KVM: selftests: Update hwcr_msr_test for CPUID faulting bit
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
 tools/testing/selftests/kvm/x86/hwcr_msr_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/hwcr_msr_test.c b/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
index 10b1b0ba374e..5357281e6e4e 100644
--- a/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
+++ b/tools/testing/selftests/kvm/x86/hwcr_msr_test.c
@@ -11,7 +11,7 @@
 void test_hwcr_bit(struct kvm_vcpu *vcpu, unsigned int bit)
 {
 	const uint64_t ignored = BIT_ULL(3) | BIT_ULL(6) | BIT_ULL(8);
-	const uint64_t valid = BIT_ULL(18) | BIT_ULL(24);
+	const uint64_t valid = BIT_ULL(18) | BIT_ULL(24) | BIT_ULL(35);
 	const uint64_t legal = ignored | valid;
 	uint64_t val = BIT_ULL(bit);
 	uint64_t actual;
-- 
2.53.0.1213.gd9a14994de-goog

