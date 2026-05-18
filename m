Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4727F3F44FB
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103796; cv=none; b=EBcjkVauQUyYypdqOUiKYT4eomwdJZUm1DPZIfJi4PzDL75aFl33CIoGHuhnuZWqnc/LsPGZQdGCjpkBMHU+npDtOYleR/m4JfzhbeE2UUog6cRfcNyTs76lVIYfItdvoz6FUd2PC3yUKBnGFGZMhJu8qnY1jCS4AXWIlO2d6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103796; c=relaxed/simple;
	bh=5h+JaZk/JM+pD3tioviir/zaPCZBDLs4hcSQ6YmKTnY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cLvS44tcAF5Ee3CTbzZR5ySiLM0cO9V6hSmAeUATp5YMbV5Q38eOvzr+1FAfR8FovMYPvruHuB3audzoQhXa23wIAXP9mwChBeFEnHY5jCmZZj9X6COBZMT83GxPkgMv9hEHSaGkehseSAp2601m8LUvmGjZLE5Mvwc/7QS/u2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u88iPtJp; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u88iPtJp"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bd86cf9d900so45484066b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779103791; x=1779708591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDqRPZa7dBLYBPk4B/6HSFC2D7QwgtADBC0sCxOKu8=;
        b=u88iPtJpnvvpxFjZ+IfxFb2sYp6Jz+z6vCrfTzV9ikgYUSPupncedJqMu7lCTVEpta
         8TWqL7sMd3u9iLS2Yf8ZulEnFmDr6Ncfz1iTvH7DUDuJSkXadaXPz9McWkZJ7iJjkhnY
         aKdpxHLZjhV2dCMYfa4NJWcZ5uR9toZcMRPu8MsfZVcJriRzaU5h9k7GcN/oh0Wm5waK
         7hIMZRI4rrTeF3gv2oy1WgN0ymDPzEF92i6ETAq8XL0Vcg6Y/MAb78Sa0CyRzNB6wX0m
         ZRLUMSPdD26Nn52HEnVjWUkmEtgwfl5IHMpLymYKedpvRnF4ZPl6cEO8YSu7Zm5Eg2+a
         UzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103791; x=1779708591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDqRPZa7dBLYBPk4B/6HSFC2D7QwgtADBC0sCxOKu8=;
        b=P5qjWdfQTjJC1e6ERZFc2Mnh0e3tyHLJ8xQxE/9uPKxpAGbZXTg8UEWPW8LH88m4AM
         bJ9JXSOI2Hm5HvZ2bbRFwP7ZSaEBy2b8r0KImtNBVvIxU1P/QHbrzhqNk0fdNPthAIAc
         J1unGXzxAKct/uMVZxuMRBwLOjXsLtV/mKs+wa5QzsjkMcgFx7N4n4OHg04CGKJfn75e
         930CxlrTSHcSSOCP8OlBCBRZtlf4B69bAb9bY+NZKmwSDMu/xvX2L81T9s02bB6qGgeu
         a560z1h5H2uYrkYsXMcExuT6+o73BvSTpDwIgUuZEjOVvMDmvAUlW4CdYEoNREutZH4k
         lBTw==
X-Forwarded-Encrypted: i=1; AFNElJ88vztogJgDgTItkQQvfwrhqgf9Sx07xORQqqgeprRWJFlxsZBgf4+PHCOGvLyzTbUAC3/Iyn9sVUqG0owoqBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylvBtulRt+ABZ5XG967+QOsky/0EBnLTdcTAawmEIllaFzD7lr
	xwvjtuZB0HwWZzgRe8ku4XYZpaKFsmiE0CM5rtJvOR/Vp2C/eUPTWLLJV9GOSRnyx3EHTXCzajC
	wiRMeyWBq/gkuh+J4tA==
X-Received: from ejchr5.prod.google.com ([2002:a17:907:3f85:b0:b99:5efe:10b2])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e86:b0:bd5:2cc7:d845 with SMTP id a640c23a62f3a-bd52cc7de89mr574085666b.30.1779103790274;
 Mon, 18 May 2026 04:29:50 -0700 (PDT)
Date: Mon, 18 May 2026 11:29:49 +0000
In-Reply-To: <20260511201155.1488670-3-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511201155.1488670-1-vipinsh@google.com> <20260511201155.1488670-3-vipinsh@google.com>
Message-ID: <9huzy0hh3qhe.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
From: tarunsahu@google.com
To: Vipin Sharma <vipinsh@google.com>, pasha.tatashin@soleen.com, rppt@kernel.org, 
	pratyush@kernel.org
Cc: shuah@kernel.org, dmatlack@google.com, skhawaja@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Vipin Sharma <vipinsh@google.com> writes:

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
nit: Can add a comment that, once it is failed, retrieved status is saved,
So it is permanent failure.
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
>  
>  	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
>  	if (map == MAP_FAILED)
> -- 
> 2.54.0.563.g4f69b47b94-goog
