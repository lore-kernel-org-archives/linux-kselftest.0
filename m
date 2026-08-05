Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D13C3BFE
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899386; cv=none; b=hY5uowAeN62Ci1hRdm3P5uBWAlGxkhRosOepsLwbOMzREH9tGQ6c6dy+OTkqK4ZWrgQ/L+atkUhbZd7PT4dCFxLHGTCQp570UqYWj8L2pUweJWBWuJ9QNQlQOsM6akVw9SWEJTJ9FHxXZEJj6h3M2FDxkUY4yrW6SWtu11yHamM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899386; c=relaxed/simple;
	bh=bFLblOr7/KRtDWGaNUQ/oxXl5YkPdtI2jyGgXHP9qko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+KCQiPr63J60rApOCeu7I+JWeB8QkdC7hQ5gGVs9NeSk5C/AMdLBs+5FBMVioXvDogDM1yRUUYIJPVd6zKpOO91BS9DXx8jwsp+Ae5+qH2CIgo/ZUSrWB/Nl2rSYxXUmIzwTpyMR1+rONaey1ARWfSMYlSTDrBfnHznIJhFlhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rO+WoNmf; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rO+WoNmf"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so482525a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899382; x=1786504182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtqhiQPtfLx478uCqIbccXvcoISzUjC+Hx+PXZFH8QM=;
        b=rO+WoNmfbg0eSFcqarVT07ZnGLu6pD6yC1N0OTL/t0F3Y7jdtHE0In3ZtCtdToQO4P
         KQXJOiuep2BUB0C/a0TWfV5+ZIgyLbq2qlWKCD6Da3sYkZWgysGzj++RuX4OSMtHLxjD
         3SlsVzmiFm7FGjN4v4BVY1l3KdXLpCVe1C0iaVmEtB2cRwyVPQxSmU+bYwJwLSyJmKb3
         3y1XgzI8eCQHC90I7kGHygNGyx/N5H4FSczJaBt4rh8fHK99PdoQlVSdAl3OMKi/XJJB
         kO/zdJ6rllJeOFL8QVFmkt7POl9/Ngx0m68ETKxeKHR+c9/fAhH4XxQeSTT+M9W7mzdg
         gF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899382; x=1786504182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtqhiQPtfLx478uCqIbccXvcoISzUjC+Hx+PXZFH8QM=;
        b=TVkhxNfHf4dyl2C71J8n6UzvVCAxK/Ly/zRtzSepZVf1xHbDSbsVtJhBsmJk43ny4C
         AAJGuSQu1ko0Fk6xFcWjXJUR+Ob1nIyUnXDZ/a4+icmauvKnOF21yNsZOaAypjrT0Jas
         6ierPUySbXSt3/8ZwfJcnCEbALSYrZROCu/Ao0e46+gVVsOfo0riyORB6EShWPHbo46t
         wQHpMIqiXNo/I8gHu13rxshH6hJigUXsfxGYoNleKEbb2ksWTS47cu35y+e0gvLbd1UA
         S/vOrVVXnCsAjldmyDlthQrBoDQPChgRKXMVZ3087BBux/luIFoSvCre898NvPgiDaef
         BDVg==
X-Forwarded-Encrypted: i=1; AHgh+RpUsrGT1HKUfoT/9lJMohpqUahGM+nhRaNNn+rXgySuo2RJSuHdRU4eslEZy85qqP/lBBUL9WoU2wWcwFGZMxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyykYnECK8w1ifprSQzOTemGTmtMIWQZYGIywom2K5UI8KlKPni
	0fJ+73EanQrNUZDjmn3tJiFDTslzmHp/8FXCFudlHJgxw4tm0cP0LC4c
X-Gm-Gg: AR+sD10vDwmepFpsk8QlHLFfsNimq3BL6gqtD8KVOR+UVGJPdd7bYC3TQOhNRSZdKOe
	Syl9elMExownuTRAtlp0PNhlkjJui7Dkiq/fm4Mh3/kwCA9ekgKQEtpIlPUKFjD08UDsONnLeaL
	iYhimaAjumvnhkh0poFSu+NLQkOW9vGJkEoIze2eHjn/Gsm7tcVi+CMG3kkAkny91ogo+CJU8yh
	EQUWPVviMqbwN7i3TA7P2s4h9VOSZQH4fbSzv2uj+oFYlo21K6LsULVkHIpF97onLuoumaMGMY9
	GvuNDdoqFHMCEzN0Vlpz6bmhT9LjzlzkVXfV1qcgmdUvPd089/8uPd5905fbu2+/27G/8nRFTcI
	LfM+OlCD/gRvo6rFrtWtHjLiDJz06p3u9ipstJuaKg2pUf6L1w06WqJYWWZuBSagfDx6acWk98N
	0CYeoea3prmkebh1VLUb3VkdRHP5b8QgAChRd+4kxjX4vwKrLk1JN6KTEI
X-Received: by 2002:a05:6830:2116:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7f1e5d0f2e8mr2759082a34.5.1785899382203;
        Tue, 04 Aug 2026 20:09:42 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df2fd11dsm2032300a34.5.2026.08.04.20.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:41 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	alexander.duyck@gmail.com
Subject: [PATCH net-next 01/14] selftests: net: shaper: Drop redundant command timeouts
Date: Tue,  4 Aug 2026 20:09:23 -0700
Message-ID: <20260805030936.1092907-2-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
References: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohsin Bashir <hmohsin@meta.com>

Commit 57bb59ab6fa3 ("selftests: net: bump default cmd() timeout to 20
seconds") raised the default cmd() timeout to 20 seconds, so the explicit
timeout=10 passed to the ethtool channel commands in queue_update() is
now redundant and, in fact, shorter than the default. Drop it and rely
on the default timeout.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index e39d270e688d..c80a4bf8cc05 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -388,7 +388,7 @@ def queue_update(cfg, nl_shaper) -> None:
                        'bw-max': (i + 1) * 1000})
     # Delete a channel, with no shapers configured on top of the related
     # queue: no changes expected
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 3", timeout=10)
+    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 3")
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
                        'parent': {'scope': 'netdev'},
@@ -408,7 +408,7 @@ def queue_update(cfg, nl_shaper) -> None:
 
     # Delete a channel, with a shaper configured on top of the related
     # queue: the shaper must be deleted, too
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 2", timeout=10)
+    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 2")
 
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
@@ -423,7 +423,7 @@ def queue_update(cfg, nl_shaper) -> None:
                        'bw-max': 2000}])
 
     # Restore the original channels number, no expected changes
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} {cfg.nr_queues}", timeout=10)
+    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} {cfg.nr_queues}")
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
                        'parent': {'scope': 'netdev'},
-- 
2.53.0-Meta

