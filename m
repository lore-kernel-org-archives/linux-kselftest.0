Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394553B27DC
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666120; cv=none; b=E/ep4Kz+Uma01JvP1HvgGdrJgr5H/xwZxlSlE+bBHs01KsjxdvYYTfjp8ilj6P6kKqt7tgRV5daW/gHnnwrpZXHMfjRocBkyBCWKptfFDRLJmSyquBiKjpy2m/CvSdbkib+AxH8J5tbecggQ+xvIbOnudTK0JgGT7ig2rJeOKs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666120; c=relaxed/simple;
	bh=1eg7xfXvqB+X7Z1e0Md87PErbs70YQUknxBBKub28qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebgnLQ+89kM4adlSYPZOY4Uardoj4yAOuSo7g2p7wt7EzMqcgPW7tXKsFS3U/WkTeGYNAHDrmAuEdgJCXW1DfiPNTcQbcTJDjGhIx0r05/SpOAb+zsC7iPx7DYu1NtMGesfmUKzKBzVT8cHoBP6DI+r1/hlkrW4gndh5qXvP7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pByYC6fe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pByYC6fe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2837540a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666119; x=1789270919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=pByYC6fe9rYpeI2BCqm4LqE10goXDHLY+ydc7kEOEirNfIz4QRZLjVE5YDCl+gk1eZ
         o0OZt4vrr8Kdu8hK4vAHYBgspbGR6C3hXsMgFs7iePUcn00VT7cNFB9woAeUG0xEepRI
         vUaEgG0Mwlzozs68zlniNNKq4GiFbCmWmLtAb7J8IGQ7YljNVqNN9FboAWDBbPCdcapB
         y1MFxESdV1EE5uaq+m7RphhLVqln367q/eqSEh8GWThEyhJbWmSblVy9FsgJ6uKjK/lx
         J3HPdkX8pHJEPyf/4UsgWZMyO0Kusubpdfgl6Db9igXRW0DTTaePHhnoZXTiUVoUo5/e
         ijjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666119; x=1789270919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=FDT1eMVtmztUj8KvC3t1zRM0DYpCCBLN+2ulYRwaCS5Kep/8xAMZtHtMb+T3xHNSMs
         a0Zn8kJPRcE1beSnpehfvfBCMq/1KzDGPI0EcGcH9SJ9T1gplTa8w0JHL7aSYYUUcKNL
         3kiNxk4M9Yu/eipBMCdxpwhO4stNuYl2POeyPNf7VzFY5NcCmf42anZyzpTX+DoSHmMc
         20pTl9nG+uCClNVPmF+3ZepnKtBan8LNgDEHVaC/yoWQlvKF0ZdXYMGN7pZWIiTn3Ndc
         WvBbfcib2qVTxyJHTa8fCimehZVfWrUwmRokK7j4v7HtH5rYkMlTyU5dxbxMAKTwyE1T
         Ob3A==
X-Forwarded-Encrypted: i=1; AKwUvByiUUBayrynFdnc8QXeFF6IpXA0mGXAv3pIAYwP2CWck604+zhWm76O/cHxP1SGKfI5gzIDXAwc2k6lx0TuwIc=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ9DSbyBvQwsKgcxTIl9hbz10UGClQTbmFlSVRpe5t7hIrcCvd
	wqZg4U/UxOiaruKa1VxYifX3a5y29GF1l9XmWYRVYeUkllhWjdkK6LvS
X-Gm-Gg: AYBFou1gqt726WLQ3SFfYJHlE8M0g8g/CB1gnw05uEJI0V1SYAkvWQQbT8MnyTnVxXn
	B8w3EaN9lol93tR1fr95G1QyYhvoHXCKsogrnU9w8Z7c7zHI1+TsbPfSGbHotDIuOjXEazPyoOO
	fkx6HEriwKNbNd+dLpCbnSemJxmJD0xq7gL7Zxwfny4nip8GaxvYCah34eQeTPVxI+d6+S7PR31
	6s6b5vp/Yp11yNcDt2DPc/wzfcyd0lu7nfy+wy1v/mtLJUFwda1CXOBJ8yFISTNcb8gjau/iGlT
	8Un2QFpwYDwmd5ZUAGN4JJ5vVb4DuajU196syglaAtm421enjQw9JUqTY/SEigEhwKXnX6oZh3A
	7ZLwT7eZFAgWTVplXO/3rfjqfshqPBLMcfYnTgiXwbgrIPwUiLUcOjGr2ruVQNvIYaWyZYKB7pm
	aBR9e0P5072OOMuJnQqJKmtiHOHNi48ty4SVnYcoZ1cUQe0moyJh72pGyPHrv8FN97xDm2HZg0I
	U/QCDBXbmwDAYU+eQEEzUpxG33CzhwiHWzltP1Q1n8a
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr22343140a91.12.1788666118495;
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm22761765a91.14.2026.09.05.20.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix VM leak in early return
Date: Sun,  6 Sep 2026 03:41:43 +0000
Message-ID: <20260906034144.14059-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mmio_ease() returns early and skips the call to kvm_vm_free() when
ID_AA64PFR1_EL1 is not available.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: a90aac553249 ("KVM: arm64: selftests: Test SEAs are taken to SError vector when EASE=1")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). ID_AA64PFR1_EL1.DF2 is not implemented,
so test_mmio_ease() takes the skip path exercised by this fix.
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc59..7836756a38a6 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -339,7 +339,7 @@ static void test_mmio_ease(void)
 	pfr1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
 	if (!SYS_FIELD_GET(ID_AA64PFR1_EL1, DF2, pfr1)) {
 		pr_debug("Skipping %s\n", __func__);
-		return;
+		goto done;
 	}
 
 	/*
@@ -356,6 +356,7 @@ static void test_mmio_ease(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.47.3

