Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021346D57E
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519513; cv=none; b=oSgi0+ImKXOYoAhbAYZTqD34J7mhCuE1iu3PofUsNBrUhkeEK0paX7wWCChilxlNYyuFh50l4zGaYkDQOHDAP2lAG3Ol1s6PusGNmgHrSyLdeGw0hGsSuZ9YcJ1gtO3wgAuZIKJUfYGuVg3u3OdxR90R1JF455ns/LHxmfOk6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519513; c=relaxed/simple;
	bh=5yHQlDDHZS6dSVTjZsXMj1S4H7hxEwFqsfVwpTXeteQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVEsMiOyuDvrOQFWnO2pvDim1aIBCEAvJUZ3nhYyVt5vvJN0lMEs4LhjpVL0ag6Kw+57cRGC6c4URiIwnWod62wq7r+yMgB/tmtO8nKYpO/kkoywj2ar43WOu/Z5U9sB92JjMfE5x7Eol8oum17D1hWjO9s7KWq0XM58ZGQUv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGl+VcAm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGl+VcAm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d91ff7d9acso7739315ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519509; x=1789124309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PizEHm/PS46Gb7MqU/Rt95IUcZXQSacvCcrM5GSnGTo=;
        b=dGl+VcAm7kClFdBOevqEH2I+irqA+wM/NvNwoos1I27k9nH4fxG9asrMi4aOErGWnm
         SOIsBoUTgg1yk/0cJGQ2qPsOBINhP3if9Vw7XzswruzjfH7dXO/fb6HeNPsYfxcLlNxx
         7jNnKFHLl+dZ5MTh4aW70AYP2951OuL4FruYw5v/A5eckFaOU6xWY9Xh2Z9xpm+1PYVB
         DUGVg9CjS18Fy9USV9/8jk60YYVDsPf6Zt6TRHwXGNOYjmsrVZC1GQMp15yy277+xAK4
         nGN8r52Qs6Toq/guZQZr03vheowiuN3JS5rZe8oHz9koeiDuA0fwBiL4v/Uvr5Lo2/V3
         +MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519509; x=1789124309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PizEHm/PS46Gb7MqU/Rt95IUcZXQSacvCcrM5GSnGTo=;
        b=p339CHXLJ67YkK5PRyqafeXYlKX6dVqGNvWIi398Ol3Owp0i5GCH727X8dR83icw0/
         27RHWylDiZjQW7Eq0KVMz/76jXUc24lcVLA4xV/Skud0s3+1yRsSXX1tojNbtg2Mx4Jn
         xIWkHjpP8EjKZ+0ciIbhP7JfHKIugChAVJkyljUJBHXBvFW8416iJG8p4iHAR3JGAazQ
         /g6qnOWuCit3Lq8iQ5PtTwyRJDrVld+VxOAxj6dkk4j0+8Yi6vM5XVY7gLRj8pxdQhIT
         8CNMFMB2ZoFuxoLyQAFU9z+TmX6e+DdBBFAmCe+dunCOCnk9crKYlwKUuIT9x6WGLT4p
         l2hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCOXgDtMn959ifG4sxavVW5X3nARnRo4ria4FVnTr5wXjocOOCzInTnkY3YieV3b3RxLKslTLwbhmz28PKwag=@vger.kernel.org
X-Gm-Message-State: AFuF++lTznfRKUfx6eAVh3nFCodAI+iBtD0owujrXyvkE0Yz3gUIoacn
	hRUZgO08k4UPBNVUuJFIHXDSYX/PHZ6cXLkmBDiij3dsaGOc03DC54jb
X-Gm-Gg: AYBFou11fpKWQtm5BRPUQJzLPzemydkvhf3otkdQjWpJqQI9EOp/f05aiVHWxOjX++7
	RzFSzJmnb3j2uRHBt7/pwlu9Rme8epewN308S66e3Qiqn0vVbztRxMWZgTCChqnu8g+a1xVTuyn
	iYwWzhUH/NQhesumCGdf9D6eufrJJBcibtCQwf9hpmXABRcauSE9YvZIOlsW37tj8AD79PdJJT/
	jfD9sttieHg8CQH19yMvhNkdc7raoqnPX4tm3IpjF2D0FhiIIUnadWWGv93iHqpgOy8m2DPiT6n
	KbCbHCTgiwH/K2l2SFg3UrdPHF+hyAhnQV6MY/uDZvJXBGYb3hGcxR3iT88Heugr6Wtaa5XRq81
	N4pdeilZLxGVZqsUADq4SVPuU2jLzD/pOREbAg/a8zj+ITHGI+6V0PvGC538n+0qgcXWncs137G
	8xcYXeB/iPTkQLI0Sm3uMCQL2F2uQlhCc0fq9DCfqYsbDvMWnt3Hs9ZUp5wHCv0JTjoSI0166f0
	+HQH2dscOIcIQdQbE7xvwWuBw==
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39b2623abfemr7468790a91.21.1788519509025;
        Fri, 04 Sep 2026 03:58:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:58:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 7/7] selftests: bpf: fix repeated words in comments
Date: Fri,  4 Sep 2026 16:27:37 +0530
Message-ID: <20260904105743.39799-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
index 5135d5c72a46..158d95c2520b 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -221,7 +221,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index 62d7df9e80be..340670e89ba9 100644
--- a/tools/testing/selftests/bpf/progs/iters.c
+++ b/tools/testing/selftests/bpf/progs/iters.c
@@ -1511,7 +1511,7 @@ __naked int checkpoint_states_deletion(void)
 	 * would get equal to one of the explored states and thus loop
 	 * exploration would be finished (at-least for a specific path).
 	 * Verifier evicts explored states with high miss to hit ratio
-	 * to to avoid comparing current state with too many explored
+	 * to avoid comparing current state with too many explored
 	 * states per instruction.
 	 * This test is designed to "stress test" eviction policy defined using formula:
 	 *
-- 
2.48.1

