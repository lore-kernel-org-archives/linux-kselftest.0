Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D303402BA0;
	Mon, 11 May 2026 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516956; cv=none; b=VeQMaVYu5704ZiJHyC6xKryIJX/c6TFYGw/NRjLygUYC+HjKVCssWngXIgkabozeIb7q7KlbVu0183vTvGwQUHXGwu7tUG4tnnaa6oHog3MksSppnoVRMsvqa0y6w6aZ0XDri4hQrhVyO25PY3Pb5vUfN2d9PT7KbwHdliHRj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516956; c=relaxed/simple;
	bh=D3ucbWX1umJfXHKxzz94PIX6u8f6Y5ITK227CSAANgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deHqxzctn11seg1dLA+wFHuizb0wgB3de48zd0YU03+h9rQHIPGZXdfFU4JPw8+ZxQk2GdLgjEXlrO7Cx8AYaNIux7CK3xTdsa8RbmhQkpm/ZtAx42Sw3shakU4o9MR5iXfyj+ypuzhWIR9dxNjjSVI9z8EHLk182VDOb6fZ4Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElzUc2q9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElzUc2q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33B5C2BCC9;
	Mon, 11 May 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516956;
	bh=D3ucbWX1umJfXHKxzz94PIX6u8f6Y5ITK227CSAANgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElzUc2q9icB8fVCWT3YXVt6seSEwj6pXFOTBb9Sv60fVqzSgolcvFWBKj2MMYtrsc
	 S8UieN7pOCcupgZ5Hu1TbxkciuGtPKqRKg1sGRE1AqfK8+uylDD7oTWoSYMaTiZoTn
	 qXMdhrGVXzqk0iRKXaR/u8VxDZcn1P9oOKjeGeaqPu1m2zjhbjKnEaUwDC4mFiAKYo
	 nsvp8NmgMq+1YydIPkZggBuaO4IBehAIgjqkjtWPKTYxvsHWij0qjrv9CqzVaI+iX0
	 jl91WkkyVzTPLvVwp5ISjTh54Ynx7Y+dSU55yruRVfIrraQVtg+E5DiCm9s69aBo/X
	 aQY9IAUvnSWWw==
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
Subject: [PATCH v4 04/55] selftests/mm: migration: properly cleanup fork()ed processes
Date: Mon, 11 May 2026 19:27:48 +0300
Message-ID: <20260511162840.375890-5-rppt@kernel.org>
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

Several migration test use fork() to create worker processes. These
processes are later killed, but nothing collects their exit status and they
remain as zombies in the system.

Add a helper function that kills the worker processes, waitpid()s for
them and verifies the exit status.

Replace the loops that call kill() for each process with a call to that
helper.

Reported-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 47 +++++++++++++++++++-------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 16ffd3c55ee0..e504829df6b6 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -67,6 +67,29 @@ FIXTURE_TEARDOWN(migration)
 	free(self->pids);
 }
 
+static bool kill_children(FIXTURE_DATA(migration) * self)
+{
+	bool err = false;
+	pid_t pid;
+	int i;
+
+	for (i = 0; i < self->nthreads; i++) {
+		int status = 0;
+
+		pid = self->pids[i];
+		if (pid < 0)
+			continue;
+		if (kill(pid, SIGTERM))
+			err = true;
+		if (pid != waitpid(pid, &status, 0))
+			err = true;
+		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
+			err = true;
+	}
+
+	return !err;
+}
+
 int migrate(uint64_t *ptr, int n1, int n2)
 {
 	int ret, tmp;
@@ -151,7 +174,7 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 {
 	pid_t pid;
 	uint64_t *ptr;
-	int i;
+	int i, err;
 
 	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
@@ -171,9 +194,9 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 		}
 	}
 
-	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	err = migrate(ptr, self->n1, self->n2);
+	ASSERT_EQ(kill_children(self), true);
+	ASSERT_EQ(err, 0);
 }
 
 /*
@@ -217,7 +240,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	uint64_t pmdsize;
 	pid_t pid;
 	uint64_t *ptr;
-	int i;
+	int i, err;
 
 	if (!thp_is_enabled())
 		SKIP(return, "Transparent Hugepages not available");
@@ -247,9 +270,9 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 		}
 	}
 
-	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	err = migrate(ptr, self->n1, self->n2);
+	ASSERT_EQ(kill_children(self), true);
+	ASSERT_EQ(err, 0);
 }
 
 /*
@@ -287,7 +310,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	unsigned long hugepage_size;
 	pid_t pid;
 	uint64_t *ptr;
-	int i;
+	int i, err;
 
 	hugepage_size = default_huge_page_size();
 	if (!hugepage_size)
@@ -311,9 +334,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 		}
 	}
 
-	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	err = migrate(ptr, self->n1, self->n2);
+	ASSERT_EQ(kill_children(self), true);
+	ASSERT_EQ(err, 0);
 }
 
 TEST_HARNESS_MAIN
-- 
2.53.0

