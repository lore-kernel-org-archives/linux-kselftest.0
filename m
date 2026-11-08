Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149398;
	b=jb4CQ/Ed/BHG6GBU0fkzo1jp/OLe3JWQM5+eHG5U0c6X8pbDfL20lXiIiBBW3wF0NMnj
	 33QeQcFEZAhPnCzjGrQVLgF11GR26C4WLMpsTptezU64GVul7Co+3SA53UBUFtQ7WFGjP
	 n3kp34jPG80ZM9fOU1zxa04fez8aDoYo2WkYsUS+fJNuQkwqYOo2m+rb0MQv5WNw7U2Eh
	 S58btRwCTps56ZDV9T2K/bCNdm5CQC+FtJHdZaF9HbutjIsct/Rc22Hu2bxQzS1yxNSPb
	 KM9eLWPtSmkOsmwXER/iV5TqTW/fZDFqdNx6SJ3w4Cyd0/EXx+aCgaKldsdvtO1sBWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149398;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HxJ1SpOqLJ1LXhFs3MKc9Trp1jkDRwUd5c66Lv59N1Y=;
	b=webK5mgvSEn3Q1ERwPxpA2uHxxNwLyD3Tt8Nn8MLcNMvsVRvtPr7cMWhKuDhrI+ML7zU
	 IWn+5VxKi0P+lIR5fEk5rkUJCkIUL4w5lBw0jKt+3iaaxI+xOHn4V4wGthndtcJ/E8D+0
	 4LnS+QmXM2B2iC/wW4aJ2ocRtO9e+ZBZ9MwwL/ChxWcl3FeKI0Xsk+Y7yxTx/GyvIs3jS
	 SwJn50n6liS9UvnlVe2N3jbm9ekX7NsDZNMRuXQHUUkS/+MsEhka2RQAn2deB54jUphSb
	 oddmqnFVasMV1uO+UxGHrTzBte84P8eniJAN3MIUL+LMFAEWDIooI7SUbx+lPBeDrqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=a5iwgUfq;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C53606A331;
	Sun,  8 Nov 2026 14:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C53606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=a5iwgUfq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794149397;
	bh=HxJ1SpOqLJ1LXhFs3MKc9Trp1jkDRwUd5c66Lv59N1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5iwgUfqhBLAJjofyn3oU1b+/sO43mYG1pGDakD1GysHgy1tpeW4fUfnDkppS+ZDd
	 Ryg9ykbYyqQF+6LFz0EI5b+bQHoCocrlWZdq7/+QhElXDdyIyS421n/UflG5beX7Yf
	 ZCi6xRz7gc5sbotgRVkPbS7X0ypcYdpYcxGNlMu5T5EHvo4sYhFE43UHjk61nxwlJP
	 V6GRIXueAP7hWflDXTVT5uDJqwsVb201u3LaIsXMAPTC3Ge2eG8FgSC2f2NV4qeBXl
	 PMvTpUTYeHDYJ8YPnAic54ZXNetixhx3AVutE/gJehcFkXvFxo8HIJjc7Xl+iKtpk0
	 OCX44/TfLYKcQ==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwn11RZ6zMJj;
	Sun, 08 Nov 2026 09:49:57 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 4/4] selftests/futex: Remove the shared memory segments of the futex tests
Date: Sun,  8 Nov 2026 09:49:52 -0500
Message-Id: <20261108144952.1531160-5-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261108144952.1531160-1-mathieu.desnoyers@efficios.com>
References: <20261108144952.1531160-1-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

anon_page in futex_wait, and shared_waitv in futex_waitv, create System V
shared memory segments with shmget(IPC_PRIVATE). They detach them with
shmdt(), but never remove them. So each run leaks one segment for
anon_page, and 30 for shared_waitv. After about 136 runs of futex_waitv,
shmget() fails, at the default limit of 4096 segments.

Mark each segment for removal with shmctl(IPC_RMID) once it is attached.
The kernel then removes it at the last detach, or when the test exits.

With this patch, futex_waitv passed 2000 runs in a row in each of two
8-CPU VMs, and futex_wait 2000 runs.

Fixes: c3d128581f64 ("selftests: futex: Add futex wait test")
Fixes: 5e59c1d1c78c ("selftests: futex: Add sys_futex_waitv() test")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/futex/functional/futex_wait.c  | 2 ++
 tools/testing/selftests/futex/functional/futex_waitv.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 4bf7d8ee238b..4b7550aff4d0 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -115,6 +115,8 @@ TEST(anon_page)
 		ASSERT_NE(shared_data, (void *)-1)
 			TH_LOG("shmat failed: %s", strerror(errno));
 	}
+	/* The segment goes away once detached. */
+	shmctl(shm_id, IPC_RMID, NULL);
 
 	*shared_data = 0;
 	futex = shared_data;
diff --git a/tools/testing/selftests/futex/functional/futex_waitv.c b/tools/testing/selftests/futex/functional/futex_waitv.c
index ccfa31fd20fa..94ada55b83cf 100644
--- a/tools/testing/selftests/futex/functional/futex_waitv.c
+++ b/tools/testing/selftests/futex/functional/futex_waitv.c
@@ -114,6 +114,8 @@ TEST(shared_waitv)
 
 		unsigned int *shared_data = shmat(shm_id, NULL, 0);
 
+		/* The segment goes away once detached. */
+		shmctl(shm_id, IPC_RMID, NULL);
 		*shared_data = 0;
 		waitv[i].uaddr = (uintptr_t)shared_data;
 		waitv[i].flags = FUTEX_32;
-- 
2.47.3

