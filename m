Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A83264F9;
	Mon, 24 Aug 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584446; cv=none; b=Yr2P3hLlJtFx6P6kASgWHFqR4doMkIQTPb2J1G1iISq+LKPiQmcIHec+HBIko5MT/RehzgDcx8TKFXXgyTg47UhDR8hRo3tYRO+UncGNJ3K6rjQpFIM6S3M8km1j1DdEN6/n0LHKwJVIF+ekyLu1BRjknj5qtRqJPJNOb1JTxiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584446; c=relaxed/simple;
	bh=hSpT3nT9rLGatD6wsAtnzTQvhRM7DzjJw55A10hr2Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HF7WNoRsQq/iQVCnH9ep0ngUPD4Ygr4weP8jWVkOoMqehA8+OC0wT2HLUGp/9sOW7LeF4mU83jOhqLd3V9BGINBKTazrkMtWeND+guIj1eIubRr/LWd+qyywvIX8OfttKM3P8v4GRVCaG9Sp/Jrc8ix3j4szugRmVc/7HN8agyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0831F000E9;
	Mon, 24 Aug 2026 15:14:03 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] raid/kunit: Enable RAID6 PQ and XOR benchmarks if KUNIT_ALL_TESTS=m
Date: Mon, 24 Aug 2026 17:14:01 +0200
Message-ID: <64c6e0191bd8ccef0074ffbb09bd0584680d710b.1787584360.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the (possibly long-running benchmarks) by default may cause a
big delay in boot time in case of built-in tests.  However, they can
still safely be enabled by default if all tests are modular, as they
would only run when requested explicitly by the system administrator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 lib/raid/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/raid/Kconfig b/lib/raid/Kconfig
index 01f007b2522cfc33..563a178aa930c420 100644
--- a/lib/raid/Kconfig
+++ b/lib/raid/Kconfig
@@ -32,6 +32,7 @@ config XOR_KUNIT_TEST
 config XOR_BENCHMARK
 	bool "Benchmark for xor_gen"
 	depends on XOR_KUNIT_TEST
+	default y if KUNIT_ALL_TESTS=m
 	help
 	  Include benchmarks in the KUnit test suite for xor_gen.
 
@@ -63,6 +64,7 @@ config RAID6_PQ_KUNIT_TEST
 config RAID6_PQ_KUNIT_BENCHMARK
 	bool "Benchmark for RAID6 PQ"
 	depends on RAID6_PQ_KUNIT_TEST
+	default y if KUNIT_ALL_TESTS=m
 	help
 	  Include benchmarks in the KUnit test suite for raid P/Q generation.
 
-- 
2.43.0

