Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01C488235
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524703; cv=none; b=V+2TtcYK6eFtvnARZMFiXzTOc2gQf/1swDK0KEUZPj4CQTA5rxsFoxUj2vj3OgTOikdmg7cQ9inBARguKjOgy+vdQjzvhDH9rQTY9act3MTX+o0UDd9YzbB9tE8sKykKrgd+ZthnIsSNXuN+43594pnSZyh3F746/Pes3ADr0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524703; c=relaxed/simple;
	bh=PqwhrNyABnZAOTbk3+DQqjSMv0diEZDOtPwkTzZvqnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5dFBFV2T8kUqML000o257VEUD6BUaVjpyMJRySP55w5EKNqcwPgX6dz1U6JSYKgDM1h9ytdzsMY41pSgt8obn/kLoFKhPuePWpZpY6PAYP4BUthzVF/b86jRK+53AbX6q5A4lpFD0Qz6O8n8h9fPxDgiLUYnl9+rQuoSmD1VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fj5Pp8Dr; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj5Pp8Dr"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b145a9623fso411355eaf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524700; x=1789129500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjXI7c1o2fMUZ4gP/lf6VLU7Bny6ysM8MfilUau8IZs=;
        b=Fj5Pp8DrO5TxcBGWQjFVk9OBK4K1ijbZC2ykvUs0F3N59XvlpcGpjwhXcumcGH2O21
         fXjaGunVSfxhNOEXcmrcX5E2MKndQtmgTSG53Ft2E1K9V3xGPOMJeg/7YYBfJWwPLtPu
         iyTAo7a1OfH//yhL3LCK0ExUnt0a1mARtsy1lDrphOblJvaHNPZl4YcAtGk+M6v2zNdR
         zgf5rRolOGvWJA1J36fJZNFz7pJTvrscjalX/d2A+kJ+eO7iQHA0u+SADuT0eUz3Md7t
         GyD1lmUfLDuIkClMr2tWx9/2PuONnz5mSJSJKsnTpEk2V/iQZlIsc069vKmkxd5QUPte
         A9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524700; x=1789129500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjXI7c1o2fMUZ4gP/lf6VLU7Bny6ysM8MfilUau8IZs=;
        b=k9fYDDgAzpFq5k8e2O1+wriDGoLpbQeC1QI4xxkAOzM4mbvppdDmmOnWGwRIFEfpAt
         wTrA/WrFcp+RHyCl1XYNUqLvopdGwOZi3IHZ5JBRo43hgllXMqp+7WzY7IATCiG3FDrN
         W6EbSMnywE8i+0sOyczDcfLXarT1sA132cwzOg8ytVbNSVlyKiuzEv72CC3yCWdUKBkx
         Mbj7jIvzAbgpMzv5rSBD6g8ExGs0oMHEvn9mNmXSlpsJQ9VJK4ylaQbby2b6qz91rMaS
         lqk1SHANM9zF/QQjCEACee7d7eZ2UACYIjvZrOol4jN01YG/xHQs1IxFpgBN+ly7OFsg
         1CSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzob8PTfC071Ekj0e6aGyt0/REmfvPFyB8jRNEN56rgeaxfy6/gCeCCUX44k1Dh6droBs9IVSh3rtDMCU3UExU=@vger.kernel.org
X-Gm-Message-State: AFuF++lPjC2/dwj2OYr47ybgkiP1Pavg8/FkSG80kYXdWPotLGaodXOO
	tdU/Dr4QrOnTo0KDXO2hR+nXq50bvmKx8mdGcZ1IB3KmzO1Ql4gCr361
X-Gm-Gg: AYBFou3M46R6sd99hVS2uRXpA2+3cEI+5RPnG9W1oD4+I1Ks8wLATpnjlDVGPzETsgX
	Ene+oEycwQ2h0EZuHfx+oFhzmhWNgtOAfcKlpiiiTH3srwTk29sYG176kSG6MZOybvsEoCzuhyr
	ik8PynHu9Bf3yjmfJlUuddGBMKb9LBqTVUDPWBs/64RWCYN4kv7ICBh7Tki0rlHD/Eln3CqRz7A
	JHuiS6RKtZP/EjMFdwpKtEdX8XFT+qLEUuEsybDfJGKsZLj3JzHYtR6FGQXJX6vMPDvK+7gZtZT
	hjyLaQYl2ZkoQEaCekhg1eGISQrZS9c9fUFuAPkmLDnLjToO8cJWy6FEbmgMYgO/CHstyb7p0k8
	wDkhLAWZttmzHxmNqLaS1XGhjOD8yMqRECwyGUsJn/h0zkPIVrLBE5AvCl3+NCDumIJhfCdEvUS
	q1pjJ/VHviE0Wtx3novX2AytqEzyCgSX1kCFuXKrTo4buzQdXm9XVuaVQid02RLPfkVvD2/eGcO
	rIrY3IPWHsJkEo=
X-Received: by 2002:a05:6820:160b:b0:6b0:1b86:fb0 with SMTP id 006d021491bc7-6b6fe59c86dmr3821145eaf.31.1788524700176;
        Fri, 04 Sep 2026 05:25:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:24:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] selftests: kvm: fix typos in comments
Date: Fri,  4 Sep 2026 17:54:41 +0530
Message-ID: <20260904122445.31163-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
index 7dc5f0b4f6ad..9da6dc5bcfe6 100644
--- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
+++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
@@ -387,7 +387,7 @@ static void guest_code_ss(int test_cnt)
 		 * Enable Single Step execution.  Note!  This _must_ be a bare
 		 * ucall as the ucall() path uses atomic operations to manage
 		 * the ucall structures, and the built-in "atomics" are usually
-		 * implemented via exclusive access instructions.  The exlusive
+		 * implemented via exclusive access instructions.  The exclusive
 		 * monitor is cleared on ERET, and so taking debug exceptions
 		 * during a LDREX=>STREX sequence will prevent forward progress
 		 * and hang the guest/test.
diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 5d96cdf382c4..a24becda9e62 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* hypercalls: Check the ARM64's psuedo-firmware bitmap register interface.
+/* hypercalls: Check the ARM64's pseudo-firmware bitmap register interface.
  *
  * The test validates the basic hypercall functionalities that are exposed
- * via the psuedo-firmware bitmap register. This includes the registers'
+ * via the pseudo-firmware bitmap register. This includes the registers'
  * read/write behavior before and after the VM has started, and if the
  * hypercalls are properly masked or unmasked to the guest when disabled or
  * enabled from the KVM userspace, respectively.
-- 
2.48.1

