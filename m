Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A3228F948
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785285805; cv=none; b=psjDBy57tdk6dSt9x8oD7adZhgJIgvd2s1Z9RHYC/E64ZUj0KVJ3JFJXWULzloITQh4YfG4DmFCtufwALiGkdp2gYeKFJNdAsTLWbByyLMr33lB95D/oYrgK/H5+F4d0ZGyLRGWCJHbM6Ryb5eGmtFaMGmj1D9viGYwwjpkuSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785285805; c=relaxed/simple;
	bh=3/X/mr/YLaMPqkwboLnuUiwo3mFws+Ie2fvug+qqqyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XL2O2WgTMBfHO+4Ec7dsg+9bZql0UdUDq+rB3aCLmTEwiBZ2OTngPiWaU605c/BUW+GxFNdUx92EjtpKYSFYU6rv3VvTs/szUYJnX2IY3LLooPOr0Bto9NqLxtU4r+kmq80v2386TiHBYlp0m5LltV25VoAEC9If9zfs+2bFDOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5i7eNVI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5i7eNVI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso1760315e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785285802; x=1785890602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jYWGw53POFllg0ieqjSR4fZVEzdVp2GRfz+60jKrRk=;
        b=n5i7eNVIzxaXm9Sfx5OK2GexSelUK52YQs6LxUo60a/ysjqhbZZ2EFYT/bTFleP1b9
         qgiBamvaC96ItttPI+vVKL7lj16lqrf3Beg4p5LflWAtUOqg1SkPAsr9WFRr1e6WavKk
         t7lqm6Zy2I2GsQqpNv7ZbXM2wPGXjrfIBVO4VmBVYbg4XTeDkFtiqgWeEOml/FV8cbyx
         fGkdv/gKhsL9dfQxheMpLpdyqluXtaz3pplZuGRQ3NSBzbU+fFufBvvJYW3I4aAFKrjK
         ptghdFW+xcHu2Rq+v+RJO3H3L7bmqg1QPCmVGlbBAMNGn7cCOC1aBjTuML6UcmKxqnG6
         Muug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785285802; x=1785890602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jYWGw53POFllg0ieqjSR4fZVEzdVp2GRfz+60jKrRk=;
        b=ewFM0r1c2tohyM68LOZ1jir3xqdUqcvt7ehFAZ2TwDarEZdn0sddt0ARE1st7R+Jmv
         YD9BTXQUWuQHEuXnbqvdrmRtVbYiW5aqCwj0yaaev1qLQ0dWmN56KElMoP2fDlzFDqDN
         Dulzc880V4n7JQt++8q+fManR+G6oezDihNTKVAZ8i4OYDmBask1oRo3eFNnokrfc01K
         qJwu7zANnWcqcIAMjhBe7h+Hc8IydjDl2m1HI4x2jhZsnzrKuFZ2muI6Ss3tXbnWqdoK
         SQH+g7dbfhVpwc4+bMOmKxcdnm3Rh4uizdi3rZx7/vgwfUUEa0xl+MRyFib+OQO3QIFI
         nL3g==
X-Forwarded-Encrypted: i=1; AHgh+RrHpVRu3t2wqQmWPc0Jc47JljwhaoWxtudA7JinlUI4gUJ5g74EvYhAAoJ3kTWvSwzNeK3J50W7NP63jS3OHH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdCZXYq4cnWSgAiEPOxcQieTPqvIwEjYM9ILFF0RnxyxPjahp
	jN+AswW4AWRGaQRZ3DakYFCYs/3Cb7WUWpU6NMXCixhEft/yiwmHulZD
X-Gm-Gg: AR+sD11lm5MXdrWI+kzERzL7kzXABDtj1rEOzHPKML3+RvRZaxCFsmcowOSTiEMM/OB
	Cmfad4zWo1NIGvFNX1DKCnlHseeXBXxE3JSI1qGdb6kfpufWA6CClf7oIk84l8m4nTpEkJJm772
	4rTr5ZjAGN21Y1uDhZhVFely4Q9+KITpFZMJm1ggbUx0s+NdG5bS1wq/Wppb8GQMFZdZgFU1G8H
	UEWSBDZ+eLKKGZyecKv/sXvZy7KBVc8V3FsMmMlsYIPGlrUKb9tAJ/WAV5m2cKqlMENnrLBppAs
	VHw+WTYDW6tyVVOPzYoK/uMSyWFrmBpYtRy6ZYHBrXApb6oIMqPF9eOUWzJqTIhbylSVqWC4joF
	zuawZSH+xulkFUwQzCKcf5jFmrDVH4XYYLROCFrdak6N05nIzG6q/sixYdsg/oJ1MJFekP9iQ/u
	XfMFRF4Rg9DsAWLEtSSz/TYSotmBJus0FOhL2BYXKo9nDfCtFSXok7xLZdxBmClMG3MaTx6DCcU
	UbxrS09kD6wp0P0iJ6TW+HRB/lVc/O+XL4wO1yAT2BVvzaeqtIE9QIdhIAI24HpnN1uAsryfBEA
	aDMU57cd/LMc+eKz1SrgL/eJRqz0KISzT7eRPPbpTP49IE49/jUckNpBaDTDuRK81Dipa291MD+
	THHbIFQ==
X-Received: by 2002:a05:600c:3b1f:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-496c653eb6amr48053165e9.15.1785285801374;
        Tue, 28 Jul 2026 17:43:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm2827343f8f.6.2026.07.28.17.43.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 17:43:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Wed, 29 Jul 2026 02:42:54 +0200
Message-Id: <20260729004255.15630-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sve_init_header_from_task() takes header as a pointer, so for the
inactive mode

	header->size = sizeof(header);

stores 8 rather than sizeof(struct user_sve_header), which is 16.
Userspace sees an impossible size smaller than the header it
describes.

The inactive-mode check in sve_get_common() compares header.size
against sizeof(header) as well, but there header is a struct, so the
check can never fire. Reads of NT_ARM_SVE and NT_ARM_SSVE for the
inactive mode therefore still return the other mode's FPSIMD data,
exactly the situation the check was added to prevent.

Fix the size, and make the check return the remaining membuf space
instead of 0, which regset_get() would interpret as the entire
(zero-filled) buffer having been populated.

Fixes: b93e685ecff7 ("arm64/fpsimd: ptrace: Do not present register data for inactive mode")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found by inspection while reviewing arch/arm64.

Confirmed in the generated code: building arch/arm64/kernel/ptrace.o
with arm64 defconfig and gcc 15.2.0 and disassembling sve_get_common
shows the inactive branch storing a literal 8 into header.size, and no
compare against 16 anywhere - the compiler constant-folds the check
away entirely and falls straight through to __fpr_get(). That is a
machine-checked demonstration that the early return can never fire.

Runtime tested under QEMU TCG with -cpu max,sme=on. Before this
change, PTRACE_GETREGSET(NT_ARM_SSVE) on a tracee outside streaming
mode returned header.size == 8 and copied the 528-byte NT_PRFPREG
payload. Afterwards, header.size is 16 and bytes in the userspace
buffer after the header are left untouched.

 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..2a72c61a8af9 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -801,7 +801,7 @@ static void sve_init_header_from_task(struct user_sve_header *header,
 	if (active)
 		header->size = SVE_PT_SIZE(vq, header->flags);
 	else
-		header->size = sizeof(header);
+		header->size = sizeof(*header);
 	header->max_size = SVE_PT_SIZE(sve_vq_from_vl(header->max_vl),
 				      SVE_PT_REGS_SVE);
 }
@@ -837,7 +837,7 @@ static int sve_get_common(struct task_struct *target,
 	 * from the other mode to userspace.
 	 */
 	if (header.size == sizeof(header))
-		return 0;
+		return to.left;
 
 	switch ((header.flags & SVE_PT_REGS_MASK)) {
 	case SVE_PT_REGS_FPSIMD:
-- 
2.51.0

