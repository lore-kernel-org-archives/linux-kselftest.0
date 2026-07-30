Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97C44D6B4
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435879; cv=none; b=cPNTL2kxMTEi+ttoR/rw6YUk0qj2KR8hPwdvqvKD3KKz8bg6bmOp2dotXGlejLDUASh50g/4inudq3/JlnaSsob7ITHUK4lwTVJuqN4/HJTPU+m2aNDNK8afGEwB3HPPRw4qNLyMSRyWln8zpsVC0fhxmv3bAEhavEcunZp3KRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435879; c=relaxed/simple;
	bh=9sV36zm4Pp0vB7jfMDxNs36acLATXLKZM+RqCQGuQ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btEEsvsZos680YfQkUTA2aESwtDyilVF4c3jQZOoB0p+evYjtPtB0vs6M7D0YL3TYsCHbSPNpuvlOS++dSKJ+WVz4QkaR0NZei5fjSrGTkaggDz6my6J/NMcj/RXlJf1DJ+mWRQH3/rt0qlTaajmalHSC1NGGQcWdAYwjqJeK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lA4v9oif; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lA4v9oif"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so687445e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785435873; x=1786040673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbirN5OGmG09g2d8b+3odPVgp6feGkgDgocLsc+TSTY=;
        b=lA4v9oifTrmHcH0q9YjSwQFIx8ZCeXR9qLlohFodYpAW0KpLprAw/teOU2VwGVMj3T
         FVNO73xKVIO1Vt6ylTLLKBpKJRn95cSP7sgp5SrP+nk5UgB5OQRolhRInRv7JmARllxY
         wWl6+vNgl1KYeodD8fncqEsKmL6hkfZdLDTW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435873; x=1786040673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbirN5OGmG09g2d8b+3odPVgp6feGkgDgocLsc+TSTY=;
        b=N+tqzTnXE1rlo3EyZybIgveDFACnHUtLxF3ltzHaYZtWiz/zhSNQTF1S1gRI26d4pW
         gOoPCAigwLvZ8BVTp4eTVPirWr3xRSDzdb5C3CBa7pkiwDqA8U/TPtd+ZTSPbNpugZlV
         4tCts0alqWM4kwT74G8GInP2S1Q7XRc2LfgpEynk8spVoK6jZLoKhejG5H2Wsvd0Dd2D
         cbnh6RPG9FavW9rMlrjAflpcU3u7Ualx0IkXnFnrhHSA4pmz0p0efLq8qNhIrjLZnJVN
         Rxrh/NFfWq5Nhp86i3TMogNKOBAm92ERcenO9QKbwh+TQnWOxm6zH4fRHccmIJFsl3zb
         YsMg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9wvjpHoc7zhtfUgLkniQ6Pf2QulkKMAvTWbL9ykb4+PWAUYGS4BgXpnNehX9+afb0p3PPWDgbL/VjUdd7LwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPNDk50mZ8Vg8d4TOTvBHrPJCsg5Jt+onLGmLmYmbwgc3/8db
	eMa/Fs3aeh4V8B4loupXTckTQJFCTIq6SXknaEFZeL0pfF76iSuGD5MfBMqmrxCw2A==
X-Gm-Gg: AR+sD12I6ff4Vpi+1W6mnBnBlf79KV0p7Wbf7aRkJeMvkgzWMq4VDic89d/9oTMPRyZ
	iYEJQ9mdU3+TSFB0+PbKxDOjAdPPcRboatGZRRzkcyHQe7YtmwB02fEiRvg/UvcGhuwQNhB7Ete
	zs/nRIN0VJb111MGOC/Jg05j2rN9yx7m8WtaKBsXxdu+mTBWCvCLG11d0cCQuWc2pbqP94Kn6kK
	9JGeoh8b19KrNxwvT7eXwm61viFWVhrysvoMUD9SGND1sHZ4S5xa8Yk93Sj0dWVKkKseXc3Okqu
	ou2FXBxy+y9QhalVbKTDyX6yBScbhOzZrH0e/vyUmXzYTFo5EMgwk5D5dgYgnJupcZSOe13AcH5
	KK1okGGNCYdzRU9VwWjXFapzIDY7N7tY8rD2se3ZSY9ndcNFfXD78octkog9kRbmPKPKB4F1JSw
	em8zSTDRtLWaWYu+tLVYYzR1bi/CsvSjvJnTCzJ6FKhduPfJ7+OgdOTjEB4WLWVKTJJRQxvmnq6
	RJo/dUsOxOXXBdI6OzOg36Md4cBW7EAT0F7NybFlDRuLnZeR/Q5JBo=
X-Received: by 2002:a05:600c:6099:b0:496:c18c:f998 with SMTP id 5b1f17b1804b1-49800ea2197mr53831885e9.19.1785435872774;
        Thu, 30 Jul 2026 11:24:32 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm84008685e9.14.2026.07.30.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:24:32 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mathias Krause <minipli@grsecurity.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH 1/3] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
Date: Thu, 30 Jul 2026 18:24:23 +0000
Message-ID: <20260730182425.1223530-2-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260730182425.1223530-1-dmaluka@chromium.org>
References: <20260730182425.1223530-1-dmaluka@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM_CAP_MAX_VCPU_ID is (confusingly) exclusive, i.e. the maximum allowed
vcpu_id value is KVM_CAP_MAX_VCPU_ID minus one.

Some tests in x86/max_vcpuid_cap_test.c and kvm/x86/set_boot_cpu_id.c
mistakenly treat it as inclusive, in particular, assume that setting
bsp_vcpu_id to KVM_CAP_MAX_VCPU_ID is valid and should succeed. Fix
those tests.

Fixes: 4b451a57809c ("KVM: selftests: Test max vCPU IDs corner cases")
Fixes: 438a496b9041 ("KVM: selftests: Test vCPU boot IDs above 2^32 and MAX_VCPU_ID")
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 .../selftests/kvm/x86/max_vcpuid_cap_test.c     | 17 ++++++++++-------
 .../testing/selftests/kvm/x86/set_boot_cpu_id.c |  4 ++--
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
index 7e2bfb3c3f3b..43f16c052de4 100644
--- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
+++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
@@ -30,22 +30,25 @@ int main(int argc, char *argv[])
 	if (kvm_has_cap(KVM_CAP_SET_BOOT_CPU_ID)) {
 		vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)MAX_VCPU_ID);
 
-		/* Try setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID */
-		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID - 1);
+		/* Try setting KVM_CAP_MAX_VCPU_ID below or equal to BOOT_CPU_ID */
+		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
 		TEST_ASSERT(ret < 0,
-			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
+			    "Setting KVM_CAP_MAX_VCPU_ID <= BOOT_CPU_ID should fail");
 	}
 
-	/* Set KVM_CAP_MAX_VCPU_ID */
-	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
+	/*
+	 * Set KVM_CAP_MAX_VCPU_ID. Note: KVM_CAP_MAX_VCPU_ID is a misnomer,
+	 * it actually represents maximum vcpu_id plus one.
+	 */
+	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 1);
 
 	/* Try to set KVM_CAP_MAX_VCPU_ID again */
-	ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 1);
+	ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 2);
 	TEST_ASSERT(ret < 0,
 		    "Setting KVM_CAP_MAX_VCPU_ID multiple times should fail");
 
 	/* Create vCPU with id beyond KVM_CAP_MAX_VCPU_ID cap */
-	ret = __vm_ioctl(vm, KVM_CREATE_VCPU, (void *)MAX_VCPU_ID);
+	ret = __vm_ioctl(vm, KVM_CREATE_VCPU, (void *)(MAX_VCPU_ID + 1));
 	TEST_ASSERT(ret < 0, "Creating vCPU with ID > MAX_VCPU_ID should fail");
 
 	/* Create vCPU with bits 63:32 != 0, but an otherwise valid id */
diff --git a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
index 8e3898646c69..1c4ebdf8e82c 100644
--- a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
+++ b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
@@ -39,8 +39,8 @@ static void test_set_invalid_bsp(struct kvm_vm *vm)
 	int r;
 
 	if (max_vcpu_id) {
-		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(max_vcpu_id + 1));
-		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID > MAX should fail");
+		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)max_vcpu_id);
+		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID >= MAX should fail");
 	}
 
 	r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(1L << 32));
-- 
2.55.0.508.g3f0d502094-goog

