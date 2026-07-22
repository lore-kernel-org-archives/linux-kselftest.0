Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28D31619B;
	Wed, 22 Jul 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679506; cv=none; b=DyL7KRZqfE5vIjI+EFdTBYI8xQTAUXBsJ435bdtVwBf8cR3Ml83d1c1sWJ7pihUAVqAYqIPIxPmOWmCABrZiTEfws+SL8qZt4EcgpKBDoydb9ZwHpewIZLpVDYH+LtlBqtIFEZDVnke1mNLizCsnuwTEYybEU7FyqNSNOjKXGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679506; c=relaxed/simple;
	bh=YTmkcmJ8gx8RuKHiebYC3gqo1UAMozEiLXFDXGlSWE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+VaeYijiJf21i5Hn706IbD7Y18cWMZUTxZTZnRKcgcSNuuFrBBkSxaEktsCNcW07e26Ndpq2Z71RXPSK8kuVeXdxPlHidJSclmx9Nu3wZdnDntVwPqxYQWbII50jy3Im+c39ZZl2AeB0GoHA/B9Ux0uxejH8934Xv38GMM4Hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQklOV3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQklOV3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA041F000E9;
	Wed, 22 Jul 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784679490;
	bh=NZE8OVcCqPgnZz+/5Kme28lwwlaGh+3LsOtdYSryteU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HQklOV3tmYgsc8UrejYclNrWh/eCAMQrh79IZrgN0+gHQk4JssCNNslTRNhnYyWkX
	 FyKeg3rWX8mUJnpmSgf+lsRZV5A99IIVJ68sU4maNDFnhBE8vha3SnLsjClH/fl0G3
	 Anxbm4RcITokwXA85WLGQqRyUh3ahEIoN97Tfa0CB+ZDz75rOG7cBhXZYXc7aFPZCA
	 xBhlZxxthyvWaJ3wGH2xRHqcWXT1KM2anIcUXTY2aG6QUVHm5f9io8QARfC4i/JiIg
	 ziVrar6D8Pk1jj+IDiMyd2mh1f+nd66nN2S2aeQ3h/d3I2oeS07tQjN0VhcSsHnCNl
	 ogBmadR06ltiA==
From: SJ Park <sj@kernel.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/mm/pagemap_ioctl: Fix missing NULL checks after calloc()
Date: Tue, 21 Jul 2026 17:18:00 -0700
Message-ID: <20260722001801.150265-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721063611.342-1-yanlonglong@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello longlong,


I found get_maitnainer.pl is suggesting to Cc below recipients.

- Lorenzo Stoakes <ljs@kernel.org>
- "Liam R. Howlett" <liam@infradead.org>
- Vlastimil Babka <vbabka@kernel.org>
- Mike Rapoport <rppt@kernel.org>
- Suren Baghdasaryan <surenb@google.com>
- Michal Hocko <mhocko@suse.com>

On Tue, 21 Jul 2026 14:36:11 +0800 longlong yan <yanlonglong@kylinos.cn> wrote:

> The pagemap_ioctl selftest allocates memory via calloc() in several
> places but does not check the return values. If calloc() fails, the
> subsequent code will dereference a NULL pointer and crash.
> 
> Additionally, in sanity_tests(), the calloc() failure check incorrectly
> uses MAP_FAILED (the mmap() error constant) instead of NULL. Since
> calloc() returns NULL on failure, the check never triggers and a
> failed allocation goes undetected.
> 
> Add NULL checks after each calloc() call, and fix the wrong error
> constant in sanity_tests(). Use ksft_exit_fail_msg() consistent with
> the existing error handling pattern in the file.

Makes sense to me.

> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

I have a trivial comment below.  Regardless of that,

Reviewed-by: SJ Park <sj@kernel.org>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
[...]
> @@ -1000,6 +1004,8 @@ int unmapped_region_tests(void)
>  	int written, len = 0x00040000;
>  	long vec_size = len / page_size;
>  	struct page_region *vec = calloc(vec_size, sizeof(struct page_region));
> +	if (!vec)
> +		ksft_exit_fail_msg("error nomem\n");

I'd suggest to separate the definitions and statements by putting an empty line
in the middle.


Thanks,
SJ

[...]
