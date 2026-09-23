Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C49F3A7593;
	Wed, 23 Sep 2026 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179343; cv=none; b=ijCGIM58ngdjIoO9TeU1Cq8TUKpq8Fdn57hzdh9CTjFtuHDtBnitZl9RYUs27WNROvbYBxJA/4JBC7UwUDXVyc1+LALNEe4zqC5ygxdlslB1E3dER9UhECzEZk+o5ykQcoUnQTliTZkHrKPTx8PEC+f+q2EjjeEJzTSwAvm7BcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179343; c=relaxed/simple;
	bh=1l5zG/LFyrLc3Fuiwq6dV5vVH2kbho3X7OvJ0lxCmoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGH2RIqApXSQ1CCqnloo/xMwX4WR5KcKUF8u2ELZ22fS/4+nOwbT0gI+MWZpszM11ANJGwz751OVeSPd8+DpHOl0xRsMKdHqkQfp4rKaA1QvekYdjPM0RyQUIEw9AV45ObqsN8WEGPn/jLemzAKnZOezMe8rEXKkiPUNM4fXS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7AZCEg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7AZCEg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BD61F000FF;
	Wed, 23 Sep 2026 16:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179342;
	bh=M79vYD/0NuECTzxyn7/SZqwo9o47/DciXWmBgqiAck0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a7AZCEg9mOmHObnvA6Cd0w4EdnEq+L4JOd8/1X2w6uLUJmT/gz12kXC0xstpbdArm
	 kGeuthW09HYW/H6Fdrt9wc4dFYLNa9e0wu22KaoBM7BA2oHqxgvQoTj8GovlqUgqMm
	 quuGaVBMDYG7nHhIZ8Ahha/OkYJ/Os5nVsocdQX4uzHzJf9s6U118rGXeSreVB7uPt
	 I8yS+8MAJETkVczEa/DFshgYSeWE6MU4It0nCjcZhRm+cLNQrxS7dhrx/saoTEOp3D
	 MTCzBghnbZHkGSFIbJfBbk/HRte3LPwdrJ1cAlNx5E0t1sfqbXaMQfBu1oSzcjiLBp
	 itLnd8vHyFtAA==
Date: Wed, 23 Sep 2026 17:02:16 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 04/10] mm/madvise: use the PMD softleaf validity helper
Message-ID: <arP3wI7qe7-eA7J1@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-5-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922235830.2350770-5-gourry@gourry.net>

On Tue, Sep 22, 2026 at 07:58:24PM -0400, Gregory Price wrote:
> A non-present huge PMD must contain a software leaf type supported at
> PMD level. The open-coded check names the currently supported migration
> and device-private entries instead of expressing that invariant.
>
> Use pmd_is_valid_softleaf() so the validation follows the central
> definition of valid PMD softleaf entries.
>
> No functional change intended.
>
> Assisted-by: LLM
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

LGTM and I like the use of softlaf obviously :)

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/madvise.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c345fef23f15d..b31b877c2c130 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -427,8 +427,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>
>  		orig_pmd = *pmd;
>  		if (unlikely(!pmd_present(orig_pmd))) {
> -			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
> -					!pmd_is_device_private_entry(orig_pmd));
> +			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
>  			goto huge_unlock;
>  		}
>
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
