Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F138B7DD
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 06:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329713; cv=none; b=RoRHvHxjk0Kgc0IdsUXazRX1Uphc69uYalPFD3rmrrZyaiPLbGGhMf/OdTG1KNs0RZ4E2sCAHyIKscFHzNPdem8OKI5OsZpdmMxUjslsSbHfIrA+CnZGxefQcF+HxaDZsu5HDeqJXdOsCGBLwwO7LFlBxBubIsdbiJ9jbPblg/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329713; c=relaxed/simple;
	bh=UwOA8LjM0NSCFy3j2zt1k5HHkmtLxl/qmELRahsK2hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GI9vTSgntcyxO9VlhtJovUYflHJPr6dHwBme1uXrS4xOxMuFRudJavoMC/j4xFhrJWjjG+Rovs1A1pvmkdg95OON8bOPoq75NeKxkd0gZt9nO6bmLOaVMqZNeAoR+kfbdxG7Akuvc82tqx697jnVNCubT+cr5ch+qJRMJGE3eyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=gPST44Yt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gPST44Yt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6f9e2f681so6776715ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788329711; x=1788934511; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eu4ymMPYKZBtIpuaapdXbFgIh8ENIgqZKDyMhyBzO+s=;
        b=gPST44YtzCBLYwFHrypRJU0ZeqCR2wZT1ZWzDUXqiGd0Vuw4e02cX6Gnc03LpWoLso
         RuVw+LWD5NT2DAima9OLOryQpHJBncQSLO64acgLEEUUl4VWWY25t3QlXN6iPvbUi6Sd
         mp42OQdgkCBvHqUUBceSfQV1z0jyF22Zh8uhW8h+KSx7z+/RoCbhme5q19v16Srpizp5
         ovbwWAhstMp5UBB+6UzHmpLY6D1Z1ZhOcH0pkLtJMm5bUC0dX59fEkj7GJz4/J+j4Lrg
         azFo74EGF2LDKvIY0o5sx9oPPX/6pmMGvUf9fR1MSagMiUvK8Ow8oOMfcMQXk7P33GXH
         4P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329711; x=1788934511;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eu4ymMPYKZBtIpuaapdXbFgIh8ENIgqZKDyMhyBzO+s=;
        b=KzLpOCCS/zj51sncNJycga96OBk6B2Hp7EwxvCWeMtOd1wsEv7DbP11S3JzhBgXBZy
         lWCTpJsZCEnQcBIchRVMqTxR2HjEYRcb8QsD1ROupQUCMkeSZmmAnVqDgnxOxgpTC2Bf
         Cv+cmcRFe4sjfAZaHcfCXXmkrFA0wxKa0DXBFqzyMgnuBlYJxketaay7aufBQyc8um+D
         Gkka3mGG2Ziu+HxoNj6Du/7RQMRV3qdL7U+akpIARL4RXRTB6ZYqjh30BVGmVMASbtSQ
         YWGO9B4MIT4mkqe4gkf5fSKSPIKTmh3yG8p7lxDuyNmZaVk9WKY2vzcrSZksGZ7mjuxk
         RrLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcPCp+TfbQsQJMu61ULxuVBvUVnY8ZXQq044URj3LXAjADiAflG9rG0+irrcYHUBfAJ3ZBfC9Er8Nkdv1HZOo=@vger.kernel.org
X-Gm-Message-State: AFuF++kDc1LFUI2HDnOpBDhdn25zgr1rntJKQzyEuNePYLaZUXxhZfLd
	1XgKFTQzGKJpWzhXlXoJZ8Bh4bguFOWNuitzXQoxyKNHNUMcs2sLNMVy3KrAAuitAe8=
X-Gm-Gg: AYBFou1WDfXid+LEeRQFuppTsiYQdIM36So6TFmdZY9+Cfy/1Xj5sZSkdxPCNWrluHL
	9PL/iVI0LkIf4M4FuSqHr+ISWywJ8oRw3bDHYc/VkvOVbKXvb7hCCXhtFUd1ZHM9nVvWoYgqqKg
	svIRMUFQigHcHG1sU1beyAtB46KxKx43m+l6b25pVZ9jzi6mOn16dXyXotCrN7V03xSnh7JUD5+
	CnZX3Vl2D94ExtStfgl8iX+dw9E9ARowaUngNAdTiKPLj7jZK0KrY+dTCTJp8UX18l5Unw6kW2U
	ESAFy9HXheEFz9oPZYSryW9vwvbfJeZP6ajCgRgQuhkoqV8vXq93gi4BzEAIIhkArXXWLnHyTMg
	VyLbQByGXCkTegYr6Z18VMsEYQ9qClcJWkt2c4QwQFdLiEZhZErj6ejvPZjHMyKfodmT6Jf2iQ/
	aBqJQ0Mt0qM2mAJEgdLB8F2zMjL61iZWPxfUp3o9OHrhEoN5Wg5ErIesWqhPj7YZybivDuiU3Fx
	Fm11Fle
X-Received: by 2002:a17:902:e804:b0:2d1:134:b86e with SMTP id d9443c01a7336-2daec5ad579mr31546085ad.2.1788329711119;
        Tue, 01 Sep 2026 23:15:11 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1f4fsm3462624eec.11.2026.09.01.23.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:15:10 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 01 Sep 2026 23:15:08 -0700
Subject: [PATCH] KVM: riscv: selftests: Disable vector extension in build
 flags
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-kvm_kselftest_disable_v-v1-1-fe73aca5bf95@sifive.com>
X-B4-Tracking: v=1; b=H4sIAOu+l2oC/yXMQQqDMBBA0avIrBuIEST1KqWEjE7sqLUlE0NBv
 HvTunyL/3cQikwCXbVDpMzCr7WgvlTQP/w6kuKhGIw2rbZNreb8dLPQEhJJcgOLx4VcVqZBDB5
 bq68WSv2OFPjzP9/up2XDifr028FxfAF5qXhSewAAAA==
X-Change-ID: 20260831-kvm_kselftest_disable_v-23bbfab68098
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 anup@brainfault.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788329710; l=1384;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=UwOA8LjM0NSCFy3j2zt1k5HHkmtLxl/qmELRahsK2hE=;
 b=Wu6dcMEbHae6NcaOo3PXMhRBifeLnVbHpjN50VxkDCm33Rv81KHvvaw2L4qt/n0WHkwTsJNJs
 8+5SSom61XiCmQ1TrwA1tilfCToI+4AHBSI3tH+M6wUcvuvmXA6LVs3
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Guest vCPUs never enable Vector state (sstatus.VS), so any vector
instruction traps as illegal. If the toolchain's default -march
includes the V extension, the compiler may auto-vectorize routines
like memset() into vector instructions, crashing guests.

Build with -march=rv64gc, probed the same way as x86's
-march=x86-64-v2, to ensure vector instructions are never emitted.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6fc34e9bf8e1..46c54948f4b1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -297,6 +297,11 @@ CFLAGS += -I$(GEN_HDRS)
 $(GEN_HDRS): $(wildcard $(arm64_tools_dir)/*)
 	$(MAKE) -C $(arm64_tools_dir) OUTPUT=$(arm64_hdr_outdir)
 endif
+ifeq ($(ARCH),riscv)
+ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=rv64gc -x c - -c -o /dev/null 2>/dev/null; echo "$$?"),0)
+	CFLAGS += -march=rv64gc
+endif
+endif
 
 no-pie-option := $(call try-run, echo 'int main(void) { return 0; }' | \
         $(CC) -Werror $(CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260831-kvm_kselftest_disable_v-23bbfab68098

