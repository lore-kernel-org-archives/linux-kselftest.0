Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F02D94B5
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 18:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779561276; cv=none; b=YmwsSwrmWM+L1zxVqiSvGj9y7dQVV6lTqxl7iKfGxyF/wG1Mi5Ga2B+k3kkMcsRvXCOxxu+9jXFIMMIjZ7Oq5JZFRjskulY0/wYAkb/xeCDUGKrLIhZC4ksYChauqJGEHknzXmNQhiD4SnWDHYNbacwP8x5VvHGXO77IDyDWrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779561276; c=relaxed/simple;
	bh=ayLCEJxKGv6lRLSreqbdQbMAe8lnt/uLy918tHXWCX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VV4dGBg0J0Dz98JsEjpn072hZlvPqVrl6w+6r6uGhy4p8fCZs7snZKUQQNIkVkEn2200CwhPk9nEtkuBU5OGSPPPKG+ESdohVMzBe5fo5N9tC+Ss14hWYGVs5NNDBimnDALqpBSHybJa4CqzIvcSjUh4zJU+dNGDKVwc1wqNJFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sF8TwgSK; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sF8TwgSK"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-369002b26f4so4763296a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779561274; x=1780166074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0H1SzqM6T6ZRCLW8lQs1DB+o83qlxULhZJ1jgh3dmY=;
        b=sF8TwgSKJ1B5HbzUvGHuTbTE+u03LgDZPO6UuVVxkqqH6088/jewZJtsS/u/Rq9b2b
         LiK+2YlOjUKnzZB0ERBbAM6qCADSmrViAkRz9ha1mK4eE6CglyaNDe4Ud6CrLmz062LW
         OjE/alYV/AgUvxuHSrYi7J9UzwYAeUR/R1NS/iYyc+6E4NHePcos7rVwlw9QhBAJSK5j
         jxJm7Pil+acRz7LqOoGXedPd4WdFTv7rwzv4B8GKbHtcXFCQAkAvDXso5tryNVcCIPBa
         h5+aQvyPnOYAQM0LsdizB6EXmqWNi8nD8pFgywjX1nWZ4xdAJoljD3DLqmgmdv6wTydD
         8fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779561274; x=1780166074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0H1SzqM6T6ZRCLW8lQs1DB+o83qlxULhZJ1jgh3dmY=;
        b=d3cxnQ89ry7tHsgeEzyF+xohx0OGU3ZZm7Wp8MxUlpaYF38uKVmYa1ZmSvM5XUA3i/
         YSYKIqz2RzoYk1FM+7f6FjY6CFb2vzxRfLpHFv0RJ/dtgOjVaBjn+zu3BsvAvPSoG+zG
         nCM5p7GhhfHqQyn/XbCGjLQZtWASum18AVX8rE3hok/XXbYC9p1eznw4zF2sX7itplkb
         WYa5AMlGPfd6rEktBqJfKSj30dTXoBoFgx/r0LOC5lcwffu+TkRP9+s1/azJLQQqkX2J
         GgrfP0v8BgjcWK+DCIDCUoBsCNO5GR3L8X5hkyvd2VikJnAJ/8WWJfInn6HI5zQkWEL+
         bY6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+O9WdAf0llldGa9zxcDpv9R6ve0CS64T99GgoNNSsfK+3wwJhQcxfXyysjN4RNTyLjLY0P/hRs+iCBATNNdsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytPwLpWqBh6Rb87pGH1ngNoIjxavohXk5bdwbP0ljhvTFa5DfQ
	fOGjyvClkHd8m4omMZreJuh0TgHPT86pPfCt/L83ZCSd8KOszww3nAKn
X-Gm-Gg: Acq92OGzlGzQuP3aqn+BuNEqKr/OKp6hpIx/oTVBdgT8B1wyvEqN0l+7JB3UE9adu6D
	C7KrOZTiyRrG7E61EDUausGM9PLwbznSA1boyC38OkdC5Gz3OfEhBH4AWPptW6sqyAiWHd9tejL
	6zrqDBZGrY+5Uk+LBzxXWDpbirPFmcpjWrTxcAJBFR7aMUv7Zlkca8ff+iv9J4hzQSpiCpbvmYm
	2Fz5OUtQZe0dGMBAnd+FbWlUtXyIgtSEQkbCHCgcjI3uZ1fKI+T63yYGkd9PzAyrJ71Frxm6Ze4
	18u8qPl1mEOUAUvn+8g8AusizDYwZtZIL/6x5t11p4e5gVHw05NY7YW0BWoJkHMoRVJ3LENDp84
	ndCftC85hXPHepeVDPI1ENsUw1cV5GvmTp3CFddC7+TuRLPjLsyyPxRN/qZnkMb9Qgt8J47ZYV7
	8ICD9SUo7LjYU0u458WSit5HyX/fcdn3FgwT6KhIbBwA==
X-Received: by 2002:a17:90b:33c1:b0:366:decb:d119 with SMTP id 98e67ed59e1d1-36a677303ccmr7921073a91.11.1779561274537;
        Sat, 23 May 2026 11:34:34 -0700 (PDT)
Received: from archlinux ([205.254.163.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm7002057a91.9.2026.05.23.11.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 11:34:34 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] bpf: replace pop/push emptiness check with bpf_list_empty()
Date: Sun, 24 May 2026 00:04:22 +0530
Message-ID: <20260523183422.124105-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify fq_flows_is_empty() by replacing the pop/push based emptiness
check with a direct call to bpf_list_empty().
This avoids unnecessary list mutation and simplifies the code while
preserving correctness.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
index 1a3233a275c7..3b05ac1d7c77 100644
--- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
+++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
@@ -197,17 +197,13 @@ static bool
 fq_flows_is_empty(struct bpf_list_head *head, struct bpf_spin_lock *lock)
 {
 	struct bpf_list_node *node;
+	bool empty;
 
 	bpf_spin_lock(lock);
-	node = bpf_list_pop_front(head);
-	if (node) {
-		bpf_list_push_front(head, node);
-		bpf_spin_unlock(lock);
-		return false;
-	}
+	empty = bpf_list_empty(head);
 	bpf_spin_unlock(lock);
 
-	return true;
+	return empty;
 }
 
 /* flow->age is used to denote the state of the flow (not-detached, detached, throttled)
-- 
2.54.0

