Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DA36C582
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183185; cv=none; b=q7QBiVMUbAD6NP2hjE3x3KOEUBFsGt3cdekeo5TYk+hg3clbWfSv3LHpUB2o+PS3PDt3Se/D2I6NTq4qV5q8tIVU8I6x4iKmaj2LFxFP0Ua5TtgkgJ0vALudqVL53PzEIvpI8Kl7kHq72mL+SvxSinPgRIV7A8Y4ex2b2YB59Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183185; c=relaxed/simple;
	bh=hQfYsL4RRwUOfZPXMVlGIisUY0zGqvIM4pVagY2neLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx6CjOtioy9SQN1F6xnjZlwbQ5fNfRwRGeQrtl/GUrmgh+8jVsQVBOiDyUWIs2HigtSD0SyLJxAuUL00ps7A7YCa16xpEtcC8Q73bczXstjiK0f9768LFc8w4Bg6XGKimm+toeEp/+3Vt1gT27BLWbjjcx/CuKMsXfzQT7UtpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a40jDYoH; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a40jDYoH"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so644147f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183182; x=1791787982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNdiFKmiNwVXREQZb4H6BvkiMV9G9eQw2TPowFW6zrs=;
        b=a40jDYoHSEARO+Njqh6WkpbBs7zO86WuKhOAgprBg46TeFinHAzLcxOLTTl8XEGDTc
         Pyooez+YJ7on7JSmEWKGjMaJM+ik1TJaRpSwmcZ/zaZKAVp9J11q0ezcrnScw3yyLoC9
         b58dW0kD6RMi10+zdfYTTxu78ryvqH74apSH8Tpwle58J7FgfLSQ5DSwPL+fhO4Df8IY
         05bQJ7XP0313GqwjzqDbxfpeLDG1BxWgremoIDC8+I/xmaQOq+7nzuWSR/E2zwwA6j1W
         gyr7pmebbPtZ4/TT0NVD3VH4aa2SoNFiue38X/694W3tmbO46bwETt8NInGWXOzcU5PK
         eeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183182; x=1791787982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNdiFKmiNwVXREQZb4H6BvkiMV9G9eQw2TPowFW6zrs=;
        b=xqRfT4wHx+dNXIhNc4HjOxJP8dnTq7uZddqSzpRRZJIyezUhPn/+sBa6TztyWByMzX
         dr+vV9qK2asFsYLUgQ1oGGS3D47suZjMv6Km0nBmSRx3PR4qownVMrsNGg/2E2rKB/Om
         eeqgaht+N8KLQondkdXAyIcQPfAK2yUQ87u59MZ+nITAYjqR/bJBOYSLBeqCwCtj9Q/k
         PKfWikpj47gFv4FE3uvBOhRxev+8u9SRjrSW7v9Voy+A+TgLJ5mKMFBSjkKrNXCgHAvl
         Njobr1DbzqTjzonI1sd5qWqitu+c6j6X65efPniafJ0iJuNabD4OmCJekTJGDr246noP
         lidg==
X-Forwarded-Encrypted: i=1; AKwUvBzAHyqBaazyU1ls81AlBnZFZRScGDARQ1INeayH1mzq6Egwp84pIXutoIvuKO5lZCQPEcjVvyai9tPi3HDrOAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeDajcnyOkz6VXVea1gAfyPhmuxzdhCmIwLHfA+uTyKto85U0l
	GPSmK9TCx8hEwQ0XSfqm1TwaTwV353tS2QruAsMNJac8zIoNPCtuhxWo
X-Gm-Gg: AYBFou2N/kntpYE9dnJRn1EkiozX0QcdGAAifJ5UXy4g9LohssQ/EKxDO61qBnIw6EN
	gwo5fE2Y+WTvWMtKZKJ4R6Fn+PPnDVmMoaa/H8IN/xNgSeylZY7ige87hlRSERcHTVD6TAZcK6/
	UEcSj93mxDPYKGEMYw9dVnnDifbfAUM9Yw0M0vdGLT5YyygzJ7oK9fAb+17ldhbYUCnIc6wh2DD
	tKotonByj+6189hsSpPHtEfqFufg3N8AgLsonMSQ/6ImuoVGPJdSh09b/gf3J2t9dxtj2++oxvQ
	FyNxbUJdgf9sQOgTD36PUqqYjyYb6DlWiMjP3EMR/1JF9jGWqdSoXi7RZ7F4tK6lcnnJSMPfEfQ
	Id95GXgu5c1QR1OtT/tyVuAyMa93jTuwGk3BAIQJkcyNaparzubFPb09dmCSOTfnZdb4CGcd7B6
	na28+3h1CKiwC+bvTfl8k3kUyP1grav4tRHtt5Kn/AI8b7vJk3rKrSHys=
X-Received: by 2002:a05:6000:4301:b0:48b:b1a1:a002 with SMTP id ffacd0b85a97d-48bb1a1a2c5mr20641697f8f.24.1791183182123;
        Sun, 04 Oct 2026 23:53:02 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm1247436f8f.3.2026.10.04.23.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:53:01 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Park Tae-sun <ts930@dgu.ac.kr>
Subject: [PATCH 1/3] mm/mlock: make a zero length request a no-op whatever the alignment
Date: Mon,  5 Oct 2026 08:46:29 +0200
Message-ID: <20261005065244.6935-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005065244.6935-1-azpijr@gmail.com>
References: <20261005065244.6935-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A zero length mlock() or munlock() at an unaligned address is rounded up
to a page, so mlock(addr + 5, 0) locks a page that was never asked for,
and munlock(addr + 5, 0) unlocks one the caller may still rely on. An
aligned zero length is already a no-op.

Return early for a zero length, before the rounding and before
can_do_mlock(). This is a uapi change: with RLIMIT_MEMLOCK=0 and no
CAP_IPC_LOCK, mlock(addr, 0) returns 0 instead of -EPERM, which is what
munlock(addr, 0) already returns. man 2 mlock does not say what a zero
length should do, and -EINVAL would break callers that pass one today and
get 0.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Link: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index 4235a1518fc9..cc28e5d7413a 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -612,6 +612,9 @@ static __must_check int do_mlock(unsigned long start, size_t len,

 	start = untagged_addr(start);

+	if (!len)
+		return 0;
+
 	if (!can_do_mlock())
 		return -EPERM;

@@ -678,6 +681,9 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)

 	start = untagged_addr(start);

+	if (!len)
+		return 0;
+
 	len = PAGE_ALIGN(len + (offset_in_page(start)));
 	start &= PAGE_MASK;

--
2.55.0

