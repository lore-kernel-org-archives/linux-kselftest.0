Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCB4DA549
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619410; cv=none; b=i3gZNrTE/xzLTdWDhUrOTP24k7O/0nNXq/wN6GC0knN7wkWrk/+HHgAM1BGSqaSTDOjP6nknyRk1LfdJxiK1VmomPfJP54LQMD5EM8RlW0fVA9AxmZ7WkX19aWgHnwzZYWqvEoydogMrvXnGhs6jfDmH5q27EdQAP05MxSfK6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619410; c=relaxed/simple;
	bh=ZH9gUXanWZQyFamf65EPOVHin/vb7WyYMXAgD6w9ZNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4MxfjaWfGPzdisPhdD84DhE55xZCL8abAI9jpt72nHa1A7IkEhBMFC6tHit1EUxtP9KK7p+fm99Wel/jfNbho0X6+i2E/UusaB6fA3crOyLqs63zHv95GBWbtn3KJYGUSx/A/DLwRLtPGviP+t+k1CSwfh8zpH09CIT+KiOUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGH30+y4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGH30+y4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso191149a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783619408; x=1784224208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBMHzicJyGTjDx4Sp0E+AdJJQvA9nCK0HkWtJMojLZs=;
        b=KGH30+y47/VGnqs0bVScnk/1d86q02HFQ8Su5nJuowxwlDgSV4KbjPrdS1fcY2xUXJ
         SrlH7uy9jzOC858QpJw3ET5qnvMZKW7VQP4zqCl1NVbEZhrQ4qtbYp8RlEZSrAD1mnd7
         ivMmZCe6QsJ8nLUNA4BSVSqQA/sbQ8e+0PUh8fSG2v6TCKJONt08rE81uPRrWzZCGvZE
         wQAjPvRu8h2GusuN5UPn6MxHWzuuEu8YWEdYX885ID/zoCiCeQnivbnviKbhG6hmeyNM
         gKl4hghuVDQlMfQFXbPk2YszoJg+5QCDxmLvtNBZ/wmJURl1a+IBhGzSLVpjQuGNTqfa
         vBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783619408; x=1784224208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBMHzicJyGTjDx4Sp0E+AdJJQvA9nCK0HkWtJMojLZs=;
        b=cAF4RyNGuKo4Am4HEboqWOtTot2ZPnSMOq4T+2yj8/YFYGibVOiyskggo/fdaOeXWE
         5OmytimSO8H4E6WokZEFU2MabmoiaO4ER9hWbQRbeQkKDJpFAi6UuD+cduTkxaX99Wb8
         2u6HC/B2B8/9DS+/dMb68gVa/lFnxKF5eHj41wQjoyQtA92O9NQFmmZeXWsKk5Vegd4E
         8+ZdkQiUuFDAL9G59sh1Q0l+qjEnXKI2mLPZvkOnkXo63ihXz8Q9KJhLYTFHjOGuZOkp
         7nA9SpD4ZvcxpB+P4dg+yFFc1ZlJozkC9YbNfyBr9t5Ui1tSvpE0Geyrwmn2LW3k83FT
         JpAA==
X-Forwarded-Encrypted: i=1; AHgh+RpSgk0o9cKXUwGyesQSR0ab5EaXUAi2GCXK0gGlr+sXVpiVbylWNS0HmpTSWljc5+zm8VoBNb/9M0qwYu86NPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFb3hubvpti6PiG7nOo2zfcN4zvJA2yR7jlEqMMP1gEhEN/Qlg
	w4TD5GoqjIbVlJEpqWAnOO6fleTV2B5LjxkCyFCopUX0xyRAavyrwXVV
X-Gm-Gg: AfdE7ck24qollO4OfBWik9UE9CBoHPfSAt/p1enfjwAlE6/Cgplpd9RULDDHXQcCRYH
	lfX23lc2whKh5uioWYK4Wx0zumpB6NWYO+a2QbQGL6D9ncz1i+tl/0M/iCoC2tzA8hRmhfjByhz
	Zq0TLauBR4judkPw2FujxyYYVpcXoSyhVsFKtiiOJ98zYvfxQGuATxpJUy70+PyYtHqGsYxZUDq
	EYIM2qgP0eQqlnDdXWD+BNKhPN+6tjBgKfbv0Kh2XlWHaYXDR/uaoN4VM60HRMe/cUyDTXGgFDq
	AnCKqhadZDl09a1yPS+ugZKsRqAKzf7kREI4mmTUuDARai6a1tQbWGNDhB7TIcRXjybDxwnFzwL
	QRcByLU0xDUSiKvhsSiBxaIiH7JJGTNjvrzvPP0UKjQXmBSD7UNWn1+UIvGGxY0GJezBZOnr2v1
	1ZXKjB9u7ay62ZTclvYKHO2p9xXmL3OFeC37k=
X-Received: by 2002:a17:90b:2803:b0:381:abcc:c8e9 with SMTP id 98e67ed59e1d1-3893fd5f5b7mr8066066a91.7.1783619408160;
        Thu, 09 Jul 2026 10:50:08 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm2206765eec.15.2026.07.09.10.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:50:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: [PATCH v2 2/2] KVM: selftests: SEV: Sanity check the launch measurement
Date: Thu,  9 Jul 2026 23:19:55 +0530
Message-ID: <20260709174955.628913-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260709174955.628913-1-hemanth.selam@gmail.com>
References: <20260709164751.621326-1-hemanth.selam@gmail.com>
 <20260709174955.628913-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_sev() launched the guest while discarding the launch measurement
and left a TODO to validate it. A full attestation-style validation is
not possible from the selftest because userspace does not possess the
transport keys the PSP uses to derive the measurement, so recomputing
the expected value cannot be done here.

Capture the measurement returned by KVM_SEV_LAUNCH_MEASURE for SEV and
SEV-ES guests and assert that it is not all zeros, which catches a PSP
or plumbing failure that silently leaves the buffer untouched. SNP does
not return a measurement through this path, so it is skipped.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../selftests/kvm/x86/sev_smoke_test.c        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 6b2cbe2a90b7..9ce465b4a770 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -150,16 +150,35 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
+static bool is_measurement_nonzero(const u8 *measurement, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		if (measurement[i])
+			return true;
+
+	return false;
+}
+
 static void test_sev(void *guest_code, u32 type, u64 policy)
 {
+	u8 measurement[256];
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
 
 	vm = vm_sev_create_with_one_vcpu(type, guest_code, &vcpu);
 
-	/* TODO: Validate the measurement is as expected. */
-	vm_sev_launch(vm, policy, NULL);
+	/* Sanity check the measurement; SNP has no measurement here. */
+	if (is_sev_snp_vm(vm)) {
+		vm_sev_launch(vm, policy, NULL);
+	} else {
+		memset(measurement, 0, sizeof(measurement));
+		vm_sev_launch(vm, policy, measurement);
+		TEST_ASSERT(is_measurement_nonzero(measurement, sizeof(measurement)),
+			    "SEV launch measurement is unexpectedly all zeros");
+	}
 
 	for (;;) {
 		vcpu_run(vcpu);
-- 
2.43.7

