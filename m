Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDBC30E82B
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791154834; cv=none; b=LW8UlMEmowYS5CdQryk0UHdEhwEhuvtFEObT8ICU20MQgL9LwQ6WSsaMAEyULGPHqaDKCWe9oCEADWAHcnKOsCf/I0/zfp65C5B/QC2RoQUUbw91SligWqC8Fktw3ERJgVyZrWFoX4EOlvgH3bZhDznKYtlk4cnkUoSya0feRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791154834; c=relaxed/simple;
	bh=5UBAOPofpToLQ7Z5Z5ErYTHCoh4xA1BPRqqUx9u13a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2KL0grz1ADA5Fjf7pTP68yDfAbo2hUKOO/1FdUfsYwIv8n4u+f8z/9VqJXjLOcNV91/DLsslO+j7cl9N3itW9mjzpT41Hdc5KbB7MpD/EJwIG96gEEf7hKSMMjIPLTtQBcCIMWNZt3/724xyl5OuZVP/BbWDbazJfHmf5Z0Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iN7MS0B7; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iN7MS0B7"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49e8361492fso5919625e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791154831; x=1791759631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/9bjhbBPUpWaue8GUHQjnboGL/2wNmsZKJPcvc1aM8=;
        b=iN7MS0B7xc4HZA73M/ftkYC0QUx3ZJB8JKXGjNx4StzbEzHj2u/OYrNSdtCzTtXSnU
         +5NC+JBd0+4NXexXLnok5RGrf9aw1Vfk28Zztp0U28BdChkEiXsK/mPgurfp8iigIikL
         tJ4kAvilyYijiu5/0d86NqUsG6Z6c/qba9nSjj0Iy6myC3B8mGlmNBHyXr4cUiUqar6/
         aE0isYja1Y/8dGH0W4u19TmH+VQ45GsQHmL7rYIZnD9A4GuPIKp6FrvulWn0Gp61pKXe
         WdKq0DYlZ9oUVcknLCUL3ZTP6KOcTG8zHwSs8RnItB7ay2sk3QrjEhH72g/godXgOxNT
         +7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791154831; x=1791759631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/9bjhbBPUpWaue8GUHQjnboGL/2wNmsZKJPcvc1aM8=;
        b=iqSs+LNTJffQ+BH5za5q77q1qnLtFuT4OkqrCBg4AFow8ISwEkeAMKe4kUHmxPQk6r
         3ZYcfIQk3TGtd0/th95uRestmyAsrXrN7ihN/h+L23yMP/63GURUbqacNFNuPgEwl7mw
         AsUJseCB01H5PmbZo1DK2c2CSJnPlQL6+gA7aKS7YO+2m/RGRUCQHmx2kFldiUwxYU+g
         XEo0rXb7WFnq4dGPP8n/tmmslKqEbT/vMbgX39Zit/Y1ThvTg9gm/BQ9+R2IEYUDV7Oe
         Vtoglg6WZPeBMHlvmnG00GPPuMEa1dLUdPDSfymc9sOlU2+9IuZYyTyVVU4xFfBWkx12
         g7nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV1L0yIWgNa6mWBwW4MJyV2VKJ8+ZaGIViON2KJlIdYtkHvanIQgdtNDS2ZTNOCGyzt4/HCuuaSQqn46sjiIs=@vger.kernel.org
X-Gm-Message-State: AFuF++kkpaC+8yG9Jq2ANSgbZ5a2VVes79LvrFLgIPpKdPFq+s+uQ9iQ
	K2boajrJCvDdrKMX+t614Sg7h/rc49CADGFWKSCaroB46UlI+caiFh5C
X-Gm-Gg: AYBFou0vVio313tNXgIM5tHISvyOhepmlTDRzyhAtV0RxS4JB/wxtrqWLA4vbYKYIcK
	3ymTKe+S3lttA+K980InX4b7dZ3hkmywmwiWMZwy2dN+HnT6ViA68lIPlE2XbjpEjvdCI4evD+u
	Kv3i37dk1EwCNJGxPSoGUFbjLgCDzSxNSy0Sy0Sqc5iT1oOnM2yNQFxcl8nyS3PZUUxMLifzZsU
	BGlm6zylQ1n7LmqycqCn17J7RjpkDrb8IDvqGrGikgyQdoFUMjggflT3UStpXWYS+u5Kvzli4iz
	jWTf+Vq6TlpPRFlCp4Y+oZXtVnDKEkYw9DL0ja1K2EJoeCUtKe403NQOHtraCDm8EioGMr9wu2x
	C0x9H+4DQ5+s+KvvLoaiN2EX7DyguceUmJKQT1t0h7G4zoVYbI/ONmRzCGxiSSUOFY1UCwJ9m7z
	UFc60SVNAHb1rJDVAa7p50+D/SeWlR0N2ioJTQiq3RgK4a055z0K2CZThWuGY1DLI+gDoQBxfLr
	KpWRouSf0yvd6x0xTiv3XuyueAa2xp6m/isPfhtrn9Abjr8NbGXgOg8aiFE44rf4Ygw9wm5O8hS
	1aM43M4mrMm2OjsSOtHYxjS4B2sXKZXQLQ==
X-Received: by 2002:a05:600c:3e06:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a16d3d5c54mr70770065e9.29.1791154831127;
        Sun, 04 Oct 2026 16:00:31 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm240046315e9.10.2026.10.04.16.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:00:30 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Guillaume Morin <guillaume@morinfr.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: hugetlb_madv_vs_map: fix TAP plan mismatches
Date: Mon,  5 Oct 2026 01:00:18 +0200
Message-ID: <20261004230018.190880-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqgUdbtumaO8RiIb@bender.morinfr.org>
References: <aqgUdbtumaO8RiIb@bender.morinfr.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plan was raised from 1 to 3, but the HugeTLB setup check that may
call ksft_exit_skip() still runs after ksft_set_plan(), so a setup
failure reports one result against a plan of 3. Move ksft_set_plan()
below the setup check.

Also, when the underflow check fails, or munmap() fails,
test_underflow() jumps to err_cleanup and exits without reporting the
remaining results. Report the munmap() failure as a test result and
skip the final HugePages_Rsvd check in err_cleanup, so the output
always contains the planned 3 results.

Fixes: 827149aad495 ("selftests/mm: hugetlb_madv_vs_map: add underflow test")
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index 1d111f42dd59..5dc44ff0a377 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -169,6 +169,7 @@ void test_underflow(void)
 	/* First unmap, this will close the vma */
 	if (munmap(huge_ptr, mmap_size) != 0) {
 		ksft_perror("munmap failed");
+		ksft_test_result_fail("munmap failed\n");
 		goto err_cleanup;
 	}
 
@@ -203,18 +204,20 @@ void test_underflow(void)
 	if (waitpid(pid, NULL, 0) <= 0)
 		ksft_exit_fail_perror("waitpid failed");
 
+	ksft_test_result_skip("HugePages_Rsvd check after child exit\n");
 	ksft_exit_fail();
 }
 
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(3);
 
 	if (!hugetlb_setup_default_exact(1))
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
 			       hugetlb_free_default_pages());
 
+	ksft_set_plan(3);
+
 	test_madv_vs_map();
 	test_underflow();
 
-- 
2.43.0

