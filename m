Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9728725A;
	Tue, 28 Apr 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408997; cv=none; b=nsEvhw3gsDNZfuorWkWRBRwo3BWTxswl3k+/HcNP0nQO7fn1OSf5qd7T4rdfTwHvqU54wNdeW/F8drOg3pXPyN8BiWR09R10qfhJ6vG/v778n1XnWd3hgV53ZWE08ACO+gYFYBaoE7Ff1XxUyOk0BPH2E2p0SyZNj948ZdTJGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408997; c=relaxed/simple;
	bh=YVLuQpulE4IGKf3/7Seoz5g6EvCitjNNVoS1iFEVWZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRmBJaKxAmRJcdmje3zAvwb7zDuN3DvYMVUeIoxCUf412R29TfdkrJBnhN8XJC5o6XxXplnfFfhvtKRCKNtNEd3eyd+BhmMlQkpiY6pVNbCp1/YhASB0YJmAQBgdMNHHvyatCoWJzbJJCkmeagelHss1PF6sP8y+CFm6WwM4wBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAZE/WSS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAZE/WSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704AAC2BCAF;
	Tue, 28 Apr 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777408997;
	bh=YVLuQpulE4IGKf3/7Seoz5g6EvCitjNNVoS1iFEVWZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cAZE/WSSmQVOFRo/+tVPHTO4Sxp02oS/bYllLIpL3lw8OXLIQ0lrkt5dKHdUnkU2K
	 CB5JaWg476OmEVmbtTJJypc7Zh4Zgk7N3cXU6tOpohf6UFC3voeUklGLT/UHIs4OS+
	 XogWu2BK+VU2RnPNUMPRR7r+wBr7WM6HJIjGFaJKndndNqZJ2GJWoQdVUX4FAsbNg+
	 qeQjiwJJSLqSjhx9+jWoW7DRC0s+prg3meLM4VELz/UUcnBWYulBwX8GQOmAJzMrFl
	 oKpgMml6UiOmp5QC1W/wIIWZvh5QnAgv0e4TvuAcxmKagy8vYDR/SW4Hwt7whzzd0X
	 8mzrcXpDGMMPQ==
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
Subject: [PATCH v3 04/54] selftests/mm: migration: properly cleanup fork()ed processes
Date: Tue, 28 Apr 2026 23:41:50 +0300
Message-ID: <20260428204240.1924129-5-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
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

The addition of waitpid() calls also makes sure the migrating process never
exits before the processes accessing the memory, so it's possible to drop
the call to prctl(PR_SET_PDEATHSIG, SIGHUP).

Reported-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 54 +++++++++++++-------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 3630f2fb0800..76e380b74658 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -67,6 +67,24 @@ FIXTURE_TEARDOWN(migration)
 	free(self->pids);
 }
 
+static bool kill_children(FIXTURE_DATA(migration) * self)
+{
+	int i, status;
+	pid_t pid;
+
+	for (i = 0; i < self->nthreads; i++) {
+		pid = self->pids[i];
+		if (kill(pid, SIGTERM))
+			return false;
+		if (pid != waitpid(pid, &status, 0))
+			return false;
+		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
+			return false;
+	}
+
+	return true;
+}
+
 int migrate(uint64_t *ptr, int n1, int n2)
 {
 	int ret, tmp;
@@ -160,20 +178,14 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 	memset(ptr, 0xde, TWOMEG);
 	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
-		if (!pid) {
-			prctl(PR_SET_PDEATHSIG, SIGHUP);
-			/* Parent may have died before prctl so check now. */
-			if (getppid() == 1)
-				kill(getpid(), SIGHUP);
+		if (!pid)
 			access_mem(ptr);
-		} else {
+		else
 			self->pids[i] = pid;
-		}
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	ASSERT_EQ(kill_children(self), true);
 }
 
 /*
@@ -236,20 +248,14 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	memset(ptr, 0xde, pmdsize);
 	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
-		if (!pid) {
-			prctl(PR_SET_PDEATHSIG, SIGHUP);
-			/* Parent may have died before prctl so check now. */
-			if (getppid() == 1)
-				kill(getpid(), SIGHUP);
+		if (!pid)
 			access_mem(ptr);
-		} else {
+		else
 			self->pids[i] = pid;
-		}
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	ASSERT_EQ(kill_children(self), true);
 }
 
 /*
@@ -300,20 +306,14 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	memset(ptr, 0xde, hugepage_size);
 	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
-		if (!pid) {
-			prctl(PR_SET_PDEATHSIG, SIGHUP);
-			/* Parent may have died before prctl so check now. */
-			if (getppid() == 1)
-				kill(getpid(), SIGHUP);
+		if (!pid)
 			access_mem(ptr);
-		} else {
+		else
 			self->pids[i] = pid;
-		}
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads; i++)
-		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
+	ASSERT_EQ(kill_children(self), true);
 }
 
 TEST_HARNESS_MAIN
-- 
2.53.0

