Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C172D0617
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382423; cv=none; b=aiYykDU6eUol/QB9F12pU4B8qhu4chd9imvwuRRFgqFCopbsc+zpkc+g5/mTO+KSMlWC8m0HnCrvcxSitke+75cUDkGPJ1+FQYMNizfD50sCru2uaCa69FkIBExbv3btSP5ImwlqOFw9Fq23hKZIQwLAGdMuA45B3zmUs6Q6fpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382423; c=relaxed/simple;
	bh=eH+CnV08N2fIKSTwegC8XAg8UFfA280SaOjukzHDpMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=alJgzzM4G0bmVjS7Eaug9ZyTHprB6xdp0gnIdrUTp8FlooL/hzxZUb8X5egg1opEm6IjFPCMZ42dQpZxgJ8+6SK858fZD2BRKnp9ToU5IMXcviU7gkq3yo2pOjats8VZzUMCUCZ9oLrMSBjlOrJ8DwFeamMiCorQpwy9PJvn3A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrX9TEgn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrX9TEgn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8407545e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 17:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382420; x=1790987220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8AxWCgmThRPp+cgG4iRbScwCflkBmLtbfRDzGlnHd8=;
        b=CrX9TEgnFHm8a6Bpyep06GMTWqecNes0h1Pbsf29BawjQzA9FFn7V9UAMrsyDYMLwN
         D2yx6zEwpRDXBbh3p3QCcKwgT+moXe73+fDOq6+zWC5C35FqeIuakuC4gfgHMxWGW2ie
         DP2DHW2oKzCCiqv2GUm59xXENha0YbBFasl0s1itJI1CMHCnHGFQnaGMxt5F21lMN2mr
         MDXpj0yHsTLxsqGFecktMvwLpyKBaNNDHZZzC4GvqFag7t42KIdJxsITHwpG5MyJE58n
         KoC6neHB2rf+KtsfVzyf6rsnetPHfxxV9fYaMbqAYTo1c0qtHCaFDum45pdh2uBU28jN
         HC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382420; x=1790987220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8AxWCgmThRPp+cgG4iRbScwCflkBmLtbfRDzGlnHd8=;
        b=G8KancVDjLHFS6PqvIcpqQwrduB2iOvTnyJuE8t0UqxWDFuGZe+I8DxIm/JnaA/48O
         EhYZSPXJygXr93znPbL/qE94dBrFDU+cYNCrLsyklgDSCSTg1s2uj6fV4pEtMCm98Di1
         qn/FohhNBRx/elN5EdVhJ0AGm/g/xuT04KFXCmNKe1QoLRLXM48QmdMCyzV5N+oqgEGm
         x3JCfVnugYFciVRjtI2s6BOybJRcXcQRaBuaw01jgs2dWJQf3EfhMyvU9XAqIq2XNaZZ
         w1/KaFZ6aLK5BUkwuHBq75vbGp/LgSvg1SdqWu7EJ5NQtqEuMLBMstA1nJhKZroDKo8H
         Kd6w==
X-Forwarded-Encrypted: i=1; AKwUvBwtK+iNhasfngUcIrYYG3YvcyIFH8BSYrJ75QzfDFTuf+L0uH8nrcNs9xsXj4HBBsvqMCcMH6wOpBqEmkoue2E=@vger.kernel.org
X-Gm-Message-State: AFuF++nUF1dyT1cUDDOkRQlU7qIFwJEaIGr34jDWFy368zh3kU5wRnXH
	EGFBKjtnDhKHbSvFkGIGqsFaDAuD55zZic95BAYNNn5xmMO2UB0XgFyv
X-Gm-Gg: AYBFou0qaD9w71ZAcnslzzteSWfZZMtBW4bGe8tBv/gn0N1Wtvm2sE/IlEOA/xNQ+hE
	xuSU/1+bzZ5IlX9sZ3gQN5o/igh+LL756YLxV27Sbop3xs7EsLETL+Gbjn3kSolGs29+KYRqfgl
	sRWtGUk5t0Y/syfPIN48NYGMKFCh797r+dv7J3YXjEN8SVS5dfZsDRex8qn7e2NGmkT3/XQmDid
	7uyXrygvklVUWcSPm07r+salWg5eRn5RdD5zVj9T5P7bMou/ZrSPzojQkfSuOW12zciNonpHiy8
	KjVWIIJURSqaB+XJxi47bfihHpzTm1ojqcmCGaZBPwJngdRdZuS3tE8ijX5A1yZWlTQhC6VbJcu
	wz521ajAPK4eZqpa/1l9eAZRZXgBTbopMpGjMKqIMiw6H41NDcDwmIYE1BtKP7DZGKlW40RIh5V
	LvmkCjtz65Zch4iMZ+uuaDZ6rReyG/MnhFGHCogBBRJa0TCjuiU9AbKE/ci6/jC1oIhFYXSpwzL
	vM4pd6RIyBWwh7HQKAaCulZka7FDeXUhQw1bL/wAOaTB1CBvNM+rqqKis892AaulY9qB/6zJ/Bk
	T1HpyWpPNsHsbbYomABhikO+DX0tPKNUu0FIO4Dspf45FKVYzJQEgwZQwJE8fLrEuxF054I/OzG
	JSFPta5E=
X-Received: by 2002:a05:600c:3b84:b0:49f:f099:6f98 with SMTP id 5b1f17b1804b1-49ff09970dcmr81426865e9.20.1790382419512;
        Fri, 25 Sep 2026 17:26:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a9e5-4c01-21ce-313a-e569-2df7.310.pool.telefonica.de. [2a02:3100:a9e5:4c01:21ce:313a:e569:2df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbdfasm89908685e9.14.2026.09.25.17.26.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 17:26:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] resource, kunit: stop selecting GET_FREE_REGION
Date: Sat, 26 Sep 2026 02:26:51 +0200
Message-Id: <20260926002651.87267-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RESOURCE_KUNIT_TEST selects GET_FREE_REGION even when no other option
needs it. Remove the selection to follow the dependency rule in
Documentation/dev-tools/kunit/style.rst.

Skip resource_test_region_intersects() when GET_FREE_REGION is disabled.
GET_FREE_REGION has no prompt, so configurations without a production
consumer cannot enable it. Most configurations will therefore skip this
case; this is intentional. The union and intersection tests remain
available.

Since kunit_skip() does not return, the compiler drops the reference to
the unavailable alloc_free_mem_region(), as in the CONFIG_OF_ADDRESS
check in drivers/of/of_test.c.

Fixes: 99185c10d5d9 ("resource, kunit: add test case for region_intersects()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Validation:
- Clang 22 and GCC 13 ARM builds pass with RESOURCE_KUNIT_TEST=y and =m
  while GET_FREE_REGION=n. The built-in vmlinux images have no
  alloc_free_mem_region symbol, and the modules have no undefined
  reference to it.
- Clang 22 x86_64 builds and QEMU 11.0.2 runs pass. GET_FREE_REGION=n
  reports two passes and resource_test_region_intersects as SKIP;
  DEVICE_PRIVATE=y enables GET_FREE_REGION and reports three passes.

 kernel/resource_kunit.c | 3 +++
 lib/Kconfig.debug       | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/resource_kunit.c b/kernel/resource_kunit.c
index 42785796f1db..9eeb2b1a85c0 100644
--- a/kernel/resource_kunit.c
+++ b/kernel/resource_kunit.c
@@ -225,6 +225,9 @@ static void resource_test_region_intersects(struct kunit *test)
 	struct resource *parent;
 	resource_size_t start;
 
+	if (!IS_ENABLED(CONFIG_GET_FREE_REGION))
+		kunit_skip(test, "CONFIG_GET_FREE_REGION is disabled");
+
 	/* Find an iomem_resource hole to hold test resources */
 	parent = alloc_free_mem_region(&iomem_resource, RES_TEST_TOTAL_SIZE, SZ_1M,
 				       "test resources");
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..e7c5d5b5870f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2776,7 +2776,6 @@ config RESOURCE_KUNIT_TEST
 	tristate "KUnit test for resource API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
-	select GET_FREE_REGION
 	help
 	  This builds the resource API unit test.
 	  Tests the logic of API provided by resource.c and ioport.h.

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.39.5 (Apple Git-154)
