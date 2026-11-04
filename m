Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804751;
	b=LN1knM7UTjC8JJzumYNdVxgtAG2udFy184GqPAWWxX6uPAArauWW8bJJj/ZQ693G3TCt
	 kMiHpSzskNtovzgaXPjf5Ds2ZuKuIobfEg2cUlkYlWttKOXJ9B/w/jyJfmKJuq/chKPlB
	 uh3RY4LknA00nRnImkHtCSzl2lDg/EXChgm+cNfUwUvVPkD8VeSZuSX96mcM9LK/WegCA
	 q1/pRIM5aquWH1bNtXDKPwLILvj9GMvlFqtD2jZ4T461Pplh+nu46ldEvnQmTAQu8Y7OK
	 fPNm/Kl6PgmAKw7b8KUJX1E1baThRmmE7a2hVfqoj6dL315a5xhjkRPZpO+QEaln62g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
	b=4d2mlWKdPUIMvOYAVGLv7P6PXDrTJ5l+EEyPTak3UtvwNnVLNGD9TNaR0XsmxNwU7N0y
	 k7fqb3p/qgV4jv8n0THl1nUEIwbSBFyu4nlK5v/Y3HtRCDOuBYLSkpsKUOBwXDwXQ+BD0
	 DFlp/cGjMq5Qf24uz3wfF40I6rl1Dyxr3MDhwfAdUB7jx3Tii/ykgRBb5r7QoTn109CtL
	 N+grrd5KgwZsyzska9GaHJjVy61fRdTIlxxxtxuaknboO79fchYhyE/pUV7jgXpCXqEAl
	 DJB1E2Rn8j8eCVLJD8cPRTaonwKuoPjSwSqLrNP37Es/LwRcTMIwtfNZqVCv3rUubQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=evalinux.com;
	spf=pass smtp.mailfrom=evalinux.com;
	dkim=pass header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=Eo68ob9V;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C33606D809
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 15:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C33606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=Eo68ob9V
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-846566246e8so750760a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1793804750; x=1794409550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
        b=Eo68ob9V2mMtODN+yQGPwYvGyhRGFcszgFohgee+JNSZmp3xyzODVTHwlW4Acy7Rg4
         Ff33jluJFSLdW6XwgrEhihnB0oPv7T+iIL1Q02aHTEhEeoRa0elL80KUpBkhCkj6t4gX
         l2kElfK85gdJgar89Nx9B6wGa6nmOX0eoVDn+6pP+AMeazWqa+qAJSjXPLsyfbnYunu3
         iwTmDdANMHGf4Nw9GTclU+Ozi4Onf+sNY3KIz777tzF5MCKQzXUzknfWbGgGiZE1o6A7
         D109HtTZw8iSaBNiOaSeufKtw0HDFor7NxHzHCFGjrnMUhFqknrz2Yt0wVVEpMQSWGO0
         Y5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804750; x=1794409550;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
        b=SSrlSOBnYJc5Op8/s7DlnvjxzqYBgnHrg8lf33M/Xdyj07hxcTwSdYnRUW7tERblgE
         I7KVZH47Jra+ADM5/Q9XbVvINw07pMf+T4lSoGJJ9nmVFWn9N/nZHaSPC67G94LODwID
         ADkkW42xDtJlBKX7dstmnsHk/5Pm1URFgKUXJDbvFqlcjyKthwTiBJ+CLgjDn00yxhs/
         pBvfzR7ROibnKFv+ekJ/koibOP/WIM4Sm/4dfq/UsVXo4rOFDItQgP/dRCsdfy6ggRCt
         Dmw9VSQSBp984Zll4SCAeltYd+1p8Ke8sVTtubQx1v/5Kp5DtnyIkX0uI6tiWXkWNWf4
         UMjA==
X-Forwarded-Encrypted: i=1; AKwUvBw6pqhXW0+cRP1X7zM1+OWG4OsX2K8GfsKzazQdwxdhOxgUcQGoYuZ/RDjgh6xrlrKq+L9BITF6mW8WAUaVN2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0XJREGseDS0Po83Kzos+vzR6yh7MO0f87UU+1dqndWLyTXLI
	piPT1eFAWMAlIlp5WBgrHOLMGzw9tNW2tuj9oekq+GhyyUSLkT3dvPIUGBnJCSMm0Ps=
X-Gm-Gg: AYBFou39WTjQG/avSdKRdaN0GzwZvEJgivmw+xf9jDvTfVtLor9hLbtvuLH9H7Dhbrz
	yOZmuV37hh1d5Tu4bXGv/vGbbKBHCUtX9haenTD/kM1KQRxns0ri9va6GqQ6YpR+obCZPTSG1YR
	ESWSlLPzFXnGjzFfPyHmToycP9g/Ge9HNIfe+TxvCISiZQqwp4WTdDyTnH2KJPcGHCa+Ht1OArC
	4ib/rodaQFIvMS3c/CKeZTOmDgKRgflDQq+gLKQjBXok+9aJ3F7u+mIqYCfeeCinfHxbDycWgZe
	vjrf0Tt1clqSVqGZqu3HTH6eLq3lBovQvs+B+r4WAP3pNZDyL8XAJ7ueMyJbYh+1zel0ajC8vjF
	3wIP941gt+XS5laC9i5ZengBBldjteQQBce/aPnjO71pkkDpMVGTyczgBafai9sprROLJQyHun2
	1yi4HIMNK5hCfIgM5BRnyv8rXKeDZhzx5MwaWMKeRGmUnsxCymIVp0UFY8L2wLyMGWpTiVeFQEp
	pKDqhqNHFHBmOojgNphp3Q8zuWKOBdbEJ7DmzzMjLHG1a2Ohm8HJ2/xleqPbGjjSSmDDmkZPXRV
	o+t+AU7D5Nm4ivUPJgBqaXpseDkJ4XXM558q8MzdGFf7gKKypV9p+P39g2P8JWymdd+G4SE=
X-Received: by 2002:a05:6830:6412:b0:81d:9acd:ee04 with SMTP id 46e09a7af769-85d35ef0575mr8247769a34.0.1793804749819;
        Wed, 04 Nov 2026 07:05:49 -0800 (PST)
Received: from desktop.casa.g02.org ([187.247.185.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e98892sm1982467a34.19.2026.11.04.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:05:48 -0800 (PST)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wake Liu <wakel@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: [PATCH] selftests/futex: Skip futex_requeue_pi on unprivileged thread creation
Date: Wed,  4 Nov 2026 09:05:46 -0600
Message-ID: <20261104150546.1041422-1-renich@evalinux.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The futex_requeue_pi and futex_requeue_pi_signal_restart selftests
create threads with the SCHED_FIFO real-time scheduling policy to
exercise Priority Inheritance futex requeue operations.

When executed without root privileges or in environments lacking the
CAP_SYS_NICE capability, pthread_create() fails with EPERM. Currently,
create_rt_thread() asserts that ret == 0, causing all 24 parameterized
variants in futex_requeue_pi and futex_requeue_pi_signal_restart to fail
unconditionally. Missing execution permissions should be reported as
a skip rather than a hard test failure.

Handle EPERM from pthread_create() in create_rt_thread() by invoking
SKIP() and returning -EPERM. Update callers to check the return value
and exit early so the test harness records the test as skipped.
Privileged test execution with CAP_SYS_NICE or root remains unaffected
and continues to run all test assertions.

Fixes: b7d837c2d49e ("selftests/futex: Migrate futex_requeue_pi to harness")
Fixes: 7fe733f11215 ("selftests/futex: Migrate futex_requeue_pi_signal_restart to harness")
Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>
---
 .../futex/functional/futex_requeue_pi.c         | 17 ++++++++++++-----
 .../futex_requeue_pi_signal_restart.c           |  7 ++++++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 65326cbef3a4..afcede02fe9c 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -143,6 +143,10 @@ int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*f
 		TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
+	if (ret == EPERM) {
+		SKIP(return -EPERM,
+		     "pthread_create failed with EPERM, need CAP_SYS_NICE for SCHED_FIFO");
+	}
 	ASSERT_EQ(ret, 0)
 		TH_LOG("pthread_create failed");
 
@@ -358,8 +362,9 @@ TEST_F(args, futex_requeue_pi)
 
 	if (third_party_owner) {
 		blocker_arg._metadata = _metadata;
-		create_rt_thread(_metadata, &blocker, third_party_blocker,
-				 (void *)&blocker_arg, SCHED_FIFO, 1);
+		if (create_rt_thread(_metadata, &blocker, third_party_blocker,
+				     (void *)&blocker_arg, SCHED_FIFO, 1))
+			return;
 	}
 
 	atomic_set(&waiters_woken, 0);
@@ -368,12 +373,14 @@ TEST_F(args, futex_requeue_pi)
 		args[i].id = i;
 		args[i].timeout = tsp;
 		TH_LOG("Starting thread %d", i);
-		create_rt_thread(_metadata, &waiter[i], waiterfn, (void *)&args[i],
-				 SCHED_FIFO, 1);
+		if (create_rt_thread(_metadata, &waiter[i], waiterfn, (void *)&args[i],
+				     SCHED_FIFO, 1))
+			return;
 	}
 	waker_arg._metadata = _metadata;
 	waker_arg.lock = lock;
-	create_rt_thread(_metadata, &waker, wakerfn, (void *)&waker_arg, SCHED_FIFO, 1);
+	if (create_rt_thread(_metadata, &waker, wakerfn, (void *)&waker_arg, SCHED_FIFO, 1))
+		return;
 
 	/* Wait for threads to finish */
 	/* Store the first error or failure encountered in waiter_ret */
diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
index 4933612a7b55..69de80790bbd 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
@@ -61,6 +61,10 @@ int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*f
 		TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
+	if (ret == EPERM) {
+		SKIP(return -EPERM,
+		     "pthread_create failed with EPERM, need CAP_SYS_NICE for SCHED_FIFO");
+	}
 	ASSERT_EQ(ret, 0)
 		TH_LOG("pthread_create failed");
 
@@ -111,7 +115,8 @@ TEST(futex_requeue_pi_signal_restart)
 
 	TH_LOG("m1:f2: %x", f2);
 	TH_LOG("Creating waiter");
-	create_rt_thread(_metadata, &waiter, waiterfn, _metadata, SCHED_FIFO, 1);
+	if (create_rt_thread(_metadata, &waiter, waiterfn, _metadata, SCHED_FIFO, 1))
+		return;
 
 	TH_LOG("Calling FUTEX_LOCK_PI on f2=%x @ %p", f2, &f2);
 	TH_LOG("m2:f2: %x", f2);
-- 
2.56.0

