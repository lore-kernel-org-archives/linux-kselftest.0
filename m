Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277B48A8C9
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364755; cv=none; b=b4kFMi/yjIix94tV+dyhZpgPfvABPNZ46uDjplkSWbnX7myfu94D5X8tDfKXqc/eE2uOfTg3axGDbP9tbrzqzhjSWeHa6k1hDdV7+D3JnlEOby0eDNxGuMfSn4C9nnyvn87Uuj0d0U0zh8Twp6Z4whxTr4tkgMhBZyJ/IU3cFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364755; c=relaxed/simple;
	bh=Lpj2FYp5lpD7KkRLPJAr0iKTl7mf0Lufuxe4+c5LATw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXSB1d9yYv+d+X11hcWj2FTN1ZrCONrgXvcHwvobJmG/FzbGNwlDu2RK56ybKgusLUvdi6vDIVtytU4EP5Z4sdSER3YDn3rT27YwUgr6PyCcOWwKYipm8qVPVsBqO1AjMukkZEr2p8lu+iSOoKwDTKUH0RBPybe/4fjxI6gRVPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTd4rVTm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTd4rVTm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db80fcdf8bso13791885ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364654; x=1791969454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMJqX2UfW+yt+gLeXDIEXy10CvrOQ6MYyBHgdruEdmw=;
        b=kTd4rVTmYegnXxioZ4UGlctMwfu1m+WLlYntZo6y9NQYhv+KpDQFSMZlY7WnkiCxok
         dcbCNGbzI2/Z6oBaU3Ang1nyMVtN6cv+3vAyPHjJ1E8No6/7/6U+VbKMScnUL4Wuacsn
         aBou4xSkXz6chi9P5by8w1gQbbxkBtpy/xs4HScKdTxt7FD6hRXTgZ24iN32+NKaCGG/
         xBfhHAzScC8wN07Kjfb2PQ5pBKRuSUjuwr9U10Uj1ZzeYW/Gd3Ij5OBkMIZsZU4uospn
         RgiooVPwpsqELD0u//pYtulajIxeJPSlrgrtNnw+AmEVfS3VKTk3VcG6cy9Dm+Si51TG
         a8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364654; x=1791969454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMJqX2UfW+yt+gLeXDIEXy10CvrOQ6MYyBHgdruEdmw=;
        b=eesiq7gdA9lBbmXGD+cCr4mZCNwbDiXgxwsvTCgsjaacZZzN1yxKyBGYvsv3JnVfJv
         S+Wy7NqqGTZsjR+Csf1G//J4g4UCuxvj2/N244lyTznnLtG4YIXfCXbjhWhNjJSWiRvH
         7ktbdXLqoQJ4u4H0QIZEcMiHGG2Kv0uyNQkz2L1qZ2q+McQKo03aCgyKvk80cyDNr8Rr
         /bBOw95l63xnyQfyzwh+9gwY2pHNUiBPTCDOimeMImB2U/fHxDHrkStnpqiEqY3Xmr7s
         tArZ0d0dywneokWUZpFDTF3MN3Re8aZytZ3nCFDo9/+iP4jHHJzq26mOG/Klcir6dMzd
         yDHw==
X-Forwarded-Encrypted: i=1; AKwUvBzhjIeFblYR7n3PoSy/xCMDmqwsCZTG5LqIAx7cZEwgnXEZVAmptEJmMHwNqXR6sY8oYTcSFYe9j1SomFmViZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtzNVZyUIxI7OQd4YyeKnU39cV3mTEnAf/RyzOstN9YS7bvbOk
	EmT9Edbwh+5Ah4JJ6TIKLnsdpNR9jWY/a85dbMadk1l785Sui2RyIkUV
X-Gm-Gg: AYBFou3mLUtoBhn+mCA4V9XAuP+NYMmjcPxkJdsG8oYcPqJglWTyunySWkmn2SF40uj
	L7ur4lcEwYUc1TUWY5+5Vh7xa+zni1T5Z1ay8m4Ahggw5mEOWW6889j8C757zynLVLVM/lXgORD
	0xjyQdmKTFagu5C5/5IuPwb4KL8vQeq8Gn7vMdzPTeLtH+OaKu3b24b4ZLG/XW5766UHBZBHiKA
	lrW1dsyXecVKs8IchnTmmN2lpOE8XX8S488JNm3K2a6Fufdh8xf2E1a8xucqOJJuYGlZXBgSxju
	8UA2SJOUGW/xpznsNL68CkOLgzm6XCyQ1xvCFdGui+djy/MjGM1ryXya0djse2x+f1kEDudQKMq
	jCC3RSNhHhGhy6w3FQI1aTV+npUf1bNibPZuU19D0IYLrWWs9JLlQpB9IzlOnHxu6MY3qy70KSE
	c/4j0Rwr7TzPJJVaDWdfU+KqZE2a32rs/tbxq06uER6TMQhppUABeXwkfcdzycoK4H45BeJdsiT
	JzNvgTU5o1ChoAlhtqAHPNeRxo=
X-Received: by 2002:a17:902:ce0d:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2e60036c486mr15062015ad.11.1791364654342;
        Wed, 07 Oct 2026 02:17:34 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604724b46sm7175375ad.42.2026.10.07.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:17:33 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH] selftests/mm: test MREMAP_DONTUNMAP mlock accounting
Date: Wed,  7 Oct 2026 14:48:09 +0530
Message-ID: <20261007091809.1438944-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MREMAP_DONTUNMAP moves a mapping's page tables to a new address while
leaving the source mapping in place. Check that mlock accounting charges
the page only once after the remap.

Add a test to mremap_dontunmap that verifies mlock charges one page and
that MREMAP_DONTUNMAP does not increase VmLck again. Skip the test when
mlock is unavailable.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/mm/mremap_dontunmap.c | 92 ++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 96ba537facf7..e4b0e1868a6f 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -90,6 +90,26 @@ static int check_region_contains_byte(void *addr, unsigned long size, char byte)
 	return 0;
 }
 
+static int read_vmlck(unsigned long *vmlck)
+{
+	char line[128];
+	FILE *status = fopen("/proc/self/status", "r");
+
+	if (!status)
+		return -1;
+
+	while (fgets(line, sizeof(line), status)) {
+		if (sscanf(line, "VmLck: %lu kB", vmlck) == 1) {
+			fclose(status);
+			return 0;
+		}
+	}
+
+	fclose(status);
+	errno = EINVAL;
+	return -1;
+}
+
 // this test validates that MREMAP_DONTUNMAP moves the pagetables while leaving
 // the source mapping mapped.
 static void mremap_dontunmap_simple()
@@ -125,6 +145,75 @@ static void mremap_dontunmap_simple()
 	ksft_test_result_pass("%s\n", __func__);
 }
 
+static void mremap_dontunmap_mlock_accounting(void)
+{
+	unsigned long before, after_mlock, after_remap;
+	char message[128];
+	char *source, *dest = MAP_FAILED;
+	int failed = 0;
+	int err;
+
+	source = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (source == MAP_FAILED)
+		ksft_exit_fail_perror("mmap");
+	if (read_vmlck(&before))
+		ksft_exit_fail_perror("read VmLck");
+
+	if (mlock(source, page_size)) {
+		err = errno;
+		if (munmap(source, page_size))
+			ksft_exit_fail_perror("munmap");
+		if (err == EPERM || err == ENOMEM) {
+			ksft_test_result_skip("%s: mlock unavailable\n", __func__);
+			return;
+		}
+		errno = err;
+		ksft_exit_fail_perror("mlock");
+	}
+
+	if (read_vmlck(&after_mlock))
+		ksft_exit_fail_perror("read VmLck after mlock");
+	if (after_mlock != before + page_size / 1024) {
+		snprintf(message, sizeof(message),
+			 "mlock changed VmLck from %lu to %lu kB", before,
+			 after_mlock);
+		failed = 1;
+		goto out;
+	}
+
+	dest = mremap(source, page_size, page_size,
+		      MREMAP_DONTUNMAP | MREMAP_MAYMOVE, NULL);
+	if (dest == MAP_FAILED)
+		ksft_exit_fail_perror("mremap");
+	if (read_vmlck(&after_remap))
+		ksft_exit_fail_perror("read VmLck after mremap");
+
+	if (after_remap != after_mlock) {
+		snprintf(message, sizeof(message),
+			 "VmLck changed from %lu to %lu kB", after_mlock,
+			 after_remap);
+		failed = 1;
+	}
+
+out:
+	if (dest != MAP_FAILED) {
+		if (munlock(dest, page_size))
+			ksft_exit_fail_perror("munlock destination");
+		if (munmap(dest, page_size))
+			ksft_exit_fail_perror("munmap destination");
+	}
+	if (munlock(source, page_size))
+		ksft_exit_fail_perror("munlock source");
+	if (munmap(source, page_size))
+		ksft_exit_fail_perror("munmap source");
+
+	if (failed)
+		ksft_test_result_fail("%s\n", message);
+	else
+		ksft_test_result_pass("MREMAP_DONTUNMAP preserves VmLck accounting\n");
+}
+
 // This test validates that MREMAP_DONTUNMAP on a shared mapping works as expected.
 static void mremap_dontunmap_simple_shmem()
 {
@@ -348,7 +437,7 @@ int main(void)
 		ksft_finished();
 	}
 
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	// Keep a page sized buffer around for when we need it.
 	page_buffer =
@@ -361,6 +450,7 @@ int main(void)
 	mremap_dontunmap_simple_fixed();
 	mremap_dontunmap_partial_mapping();
 	mremap_dontunmap_partial_mapping_overwrite();
+	mremap_dontunmap_mlock_accounting();
 
 	BUG_ON(munmap(page_buffer, page_size) == -1,
 	       "unable to unmap page buffer");
