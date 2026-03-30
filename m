Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA84397E7D;
	Mon, 30 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898709; cv=none; b=KcLlqwt67ZirOK8rVMw+aiaGvFiUa4R4maBmZddXLchpL1F6cVzkYTNx4xVdB0JTmgud0TlthMAADCmc06Hvf7xmT4kQ9EFBcsrYLuAJ1uaNh8BcjmzCiP7eta/URaJKS5wUmNr8+/6Xy6oYYxIPvrX24PrCeK1AjpbgZJZufOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898709; c=relaxed/simple;
	bh=7al5O4bBZZH0Ib7f4duHqDl5oMT2j0Ey0qkepxtrNB8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ocHI+Cc9N9xskYORx75g1bj3f3JQ3N9k1sdZznbCiyNqDhqpQDBJmjl+JMaJqEH/XUiuGl0wZDFg+hqp+kXa9s1LiUHYCzQDB4uAOcmt7Rq3oH29txzMJY7L/vXsOOuChoFwP6HBRowoSmSDvCbJubV01gMcOPr+TzuW4wu1270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BtaRypxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BtaRypxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCF9C4CEF7;
	Mon, 30 Mar 2026 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774898709;
	bh=7al5O4bBZZH0Ib7f4duHqDl5oMT2j0Ey0qkepxtrNB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BtaRypxmtugWdzAkIPgNlu+r2F6IPN9+eyYQCkAZHY9Prh0Y/+QQFjU5BuY2A3fqE
	 6sEtRKcphgS2YYt1OB+02vhGoJV6s0APCsCcZZ5zAT8ECst4QJVB8/COjrJidxgt/Z
	 UUZ0Z+LEOVg7jmJEbMBU86g7icDOE1/+oE2ohpxw=
Date: Mon, 30 Mar 2026 12:25:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v7 0/7] selftests/mm: skip several tests when thp is not
 available
Message-Id: <20260330122507.1dcfa49ab0fd9b58f923bc1f@linux-foundation.org>
In-Reply-To: <20260330151503.670415-1-chuhu@redhat.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Mar 2026 23:14:56 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false negative.
> Mark those tests as skip when thp is not available.

Thanks, I updated mm.git's mm-unstable branch to this version.

> Changes in v7:
>   - patch 1 add reviewed-by from Lorenzo
>   - patch 4 new patch to make ksft_exit_fail_perror variable length
>     arguments
>   - patch 5 change to use %.*s to print the buf when error happened
>     Limit the buflen arg as 2 minimum. Check the error path (numwritten
> 	< 0).
>     And use the ksft_exit_fail_perror to print the logs in error path

Here's how v7 altered mm.git.


 tools/testing/selftests/kselftest.h  |   21 ++++++++++++++++++---
 tools/testing/selftests/mm/vm_util.c |   14 +++++++-------
 2 files changed, 25 insertions(+), 10 deletions(-)

--- a/tools/testing/selftests/kselftest.h~b
+++ a/tools/testing/selftests/kselftest.h
@@ -43,7 +43,7 @@
  * the program is aborting before finishing all tests):
  *
  *    ksft_exit_fail_msg(fmt, ...);
- *    ksft_exit_fail_perror(msg);
+ *    ksft_exit_fail_perror(fmt, ...);
  *
  */
 #ifndef __KSELFTEST_H
@@ -417,9 +417,24 @@ static inline __noreturn __printf(1, 2)
 	exit(KSFT_FAIL);
 }
 
-static inline __noreturn void ksft_exit_fail_perror(const char *msg)
+static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
 {
-	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
+	va_list args;
+	char *buf = NULL;
+	int saved_errno = errno;
+
+	va_start(args, msg);
+	if (vasprintf(&buf, msg, args) == -1) {
+		va_end(args);
+		ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
+				saved_errno);
+	}
+	va_end(args);
+
+	errno = saved_errno;
+	ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
+
+	free(buf);
 }
 
 static inline __noreturn void ksft_exit_xfail(void)
--- a/tools/testing/selftests/mm/vm_util.c~b
+++ a/tools/testing/selftests/mm/vm_util.c
@@ -782,21 +782,21 @@ void write_file(const char *path, const
 	int fd, saved_errno;
 	ssize_t numwritten;
 
-	if (buflen < 1)
+	if (buflen < 2)
 		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
 
 	fd = open(path, O_WRONLY);
 	if (fd == -1)
-		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
+		ksft_exit_fail_perror("%s open failed", path);
 
 	numwritten = write(fd, buf, buflen - 1);
 	saved_errno = errno;
 	close(fd);
 	errno = saved_errno;
-	if (numwritten < 1)
-		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
-				strerror(errno));
+	if (numwritten < 0)
+		ksft_exit_fail_perror("%s write(%.*s) failed", path, (int)(buflen - 1),
+				buf);
 	if (numwritten != buflen - 1)
-		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
-				path, buf, buflen - 1, numwritten);
+		ksft_exit_fail_msg("%s write(%.*s) is truncated, expected %zu bytes, got %zd bytes\n",
+				path, (int)(buflen - 1), buf, buflen - 1, numwritten);
 }
_

