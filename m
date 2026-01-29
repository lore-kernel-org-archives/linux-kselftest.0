Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399532AAC9
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 22:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725077; cv=none; b=gHlbrpnvlFX+hBhIZuseMQrhhJkodkzM6IFOcJlw7SlMUVth+6Fv+PB65Es9WwDrb+aNZBS5wmUwZoqSITuciiwc76j5M5doAl8f8d0r9F5tuuiHtUpZZFYMSz+lfDn/BAtfqvMSU4DwA7NcabWPG+Kvwd5/cUPpuG2JwDjFjus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725077; c=relaxed/simple;
	bh=/zL7B3FCILle4gEIk42B7eSJqbXtnCdfr95PBh8NC8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7dIl0z8Dj0yMvYTs7orMlogq06cuE/TqAfeEawPN2vnA7Yqt55zXLig+iCiczmu+ICpe8DZWoHjbqILFkE9IKMd5gUetQEYwk3LQMR3XSM+L8E5JttXp36bRzRWwqp4kcvTaIQMvLttVabT/iN4oRc/+d6H1/UMNjZaE4JkRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8SL3wOd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8SL3wOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769725074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HGj1Mvprj4t38CWkNwGjGCEoKgecHbX9MRBgck4BO/w=;
	b=J8SL3wOdAIzZ32dnOeNphchckVxN/jmC8fB4ubq4AuDPoWTHOJz+yDObAeUYjSviRhGbJO
	FrvzMthVv5GuXKdlmpFhtz2gyIAFqHfYPdI7wkTUaNO2ZORltLptOWnCTBPBcZy3SbeV8u
	92V176q1RyaekbcgPlrgg0lNvXFhi2U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-vU55RsBtPjuETsrkLiHW0Q-1; Thu,
 29 Jan 2026 17:17:51 -0500
X-MC-Unique: vU55RsBtPjuETsrkLiHW0Q-1
X-Mimecast-MFC-AGG-ID: vU55RsBtPjuETsrkLiHW0Q_1769725070
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC01319560B5;
	Thu, 29 Jan 2026 22:17:49 +0000 (UTC)
Received: from napanee.usersys.redhat.com (unknown [10.22.66.39])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59AE61800665;
	Thu, 29 Jan 2026 22:17:49 +0000 (UTC)
Received: by napanee.usersys.redhat.com (Postfix, from userid 1000)
	id AE7CEC17CB; Thu, 29 Jan 2026 17:17:48 -0500 (EST)
Date: Thu, 29 Jan 2026 17:17:48 -0500
From: Aristeu Rozanski <aris@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, liuye <liuye@kylinos.cn>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [PATCH] selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT
Message-ID: <7888ed77-da89-41b2-a73e-09038b7c9285@work>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20241114-35-62db1e
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
Cc: Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: liuye <liuye@kylinos.cn>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Aristeu Rozanski <aris@ruivo.org>

--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -18,6 +18,9 @@
 #include <sys/stat.h>
 #include <sys/syscall.h>
 #include <sys/wait.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/sem.h>
 #include <unistd.h>
 #include <ctype.h>
 
@@ -39,6 +42,20 @@
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
+ * children will be PID 1 and can't send SIGSTOP to itself due special
+ * treatment of the init task, so the SIGSTOP/SIGCONT synchronization
+ * approach can't be used here.
+ */
+#define SEM_KEY 0xdeadbeef
 
 /*
  * Default is not to test hugetlbfs
@@ -1333,8 +1350,22 @@ static int sysctl_nested(void *arg)
 
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
 
@@ -1355,7 +1386,9 @@ static void test_sysctl_sysctl2_failset(void)
 
 static int sysctl_nested_child(void *arg)
 {
-	int pid;
+	int pid, sem;
+	union semun semun;
+	struct sembuf sembuf;
 
 	printf("%s nested sysctl 0\n", memfd_str);
 	sysctl_assert_write("0");
@@ -1389,23 +1422,53 @@ static int sysctl_nested_child(void *arg)
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
@@ -1415,28 +1478,62 @@ static int sysctl_nested_child(void *arg)
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
 

