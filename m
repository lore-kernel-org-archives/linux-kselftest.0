Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B952ED30
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699391; cv=none; b=K8lNhD7O6dXORRR2UAa6b3uWcZvQOCdE9vcPvCs6o2ftf/hjJ1C9nG61UMsOJW9Djc4wAH8C4Bt0+iWgBghI5wtxpTV6KLErAjgW8d6nsDoSEmmchb6AQzSkZt/6PmjN0xbQMAKochlAfNmZU4XZMkYhOBn4d5uW4ZWBDG5w2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699391; c=relaxed/simple;
	bh=at9caQSNlDirzi19HDDan4Y2L3uJCRt9I9RlxktvPA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUPRPG6AvkRqldKNRk5QqpAWPGd9QTzEcEQBcRjnZbtyyS7T4iloWcrfutKKPsPby3wJtuLhAi49UFbsXVG2kAFZ6++JgKNP2zDb2eiAoQ/ikq0hXfiLLa2GwBiYPGRU5TVspAuH7tOLna6gkveWkca4HWVqzGxq6l9LH1dAO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBR5IXRm; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBR5IXRm"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so622393a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699389; x=1791304189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=TBR5IXRmomUpK6uuo+27sfEnZuB9z+QyyX8PQNBGyA9EofMqSFJ4CzTvYilbflTLXA
         YDkJQ5KHZezf3pP9kfsLw6h7c+Yd4wXq/ktDQHOc1T+4De2u5ufNhg8qIKOzPNkJ3cYL
         QXoprhz0+JkE3Tm/YlJQwtsqea+JO6yj4KimQ6qQdPGOb2bI/+/A8eB1+1wxZ13JNTdc
         vy3XSsNm73eWblGUVQapLKtnO7uSEtCeTkzB6XjFfonUv/o5DzePowvWRO1l+87W1kQ2
         wRJFgz0Ukunx3Avf8/n517AgyLENjuSLwpUXVnN/2BLmEZL23W+x2Dz3hvZ9t9wGPhev
         soXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699389; x=1791304189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=hSHlJfWQ1M8SC9+UY07w4l/VZdTG2qqvf+eaAqa7u7BH3VLaphz/4NO6vTK6W5r9Mm
         +GwNpfoLLRwvnCAZYltMbrK6T+Y6vJr2hSohTPtmjPfTcWjyZ6C0R0Y3sLA9wBjceWeq
         PKuPCKzZ2E48yRlJnuWenOOYz9fVTFegz8MTcS8eq2f9qR23sUkdxfYJG5UxXhAev9AB
         SAMfEI4j8vKQuaN/M4z5kadJ1rfybMVHizI5CAzR2cXStoFjsHOAaQFEGu4PQ5CloMpE
         kxrSd1InJlh4Wt6s5mRAPbEA1Fckva2yCOrY5PZcv8i9qtumXaKeRcZ0sarQDrVtLHu7
         qUTg==
X-Forwarded-Encrypted: i=1; AKwUvBwxUDNuno+nHIrEJqWaXx9eufrXAr7gXvOrFadL5S+4N+oRGSXMfOP1/QzqKQLE3RCcqrRdU4fc28uFu1C0gGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/ee8u+6O0vuf0pYJryyNljTocZRvkXhdhceca5nyfDAgWC/LI
	pgRHiDiIzNv7Iim9eqQbbeoLkFj+5DRlNK91BxpUlIyJOHKog9wqmmc7
X-Gm-Gg: AYBFou0WyW8gH9Q55jUEMTaXmA7ccDsH4hV/9QVstQmHlQtprEbZ7wK+EIa33D6y/J+
	8InK6SVK88w+H8V1a7H0TAnJ24izRA+9l247BxzEEQx0pY/wpTc60slIHKWrrhUIQCkLiVxPnj5
	my9EDB1ukHwBD+1OjShCNfSi8uDnVwwygw3bYo62njCgkd7nYv3+Vu46qPnfnQD8KfWc5JYYLVX
	6f+TK/aLTJXj3NK0Mi5rmmr1B2ycba5UByrCR9J8AYYo1IvkglDReCddkmZpDDn4W+eB58XR4ii
	TCBRqP9SMabSUe2J/ABsqxc169hdVMTlYLhz9H4+6qXgZLmGujod+qZnBRzSVgvglCj36xnQ8WP
	c3X+2aEQD7CrD5U44MqIcSv1EazQdrEsISzJSZQJW+paCjBll5o0K78SsTyAdkoSuEqzHDS//43
	thj+VPU0o2kzGrCgtwm/QV6mspWIK2qFMVYlO8dj84V1SeWvR451itXPZwXaobAcfKbS4zJWmvH
	07cltmb0MLTeNfISX5fQQ==
X-Received: by 2002:a17:90b:2882:b0:3a4:b8fd:5d67 with SMTP id 98e67ed59e1d1-3a4b8fd5e29mr379785a91.50.1790699389050;
        Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:8c3c:36b:3374:1c96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ecef67sm6481678a91.6.2026.09.29.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:29:48 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on non-canonical FS_BASE write
Date: Tue, 29 Sep 2026 23:29:40 +0700
Message-ID: <20260929162940.14610-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msr_filter_deny test covers the FILTER and UNKNOWN MSR exit
reasons, but nothing exercises KVM_MSR_EXIT_REASON_INVAL.

Have the guest write a non-canonical value to FS_BASE and verify
that the write exits to userspace with KVM_MSR_EXIT_REASON_INVAL along
with the attempted value.

FS_BASE writes are passed through to hardware, i.e. a plain WRMSR
takes #GP directly without exiting, so use forced emulation to route
the write through KVM.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
v2:
 - Use a write of non-canonical to FS_BASE value instead of 
   reserved EFER bit 63 because writing non-canonical can't 
   become valid without massive architectural changes unlike EFER reserved bit
   (suggested by Sean).
Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
---
 .../kvm/x86/userspace_msr_exit_test.c         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 2808ce727e5f..40b084cba2c0 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -309,6 +309,14 @@ static void guest_msr_calls(bool trapped)
 	/* Invalid MSR, should always be handled by user space exit */
 	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
 	wrmsr(0xdeadbeef, 0x1234);
+
+	/*
+	 * Writing a non-canonical value to FS_BASE is rejected by KVM, but
+	 * FS_BASE writes are passed through to hardware, so force emulation
+	 * to route the write through KVM and get an INVAL exit.
+	 */
+	if (is_forced_emulation_enabled)
+		test_em_wrmsr(MSR_FS_BASE, NONCANONICAL);
 }
 
 static void guest_code_filter_deny(void)
@@ -627,6 +635,13 @@ static void handle_wrmsr(struct kvm_run *run)
 		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
 			    "deadbeef trap w/o inval fault");
 	}
+
+	if (run->msr.index == MSR_FS_BASE) {
+		TEST_ASSERT(run->msr.data == NONCANONICAL,
+			    "MSR_FS_BASE data is not NONCANONICAL");
+		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
+			    "MSR_FS_BASE trap w/o inval fault");
+	}
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
@@ -667,7 +682,9 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
 
 done:
 	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
-	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
+	TEST_ASSERT(msr_writes == (is_forced_emulation_enabled ? 5 : 3),
+		    "Handled %u wrmsr in user space, expected %u",
+		    msr_writes, is_forced_emulation_enabled ? 5 : 3);
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
-- 
2.53.0

