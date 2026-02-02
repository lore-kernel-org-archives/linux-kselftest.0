Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1936CE08
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043098; cv=none; b=pCHx0bej3jqMUJmINfQsP6jPiFI3Irn0TCfE/Bqf536zqe16+/2qr7FkoroR+A6uXa+caf8Jr9aolbzjyBzYlvXNqvvWP8+yLl5+fvo/Su+4oaQrt6FzbFiimZN7+XZOcS6FK/gPdtfrRo3QOQtnMxIN8HgyK1248XEqA6Y9YBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043098; c=relaxed/simple;
	bh=LTmtOJUbE7mku/xjnEHKOXOrNHA/LOkIWKGhPc+4CiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnkKjbqYqZ6sGt8ES5Kgdgdi9dnas2B4L0JnOx7Wz+eLlD03gvv7UgYD+ZrDfna0RO4cZnZqb7BtCowb9B/5Mkmgxy9CwZYhsjpShu1CgVpzbRdOnQ2otdq8sJLQVutZmFyRmmod7BMMpWHA55/ApPm2/UNOYa9ezfpZvTAahwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TOo1gUwF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TOo1gUwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770043095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LLPSi3nvHTn4l+eMte4lOVK2lLpRjSH202e/Dy3d0DM=;
	b=TOo1gUwFtBz9sjZmahFddeqtd4wdQTazX/E4uGTHcOFDfrG3tASUWoYLxxaK/9ISRI4yYy
	V2x/Re6xj12IOHwjCz5UN5ltUzlwrka8i44bAS9iWsL0qal+RrE+e8p+IiDjMX+5hL+w3p
	Ig65kmTkWHDlem9zxHcCll4X1dqMdWE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-cm_R2a_KNMOfV1SOjTvf4g-1; Mon,
 02 Feb 2026 09:38:09 -0500
X-MC-Unique: cm_R2a_KNMOfV1SOjTvf4g-1
X-Mimecast-MFC-AGG-ID: cm_R2a_KNMOfV1SOjTvf4g_1770043087
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DA2B1800371;
	Mon,  2 Feb 2026 14:38:07 +0000 (UTC)
Received: from napanee.usersys.redhat.com (unknown [10.22.66.39])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6752030001A7;
	Mon,  2 Feb 2026 14:38:06 +0000 (UTC)
Received: by napanee.usersys.redhat.com (Postfix, from userid 1000)
	id C9644C197F; Mon,  2 Feb 2026 09:38:05 -0500 (EST)
Date: Mon, 2 Feb 2026 09:38:05 -0500
From: Aristeu Rozanski <aris@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Aleksa Sarai <cyphar@cyphar.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, liuye <liuye@kylinos.cn>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org
Subject: [PATCH] selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT
Message-ID: <a7776389-b3d6-4b18-b438-0b0e3ed1fd3b@work>
References: <7888ed77-da89-41b2-a73e-09038b7c9285@work>
 <20260131132315.62b0b029dc1dd03febe97481@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131132315.62b0b029dc1dd03febe97481@linux-foundation.org>
User-Agent: NeoMutt/20241114-35-62db1e
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT

In order to synchronize new processes to test inheritance of
memfd_noexec sysctl, memfd_test sets up the sysctl with a value before
creating the new process. The new process then sends itself a SIGSTOP
in order to wait for the parent to flip the sysctl value and send a
SIGCONT signal.

This would work as intended if it wasn't the fact that the new process
is being created with CLONE_NEWPID, which creates a new PID namespace and
the new process has PID 1 in this namespace. There're restrictions on
sending signals to PID 1 and, although it's relaxed for other than root
PID namespace, it's biting us here. In this specific case the SIGSTOP sent
by the new process is ignored (no error to kill() is returned) and it never
stops its execution. This is usually not noticiable as the parent usually
manages to set the new sysctl value before the child has a chance to run
and the test succeeds. But if you run the test in a loop, it eventually
reproduces:

	while [ 1 ]; do ./memfd_test >log 2>&1 || break; done; cat log

So this patch replaces the SIGSTOP/SIGCONT synchronization with IPC
semaphore.

Fixes: 6469b66e3f5a3 (selftests: improve vm.memfd_noexec sysctl tests, 2023-08-14)
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: liuye <liuye@kylinos.cn>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Aristeu Rozanski <aris@redhat.com>
---
 tools/testing/selftests/memfd/memfd_test.c |  113 ++++++++++++++++++++++++++---
 1 file changed, 105 insertions(+), 8 deletions(-)

--- linus-2.6.orig/tools/testing/selftests/memfd/memfd_test.c	2026-01-29 16:22:56.094182500 -0500
+++ linus-2.6/tools/testing/selftests/memfd/memfd_test.c	2026-02-02 09:35:04.887782294 -0500
@@ -18,6 +18,9 @@ // SPDX-License-Identifier: GPL-2.0
 #include <sys/stat.h>
 #include <sys/syscall.h>
 #include <sys/wait.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/sem.h>
 #include <unistd.h>
 #include <ctype.h>
 
@@ -39,6 +42,20 @@ #define F_SEAL_EXEC	0x0020
 		    F_SEAL_EXEC)
 
 #define MFD_NOEXEC_SEAL	0x0008U
+union semun {
+	int val;
+	struct semid_ds *buf;
+	unsigned short int *array;
+	struct seminfo *__buf;
+};
+
+/*
+ * we use semaphores on nested wait tasks due the use of CLONE_NEWPID: the
+ * child will be PID 1 and can't send SIGSTOP to themselves due special
+ * treatment of the init task, so the SIGSTOP/SIGCONT synchronization
+ * approach can't be used here.
+ */
+#define SEM_KEY 0xdeadbeef
 
 /*
  * Default is not to test hugetlbfs
@@ -1333,8 +1350,22 @@ return 0;
 
 static int sysctl_nested_wait(void *arg)
 {
-	/* Wait for a SIGCONT. */
-	kill(getpid(), SIGSTOP);
+	int sem = semget(SEM_KEY, 1, 0600);
+	struct sembuf sembuf;
+
+	if (sem < 0) {
+		perror("semget:");
+		abort();
+	}
+	sembuf.sem_num = 0;
+	sembuf.sem_flg = 0;
+	sembuf.sem_op = 0;
+
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		abort();
+	}
+
 	return sysctl_nested(arg);
 }
 
@@ -1355,7 +1386,9 @@ sysctl_fail_write("0");
 
 static int sysctl_nested_child(void *arg)
 {
-	int pid;
+	int pid, sem;
+	union semun semun;
+	struct sembuf sembuf;
 
 	printf("%s nested sysctl 0\n", memfd_str);
 	sysctl_assert_write("0");
@@ -1389,23 +1422,53 @@ sysctl_assert_write("0");
 			   test_sysctl_sysctl2_failset);
 	join_thread(pid);
 
+	sem = semget(SEM_KEY, 1, IPC_CREAT | 0600);
+	if (sem < 0) {
+		perror("semget:");
+		return 1;
+	}
+	semun.val = 1;
+	sembuf.sem_op = -1;
+	sembuf.sem_flg = 0;
+	sembuf.sem_num = 0;
+
 	/* Verify that the rules are actually inherited after fork. */
 	printf("%s nested sysctl 0 -> 1 after fork\n", memfd_str);
 	sysctl_assert_write("0");
 
+	if (semctl(sem, 0, SETVAL, semun) < 0) {
+		perror("semctl:");
+		return 1;
+	}
+
 	pid = spawn_thread(CLONE_NEWPID, sysctl_nested_wait,
 			   test_sysctl_sysctl1_failset);
 	sysctl_assert_write("1");
-	kill(pid, SIGCONT);
+
+	/* Allow child to continue */
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		return 1;
+	}
 	join_thread(pid);
 
 	printf("%s nested sysctl 0 -> 2 after fork\n", memfd_str);
 	sysctl_assert_write("0");
 
+	if (semctl(sem, 0, SETVAL, semun) < 0) {
+		perror("semctl:");
+		return 1;
+	}
+
 	pid = spawn_thread(CLONE_NEWPID, sysctl_nested_wait,
 			   test_sysctl_sysctl2_failset);
 	sysctl_assert_write("2");
-	kill(pid, SIGCONT);
+
+	/* Allow child to continue */
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		return 1;
+	}
 	join_thread(pid);
 
 	/*
@@ -1415,28 +1478,62 @@ sysctl_assert_write("0");
 	 */
 	printf("%s nested sysctl 2 -> 1 after fork\n", memfd_str);
 	sysctl_assert_write("2");
+
+	if (semctl(sem, 0, SETVAL, semun) < 0) {
+		perror("semctl:");
+		return 1;
+	}
+
 	pid = spawn_thread(CLONE_NEWPID, sysctl_nested_wait,
 			   test_sysctl_sysctl2);
 	sysctl_assert_write("1");
-	kill(pid, SIGCONT);
+
+	/* Allow child to continue */
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		return 1;
+	}
 	join_thread(pid);
 
 	printf("%s nested sysctl 2 -> 0 after fork\n", memfd_str);
 	sysctl_assert_write("2");
+
+	if (semctl(sem, 0, SETVAL, semun) < 0) {
+		perror("semctl:");
+		return 1;
+	}
+
 	pid = spawn_thread(CLONE_NEWPID, sysctl_nested_wait,
 			   test_sysctl_sysctl2);
 	sysctl_assert_write("0");
-	kill(pid, SIGCONT);
+
+	/* Allow child to continue */
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		return 1;
+	}
 	join_thread(pid);
 
 	printf("%s nested sysctl 1 -> 0 after fork\n", memfd_str);
 	sysctl_assert_write("1");
+
+	if (semctl(sem, 0, SETVAL, semun) < 0) {
+		perror("semctl:");
+		return 1;
+	}
+
 	pid = spawn_thread(CLONE_NEWPID, sysctl_nested_wait,
 			   test_sysctl_sysctl1);
 	sysctl_assert_write("0");
-	kill(pid, SIGCONT);
+	/* Allow child to continue */
+	if (semop(sem, &sembuf, 1) < 0) {
+		perror("semop:");
+		return 1;
+	}
 	join_thread(pid);
 
+	semctl(sem, 0, IPC_RMID);
+
 	return 0;
 }
 

