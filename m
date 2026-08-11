Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D6322B6D
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421357; cv=none; b=HYzMVG+/2VZyzopICwC1LbTnE+LwEAKiYVituK+vPT/MCid8ss76PijbawAUXDSvt3Mm+PBXadjUi15H3/LY2hj2x40VjVmgkjCtAq+gUl0v1v4WPQZd1wObPqEYBc4QfJDjNe9dbLoj+DSXshXZS3OrL5mhaFVdmYjR/YFPsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421357; c=relaxed/simple;
	bh=4r96qpMJsNweRuHbWhrMwI6A+/kGgFiPkndPA4GSebI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/iIzuWa7Pce/OgMMyZThSNMrV5B1oSx5KB9Q0eaEAathMU4/QqiGpyIYuzzLqpjO4bTFePwlw8jAdokd2Vs06T0OhIX7RS6V9xOFFjrkB28ir//PXj+FrItkN06rAu1rzrKwo2aOArYQ9hu83N6Ko6aTMGSX/g5eJ2cnpJXlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z50hEjkJ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z50hEjkJ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1429093a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421355; x=1787026155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pFfoKxUGeYDD+KaCR3NP+7Oo42dFdA9+7ZCaeGWARI=;
        b=Z50hEjkJVICLGlUBKrdUm2eaQuK4EH3vLDU9i+bsjAn3GAlC6TrNC1kNp42oessnd3
         a6D4LIB48aPAKj159JThYmbegmP7yIGtpLHzjguJTRW+o4K3yIP81X1CXHLfXqdDUh6t
         obS2Lpdq0B/OQq4e4n+wxM0rcOBVNqhRkttpGs4Zoxn+ABUl7VI8QMRyoKQHQ906vpkQ
         af+xChIN1vWIItkwBv1GHNoYtBdfK2yXO/dAOXbugS1J7tzA07uF/yLS+/pknxPWD8B+
         NSAnHSCKhxAuAJ1rFKIqL0wLMSa+A0ueigIpDRQsHGL88u7mOV455OhY5ljcwL4EIfA+
         kX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421355; x=1787026155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pFfoKxUGeYDD+KaCR3NP+7Oo42dFdA9+7ZCaeGWARI=;
        b=NBV4tdDZVdD54oWk8cPc0QFaDjUBi9q5Up2vwZtaeKAoMM2Bvo2+t2NGv/6L6Xm04C
         QlJ5NiYjThOxPfhfAxMbbF3QiWsUpe6WyGY3otW7Vt3RgEtbotcGtia33ww8X5Qm1uJt
         UYmNIG/536ITgs5GKXl/FY/uSYBx60nIlrkowmB5ourXwHrxRslvSkULP+G6vOgSt+eA
         wD2CzKqqG9R4QFMY5XEbDUf2l39shs1+U6+Gy24HnIe5HnVgWWW2/XQ3ZAv6bOsWwApW
         vBc8CWv/aCIHD/1DjRStqGH/PHpqh/8hfpjoUjqvmKXWzcYglsil3mOEsGy0bB2NjkTq
         dPPw==
X-Forwarded-Encrypted: i=1; AHgh+RpN3+wY+TWHHvM+6yrC6DkqPefnYHEQZanwb8vdORqYqhCZGy/R6cifYXOznuxLggOh/KfEv+lOmTCFcZqgEB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVzJsaVDeGFKNN2hvY1SVr6lO2gt8SSRJkyb4ncO99xmDxVL8
	foC2PbgPYyVGKgbxYgFC4OXaavrMfxtb5WykzWvoWd/dmxmdQlsa2zkS
X-Gm-Gg: AR+sD1020T1oYyypSVTa+I1CGaGzqGdorKkYbEMPOZEEGtErnwUb/KKEH5g3hNYvYnd
	0JWcOMBdy/Opf1VF4RnOG6I8BpQO4ajZArAn6fL+4Fv8v1P3aEhxwivNX1X7N5dgMbxtjwwqDQW
	CvtATcULHwwOiHErlT11NK+oW6sT/+9nJStQIf/oWd8TYxSzDw3qQxWicq6mGESHNpL7VF7uRZd
	zZXyHd2sIuc6K3y+ztUrYiM9S8V5QH6rHMY2SU1T1X+DTKzaDjHw9iC7nUeCWVGXlFqwwh9ttNj
	aFauPBakvq8tqsS6LJls4+F5Gq6TV6kvUtCOAK1U1/cws/s69+X9T+42gQZ8xtKs1bw8wWVhqpO
	y7xOJJjEBkfuMx7mSXBT3Hf1bsDyoy4bONwlq90d6BX9H2UBJLAYFGBGCwjCuJvLMRsjiFkKmcw
	CjnYw83ICPgtFozUO1scEumUHgwzb9jMrS9D/cUTNUxPsHPMICTY/wOp/l2B/WqGAJSMDYN4cla
	urYN0WGMvs=
X-Received: by 2002:a05:6a20:c890:b0:3c8:d3a4:7b40 with SMTP id adf61e73a8af0-3cc2b8df2d0mr1048119637.2.1786421355430;
        Mon, 10 Aug 2026 21:09:15 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c65005accsm29307eec.31.2026.08.10.21.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:09:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] KVM: selftests: SEV: Sanity check the launch measurement
Date: Tue, 11 Aug 2026 09:38:58 +0530
Message-ID: <20260811040858.1984593-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260811040858.1984593-1-hemanth.selam@gmail.com>
References: <20260811040858.1984593-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_sev() launches the guest but discards the measurement returned by
KVM_SEV_LAUNCH_MEASURE, with a TODO to validate it.  A full
attestation-style validation isn't possible from the selftest because
userspace does not possess the transport keys the PSP uses to derive the
measurement, so the expected value cannot be recomputed here.

Capture the measurement for SEV and SEV-ES guests and sanity check it:
assert that the firmware reports the blob length defined by the SEV API
specification, and that both the measurement and the nonce are non-zero.
Describe the blob layout with a struct so the buffer and field sizes are
derived from a single definition instead of open-coded magic numbers.
SNP does not return a measurement through this path, so it is skipped.

  # ./sev_smoke_test; echo "exit=$?"
  Random seed: 0x6b8b4567
  exit=0

  # ./sev_init2_tests; echo "exit=$?"
  Random seed: 0x6b8b4567
  exit=0

  # ./sev_migrate_tests; echo "exit=$?"
  Random seed: 0x6b8b4567
  exit=0

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/include/x86/sev.h | 12 +++++++
 tools/testing/selftests/kvm/lib/x86/sev.c     | 11 +++++--
 .../selftests/kvm/x86/sev_smoke_test.c        | 33 +++++++++++++++++--
 3 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/sev.h b/tools/testing/selftests/kvm/include/x86/sev.h
index dec383e59a47..b29bf3aa0682 100644
--- a/tools/testing/selftests/kvm/include/x86/sev.h
+++ b/tools/testing/selftests/kvm/include/x86/sev.h
@@ -31,6 +31,18 @@ enum sev_guest_state {
 
 #define GHCB_MSR_TERM_REQ	0x100
 
+/*
+ * Layout of the blob returned by KVM_SEV_LAUNCH_MEASURE, per the SEV API
+ * specification, section 6.5.2: a measurement (HMAC-SHA256) followed by the
+ * nonce used to derive it.  Deriving the buffer and field sizes from this
+ * struct keeps callers layout-agnostic; only this definition needs to change
+ * if the measurement ABI is ever extended.
+ */
+struct sev_launch_measure_blob {
+	u8 measurement[32];
+	u8 mnonce[16];
+};
+
 static inline bool is_sev_snp_vm(struct kvm_vm *vm)
 {
 	return vm->type == KVM_X86_SNP_VM;
diff --git a/tools/testing/selftests/kvm/lib/x86/sev.c b/tools/testing/selftests/kvm/lib/x86/sev.c
index 93f916903461..4bfb97a0364f 100644
--- a/tools/testing/selftests/kvm/lib/x86/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86/sev.c
@@ -108,10 +108,17 @@ void sev_vm_launch_measure(struct kvm_vm *vm, u8 *measurement)
 	struct kvm_sev_launch_measure launch_measure;
 	struct kvm_sev_guest_status guest_status;
 
-	launch_measure.len = 256;
+	launch_measure.len = sizeof(struct sev_launch_measure_blob);
 	launch_measure.uaddr = (__u64)measurement;
 	vm_sev_ioctl(vm, KVM_SEV_LAUNCH_MEASURE, &launch_measure);
 
+	/*
+	 * '.len' is an in/out field; the firmware reports back the actual size
+	 * of the measurement blob, which must match the layout described by
+	 * struct sev_launch_measure_blob.
+	 */
+	TEST_ASSERT_EQ(launch_measure.len, sizeof(struct sev_launch_measure_blob));
+
 	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &guest_status);
 	TEST_ASSERT_EQ(guest_status.state, SEV_GUEST_STATE_LAUNCH_SECRET);
 }
@@ -191,7 +198,7 @@ void vm_sev_launch(struct kvm_vm *vm, u64 policy, u8 *measurement)
 	sev_vm_launch(vm, policy);
 
 	if (!measurement)
-		measurement = alloca(256);
+		measurement = alloca(sizeof(struct sev_launch_measure_blob));
 
 	sev_vm_launch_measure(vm, measurement);
 
diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index bf27b6187afa..51adf7a1e1b6 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -150,16 +150,45 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
+static bool is_range_nonzero(const u8 *buf, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		if (buf[i])
+			return true;
+
+	return false;
+}
+
 static void test_sev(void *guest_code, u32 type, u64 policy)
 {
+	struct sev_launch_measure_blob blob;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
 
 	vm = vm_sev_create_with_one_vcpu(type, guest_code, &vcpu);
 
-	/* TODO: Validate the measurement is as expected. */
-	vm_sev_launch(vm, policy, NULL);
+	/*
+	 * Capture and sanity check the launch measurement.  A full
+	 * attestation-style validation (recomputing the expected value) isn't
+	 * possible here as userspace does not possess the transport keys the
+	 * PSP uses to derive the measurement.  At minimum, the firmware must
+	 * hand back a non-zero measurement and a non-zero nonce (the blob
+	 * length is validated by vm_sev_launch()).  SNP does not return a
+	 * measurement through this path, so skip it.
+	 */
+	if (is_sev_snp_vm(vm)) {
+		vm_sev_launch(vm, policy, NULL);
+	} else {
+		memset(&blob, 0, sizeof(blob));
+		vm_sev_launch(vm, policy, (u8 *)&blob);
+		TEST_ASSERT(is_range_nonzero(blob.measurement, sizeof(blob.measurement)),
+			    "SEV launch measurement is unexpectedly all zeros");
+		TEST_ASSERT(is_range_nonzero(blob.mnonce, sizeof(blob.mnonce)),
+			    "SEV launch measurement nonce is unexpectedly all zeros");
+	}
 
 	for (;;) {
 		vcpu_run(vcpu);
-- 
2.43.7

