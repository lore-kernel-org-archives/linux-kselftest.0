Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4D47FB0F
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147338; cv=none; b=RTYQcY6wtLhwjq07nMoZ5foZ0ixGmOqQSTs2lCpOlFYD9b+fdNqUEd447yvnThBJ/skX+IidBO7yB/zGIm+u/ISkwgq8nLgrvKChmyngVXF428qUT6BjbzXERneb/3TO5IuC1KKCH8CeXAPCC4VzprJsC9OGlb2HzG23hjSR6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147338; c=relaxed/simple;
	bh=skJBRYLB/FR5oiV4h2qDLm5zGSWRM2OCYBFKl4Cjj18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaOjfDfw2jFdh3i2NDwOZDriW68a+AFvHME2/qXl8mERjEG0awj3K1Dje+EnN9OcfvZYXMVL4MMmwSXlnaT/xpbIS5x363KNrqJniG4OG3r07wYwtUrERuqLFCxv7Eh2AkCu0AYJ/IDpYin88dCyObptks+ArLX4SnvI2sr2eXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aI8zBt9R; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI8zBt9R"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b05d75172so689138f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791147335; x=1791752135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UzFidq+NXBj47/Ep/6RIWkRxXs+9tuu6zEHYY1jeWcY=;
        b=aI8zBt9RQKmBglc8dl7dUL7c2vAMrDKLWgeFrSWkxBT+zme5bZkglW/NZLxzh7gbRO
         tljPQpPGocVai3+/wcpEEUEA+EXJNDOklurWGhskMmmsxai+X3JSJe/XHqrot1R4xcx8
         wNykom+2hToA+wiBgpwwtsB2OhQHH6+fQPqcv0mgj9JKE1W7imBG5I7R8lKI9EV3i7rH
         5MShmJRnTCk/86mImRDsQL0x/LT6/ewgUEL48CrP40vqG9bb5fWr8fOS3o52uo8tnr6V
         AHBGLvw8ZJNrEoR015INGDiFEVIr18k1F/Roj7eGc+/6GEzZz8GHSba7C+30ToLo7qbS
         lnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791147335; x=1791752135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzFidq+NXBj47/Ep/6RIWkRxXs+9tuu6zEHYY1jeWcY=;
        b=SjSG9EX1OetNnotNXwa8HeBNgMQLrTD2ydQVo4kJHPROChbZdVk7SyoNRfUhvQe1bR
         xpPjEwIBtGByxxybdecmIEljFbjDDhG/CUqevL7GrxFYBa0KIl4qpNwFzIkfDHbWwWXo
         MUCiE4NKeM9+jpVB2dufVMsH0cLBUHjcBIJ7uISjCsDj3AHnktiIdaTybofrroauAysu
         JUqJSjQDu81+4ijRLDubVT7+neP7bqznD45GxkNH8KD94S+7EulxMoOnUCkrJ+9LDIyN
         qvKxI8IMIBLkpeRRPG9QLSfgu16sHfnY6VIRnOyVLUWjyn8llIjPoBMrb0BIaxBHxBsW
         VSZw==
X-Forwarded-Encrypted: i=1; AKwUvBx//BMsc22QK232AG+gV2luVQfN06CeNXuQMrkQ85+bEHW9T4Rs61LaRxpLh/JT5UK3K3mtxCkDdqyTB7YzQ74=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyQ+6TYeTZWNHl0i9SX5bY7TcFdYVO0s/L295hpH1HIHZAvNBR
	kB/rleDezPuLkYoUHwHN8FgLKoFSLzJAT9UGfbWd/ktrVsQRIiya+dYQ
X-Gm-Gg: AYBFou3Dx82Qv8tLp5eMOPTv9KRXxAc/Qyk3BEPvvOsZ1moklviXjygna0ADlPrHL7i
	+G8lIYGX8vtXqcKZqjt0DyQqBSm361tXQpzay+FWwHI3S4LJmgCQXP614i/9Pm2r7wTi7epkwRH
	YAeoFDxsv7RhkN0hpxFkx95FRxBq2LP3H42ZAPxPpHaxcNHkbZEovzqE/z3gYOM01eRNClL+qzl
	vlWhk/Yxl4ZbX9fkdCQoaI0mwszcPVm4Fl+TZLLRp1QE7oBY2G/uEWIrrBT2n5RXsM0IAvcjIoT
	AW73ZUW+Ao6SG6dK4rfWxVD+n1QjYRk6cGdB+cvJRjHa2UmZoFgr6nKp+TXla9L5K6l77o/owkt
	c75CNZ4KWnXkUbAuri5GQGh1nXnJh8uIb75hANYviXR2ZIN5pZEchRwxYYzNMVyU4AyoQ6oiQZF
	StcmbSoAGOK+oDzztw3ICjvb6goTa/uKg2T38LbWiAumHwwxP5PywPa2bP5xJlZVteJ1AQMe0Cs
	nI8aJWLCC8pzAE6Pa/CfWL/Jr67GLocg1MKxgo53wh/Y2FX9Vniz8yYCWa9q+r+3XCqeOsacfGJ
	4LdCpfiCdAXXMbmySN4nmfhVUquVarPEFA==
X-Received: by 2002:a05:6000:2586:b0:486:f3c0:c26b with SMTP id ffacd0b85a97d-48c4803032dmr9225013f8f.57.1791147334624;
        Sun, 04 Oct 2026 13:55:34 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0ab7sm20855638f8f.7.2026.10.04.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:55:34 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: hugetlb-read-hwpoison: add setup of HugeTLB pages
Date: Sun,  4 Oct 2026 22:54:58 +0200
Message-ID: <20261004205458.119608-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every test is expected to reserve the HugeTLB pages it needs.
hugetlb-read-hwpoison was not converted, so on a system without
pre-reserved huge pages the MAP_POPULATE mmap() fails with ENOMEM and
every test case is skipped.

Reserve the pages with hugetlb_setup_default(). Each chunk size runs two
HWPOISON tests and a poisoned huge page can't be reused, so reserve two
pages per chunk size. The pool size is restored on exit. The poisoned
pages remain allocated until reboot.

With the patch, all 12 cases pass on a system with no huge pages
reserved (tested on Fedora, x86_64, CONFIG_MEMORY_FAILURE=y).

Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index 70b24e3660c4..31748a24448f 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -13,6 +13,7 @@
 #include <signal.h>
 
 #include "kselftest.h"
+#include "vm_util.h"
 
 #define MAX_WRITE_READ_CHUNK_SIZE (getpagesize() * 16)
 #define MAX(a, b) (((a) > (b)) ? (a) : (b))
@@ -281,6 +282,13 @@ int main(void)
 	size_t i;
 
 	ksft_print_header();
+
+	if (!hugetlb_available())
+		ksft_exit_skip("HugeTLB is not available\n");
+
+	if (!hugetlb_setup_default(ARRAY_SIZE(wr_chunk_sizes) * 2))
+		ksft_exit_skip("Not enough free huge pages\n");
+
 	ksft_set_plan(ARRAY_SIZE(wr_chunk_sizes) * 3);
 
 	signal(SIGBUS, sigbus_handler);
-- 
2.43.0

