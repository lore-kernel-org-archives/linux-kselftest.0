Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80899414408
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365309; cv=none; b=cq8KsB2RP3sumpqY6FC2PKZH8nnT/EoibrAwNmgOwf+SVD3dReeRyWkbjfXzOEkwqj4Pqq4OE75fpsJE0oX3XQL+/3aBWG8/NovS59Ajd4VMv5fnvrmJ84UXmmMy3AEhBeAWnQZ7Rx2cBVGbXbpsOVaVqYXD7Wm/8yd6PVN/rIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365309; c=relaxed/simple;
	bh=BXVesABP/l0w9gs9cGwYWUSxn4Yy0tpp8Ed1lo5/k3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QxD/nz5h0BJZlHXC24NGaU4WpHcjKyXwXY9CfeJV7Eud3ms0WylOHA/zDhISjfA2pYGBRthwUFNAU568uVvfvvL/N6ln1Q9Y2iptk7iUfPJveS6iG9YSun+qGpvPH5h+j4fIifnnsSOX50eNBpICZEz4CtWCMtVpTESlbd7e9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I39pQuPM; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I39pQuPM"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49b0dd21eb8so9189575e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365290; x=1791970090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aeP9LnNMW0XFzFwn1LZhyNEoudM26n+EG4TxrN/cfzc=;
        b=I39pQuPMefb0B5dpJj0XLXCVTzw4Ll41nVCgoAeDEgj+XpW6DyrXH/qno3Hmjn3ZA0
         zMLrVLrgv8iG1OysZOmg2OHRFU3m2qyC0jtZvwSTcRZ0GXU8pssChvffAetk2F0rwDIE
         x+g+s+3rTjcACDCoIJxID5Kra+Iad2z4CU0idRGcVoXCQud1Dto2mW0UmACvfgVgfYlU
         QmJ6IaYu/5Oh+slMkCcR9HGq8ToO+hxSQN0OEY6kV/CDP6rDCEk5bn5jBb8w5K1HOuOj
         POB7IoXird9XT2pw6zKz6nWBNkhh0ysFQ7nDZ4G66iN2bJONGLWuAUq2+YyY7TVGXr+p
         sknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365290; x=1791970090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeP9LnNMW0XFzFwn1LZhyNEoudM26n+EG4TxrN/cfzc=;
        b=Y+ad8XS0S/ahCizm+EgDluKmzb8lG0YqFXG83L0SUJCIvH+7Lh+U2adKdO4VsCa1hI
         uYu3eTTGsd6JBGin9goZA1t54H8gP0P2qtjvhEdjLTsbj7bROsUqddAnzJbw6WveWt0O
         eXlpdz/y7a1PXOJUgmUY4qq9UpWcBfvGjFQh97NcRiAl9up51Bnzbfj8iHopM6xXUOyl
         hAbaMcTvO+k4OPBTnEh5lHLQl+uem6Q13JoB9WofRz4jR6H0S5igVcs7XXotfF3TuwfS
         bhOJ4nzlXQCwhm/hp0erdRO3uWcowKa04N+5UDXOhOygbTMv+EESMs2Mz5UEN2OoRACr
         fkDw==
X-Forwarded-Encrypted: i=1; AKwUvBzM0/d18sV1CLpR8gmD8DfGcDFErztuZvF+2Km9OxFiqhjCJElLut8z7OrG+fZ5R9tFfLi3cIx3xzVVT2l+7M4=@vger.kernel.org
X-Gm-Message-State: AFuF++nr5TXicUyeRFbk5k5mzGDwxynZT/gtru62lY5g9649NkaS/Y2G
	7ys6NQzCc3hNY0DdL12cdDUlv41QfhB9VTbHvuWRL4GZswKRDflLPnVs
X-Gm-Gg: AYBFou2y1DS26fhsWe5ZahhgZwy+vCaMXiHB1y84LOgOR8+ej/Fn+OFs/VwDyKQPVXX
	2OnHmQpISorcusGfwbZpnSrd+2z7lAaSPDeNWJUwJNn6F1yPipEWV4PyZq97zdTm8nFKAOoYKGJ
	AIBaAMLPQcRQp2a7PRj/f95hl59M/5rjvJKV/oNO8ahbOfyrFYmqSvLMnSPo075nJM6po7IAANa
	iLDcFyLtgm6s5TTcO4XLiIeBzr8/Mxy6j2W7rQB7j5c/lAbLgCp8UIme4A04n7MEDP8cbLOEW0A
	IJPvwEMD51neFWTu3DJRl9H0SWGAI18OzNiVrjGwwxzx+RWsikcMRyfrxmEoDBGS7VsNxfNi/3S
	KwsagynudNTX2KyjOQgy+ZWX645DJ1dTMR1O4EsX4GprQRzel0/8PK55zhCcLnkxIS3NElivCEG
	tZ2M0aiKk8E5bBiEpwHoBgLFSv4vGJbNw4BHmFOWC9Gw67lPDOHJJ1gh7QbBmmkrvf2c0rmx/e9
	kE6NfMZ2CxZ1eGJNGpWUQji9LqVQPtraqhaEHBkznVGBGh/B/T7XEbPNiOB6MmFKbwuTmBotJOP
	4GIOf/Yg+QN5IZkCxEpE+WzZ68PnL/jusg==
X-Received: by 2002:a05:600c:1c0d:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a18043c6a5mr29814735e9.20.1791365290293;
        Wed, 07 Oct 2026 02:28:10 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f557bcbsm81016035e9.9.2026.10.07.02.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:28:09 -0700 (PDT)
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
	Sarthak Sharma <sarthak.sharma@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH v2] selftests/mm: hugetlb_madv_vs_map: fix TAP plan mismatches
Date: Wed,  7 Oct 2026 11:28:01 +0200
Message-ID: <20261007092801.35649-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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
skip the final HugePages_Rsvd check in err_cleanup, so these failure
paths report all 3 planned results.

Fixes: 827149aad495 ("selftests/mm: hugetlb_madv_vs_map: add underflow test")
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
Changes in v2:
- Drop the duplicate ksft_perror() and report errno in
  ksft_test_result_fail() (Sarthak Sharma).

 tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index 1d111f42dd59..0f6afb834dbf 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -168,7 +168,7 @@ void test_underflow(void)
 
 	/* First unmap, this will close the vma */
 	if (munmap(huge_ptr, mmap_size) != 0) {
-		ksft_perror("munmap failed");
+		ksft_test_result_fail("munmap failed: %s (%d)\n", strerror(errno), errno);
 		goto err_cleanup;
 	}
 
@@ -203,18 +203,20 @@ void test_underflow(void)
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

