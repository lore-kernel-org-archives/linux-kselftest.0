Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848127;
	b=Ma2Ib+MT11l6rrprUfKTrMTh+qnzRRWMdCnT3coKID0NefWHpla9RSEwtlU6yKPzY+VW
	 SMcxc1K+TSS3VYnSKE6OXGQD4CYe1OjAM23kbUjysT0AwEROVNyVVbM2xeh0oWtMDzV1s
	 9ZEHKRWheHFuaihUHij0+8yatExnUntIMDtk/mKigmikRMqsCDkFFFQBZ19IFda5xcy3c
	 1c8at4ccWZQNFgJqtox/mIewQlPHaAy+aOvtQGxiJ1rbvz2brcYZhlsAkcAq+G5BX+OJB
	 hLOnaLl7Ourqw8UeNdwS04WhdC1kcwIrSidi1Jyg/p29VGp6Q7M364P0d2S3EwRQROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
	b=owjZ9kpKNULuDXf+ICY81+kLA2tu+WoGPqKLsVvPmlmw0WOhIEGMQw0aYoylREImEnW/
	 B2XNSywjz4Y6ciZQvbkIrJi4atK+RAD4oD/cpOaERe62ooIXN5ryanbDCX5FnxrxjDR9/
	 jR0+7VnLqcL7rkd6DwXS1zs0YjN1oJ5UMPVR7oLZxEuJnJ7xKJRcmU8NpJTL9f4Sbpven
	 S3r8zI50xpZkpo+wYsEQG/eS9PEKW1+KyzuF3rgRNeiT6iNmKI3XlONeJ2wI5QjOfv1ur
	 r/Ppn5kxmIOymqgORvrBCMhaZDKkcRUAlufOD20rs+6izOu8XqYh08FtBd/8RjOXhSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wakel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CsDcX3nK;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16648606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 03:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16648606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CsDcX3nK
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2755951c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 19:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793848126; x=1794452926; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
        b=CsDcX3nKRwdsdG86VswautjP8KAHQT3Hml41XXUq6KT+/IgwmNTOgGJet72r0trjJF
         Bp37X+qDspYxqVKP4ZnvDCJiS1xPKFYkydMBS+k60j42JrIhDGkb5u1m2729gJx6HDys
         RLZvwTcP2pZr76QoeCKoMaWFDKjsWvmfFCVFmHmXlGCJU3LNvFaPrBiik+8lOs+IG+tN
         sBEBeYDXuK7ZClGvr+9+sFEQIyMW5NNYO9u9zr/m1au+oxDEJRVgZzqaK/guUQ8UK06B
         8JJCH9a6lwaBGzTW3gbZo1iKOwu4mZ7xLwBSzkPLAavx8WBtW4h9RS+Rq64UXvrSg8zv
         W0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848126; x=1794452926;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
        b=WfeCvIahDAa2Ias0EK4rYN1WKPdXlGaJ0Wr3u3DcGf+niM9OM671jF6qWu5y6ZADRP
         6dMgqerg5xZ/VkuOQ5O+6HjpRmL+giIHhE7HOo9hQneFC746lpcPAOCYqLdx4+od87XE
         R7vI7TdjmM5uRddZdduIyvkcsrEPtDRoCtxke05nW3gJ+3OV6QdbLEvtLqWPtXvXrgrJ
         zNBx0bhzzNNAuL1Ta1bw2xfkexn6jHEkAJjO0qZS3jJOpoYapwqpSiK2NNFZY078ssuw
         sIeExzOAbUrr7fHC6hJ/Y8mDmFhxc7hoimDYC5VJzJSeNm1R5+X/exQdLLOhKErvfZQk
         KM+A==
X-Forwarded-Encrypted: i=1; AKwUvBx7YINipqosNzJGx3MhFrswU3MiNhfJydYWLom5CuGWiu6fgafX2dHPtzOsMIUjwq6QWk1cN9ZpvSKwyCqMOYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yj8VLDVenQ3CzSXf/enyoB5HNUo3jN4fIjdMKCWVRKiTiW2Pr
	cGt6J6C9MO7ncP1F8eYHmwmUejMN+FobUfUVdpyAq9pMxLeLHT/AaHbDZLJ52NiPH/1Nscv9nXT
	q+A==
X-Received: from dlar7.prod.google.com ([2002:a05:701b:21c7:b0:195:8b4e:20b7])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:208a:b0:1b0:4272:4282
 with SMTP id a92af1059eb24-1b042725256mr18017569c88.17.1793848125583; Wed, 04
 Nov 2026 19:08:45 -0800 (PST)
Date: Thu,  5 Nov 2026 03:08:43 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105030843.3319056-1-wakel@google.com>
Subject: [PATCH] selftests/memfd: Rename local union semun to avoid bionic clash
From: Wake Liu <wakel@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Aristeu Rozanski <aris@redhat.com>, Shuah Khan <shuah@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit b24335521de9 ("selftests/memfd: use IPC semaphore instead of
SIGSTOP/SIGCONT") added a local definition of union semun, since glibc
and musl expect the caller to define it before calling semctl().
Bionic, however, already defines union semun in <sys/sem.h>, so
memfd_test no longer builds against it:

  memfd_test.c:45:7: error: redefinition of 'semun'

Rename the local union to memfd_semun. Its layout is unchanged, so it
can still be passed as the variadic semctl() argument with any C
library.

Fixes: b24335521de9 ("selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT")
Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/memfd/memfd_test.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index cdab3a837624..188cb7c32db1 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -42,7 +42,13 @@
 		    F_SEAL_EXEC)
 
 #define MFD_NOEXEC_SEAL	0x0008U
-union semun {
+
+/*
+ * glibc and musl leave union semun for the caller to define, but bionic
+ * already provides it in <sys/sem.h>. Use a private name so the test
+ * builds against all of them.
+ */
+union memfd_semun {
 	int val;
 	struct semid_ds *buf;
 	unsigned short int *array;
@@ -1387,7 +1393,7 @@ static void test_sysctl_sysctl2_failset(void)
 static int sysctl_nested_child(void *arg)
 {
 	int pid, sem;
-	union semun semun;
+	union memfd_semun semun;
 	struct sembuf sembuf;
 
 	printf("%s nested sysctl 0\n", memfd_str);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.398.g882cbad275-goog

