Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C143C061;
	Mon, 11 May 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517048; cv=none; b=j/ZaAqXJSVJ2r061XMDd7N0h2C9KaMfEdUMo1yp/0Lwmzagcn64f2PhgX0ZHSRVlc1ndy/6oeUNs17Wv6aFBjgFcQSQGzdpW5it/WB3BEigM5AuVvK6L1Ekep6F9FS7++y39D7HIQtFmB3hpIaVV1mPwGzeokX3SB+qWKX4vQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517048; c=relaxed/simple;
	bh=+OsbLUb461dtYPcOPTpsH3a+LL4wXaeYYZI9beSzW7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0eCTVpjPTKrC6/2QWqWZzR2TUG/DBaMHoYPxJwN/dS8ytBA91QbE8jp/eX7A1jGt934X/9l5KUY8fRFd7gNE8m1KJLUk7P5/L4VKYHnsx9HArz7Y+8imKNG2rdUS3/MzcanjcDx7bh93ygxq5e2BWwusMb4aH1YN+Vocv1lgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6C3t1ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6C3t1ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8079C2BCB0;
	Mon, 11 May 2026 16:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517047;
	bh=+OsbLUb461dtYPcOPTpsH3a+LL4wXaeYYZI9beSzW7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6C3t1mlQbzbHhVQCBix0ZarGNuH0rSPqphj5hLzKRLiGXZfjES5IjZNy6PNZX7vi
	 0Aoh1xQj7RdxC85U+M7gI45KtW9m3uTMtOt/ZuLz1V7i65eo35c+muY+Y972d/I+uA
	 KKPv/FLWRh/hZzfd/PkSdVn92OUGU5VOkcdQUpkKZ57JsLcHSu3OUQZGNIT0GUfIMA
	 jBE8qWbnLpbhMrtweHftQxFl/4Wza/OMHnbOnpf5Rj5k4LA4Tsuu05oW39ewQGrvpp
	 /5djdQKUVAy2KLRJiyYlZSGoeCor8gxboEp6pkrnHLs7WF3GbnxkLBwxWIVOOAbr/J
	 kOGRYKKCzuslg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Li Wang <li.wang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 18/55] selftests/mm: uffd-common: use kselftest framework
Date: Mon, 11 May 2026 19:28:02 +0300
Message-ID: <20260511162840.375890-19-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Update err() and errexit() to use ksft_print_msg() and ksft_exit_fail().

This is preparatory change required to update userfaulfd tests to use
kselftest framework.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-common.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
index 844a85ab31eb..0723843a7626 100644
--- a/tools/testing/selftests/mm/uffd-common.h
+++ b/tools/testing/selftests/mm/uffd-common.h
@@ -40,21 +40,20 @@
 
 #define UFFD_FLAGS	(O_CLOEXEC | O_NONBLOCK | UFFD_USER_MODE_ONLY)
 
-#define _err(fmt, ...)						\
-	do {							\
-		int ret = errno;				\
-		fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);	\
-		fprintf(stderr, " (errno=%d, @%s:%d)\n",	\
-			ret, __FILE__, __LINE__);		\
+#define _err(fmt, ...)							\
+	do {								\
+		int ret = errno;					\
+		ksft_print_msg("ERROR: " fmt " (errno=%d, @%s:%d)\n",	\
+			       ##__VA_ARGS__, ret, __FILE__, __LINE__); \
 	} while (0)
 
-#define errexit(exitcode, fmt, ...)		\
+#define errexit(fmt, ...)			\
 	do {					\
 		_err(fmt, ##__VA_ARGS__);	\
-		exit(exitcode);			\
+		ksft_exit_fail();		\
 	} while (0)
 
-#define err(fmt, ...) errexit(1, fmt, ##__VA_ARGS__)
+#define err(fmt, ...) errexit(fmt, ##__VA_ARGS__)
 
 struct uffd_global_test_opts {
 	unsigned long nr_parallel, nr_pages, nr_pages_per_cpu, page_size;
-- 
2.53.0

