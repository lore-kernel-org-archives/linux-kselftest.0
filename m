Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE042BE93;
	Thu, 24 Sep 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279265; cv=none; b=OWm8N5ELEBdCLgdU0Eltm/Kcr41D7LfX9ZBswU60FdCv8xNZKC980bHxPYR5eVH+1zrnft44f2OJXOlQYUHupUwXc2k8iRH0GNEtXRkvRD+n+6AxuPC3SkhJVqwr8rh3QFtXPbPRVScVkFwJe4B5hxKXJJ4m+w/SWxi2Edl3g5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279265; c=relaxed/simple;
	bh=beyJJJsWmWM86F2GdMm3eZu/rCJvtCIDJyIWyk2ZqUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNzv8dciojlF6vB5+3i7kRnMoGyrejTiQsI78mpw5tyYBK1VR/64Bc3ISE7vwf11TK+HcWVuWSedZDEu7ZGqwwrvPZJ3c76eaqA0VoqNXWDZsNGk3ifL6I9uKwXn5t8T7PCG85vxcXRYzPoZ/SPsY1eGoVjE67xXLNPLX7bbHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=BXGxpwFc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="BXGxpwFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790279260;
	bh=beyJJJsWmWM86F2GdMm3eZu/rCJvtCIDJyIWyk2ZqUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXGxpwFcCnviEkO8n1AbQ27PCIgGRYlJmi6TB/vwpJtcwwLu2Y9fKBU3HGiQYC7lX
	 JdbWK2L33rkItfJTHMgSu7ULqpewwTy+EAZN1XGNpT5pg0PGCYbFKW/OO601Lv3gkj
	 muLeq9fzfa2XPQl/yJ9+/GnhpDgP3DyBjNOWxiPE=
Date: Thu, 24 Sep 2026 21:47:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/nolibc: test the FD_* macros and select()
 on a high fd
Message-ID: <e293126f-abad-4242-b427-be831159ecdc@t-8ch.de>
References: <20260924015222.31693-1-danishkhateeb03@gmail.com>
 <20260924015222.31693-4-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924015222.31693-4-danishkhateeb03@gmail.com>

On 2026-09-23 20:52:22-0500, Danish Khateeb wrote:
> The only select() test that passes an fd_set uses fd 1, so nothing
> noticed that the FD_* macros used the wrong bits for fds 31-63 of each
> word on 64-bit architectures.
> 
> Add a test that FD_SET() and FD_CLR() change exactly one fd, for every
> fd below FD_SETSIZE, and one that select() reports a readable pipe
> duplicated to fd 40, which also checks that the macros agree with the
> kernel on the layout of the set.
> 
> Assisted-by: LLM
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 54 ++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index f62183a46205..d9a8bfd4b21b 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1369,6 +1369,58 @@ int test_pipe(void)
>  	return !!memcmp(buf, msg, len);
>  }
>  
> +int test_fd_set(void)
> +{
> +	fd_set fds;
> +	int fd, i;
> +
> +	for (fd = 0; fd < FD_SETSIZE; fd++) {
> +		/* FD_SET() must set this fd and no other */
> +		FD_ZERO(&fds);
> +		FD_SET(fd, &fds);
> +		for (i = 0; i < FD_SETSIZE; i++)
> +			if (!!FD_ISSET(i, &fds) != (i == fd))
> +				return 1;
> +
> +		/* FD_CLR() must clear this fd and no other */
> +		for (i = 0; i < FD_SETSIZE; i++)
> +			FD_SET(i, &fds);
> +		FD_CLR(fd, &fds);
> +		for (i = 0; i < FD_SETSIZE; i++)
> +			if (!!FD_ISSET(i, &fds) != (i != fd))
> +				return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +int test_select_high_fd(void)
> +{
> +	struct timeval tv = { 0 };
> +	int pipefd[2], fd, ret = 1;
> +	fd_set fds;
> +
> +	if (pipe(pipefd) == -1)
> +		return 1;
> +
> +	/* fd 40 is in the upper half of a 64-bit fd_set word */
> +	fd = dup2(pipefd[0], 40);
> +	if (fd == -1)
> +		goto out;
> +
> +	write(pipefd[1], "x", 1);
> +	FD_ZERO(&fds);
> +	FD_SET(fd, &fds);
> +	if (select(fd + 1, &fds, NULL, NULL, &tv) == 1 && FD_ISSET(fd, &fds))
> +		ret = 0;
> +
> +	close(fd);
> +out:
> +	close(pipefd[0]);
> +	close(pipefd[1]);
> +	return ret;

I am not conviced this testcase provides much value.
If we really want to keep it, it should be easier to dup2(STDOUT_FILENO)
and select() for it to be writable instead of doing the dance with the
pipe.

> +}
> +
>  int test_rlimit(void)
>  {
>  	struct rlimit rlim = {
> @@ -1711,6 +1763,7 @@ int run_syscall(int min, int max)
>  		CASE_TEST(execve_root);       EXPECT_SYSER(1, execve("/", (char*[]){ [0] = (char []){"/"}, [1] = NULL }, NULL), -1, EACCES); break;
>  		CASE_TEST(fchdir_stdin);      EXPECT_SYSER(1, fchdir(STDIN_FILENO), -1, ENOTDIR); break;
>  		CASE_TEST(fchdir_badfd);      EXPECT_SYSER(1, fchdir(-1), -1, EBADF); break;
> +		CASE_TEST(fd_set);            EXPECT_ZR(1, test_fd_set()); break;

This is not really a syscall test, could you move it to the stdlib
tests? Also the test functions should have the same order as the
testcases which are calling them.

>  		CASE_TEST(fdopendir_notdir);  EXPECT_SYSER(1, (uintptr_t)fdopendir(STDIN_FILENO), (uintptr_t)NULL, ENOTDIR); break;
>  		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
>  		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
> @@ -1753,6 +1806,7 @@ int run_syscall(int min, int max)
>  		CASE_TEST(select_null);       EXPECT_SYSZR(1, ({ struct timeval tv = { 0 }; select(0, NULL, NULL, NULL, &tv); })); break;
>  		CASE_TEST(select_stdout);     EXPECT_SYSNE(1, ({ fd_set fds; FD_ZERO(&fds); FD_SET(1, &fds); select(2, NULL, &fds, NULL, NULL); }), -1); break;
>  		CASE_TEST(select_fault);      EXPECT_SYSER(1, select(1, (void *)1, NULL, NULL, 0), -1, EFAULT); break;
> +		CASE_TEST(select_high_fd);    EXPECT_SYSZR(1, test_select_high_fd()); break;
>  		CASE_TEST(sendfile);          EXPECT_SYSZR(1, test_sendfile()); break;
>  		CASE_TEST(stat_blah);         EXPECT_SYSER(1, stat("/proc/self/blah", &stat_buf), -1, ENOENT); break;
>  		CASE_TEST(stat_fault);        EXPECT_SYSER(1, stat(NULL, &stat_buf), -1, EFAULT); break;
> -- 
> 2.55.0
> 
