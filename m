Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6225A2B4;
	Wed, 18 Mar 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819832; cv=none; b=Qlvcmc+eiMU+93/n4m/l4Pbgykmd1SNfcXCwDIycsll09KpVd5RAd65JezGZr3YYBftijpvrw/+6eS4JuQVwEUCwTyeIoM4S3XfQ4ItfkJwq1EVTqzwFzgM1ZTcGzBdwqwqDqCqVY43OXuTZ4EqUSa4WrbpvBAr2+12YMCCl2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819832; c=relaxed/simple;
	bh=MR6pOI/j04PYleruQQa98TK1ndpttSpNVdbTItOLHTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soM0E8uf2rWp831evZWhM6HEXuoHQ9vmOU8St4kibwnD0/rF3hE4lWDAHRPhDldN2wCbBMdTzpnAP2leB0rlQSzNAiCxZ2m5z4HPo0sbN2wh9zlGKDYJ1deNoGy58S/6HYUqngXjnEmeAekNHcKIzpviXCvKtJrg/98kJhgDgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uU4ZfC6Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uU4ZfC6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88217C19421;
	Wed, 18 Mar 2026 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819832;
	bh=MR6pOI/j04PYleruQQa98TK1ndpttSpNVdbTItOLHTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU4ZfC6YLNJjoYyZgv6kgFdMKaBV84iR8hPCq0E1OE6spltjUu/iP0HXsirHpUwDu
	 R83utcMVIA+GmZ/fCO9wargcDNarNQ8TimXdWLZpq61FDfxzqXxgIynR1VX/AelDwm
	 1Yohcc8zUdOTT6a1ILg1eEcsPWtu33ZRds3x09hgai4XByGOrpujYJ76dU/H20x3G9
	 Q5Dkc8PGAIh2FlCj3H1Tkm2YynaeAJON+XazYalreEdjfim4cqyBKkUxpiSZIiGN31
	 iYEU2EMCTTVOieIutCSZy6irvOJQgoij8wf6B92iAo76kO5zdDzkHEq01UmEW6HQHr
	 hXwKwDiwqHxDA==
Date: Wed, 18 Mar 2026 09:43:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 6/6] selftests/liveupdate: add fallocate test for memfd
Message-ID: <abpXs6RgiUDSBA8-@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-7-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-7-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:39AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> When memory is added to a memfd via fallocate(), it does not get zeroed
> immediately. This is tracked by the absence of the uptodate folio flag.
> Initially, memfd preservation simply saved the folio flags at preserve
> time. This led to a bug, where all writes to un-initialized fallocated
> memory after preserve were lost after live update. This is fixed by
> patch [0] (not in mainline as of writing this).
> 
> Add a test that fallocates some memory in a memfd, preserves it, writes
> to it. Then in stage 2 it verifies the written content is still present.
> 
> [0] https://lore.kernel.org/linux-mm/20260223173931.2221759-2-pratyush@kernel.org/

Looks like it's already in mm-stable, so it's sha should be stable already.
 
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  .../testing/selftests/liveupdate/luo_memfd.c  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
> index 75f88101e7b5..dde3c78db50e 100644
> --- a/tools/testing/selftests/liveupdate/luo_memfd.c
> +++ b/tools/testing/selftests/liveupdate/luo_memfd.c
> @@ -43,6 +43,11 @@
>  #define PRESERVED_MEMFD_TOKEN 1
>  #define PRESERVED_BUFFER_SIZE SZ_1M
>  
> +#define FALLOCATE_SESSION_NAME "fallocate_session"
> +#define FALLOCATE_MEMFD_TOKEN 1
> +#define FALLOCATE_BUFFER_SIZE SZ_1M
> +#define RANDOM_DATA_FILE_FALLOCATE "luo_random_data_fallocate.bin"

FILESYSTEM_COPY_ or something like that?

> +
>  #define LIVEUPDATE_DEV "/dev/liveupdate"
>  static int luo_fd = -1, stage;
>  
> @@ -193,6 +198,65 @@ TEST(preserved_ops)
>  	ASSERT_EQ(lseek(fd, 0, SEEK_END), PRESERVED_BUFFER_SIZE);
>  }
>  
> +/*
> + * Test that an fallocated memfd is preserved across live update and can be
> + * written to after being preserved.
> + */
> +TEST(fallocate_memfd)
> +{
> +	int fd, session;
> +	char *buffer;
> +	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
> +	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
> +
> +	buffer = malloc(FALLOCATE_BUFFER_SIZE);
> +	ASSERT_NE(buffer, NULL);
> +
> +	switch (stage) {
> +	case 1:

Functions again :)

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
