Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F923B8922;
	Thu, 20 Aug 2026 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215263; cv=none; b=kJqfMY/LywnUxW/IP0vJFNlrHcLeqAkm0IQpsxzv0VfxzY5Mp1eYCWlBvMG3AGhzugaOSI5YME3NbTG4L6G1O2PGvarXd9SLK8Ms5Uoqb+LjRZHkrEQW2ZSGTM3tdaRntzeN+yk0wEp7Z1N04lCUt7g6NoCxywuFX0WGaNrUyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215263; c=relaxed/simple;
	bh=EWf4RYVwK2I9D/8mQ51gmq1CIEh9zad3AqWrI7wCKM4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FrJT0qNiObamU2jK37hizt7g5xXBtVdDGaPi7yc2GoimJLwSjMuRfZmok/GUSsymk9az2vCb64f1Oh1SN9Qh2uxErtoeZg2tmZN5TERfLD9kMLhxrPJq6gijafrZxvMvstPzGBCdbMQDL00cIiG8JvaFCoRrNE5VeXd5wMlrXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqXc3BNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqXc3BNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECDB1F00A3D;
	Thu, 20 Aug 2026 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215261;
	bh=TH8icUmIsFqcx2XyjrrIGOwMDuLcmtY+UH0kZbaRyrM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SqXc3BNJnZsXg3qq6Qf8ToulTCVa9Es0x+UV/0KzHsCmHQlYf4ZfBACOUq5rYZ/LX
	 qNNWRDm4eC2uvdlqfzr0DDVu6FG6cKx2yTbrIxjvZ1zSBlTsrW8r1BzX9N+5O1jeif
	 Bld8ATzn9dRJ6mdNhxsmUIA8tTHRp3M33rXKxIt9KZV6GYTWQ+LkeV5f6yOGxYnIdL
	 MGafhU4SNKwZdgVwR6qb0GsycixlKNUP2wnK9EVDcY62mzfqhTXvJwEXp9nR63oysA
	 FnTrDFXeYila7L4Rthwj+Mf0owS/1uIUdlCOQ5YtWOvxoBw3zpLo6bswTT4COd9odB
	 sxRNNqN1mpSxA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-7-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-7-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523516.2799959.13966792702490563774.b4-review@b4>
X-Mailer: b4 0.17-dev

> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
> It clears the global controls only, which is no longer enough.  A per-order
> control overrides them, and -s leaves the source order at "always", so

Nit: description of '-s' would be nice :)

> khugepaged collapses the very range the case is working on.  The case then
> fails on a collapse that was interfered with rather than refused.
> 
> Clear the per-order controls too.  Set them to "inherit", not "never".
> khugepaged honours the global never and stays out.  A forced shmem collapse
> takes the order it builds from these very controls, and still finds one.
> 
> Fixes: 9f0704eae8a4 ("selftests/mm/khugepaged: enlighten for multi-size THP")
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index a3d14cc1a2bf..5aa92de93ec1 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -572,8 +572,8 @@ static bool is_anon(struct mem_ops *ops)
>  static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>  			       struct mem_ops *ops, bool expect)
>  {
> -	int ret;
>  	struct thp_settings settings = *thp_current_settings();
> +	int ret, i;
>  
>  	ksft_print_msg("%s...", msg);
>  
> @@ -586,9 +586,20 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>  	/*
>  	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
>  	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> +	 *
> +	 * The per-order controls have to go too, not just the global one: a
> +	 * source order left at "always" -- which -s does -- lets khugepaged
> +	 * collapse the very range the case is working on.  Set them to
> +	 * "inherit", not "never".  khugepaged honours the global never and
> +	 * stays out.  A forced shmem collapse takes the order it builds from
> +	 * these very controls, and still finds one.

From my experience LLMs tend to add lengthy comments that describe their
actions in the moment. Adding to the prompt an instruction to make
comments more concise and in the global context usually helps :)

-- 
Sincerely yours,
Mike.

