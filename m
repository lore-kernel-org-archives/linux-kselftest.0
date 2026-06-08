Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5F3D1CA8;
	Mon,  8 Jun 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929532; cv=none; b=BW2CBWt6Z3oY4BM3RNdkdX6WNZx8NM1ZxSxKe4pvEs7Vi8wptfS6CnYy0UvRmx6JBIWE+mamDGS088xFkihPzhK7Q7HBjThUHTAyaWEVhQJkEK3+oTM18pYe/JPob1eYjYaRz8jbgdGlF1HHcCpPk3Vel7NIUxNpgGaALBHeilY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929532; c=relaxed/simple;
	bh=bQCZaZbfQL8wppX0kQEaZqPEC6KGyUKkd1ulVM0V2fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LU41UiqRPpDrs8RTDQfjEqi+Tt6W5oqVyYg03/YwUtYE+zVnHMOTwXoraPSQKzlbh6NGDifd/buwVmnfnA7mbxJWlVisyQTY5RFia2Vh3H1BYzl2t0QKOKjBG2dynS1sv2RQUduOMGiNU9OByZZf/hcWNTqzKDYGqnANxvqjxTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/RXlCj8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/RXlCj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF8C1F00899;
	Mon,  8 Jun 2026 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929531;
	bh=6PiR3TxV38IIKD7vgtlOhV9syvq8O1nEOM6JlJMfrPc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e/RXlCj8Y8tu5cgcqR04U7jER5rxO7qqmNuswgaT5GzqfCAxBKyFv7VE6ycBXhmoJ
	 PhJC3dL/5glqVoa8qc9tOC7NwvVV9EPtatxPs4cAHCh0vTLvnRhlIi+2WICjeWotfu
	 XoT7I6ptOu3xY/McVba0CeKjq9PTHGwlJs+tul+JM1oX/3ya8U2tudLBfX8TOaFU4M
	 C2Fgj2S1kv9NI97YPAIb3OIr4leeSYgfaabQfv9yOsgp5raS9IlrGz++xpLuMfLnxC
	 eBG7K96SIEF21z4WTfnU0ca9HjqF6zI58FFjEX02OI2Dfm743gctJmWh4U0WxDRJfY
	 vUaxHip4HXjrw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com,  rppt@kernel.org,  pratyush@kernel.org,
  shuah@kernel.org,  dmatlack@google.com,  skhawaja@google.com,
  tarunsahu@google.com,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
In-Reply-To: <20260511201155.1488670-3-vipinsh@google.com> (Vipin Sharma's
	message of "Mon, 11 May 2026 13:11:55 -0700")
References: <20260511201155.1488670-1-vipinsh@google.com>
	<20260511201155.1488670-3-vipinsh@google.com>
Date: Mon, 08 Jun 2026 16:38:48 +0200
Message-ID: <2vxzfr2xt7uv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 11 2026, Vipin Sharma wrote:

> Add helper functions to preserve and retrieve file descriptors from an
> LUO session. This allows library users to work with FD preservation.
>
> No functional change intended.
>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> Co-developed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  .../liveupdate/lib/include/libliveupdate.h    |  3 ++
>  .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
>  2 files changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> index 4390a2737930..2b04b3256382 100644
> --- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> +++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> @@ -26,6 +26,9 @@ int luo_create_session(int luo_fd, const char *name);
>  int luo_retrieve_session(int luo_fd, const char *name);
>  int luo_session_finish(int session_fd);
>  
> +int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
> +int luo_session_retrieve_fd(int session_fd, __u64 token);
> +
>  int create_and_preserve_memfd(int session_fd, int token, const char *data);
>  int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
>  
> diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> index 60121873f685..7bc6707d8bb7 100644
> --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
> +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> @@ -54,9 +54,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
>  	return arg.fd;
>  }
>  
> +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
> +{
> +	struct liveupdate_session_preserve_fd arg = {
> +		.size = sizeof(arg),
> +		.fd = fd,
> +		.token = token,
> +	};
> +
> +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +int luo_session_retrieve_fd(int session_fd, __u64 token)
> +{
> +	struct liveupdate_session_retrieve_fd arg = {
> +		.size = sizeof(arg),
> +		.token = token,
> +	};
> +
> +	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
> +		return -errno;
> +
> +	return arg.fd;
> +}
> +
>  int create_and_preserve_memfd(int session_fd, int token, const char *data)
>  {
> -	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
>  	long page_size = sysconf(_SC_PAGE_SIZE);
>  	void *map = MAP_FAILED;
>  	int mfd = -1, ret = -1;
> @@ -75,9 +101,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
>  	snprintf(map, page_size, "%s", data);
>  	munmap(map, page_size);
>  
> -	arg.fd = mfd;
> -	arg.token = token;
> -	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> +	ret = luo_session_preserve_fd(session_fd, mfd, token);
> +	if (ret)
>  		goto out;
>  
>  	ret = 0;
> @@ -92,15 +117,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
>  int restore_and_verify_memfd(int session_fd, int token,
>  			     const char *expected_data)
>  {
> -	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
>  	long page_size = sysconf(_SC_PAGE_SIZE);
>  	void *map = MAP_FAILED;
>  	int mfd = -1, ret = -1;
>  
> -	arg.token = token;
> -	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
> -		return -errno;
> -	mfd = arg.fd;
> +	mfd = luo_session_retrieve_fd(session_fd, token);
> +	if (mfd < 0)
> +		return mfd;

There is also preserve_fd() in selftests/liveupdate/liveupdate.c which
pretty much does what your luo_session_preserve_fd() does. I think you
should remove it and make its callers use the new library.

LGTM otherwise.

>  
>  	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
>  	if (map == MAP_FAILED)

-- 
Regards,
Pratyush Yadav
