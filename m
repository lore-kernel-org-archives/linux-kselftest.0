Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD234D394
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779535253; cv=none; b=UEKKaEc7yk27QfZ/haZn/DYVhyBCPbmuepjFSFnNaDz6O20tmCTw/zqrbkYF1zZcyvKWUp31JDSckUEG33OQ9eP1VOUiLOypgGK0TA7m28fKRXMGezqcxP/bC6NuJHIl5K8Lx4xSGa9L01c1zMBFaw3GQW3E5ixY/SFt+BU7qlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779535253; c=relaxed/simple;
	bh=Drxci6DRbRjEyYilJsznSmhWQNBWme4JLl4MKzSwthg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B76ytLuVDSyNrTR+JCLk7DbhN0lNAZAY37gSBT51wZi6CA6jCgRUM63D6O8Ew8Ick3HCj1RpZfkerUrJt3b5Bw8ACEm8pkq4gt6uHtAFD/IVAFNFAvX9KefMt62/zKJAkkmjBQdRYJsNWITI/ux+5GxSLGQdt31fEWLhqpoC54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8sNiQ62; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8sNiQ62"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so12926651a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779535249; x=1780140049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nqpg0cE/A26jNSG7hnd21Xe9lvVMA7stypHYfZTce8=;
        b=c8sNiQ62js1O+/Yjasv3AhBkkrBI7ZZfVmiuGzdkfiboqdNYAoNSso3eUlkjQOfzUJ
         JG5OX5HwIaXydmvFmNTEVH3XgtUG0dlVgscM82kOMONDodokWpcP9PbvrsAI06G+XRYH
         fCeUz0RjOMyKK4vYAzflVsQ1Oa838/CTDRb+fmOlmmuypWB6XUErro58TFEVpKmwI7rk
         jW/B8PdUMlIHn7KeU62qKgrCr7T9zpTrocmbur8gEPff3p0WQThsCyDtMXajIEFgp+RJ
         Lmw+m8AcYLc0/tI3RZMwdq8H2xRFVehPdFN+52g9Z06Ie/wdiTO2b/XYL0Ng+KP5peDi
         yY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779535249; x=1780140049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nqpg0cE/A26jNSG7hnd21Xe9lvVMA7stypHYfZTce8=;
        b=lDdIhqHBgaYhUcWHBXf1ZN/C+PWEb4mjEELteR1SWAbnib6Vi9PKEkvvhWd74/85sv
         AiNsBn0bYmURbEbO9LQ6cPNptaYG5/9X0CkMhom+1MHAuubKzWgRqsNH+d0SxxuEXAym
         IeXtzA35tR0/gEjhdemRQvW+w9BPeGZMepF9HZtyGgdYJAwETmSJUst/MorWFiJFdAG3
         IyVbgNi4oxLtUV2V2M+ScoYR5N59ABoE0JQg5Lhz/Jt1I4d0fANUzZyW6ZM+afqaYYi/
         8qfavOjIUqQTqRwZVZm5LAeaAv2UBpjwbo9gwTkugYT9MYldYySR4QKXa+FunOPHQkeU
         3jlA==
X-Forwarded-Encrypted: i=1; AFNElJ90oFWZT9HE4In5VxYuxhK7I9wg2bIecWEaNZV9K+Y4hB2EOM81sYzptlk/JgwMEhQvwZOt7A8eQ0bdjfWdrG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxRYwavxlf/VZF0AvnWNHVS4+h92cRi0vwbpOIaaD4qsf061Fm
	NdSX1+O6IHozBEzfMU7U/BuPjQHa8Ct86lXSUTnsxw8FZFtoaWADMRqU
X-Gm-Gg: Acq92OFSYccmca3RVpIsQHnJWv8pIwuls7TFevWEk5O0tqR5dfEdT8ERoz7Aj/B0Leb
	fHqQ2ZlvU06pdqhNmcktA9ub6dF7x1nsmVdZshZiTCJRtbcnpT316H+dydSwJ4s386Go6YbUo+m
	8+PM9XvA0XXOUs/mk8kGRs87oqCmkqIsq48RoQ4H5ur6tLDS+lVsgW7IqPCvQoQMFOj0Jzxjjzx
	6lhaMU3rBw5xeKsTaYgPwGMcZBDCtb9dUAeeMduiayVSzpGTnFZFyqt0OD1AWKu60ZlZkDdrEyM
	KrHN6gfdsaexDZPjyVZGdRk2NhNMnkAC+T+IzNZf3Tcf/zQQ20Trgrsbxl21EKjQkXB/4Xqo9C9
	bwEFpj1VBwLGmfXKauq+ZsW+0FNnHAClhYiLcnslNbPCthb0wnE6BvMp/KPNBreY60V0eJXOsM3
	ERKkQNpGHuUUnRwpr1DsZiPAlTA7LRAN3pE8hjVRq2WecPy0zhUBKpt5Mp/Ov+GX269mQMMZFOo
	o7pH1FLriEEEBkBmft96XkPaDxEsI8MRxv7qN1gj6w20gAb
X-Received: by 2002:a05:6402:5293:b0:687:e07f:d860 with SMTP id 4fb4d7f45d1cf-6889cc6fab7mr3860415a12.26.1779535249220;
        Sat, 23 May 2026 04:20:49 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1e20asm1806980a12.15.2026.05.23.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 04:20:48 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: vkuznets@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: hyperv_features: test write of 1 to HV_X64_MSR_RESET
Date: Sat, 23 May 2026 13:18:57 +0200
Message-ID: <20260523111857.195396-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing 1 to HV_X64_MSR_RESET triggers a real vCPU reset; the test
was writing 0 because the host loop was not prepared to handle the
resulting KVM_EXIT_SYSTEM_EVENT. Add the missing handling and write
1 to actually exercise the reset path.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 .../selftests/kvm/x86/hyperv_features.c       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
index 7347f1fe5157..7c8afe43eef2 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_features.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
@@ -26,6 +26,7 @@ struct msr_data {
 	bool fault_expected;
 	bool write;
 	u64 write_val;
+	bool reset_expected;
 };
 
 struct hcall_data {
@@ -267,14 +268,9 @@ static void guest_test_msrs_access(void)
 		case 16:
 			msr->idx = HV_X64_MSR_RESET;
 			msr->write = true;
-			/*
-			 * TODO: the test only writes '0' to HV_X64_MSR_RESET
-			 * at the moment, writing some other value there will
-			 * trigger real vCPU reset and the code is not prepared
-			 * to handle it yet.
-			 */
-			msr->write_val = 0;
+			msr->write_val = 1;
 			msr->fault_expected = false;
+			msr->reset_expected = true;
 			break;
 
 		case 17:
@@ -497,6 +493,15 @@ static void guest_test_msrs_access(void)
 			 msr->idx, msr->write ? "write" : "read");
 
 		vcpu_run(vcpu);
+
+		if (msr->reset_expected) {
+			TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SYSTEM_EVENT);
+			TEST_ASSERT(vcpu->run->system_event.type == KVM_SYSTEM_EVENT_RESET,
+				    "Expected reset system event, got type %u",
+				    vcpu->run->system_event.type);
+			goto next_stage;
+		}
+
 		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
 		switch (get_ucall(vcpu, &uc)) {
-- 
2.54.0

