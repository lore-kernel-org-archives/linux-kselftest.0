Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC739B949
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602425; cv=none; b=eHCGHDtKh6rFdsRccRk1hKF4bpXTP4fKqrBEsQGsa2o4HRUouZH3nGd+HcNvZ4EU5dE+POVVHxnnKnDFyQoWW9syhwPuANY7N4MGiGXQNeJIsrr8b2k+SbSQKdncGXDme+ekBVWn0ALAV58MjwIX/AP/yFLujmZBkqodFCCb3hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602425; c=relaxed/simple;
	bh=xEdNtFfkTI4eqQ4AvZso/YR6aXylBm3RqEOecwl+DWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk7puPsWXsiCFjlio0EEPH+cgnSGBeATT+6ZVMyyCuRVeVt+fC4DJn1HRmm69bZGddE+x7yXbiNYGXNdRevRqofWkTb9PxZ139qz8whSL0NGJ8jBVA4Om4pUSwRnQA974qSlqtJC0GETS7iSTwCStkBDExsQEX2uZuR9qGlQFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVXl0OJ0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVXl0OJ0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso12010126a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778602421; x=1779207221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tC71bm5vhDNsZ/9yQfswbrSvXoDAZ/5TWImHjuQzSTU=;
        b=aVXl0OJ0bU6sqBU3qeWhZnFFvGSQxPqD6TV8N5cO9SkhoLt4biArNp+p+ffkczPLNx
         NeIvqttW2TH7Ni1nbc/f9e78/ipwZLmoBQ5+x42iqSflaSQf5rdyxgDDWRlRL3QlWd8M
         eWi1YRfhDu3z+DnCUu4EJWWKBzdDoxAV8rc5g4UvdaY6iNgJEtT4p+NKazwRUCiV2HUp
         acXcgIULoMzZtpyPxkc1k4AxrHiDoMEpQNcZ8xmy9XTvwmT2FPH9nKZNqO9p5I3dXpba
         I+f/nxjD6KzJ3kUYq4Xecgfq4eGQQ4KINUdJZrIulwN9gv1fXI/rsf63AfwG1UgtZi5T
         WDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602421; x=1779207221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tC71bm5vhDNsZ/9yQfswbrSvXoDAZ/5TWImHjuQzSTU=;
        b=bRsPi7oTEcrUeApG2nxRXCxJi/mM1scQXpla/yNmVlU7sfnJjRRGFIPEBiYI0vvZ4T
         ef21ItVpMP85xo2K5/EdDKm3tVVmLsPaEigIfstVbEeJ2tns9GEjyWszV56iC6vHYU6F
         nXPaUQdn6qNe/Xi5x5PxpG4zuBMyJAGYyNyMfGkyskA8dCtm3fximc9vEzgfUgbNOVIB
         sbWfj2DxV3w0sq6OCnhvSMTATAkK+X955sC45ykK6fpspqMTYN/L2n6wb8zGzwJYlMeG
         QsGITJEkHx3S0SEelHywGsNVW6Gv2hY4FFo2+NNLUfk9o1hr1tX6YX/yFi+Vp1waXLl2
         lvHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y9av/logHmbNobzee4AcDkgsElipsUCNVDl1umufST8bST4b0aFeghOaDXHPwWYIptyVsG8uEUtvQhmweccE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7paaNNlLtDC5NqbvTGyrYziWim78LhbKSvXHvsKogn9l4fYzw
	Zb6ihuW6kykUY2gLUANcPkdzPLFaeEdGM91u6SXUQicmzrXCDOzvbyMW
X-Gm-Gg: Acq92OFLx8PBszU7mN5RYRohfgy/sH79DcA1mZPzZeXrjD32+UjUEYBQ8DTeozvfqHb
	cy2zvcn+BjpkFm7EuiMZgoUMj28JPPBbXtXVCQasTXhl8sWHXmrgEuHjIXxb+q+SlQuPjxjMJ5i
	cACoE+uhIZJH11uhuLQ1dze8cCb2raZEPXjj3QvZJohe8HM4kRkJmdcLgifRA1P8XoCjzf4S64a
	eZ1BEtKzyDfCT5yOSft7K1klMqaoRT5lWCMRJ+PSURO7QHr5GtNNHqxv1svVeocVPA+mswIi6iU
	1cPM7fNmzJCGLckqU77qpkONiaYdidl7BgBOCipi3Sn1y7ch1PcHiADuSGFb+GFv6L7XvBY0iTj
	myohJKyegyI19HmLieAspVbJhi1z+FplIo6Ih3sSC4RhblzcO39h058S7SJWgqiuwsMBnWI2h9W
	ykhKp4i+F5COnglpHMMl8L2B75WqZCo5fmuXoIn5XdUsNXMDa747DnN7d4Wo7z8a0aR7mUkeFJE
	3Tqv76N8HIJRcrXrOYYrf/xW+A=
X-Received: by 2002:a17:907:c30a:b0:bc3:a0e9:e0c with SMTP id a640c23a62f3a-bd23b406da1mr320704966b.13.1778602420746;
        Tue, 12 May 2026 09:13:40 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfb7b17d1fsm357354666b.41.2026.05.12.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:13:39 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: sync_regs_test: drop stale TODO comment
Date: Tue, 12 May 2026 18:13:17 +0200
Message-ID: <20260512161317.2580678-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agMwjrRbeuJsi9OC@google.com>
References: <agMwjrRbeuJsi9OC@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO asked for a build-time check to guard against missing new sync
fields. Remove it, as code review is sufficient to catch such issues.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/testing/selftests/kvm/x86/sync_regs_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index e0c52321f87c..5b0c2359bbb4 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -255,7 +255,6 @@ KVM_ONE_VCPU_TEST(sync_regs_test, req_and_verify_all_valid, guest_code)
 	struct kvm_regs regs;
 
 	/* Request and verify all valid register sets. */
-	/* TODO: BUILD TIME CHECK: TEST_ASSERT(KVM_SYNC_X86_NUM_FIELDS != 3); */
 	run->kvm_valid_regs = TEST_SYNC_FIELDS;
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
-- 
2.54.0

