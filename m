Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C373A3E68
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176683; cv=none; b=oTmZdFtwkWdTxAo5usZuJBl13GZMAtW5ytxO4eUnValKpoZbfm8gfTpSTfqNmX3YqoZ5HVSMgRaOaHyrnvcwsH4tAyIK4qClGePATG7wrALyv3QMRaWCAjgUmaZLkErTWW2+CHABwLICSlpsJPIuLLjbEgMUg9A3YICdAZovUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176683; c=relaxed/simple;
	bh=kz5eF8EgHJZV4kT1Yjijkfp28Af36RtKI66Pm5tq4pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUzxpBQg2EPO+LRfiODWzyhOLUfPF2bsSZmSIiyWb650V3GfUbVa6EpAMarcthxu3OByy327VBj3EMEZEC2f1ckXkuOnSsOKAuGyXuMtrek2opoPGmAjMYH0mYEdHBoEqGqm3OfsWkUsSYURFPgExz07Rpkij9xFHTw2lfFmSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRjWmcoJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRjWmcoJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso149637a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176682; x=1786781482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XV1qyiW1WN9UH6X3Jv/ZBqv2q+Lebe5phUQECTXzBc=;
        b=SRjWmcoJZDdTSWMc1KgFI003tZZFY9UHqKiudZzgwwHYlUfmT2I4vylEyI4jFCCmkd
         Gjy71Rb8UmuhaaGnP7F10PDbzVrqYN7i4/usN1kAJsScZEOmDpxWVOQd782znwuEMYPb
         IP3d7BbSn0ISI4zyjTLlbY14zEWls2xSlSG9+xaE3lL+fx1Px2Hj22GCFaROEdFUlVuM
         WBG83zjUXY9dRQCn6dcoFZy0A5MZwySHwaudrGxN3QPxKKWsJ5XCg/SWYJGKGC9/n+zt
         QFesoXVbUy2kial5ybp53Cbn+du8VfTbzyBy/udsUlHm+q++VSt1bLRNjMb5ORKtvdWI
         zVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176682; x=1786781482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XV1qyiW1WN9UH6X3Jv/ZBqv2q+Lebe5phUQECTXzBc=;
        b=jeetyCpOST8lm+65D+IuDswy7q3/Vc5xSLD4BeQvdAlhym3aNYT8WHMjTH3QcGLizR
         J23622BJ8Hii0iWPVdrC5nMFpdNbh28w03ht0HM7kywTS5jYhWEcRhKLig2nSUoss9Rq
         ZKw/IMWhB2M2vyHx5cGARSPDzQCeFg17V4r6BWvpTLrsyZoC/GbRE2cDBwik8ZxtD9/6
         EipQcYv8Iiho5DzszbYcjIxslwbGZLx/U05ceL43RK833d+jHt+DBlrNkPQyMP0ylCpC
         FiqQbEBBKSk1QQb5UuJ6y/qe58vW0VX1pdZ1br9tI61B0aZ+gW2VS3L0AELIHlOkZZqR
         WA1w==
X-Forwarded-Encrypted: i=1; AHgh+RpPTsOjhGPmiMyqNgP5z89PeZtEaMh8EEk2iUYAcOah9JPOhyEj3/uquaL8vL3SbWENOFzxdG5CeTOLg9m1Hk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLk5v9WwkYfRdJY/ThUBm+MjVXvJ+L3yI3SdMzyXyZRBk0ou5r
	0hMisBhpAwWmLCWMXQCYMcrNzcwNshZQg5f9x3fR3L6h6ujgCnLbYm1xNz9qlUiU
X-Gm-Gg: AR+sD10klMtzS1Jmeid4KKcvWVfOfNb3S/kXfbAor0z8mokWDiMQiq+xRoTvvlVYclP
	iHkoeAwDzKwVK7aynsMXxaPEzTl9Q1GzwV+kNoRZ7T0U5WZQELys8neW0V1PJjQ2r+u4oohMSuQ
	egh/1qUMdIMi6CgNhQuPD7OD+sUZsby/ej491X3o+oD7owYrk+vEVdQZgkIMrTkRVEKs2rrlXOi
	ET0Htx93ncu1txNo1k3hCbg3Vg2bAR4aZxe6vPNEpj/mV+Z4DuofPkJT8wudW2LigtGjyMdPZeF
	tW56ifhms/EYcu87GJ7v4Ho9EUs1Jo1NgbgdOFHAbNn89B6U05rPUMtGcGBQtTbiPCAKY/BUCtN
	y8cGqUXmMdlUU6Ek+/QlQFdvm0TjOhS5NAHzMlFU76O6jEavUgmvj1vqrc1PgbVzW8xYyQ6ei71
	H5xFzPvLREgIw4DHN6bUEoTeE4bJ6Lu0qS9Q6E3QZu/xwawRgGEMBVAPqEutP4+hmBs8IIR2638
	g==
X-Received: by 2002:a05:6a21:6197:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3cb85ffd1b7mr35612051637.34.1786176682050;
        Sat, 08 Aug 2026 01:11:22 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4244sm13957833c88.4.2026.08.08.01.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:11:21 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: selftests: Free the VM when the SEV smoke test's guest completes
Date: Sat,  8 Aug 2026 13:40:49 +0530
Message-ID: <20260808081050.408657-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260808081050.408657-1-gokul02k@gmail.com>
References: <20260808081050.408657-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_sev() returns directly out of the UCALL_DONE case rather than
leaving the loop, so the plain-SEV path skips the kvm_vm_free() at the
end of the function.  The SEV-ES path is unaffected; it breaks out of
the loop and frees the VM correctly.

main() invokes test_sev() once per supported SEV VM type, so a full run
leaks a VM and its file descriptors.  Nothing fails today because the
process exits shortly afterwards, which is presumably why this was not
noticed, but the leak also means the plain-SEV path never exercises VM
teardown.

Use a goto so UCALL_DONE joins the existing exit path.  A plain break
would only leave the switch statement and spin the loop again.

Fixes: be250ff437fa ("KVM: selftests: Add a basic SEV smoke test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/x86/sev_smoke_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 6b2cbe2a90b7..646ae93e3c46 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -178,7 +178,7 @@ static void test_sev(void *guest_code, u32 type, u64 policy)
 		case UCALL_SYNC:
 			continue;
 		case UCALL_DONE:
-			return;
+			goto done;
 		case UCALL_ABORT:
 			REPORT_GUEST_ASSERT(uc);
 		default:
@@ -187,6 +187,7 @@ static void test_sev(void *guest_code, u32 type, u64 policy)
 		}
 	}
 
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.54.0


