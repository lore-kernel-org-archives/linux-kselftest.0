Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C764218AC
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602297; cv=none; b=FP1qPlTRfMeIzwj8hIZceUFHJydpZX4GX641HPmPl0GLrEOnf+6Pul9FswQ729RErx/9gus4sDzyJDtJPJwvLrMdFrW7c9NgsZnJB9PnLguJVD6P9Fsej4nOZgnuI1wkcot8IpoEnhzaTpQCXUy+HoyhmK0CTq760DhwAg9yUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602297; c=relaxed/simple;
	bh=BIygEW99km40DQ4U36jHMgpKSlVhAexmh7XqJfveh7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlR7HnwfIUvb9FVWwCqXOmQJqFKWdbABhkba7Laj/q2X4rYAalajmyc5KOqrXcCFnfs8CBzaJ7M5zUeuW3cUPdlAjSIZN/9snc5q8jP6/g5PR/nRxRsFPkwKnQ0NGgnWGe9rlSz1L54gr0GzUgvpeRHVWTd9SFEQbbMblj+YZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNKz2Ni1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNKz2Ni1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so33664205ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781602295; x=1782207095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgtSCkqGvjyXkueHDMEHTv56UIjlIzxynvR+gbghz2U=;
        b=TNKz2Ni1jUU9ZBPds65++RIucziSCMXPF7RhWF/8MkFpI4JMY6fUb4s3CRgqJJbkYf
         TND+HPEgQAvT2r3f/JTbxzdhmUhHmKTAi9CoYyxJ9O6+1jgtKaIM2PEXwh8Crov54WUg
         6B5/pk6FERxR3EEqnUpGWeGMQefcFzslwwQZpZ6427/Djl0l8Z6Fv0OJlQ8Ze/PCuJ4O
         3yOPw60oLrlAEgzl2/RXWkGMd4uj3+j73vceSeIzZaUDauWs8jXAxgzvQWQrcjOCHUsf
         7zCV6Ek9X25MvYOCXJ3WS/lCMOyfjpY0g55cdwt6QeCG3vViiuTlvzEYfh00ameymu3i
         cSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602295; x=1782207095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OgtSCkqGvjyXkueHDMEHTv56UIjlIzxynvR+gbghz2U=;
        b=m5D4526RsybEB0mjM/izX4CPI0HZR4b3YFqlU2v2t6O2Tdh3yX9hecp/wrgpQnzhFf
         AM81GEgHL7RcvPrqV9Hln7mgr3Z+V+V7Q+DCpTNMd7AjHd9pQap9fxjJXF6azVBxEo/f
         4ZoovCxHyTxeKTD7sj0QqYaIXiQXN2TU1Uwr52b8E2LQXL6921pB6EnVpkewN3XGf86A
         cfpf5smLv6VpPxN0jPAcEmoB8zcV0I1791Yn+IK962TVYQjoZMy19+ZSW7bj56DjjzgT
         cUYbPhlIvOCnHLhtSjPI5NLsyF1h1VnfqWTCpxMFQZcDTWl2lO1nTTjpKS5v9Ir3vUC2
         51YA==
X-Forwarded-Encrypted: i=1; AFNElJ/uquWmFt7zaX06bLAevDHWHHo9Cw/eOltT2cj4+uf3ErP2RK0D0IUu8ZVasGWN0V7hKoufsvKEmPL4ordTKJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgdaTRp+5WAqoqvWpDDmaTLHMl5lzjRCibb3OlvvrKS/FLqlUJ
	//9zIsGjVNXF/TsoAAhcBf6Vjc0RB2EFuWArbSVwN9vW8zOSqhNGBpP/0nL5gUaXR70=
X-Gm-Gg: Acq92OGxb4w55gKFrVYgWQYsD8NL1jfdYS3doBp5UaNALXAM8J8phJ1BaM7bMhfcPTe
	nM5Ke2XzMagXkziIZIUMDN0msQJxXcicIqzuPh0jpU8AB9gf0jONmmQqlbem9vEx1jV8OaaDa06
	uvBh3qgivlVtLI8okngs0XteD17YJGajXFswXw1JmvhbH7VTPpDUY7vNRIY+PZ7TMcJCu7T4QRq
	oSNCgRzkqYTAPQ1AnpBplH6eeEHOJ5dheqOjBk83PFn+B5PwrXlUGqQb5EP35Z1mXuxqLM4jpnD
	l0Q5Cq0q6eZwKqT/+7tud9B8Crf3GsRR1Iunl+X/r85DDa2NPF7hnKCQE/k05Oc67pY0/dq6M78
	5yzqU/3bECgipbdy0II1X3e52bwv9oQ60VzeXFLAWyWKIicRUx5EW5u7BlnibFJjeUPXMDmbC0V
	8TStIK6Oe0IlMzyK9yriEdXdcLGiFkiE+/SNrJn4e2QbeQqzfBY8EA5yUchJffDcc=
X-Received: by 2002:a17:903:1ac5:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c4135e86ccmr181937835ad.35.1781602295359;
        Tue, 16 Jun 2026 02:31:35 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::209f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c52sm127329545ad.22.2026.06.16.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:31:35 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	toke@redhat.com,
	lorenzo@kernel.org,
	paul.chaignon@gmail.com
Subject: [PATCH bpf v2 1/2] bpf: Fix partial copy of non-linear test_run output
Date: Tue, 16 Jun 2026 17:31:02 +0800
Message-ID: <20260616093103.471444-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616093103.471444-1-sun.jian.kdev@gmail.com>
References: <20260616093103.471444-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For non-linear test_run output, bpf_test_finish() derives the linear
data copy length from copy_size - frag_size. This only matches the
linear data length when copy_size is the full packet size.

When userspace provides a short data_out buffer, copy_size is clamped to
that buffer size. If copy_size is smaller than frag_size, the computed
length becomes negative and bpf_test_finish() returns -ENOSPC before
copying the packet prefix or updating data_size_out.

Compute the linear data length from the packet layout instead, and clamp
the linear copy length to copy_size. This preserves the expected
partial-copy semantics: return -ENOSPC, copy the packet prefix that fits
in data_out, and report the full packet length through data_size_out.

Fixes: 7855e0db150ad ("bpf: test_run: add xdp_shared_info pointer in bpf_test_finish signature")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 net/bpf/test_run.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 2bc04feadfab..976e8fa31bc9 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -453,19 +453,16 @@ static int bpf_test_finish(const union bpf_attr *kattr,
 	}
 
 	if (data_out) {
-		int len = sinfo ? copy_size - frag_size : copy_size;
-
-		if (len < 0) {
-			err = -ENOSPC;
-			goto out;
-		}
+		u32 head_len = size - frag_size;
+		u32 len = min(copy_size, head_len);
 
 		if (copy_to_user(data_out, data, len))
 			goto out;
 
 		if (sinfo) {
-			int i, offset = len;
+			u32 offset = len;
 			u32 data_len;
+			int i;
 
 			for (i = 0; i < sinfo->nr_frags; i++) {
 				skb_frag_t *frag = &sinfo->frags[i];
-- 
2.43.0

