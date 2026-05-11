Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A9374E59
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499486; cv=none; b=LmTJWInX99W325vD6N4Sz1JazbWrYTzVoIQlOZkNihq/fAyTX1gH627oMsrHwrdgMhqDP7kRACMJ/i8UooKAcrl1MLuWOwj2lvJLfhY0dKNF7miItlehC5QpIf5a0xlJr+sdSBE7JJH7AH0swXHpSnySKNI/C3o538c+8qFI5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499486; c=relaxed/simple;
	bh=EOWmfLNuS8z2erR5IqiGNX4TFSQ82cXVDTp98cptEII=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mHBo6srRL8l8ZGx1TkVzdGLGC5YqPP0WtrkWpdeOUYM6UjbHjlQAMiEl2ohcMLlkxJ69YNBBaBziElnppwV0Nb3a2OaIsrXOXCuokR4o6M3wF00MqjNT/wZUQH2Wh0Hh4NuTK4OXNqoBWjoxkYRYOOFF7HJ2uDBN7pw+Mxlk41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jgo+LHj4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jgo+LHj4"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48e6af7a9cdso17958095e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778499482; x=1779104282; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=135gcqRF2uJesg3YaRFV8E4Vlot8XdxjYp/uZeTNldQ=;
        b=jgo+LHj4sdm92JVUYbyWHxWDVAQ1yBt/SftnMUx2G5PRVgDd3wYvbjXAe/N/7KAQby
         K6r8c4jYShhJ1HmTr9S/s/smwcQP1P1xnM4QZxw+KuF2/Z6bAGk6MaRXWRbn3hcKprul
         sONiacZkl/BEYYWxf9au5RPzcvUB9p3kVPjIVPEz2uXrQWff8RidgtK0rZrs5C3p4olr
         xR1k/m3auNgoq9XaZt+YqNeGEH/y4Lwl82nE+SWEJdrccXbc2uKib5/Xz4E11v+LQc/K
         k3g/CW9X6cLhjB5dqkGMjZFWiPu4VYrAt1b8tddROV68W6ZA6nNu5etnQajKmTNT2tT3
         zdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499482; x=1779104282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=135gcqRF2uJesg3YaRFV8E4Vlot8XdxjYp/uZeTNldQ=;
        b=PPdzwZpd6qP/8RFQf2tJCo5kRwITygm1oHgQPEfR5Q60eiANxw9z4Gt7NNSGeh3G1l
         spPk4dmGFX/JINb2VBHNPjUEFH/LkwvcwY1bAf0s5HdMzmlCTqJi0McvIHNb34Q2PdeG
         DMM2AgcPTvxKsMXo7k5mABIMP624KaD66jpUBMKY38GcXjmU88PzuEYQlsnr0ExctJCj
         P+wj8OTlrV9qFmuovl2pdSuRjdYG1izBV6XL31rS79b8uwnAoY4hyddCblpO2b3H99OO
         /JTwaqjJrJIUFDgxyRmGWTFrpJb7/SZTQ1cOxibhcV6x1ke9FH/zsHPFFcNi/RVoXWvX
         aQAg==
X-Forwarded-Encrypted: i=1; AFNElJ/UzgRwdELFiNZnlzIiZfndtFMdRqituuo5l5AOA4SaDF6f5OBUQwCLOVxFEHuRNc5QrAJYEStmHJ19i7NYALI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTXWh6RJN0jRRsIrSWIMaxOa/3wtKLXZJ8U4ZaUQXgFJ55z1T
	ai+yOyLC3LzLvT9DbPKp81+qN6820HD7dIb85LWIYVw/JltwQeGpnDroTS3SqPjcKUbSRlUDvqQ
	40g==
X-Received: from wmor7.prod.google.com ([2002:a05:600c:4587:b0:488:a6d9:e91a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a305:b0:488:8bdd:cfcc
 with SMTP id 5b1f17b1804b1-48e51dd6025mr266717105e9.0.1778499482188; Mon, 11
 May 2026 04:38:02 -0700 (PDT)
Date: Mon, 11 May 2026 12:37:59 +0100
In-Reply-To: <20260511113759.610924-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511113759.610924-3-tabba@google.com>
Subject: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
From: Fuad Tabba <tabba@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

kvm_vm_release() closes vmp->fd and vmp->kvm_fd unconditionally, and
kvm_vm_free() calls kvm_vm_release() at teardown.  A test that calls
kvm_vm_release() and then kvm_vm_free() without a
vm_recreate_with_one_vcpu() in between double-closes both FDs.  Since
kvm_close() asserts on close() failure, the second close trips
TEST_ASSERT and aborts the test, or, if the FD was recycled, silently
closes an unrelated file.

Guard the two closes in kvm_vm_release() by checking each FD against
-1 and resetting it to -1 after closing, matching the existing
kvm_stats_release() idiom.  Existing in-tree callers all pass through
vm_recreate_with_one_vcpu() before teardown, so they reassign the FDs
and do not hit the bug today.

Fixes: fa3899add105 ("kvm: selftests: add basic test for state save and restore")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 2a76eca7029d..e44223714fd4 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -793,8 +793,14 @@ void kvm_vm_release(struct kvm_vm *vmp)
 	list_for_each_entry_safe(vcpu, tmp, &vmp->vcpus, list)
 		vm_vcpu_rm(vmp, vcpu);
 
-	kvm_close(vmp->fd);
-	kvm_close(vmp->kvm_fd);
+	if (vmp->fd >= 0) {
+		kvm_close(vmp->fd);
+		vmp->fd = -1;
+	}
+	if (vmp->kvm_fd >= 0) {
+		kvm_close(vmp->kvm_fd);
+		vmp->kvm_fd = -1;
+	}
 
 	/* Free cached stats metadata and close FD */
 	kvm_stats_release(&vmp->stats);
-- 
2.54.0.563.g4f69b47b94-goog

