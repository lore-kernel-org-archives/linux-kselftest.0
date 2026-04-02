Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E0175A6A;
	Thu,  2 Apr 2026 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100743; cv=none; b=gHXT44qx0iNIvOCc4oear+p+KZEoe8lATUOrrTlPhbwNtcVDQrIar49bD6IxxDDc0YLzz7DZcIAERsmLHtA3BV/t7NMxYpiuPucGPlIPsbmVcLS7UXTZs4JZsutdYlQ835OexDlKKXEDPBaGurUlt72I5NsAIpjihqtdQF78Ato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100743; c=relaxed/simple;
	bh=2MP/a40KprMuIlnowfOI0K4jOmpx2qWOmDyzhQunkEY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IdfLskE3xXJeuFydUhdlYFnNxEZRIXPNAhLLFfn1x9rgS+I380cw9/uWTdk7OTXdQ3j70mc2vtmZD9UvbCE6eduRm9T851WkgYA+nPfB32nMN6MiLeqcEN7gmkUhyD5QK4NAdWs/Sg3kCGaHtnGtkQSu0xuJqwfoHUN6U3rikLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FPYIfzU6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FPYIfzU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D80C4CEF7;
	Thu,  2 Apr 2026 03:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775100743;
	bh=2MP/a40KprMuIlnowfOI0K4jOmpx2qWOmDyzhQunkEY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FPYIfzU6oXyMyr9FVChI9F0TI64Va34bKPPujmvrq45d4OOaBz//3vgbSrDG95YhC
	 l7lZG2zZhV+Gfjg7/mBjsLKw61NIpCqcRa3D6BOfx6BxVigMWHGQZjXGPRgW2E8UO+
	 fFNKwPLPVcXvoQECyzNJqlukxpZJSEiNIdN+ycHk=
Date: Wed, 1 Apr 2026 20:32:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v8 0/6] selftests/mm: skip several tests when thp is not
 available
Message-Id: <20260401203221.7e192497ba526afe33b9b5ae@linux-foundation.org>
In-Reply-To: <20260402014543.1671131-1-chuhu@redhat.com>
References: <20260402014543.1671131-1-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Apr 2026 09:45:37 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false negative.
> Mark those tests as skip when thp is not available.

Thanks, I updated mm.git's mm-unstable branch to this version.

> Changes in v8:
>   - removed the patch 4 in v7 (make ksft_exit_fail_perror variable length)
>     as no clean way to do it at the moment and ksft_exit_fail_msg could
>     do by printing an extra strerror param.
>   - patch 4 use ksft_exit_fail_msg instead of ksft_exit_fail_perror  

Below is how v8 altered mm.git:


 tools/testing/selftests/kselftest.h  |   21 +++------------------
 tools/testing/selftests/mm/vm_util.c |    6 +++---
 2 files changed, 6 insertions(+), 21 deletions(-)

--- a/tools/testing/selftests/kselftest.h~b
+++ a/tools/testing/selftests/kselftest.h
@@ -43,7 +43,7 @@
  * the program is aborting before finishing all tests):
  *
  *    ksft_exit_fail_msg(fmt, ...);
- *    ksft_exit_fail_perror(fmt, ...);
+ *    ksft_exit_fail_perror(msg);
  *
  */
 #ifndef __KSELFTEST_H
@@ -417,24 +417,9 @@ static inline __noreturn __printf(1, 2)
 	exit(KSFT_FAIL);
 }
 
-static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
+static inline __noreturn void ksft_exit_fail_perror(const char *msg)
 {
-	va_list args;
-	char *buf = NULL;
-	int saved_errno = errno;
-
-	va_start(args, msg);
-	if (vasprintf(&buf, msg, args) == -1) {
-		va_end(args);
-		ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
-				saved_errno);
-	}
-	va_end(args);
-
-	errno = saved_errno;
-	ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
-
-	free(buf);
+	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
 }
 
 static inline __noreturn void ksft_exit_xfail(void)
--- a/tools/testing/selftests/mm/vm_util.c~b
+++ a/tools/testing/selftests/mm/vm_util.c
@@ -775,15 +775,15 @@ void write_file(const char *path, const
 
 	fd = open(path, O_WRONLY);
 	if (fd == -1)
-		ksft_exit_fail_perror("%s open failed", path);
+		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
 
 	numwritten = write(fd, buf, buflen - 1);
 	saved_errno = errno;
 	close(fd);
 	errno = saved_errno;
 	if (numwritten < 0)
-		ksft_exit_fail_perror("%s write(%.*s) failed", path, (int)(buflen - 1),
-				buf);
+		ksft_exit_fail_msg("%s write(%.*s) failed: %s\n", path, (int)(buflen - 1),
+				buf, strerror(errno));
 	if (numwritten != buflen - 1)
 		ksft_exit_fail_msg("%s write(%.*s) is truncated, expected %zu bytes, got %zd bytes\n",
 				path, (int)(buflen - 1), buf, buflen - 1, numwritten);
_

