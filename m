Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7698B324B24;
	Thu, 22 Jan 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101379; cv=none; b=nxaQZTaBiVTlB4WHATeRbvJm9Xsyn4RywBv2XptEOUEmhMHcLzuv3epFmJA9yjuG7NrlAUcIsoVAA/dPC73+GFv7AZY9R3bPTSWRtSbdXf5AuIFbt7933PlATZTIX2r7BgphsRlUOrAL4OU+JzZsUfDoI7vC3verIs3JD8bNSbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101379; c=relaxed/simple;
	bh=MIgJ0nPhFBIbzhbdKUkOS2ZaPlA5KcP0n7dfcApBgMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ztgif9zLOQTni1WXUUeANsJZjK1K8cCs4Nc18UWIhuCNP0Hc1WbKbKtduFi7O5TAM19C8pRdFYWz2ksnhllKI88mpcuZVLV0CUjrWju8GzRbS95OE9rBjHC9YNMS8cGbUVY+FIf0PMUs76ud6X1KVrhfJmwizp6hfKnmRtcDMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7F9A1596;
	Thu, 22 Jan 2026 09:02:41 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94F103F632;
	Thu, 22 Jan 2026 09:02:46 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Usama Anjum <Usama.Anjum@arm.com>,
	SeongJae Park <sj@kernel.org>,
	wang lian <lianux.mm@gmail.com>
Subject: [PATCH v3 8/9] selftests/mm: fix exit code in pagemap_ioctl
Date: Thu, 22 Jan 2026 17:02:23 +0000
Message-ID: <20260122170224.4056513-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260122170224.4056513-1-kevin.brodsky@arm.com>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure pagemap_ioctl exits with an appropriate value:

* If the tests are run, call ksft_finished() to report the right
  status instead of reporting PASS unconditionally.

* Report SKIP if userfaultfd isn't available (in line with other
  tests)

* Report FAIL if we failed to open /proc/self/pagemap, as this file
  has been added a long time ago and doesn't depend on any CONFIG
  option (returning -EINVAL from main() is meaningless)

Cc: Usama Anjum <Usama.Anjum@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: SeongJae Park <sj@kernel.org>
Reviewed-by: wang lian <lianux.mm@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 1896c7d4f72e..2ca8a7e3c27e 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1552,7 +1552,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	ksft_print_header();
 
 	if (init_uffd())
-		ksft_exit_pass();
+		ksft_exit_skip("Failed to initialize userfaultfd\n");
 
 	ksft_set_plan(117);
 
@@ -1561,7 +1561,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 
 	pagemap_fd = open(PAGEMAP, O_RDONLY);
 	if (pagemap_fd < 0)
-		return -EINVAL;
+		ksft_exit_fail_msg("Failed to open " PAGEMAP "\n");
 
 	/* 1. Sanity testing */
 	sanity_tests_sd();
@@ -1733,5 +1733,5 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	zeropfn_tests();
 
 	close(pagemap_fd);
-	ksft_exit_pass();
+	ksft_finished();
 }
-- 
2.51.2

