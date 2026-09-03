Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3704D90AE
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467867; cv=none; b=iIMuPKkKB4gxEAKsXPrDXbp+OkDoGry7uIiMU8zlWzVPshsYPCyUp4ck7TiTeF5x86cfm4tz65aX1uxn8uJs3kehJlDQoPP1XBs1n8iqOB6NM9hnphoy5GK3gC2S6bqYYimxJzoNERSBpFgfSDk1/IFs5Ib3GcY4xcsIuMyITN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467867; c=relaxed/simple;
	bh=0mPWZrRtMVPeUI6XJyCqfL68axEeDCO9y1H3650V6jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rao0gZczEwQFPzoDiHZYhY10uGLswL5B8hYObY2qEKgWa+F5/3t5Yzydit0avTXY1l2A3pXLd7fhmw35+tmKWQyvoZPlZeAHaMXEshFvZJA/+P40XORcOVhJjjXqsUPvw3BBVsFMiyQaFBxJh3nTNLCgsxbEqXQ5FCJFsLWlMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlDKEkbm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlDKEkbm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-485843aeab8so306158f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467851; x=1789072651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnjfNvCLnsTvxUWLkyT6RSPdRaY1HQsFa2V6exB/dnE=;
        b=LlDKEkbmjzIPcmLHIn0nsLH3JOroRmIAlnQOEqzvZtYimCF2vOWPYGCMONkFaArlU6
         5YjN7srB9za4Q1c7pJeBcF3HVbzWvJeqmdF253nFzFY2MURKYbeX69VD8zaqQ/Qrfpk/
         c/saUAVyYtc4Sk5g5nEB6IRz9XBPiQrqz996ok0kEZ7d4topHpEYgzP1LCIC2N7/5nzo
         TA2RfnwDzl5ykB/THYwqtt2ClzLww/+439dCVE6p2HK9ALAAtTRmiJa2ufS6YNxVvRy/
         2T8Ri4YHJhBzLScPeIPCVDv10xl1W126rBIRG1Aj2d2kXf5hsujcVPgAfMTIAovY8OAD
         MN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467851; x=1789072651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TnjfNvCLnsTvxUWLkyT6RSPdRaY1HQsFa2V6exB/dnE=;
        b=esxX44AVcsnMKHJVqXQTHQKkIeAroRNw2HWMyGjMHvrnZBk3PJGKTf+NzBsFynMkkV
         Js4OZ5PApcBx38zaZJ7SL+7bDxLD3QqdoJRAMNA4gFD8jkumOOKknBEw6mbhki2sZe/A
         BSDCKLUYieWul76hs8uC5OlxHZ4MOR0Ykbz3Na20AG93K+F6Pwhunhv/GOuX1dEoF9L3
         uq6yZmk+zvwqzFJTCn2NnBn6cuun2crzfN7QXWEJ857T+lLSbfbdXqCNoFePeSqnNyZX
         CB+QdL0CepIeuwkgwB+W304na+tXhAqKAQb3nWGGcMPRW0WE0uFza+RmXUJIyJf6qt3S
         pMmg==
X-Forwarded-Encrypted: i=1; AKwUvBxYPuRvkm0Hb62DKsjqeStCLWyAtefUgcKv1sxwQR5Ox33IzWkk/i3qmps5njqpab4T4K9NbeHt8BLZ9F5liys=@vger.kernel.org
X-Gm-Message-State: AFuF++kEJUpilNgT4Y2yLZqZuyBeawktccoiULE09raHse9NGK3XCGz+
	qa5p7Itf9YjM1nfajaRtQYxm74ax/kYVXCYRoT4cNLNhAZpq86RBWWHQ
X-Gm-Gg: AYBFou19OJXu+RrBZ0tH6DoNpiJAVB9UDo2l0hjn+7XsWOxervkACDSml0w4UGjB5xp
	Op8bbiHtlH2mgt+8q4ISKHZcOFXfnHGdVKaToDRnhcZ3c8dTqIDFAwXi2NxkCV9H9J3couyikVp
	3NGiUzhtYhWN9xiqc6gSGlb9IXiTeR9en15f+jCaqITxZ1ZBs2AAU8JlYNUp4d5P2yOI4CzzMbJ
	IP7gG9qgMntAXn2THQmQhwe8PturwIl+sVS9pghi6QbTMUafSJQUD98FQBTK9o/2uYSXyVE6zha
	WOHxnykmYhuGBfJPmAyjyegfV4Gr9vLImaAxSPsIqNxXhZFtANRHY2o+p+6ZapidXeHQ1x1665U
	Rr+9Hedcnl90YtiW9Nb+JTv3p2Tw36LlSVYESbuUV3nc4Hoq1XgTLzHigkdnYmYWohFSBNPKMyn
	1GUum7g8XhNw13o+zHSet74hDdjfFCcNZ6DTSsyZtT5WIJ66+HqZ5z7uqXdL8mXcRQRY4qUp6a+
	C8e5F8hq+nhX9eAWcaNeWaV+0mEx2Rf2CyZ525N2X5k3aIGcNuOPy1gciAgfdUwLO7OmdAWQtBC
	N8cirsDW7sVYogNChSaAPsvkTnsPEvS3Hz/k5l0TrRIlxYt7pyR2elBqgIMCy2LJYQdtjWmZykW
	WxPxa7gQM9aXZfzuj
X-Received: by 2002:a05:6000:4b11:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-48587055d09mr3572292f8f.10.1788467851379;
        Thu, 03 Sep 2026 13:37:31 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 2/5] slab: check for ZERO_SIZE_PTR by exact match
Date: Thu,  3 Sep 2026 22:37:17 +0200
Message-Id: <20260903203720.63689-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZERO_OR_NULL_PTR() returns true for every value less than or equal to
ZERO_SIZE_PTR. With the sentinel raised to ARCH_KMALLOC_MINALIGN, up
to 128 on some architectures, the helper matches additional values
that are neither NULL nor the sentinel.

Compare explicitly against NULL and ZERO_SIZE_PTR. Store the argument
in an unsigned long temporary to support both pointer and integer
address arguments while evaluating it only once.

This also changes check_bogus_address() in hardened usercopy: nonzero
addresses below ZERO_SIZE_PTR no longer cause its null-address abort.
The rejected window was incidental to the sentinel value: address 17
already passed the old check, including in s390's mapped lowcore, and a
principled first-page bound would be a separate usercopy change.

Apart from hardened usercopy, direct in-tree users apply the helper
to allocation results or explicit sentinel values.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 563dadc16d82..458c4229b1d7 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -273,8 +273,12 @@ enum _slab_flag_bits {
 #define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
 				ARCH_KMALLOC_MINALIGN : 16))
 
-#define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
-				(unsigned long)ZERO_SIZE_PTR)
+#define ZERO_OR_NULL_PTR(x)						\
+({									\
+	unsigned long __zon_ptr = (unsigned long)(x);			\
+	__zon_ptr == 0 ||						\
+	__zon_ptr == (unsigned long)ZERO_SIZE_PTR;			\
+})
 
 #include <linux/kasan.h>
 
-- 
2.53.0

