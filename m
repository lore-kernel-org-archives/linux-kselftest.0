Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6F44A408;
	Tue, 18 Aug 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047985; cv=none; b=KfCH8K8D4CzXVbW5dLdIVlQytMjDbI2V7VnRvaqdAPnm3eD1Sjnyabj8sAHdH1EkpEmP5l7xs98NLjbQ8678Oq5mh2AYL6giqAuCYUg/OF7RIgquvxw6Yx0f9zMMvN42okZQ6X/pYHmR8L0I7w26Htb31bYNbgqF1xFU7z9koDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047985; c=relaxed/simple;
	bh=TQEdIggcC0YwSXqJia/3dZV0PSVH1zzM0Q2SY6m753o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO88zgc+173Qdew2t5LXGyhwZa3O9k9LdPpHz4b0gbQ6+tw+MY8iEAOyyayIsJjFN1o1S5Gi7K2SsNnPNufDyJyRVJxhfIiXD+aDh02EwHD7NVnEIh8b4OtzLTZs2fjbIbB5J+CZvkiqc3IM3q5Qa+Dy8stUxEsiGaS11Irz8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFpxpa+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFpxpa+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF311F000E9;
	Tue, 18 Aug 2026 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047980;
	bh=X0jR2Hu1pPq47r0Pqs+isJEWmPJhfGvuqIKp7EEfJTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DFpxpa+VDyNxFf3wVwCAF/LrGoNlRgRvjCjGTRjTjKfT4b+1fxGv/ERL6jGnk2PQl
	 yraZ0E7SjbWBuA0PnC1IFVFYoD9mmYEnFP2xz+zsYePqKxveL19B0ISHA0XDziIU1S
	 a6SizlDZ+Vfspvye/2EmHO8a10niwF6mpV9TNCaalVchQZLw+HR5hOwfI4Olrom9N+
	 a8LX0Q+qYh0As+JMMfExsdyDHC2JsKT56vTLNXMt8egX5RSXG6zrTH022Z1fv/yNO7
	 4KsDW8Hfjf6KXdmEcOuuqEhUOGlN3W+mLKB1CnAhuwWBY6F4o1J9p16Cij8NTglZ6p
	 lhWMYA4QM9msA==
Date: Tue, 18 Aug 2026 11:12:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
Message-ID: <aoQvybFWhSkWe1o_@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-7-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-7-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:48AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
> It clears the global controls only, which is no longer enough.  A per-order
> control overrides them, and -s leaves the source order at "always", so
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
> ---
>  tools/testing/selftests/mm/khugepaged.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 7eb9db0005a0..0008862e7cbc 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -550,8 +550,8 @@ static bool is_anon(struct mem_ops *ops)
>  static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>  			       struct mem_ops *ops, bool expect)
>  {
> -	int ret;
>  	struct thp_settings settings = *thp_current_settings();
> +	int ret, i;
>
>  	ksft_print_msg("%s...", msg);
>
> @@ -564,9 +564,20 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
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

Again far too many words, schloppy. Trim it please. This isn't a chat with
claude it's a comment.

>  	 */
>  	settings.thp_enabled = THP_NEVER;
>  	settings.shmem_enabled = SHMEM_NEVER;
> +	for (i = 0; i < NR_ORDERS; i++) {
> +		settings.hugepages[i].enabled = THP_INHERIT;
> +		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
> +	}
>  	thp_push_settings(&settings);
>
>  	/* Clear VM_NOHUGEPAGE */
> --
> 2.54.0
>

--
Cheers, Lorenzo
