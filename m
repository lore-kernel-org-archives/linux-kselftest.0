Received: from mail.itpri.com (mx1.itpri.com [185.125.111.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E13446DE;
	Tue, 20 Jan 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.111.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907444; cv=none; b=DO8W3fSNbPt7ZXQmC8iJiU6ui5EMXgJDgDM+or1QdLxcXi1/ZR2qzJqC2VO3U+JwGn5Kk3fjXaRN9ANPWHRmMemEMUE6yCUdKW3a0F0O9yMA7UywW4p0eLqYgOURcH/PrmpT4/oqTn05IQ+pSrN7PbP4uR74TKuwX5scs2BREpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907444; c=relaxed/simple;
	bh=vP5WQOkH8IYn3TcPdVB3VUplO/WvIBlKr4LIGv1/Yhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSlobjuGpc6YqbX7WfAur6VxRUMijP5syFk9IwGbne8xCQPIO8ewUuIUhqB7B73fXE7f6WUMmk+iTdv7oTNEoE9r1m82j3oqpF2Io4w9ZHUupP6d8SerQwMp7taRxyhZNBTFNt5PW01cQSrnkh6SlskZ2TAInlCpAdEA66N0JOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zazolabs.com; spf=pass smtp.mailfrom=zazolabs.com; dkim=pass (4096-bit key) header.d=zazolabs.com header.i=@zazolabs.com header.b=DVrAw2+2; arc=none smtp.client-ip=185.125.111.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zazolabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zazolabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=zazolabs.com header.i=@zazolabs.com header.b="DVrAw2+2"
X-Virus-Scanned: Yes
From: Alexander Atanasov <alex@zazolabs.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zazolabs.com; s=mail;
	t=1768907438; bh=vP5WQOkH8IYn3TcPdVB3VUplO/WvIBlKr4LIGv1/Yhk=;
	h=From:To:Cc:Subject;
	b=DVrAw2+2qElThA2I9EcSrmsmlFIVNRzaYnO4Q+ZtfriDpt4ms1IgZJoQkRpuDHmGm
	 F+jQFduSfjy+oBQ5Dr+PFj0nbS2vi1xMXpN9yzxnE3CN0aA8yR76Y8ajC+k0qMUka5
	 R+C1NVBNTiuhcaQlfCMP5ukZt3tXpGl6y31EWlNBZPiHO1wbhtc9O8tTpOBLoQ8tjc
	 3stCanFM9BKA/MGR0W4tWdrqlX5/egFuHERYW0KaGoU1PHYAmfO4Ep+FigV2aLhJTx
	 Dw1tMrW1GBEoD31KBChYazy6DJOxM9z4ccYgF26fPyiim0Yatq4/7iUxM0XrYf4IK/
	 f8iFbBq3Los4YMwtSfyk0PJOaaHRvbT6GZSARPmxP1qWNErlD3Q3JtJpFDlYkC9o02
	 5I2HQqhRKPcEULDu6sra3eSblz2qPkUOCdfwGGahnkhyOhYnt/gsLHma68u/ohXq7R
	 8kxz8gSQFz9Oh1F0gdNDfWrgXI6sNbjE8GVcwl8VzKMk/c/+gHLbtsZyP02SO3od+6
	 RaDdqF8k+m1KSfUabPhM9CnQO64V2G3MRK5YJTmOeau9q++4Jkii14hmbY5viak6CX
	 225qgPJtFzQ4ZDhT4YwvA98ang+vZyCpIOqiSGUjNd++bbamOTQDd0dQE2hHazaHgm
	 aMtgxOJhrKzyo5l23ZuBQav4=
To: Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: Alexander Atanasov <alex@zazolabs.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Alejandro Colomar <alx.manpages@gmail.com>,
	Clint George <clintbgeorge@gmail.com>,
	Ranganath V N <vnranganath.20@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/filesystems: follow std execveat argument convention in anon_inode_no_exec
Date: Tue, 20 Jan 2026 11:10:07 +0000
Message-ID: <20260120111008.442109-1-alex@zazolabs.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While compiling filesystem selftests there is a warning:
anon_inode_test.c:45:37: warning: null passed to a callee that
       requires a non-null argument [-Wnonnull]
45 |  ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);

Kernel code is okay to be passed NULL for argv, in which
case it generates argv by itself inside do_execveat_common.
Man page of execvat lists both argv and envp as _Nullable.
But system's unistd.h says different:
extern int execveat (int __fd, const char *__path, char *const __argv[],
                     char *const __envp[], int __flags)
    __THROW __nonnull ((2, 3));
(checked ubuntu 24.04 and fedora 43)

Which is the reason for the compiler warning.

Fix the warning by passing a proper argv array.

Fixes: f8ca403ae77cb ("selftests/filesystems: add exec() test for anonymous inodes")
Cc: Christian Brauner <brauner@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Alejandro Colomar <alx.manpages@gmail.com>
Cc: Clint George <clintbgeorge@gmail.com>
Cc: Ranganath V N <vnranganath.20@gmail.com>
Signed-off-by: Alexander Atanasov <alex@zazolabs.com>
---
 tools/testing/selftests/filesystems/anon_inode_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Quote from execv's man referenced from execveat's:
On Linux, argv and envp can be specified as NULL.
In both cases, this has the same effect as specifying the argument as a pointer 
to a list containing a  single null pointer.
***Do not take advantage of this nonstandard and nonportable misfeature!***

Listed as possible to pass NULL, then a big fat warning in the man page
and a header that acctually marks this as invalid usage.
I failed to find the origin of the above contradiction.
It looks like POSIX/GNU/Linux missalignment.
I am putting this here for the record. So may be someone could step in
and make it right.

I've Cc-ed people who made fixes but they are just compile fixes, no
explanation of why the warning exists and in most of them the array is not a proper
argv.

diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tools/testing/selftests/filesystems/anon_inode_test.c
index 94c6c81c2301..191549a4304d 100644
--- a/tools/testing/selftests/filesystems/anon_inode_test.c
+++ b/tools/testing/selftests/filesystems/anon_inode_test.c
@@ -4,6 +4,7 @@
 
 #include <fcntl.h>
 #include <stdio.h>
+#include <unistd.h>
 #include <sys/stat.h>
 
 #include "kselftest_harness.h"
@@ -37,12 +38,13 @@ TEST(anon_inode_no_chmod)
 
 TEST(anon_inode_no_exec)
 {
+	char *const argv[] = { "", NULL };
 	int fd_context;
 
 	fd_context = sys_fsopen("tmpfs", 0);
 	ASSERT_GE(fd_context, 0);
 
-	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
+	ASSERT_LT(execveat(fd_context, "", argv, NULL, AT_EMPTY_PATH), 0);
 	ASSERT_EQ(errno, EACCES);
 
 	EXPECT_EQ(close(fd_context), 0);
-- 
2.43.0

