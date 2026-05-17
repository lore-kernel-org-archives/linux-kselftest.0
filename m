Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC83BF69C;
	Sun, 17 May 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038424; cv=none; b=QsRZDOiAhzif45flbV8+Vi2iQCyCN4ct8Bqs1LoDhp/ApcGHt/dXDX20JYCLahGzGdbVeayVA+Qz9EKTrQ7wg6RYF6m1Vj+7Zsnj2o36MZCpk9b9wYkbjrd1xo63KWNzr5dM+czvEznOz+RJayDmrDilrdvqCQbV5cT0SOC9+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038424; c=relaxed/simple;
	bh=9zAiXASte9+QF5zhIHe0oi7WTzSBFGj/YZujYlv9iI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwCDbLXj/dWLB8R/cIzJGBhG8XWCrZaqF48QgC88DG+fEpGhYtr0TfidyG/wHo1H/5m52OfPV7tMQucLS/xSKDDxXTMJapTn2RlrYoYirCeLOXVkEaD8L+jAQey0QN635/9WN9brlAfYfvQrI5lglq+YSpjdeH3G6srirLSSXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJo6cs3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJo6cs3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6DFC2BCB0;
	Sun, 17 May 2026 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038424;
	bh=9zAiXASte9+QF5zhIHe0oi7WTzSBFGj/YZujYlv9iI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJo6cs3/G+d+DgzP07h7g/GxQyDv87IyuonHXZQobWN/j+tdQjATiXjrmQtCjzsC9
	 NyBqn4HoFfUKWA6G8ZeRsTgw0uNeD3P1bLtTkpoHKIXocS8K295tlVHrk0shwjaiww
	 E1Ryg4TlvJy1o+Sg1bviynvbvOz1pAH5WbvfqyaYL4x2pDgl5V2Ka3ZTxMP5qeiRkH
	 +FFtryp8VYsi1ITV9ECyMeyCxnh9kENVXjLk+ywamUugvuNeJ1tod0nGMQ3T/ewY74
	 uE7ytb7QgSMfZYWgUVeGGQImxzxIuvz8ifr6Q39qWN0qRV79BZKws5x+BMd1SNnkn2
	 DvkXBnt3QMezA==
Date: Sun, 17 May 2026 20:20:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 01/10] liveupdate: centralize state management into
 struct luo_ser
Message-ID: <agn4z5ZrFBi9AIGw@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-2-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:19PM +0000, Pasha Tatashin wrote:
> Transition the LUO to ABI v2, which centralizes state management into a
> single struct luo_ser header.
> 
> Previously, LUO state was spread across multiple FDT properties and
> subnodes. ABI v2 simplifies this by placing all core state, including
> the liveupdate number and physical addresses for sessions and FLB
> headers into a centralized struct luo_ser.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/kho/abi/luo.h      | 91 +++++++++++---------------------
>  kernel/liveupdate/luo_core.c     | 59 ++++++++++++++-------
>  kernel/liveupdate/luo_flb.c      | 65 ++++-------------------
>  kernel/liveupdate/luo_internal.h |  8 +--
>  kernel/liveupdate/luo_session.c  | 57 +++-----------------
>  5 files changed, 93 insertions(+), 187 deletions(-)

This looks lovely :)

> @@ -115,27 +117,29 @@ static int __init luo_early_startup(void)
>  		return -EINVAL;
>  	}
>  
> -	ln_size = 0;
> -	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_LIVEUPDATE_NUM,
> -			  &ln_size);
> -	if (!ptr || ln_size != sizeof(luo_global.liveupdate_num)) {
> -		pr_err("Unable to get live update number '%s' [%d]\n",
> -		       LUO_FDT_LIVEUPDATE_NUM, ln_size);
> +	header_size = 0;
> +	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_ABI_HEADER, &header_size);
> +	if (!ptr || header_size != sizeof(u64)) {
> +		pr_err("Unable to get ABI header '%s' [%d]\n",
> +		       LUO_FDT_ABI_HEADER, header_size);
>  
>  		return -EINVAL;
>  	}
>  
> -	luo_global.liveupdate_num = get_unaligned((u64 *)ptr);
> +	luo_ser_pa = get_unaligned((u64 *)ptr);
> +	luo_ser = phys_to_virt(luo_ser_pa);
> +
> +	luo_global.liveupdate_num = luo_ser->liveupdate_num;
>  	pr_info("Retrieved live update data, liveupdate number: %lld\n",
>  		luo_global.liveupdate_num);
>  
> -	err = luo_session_setup_incoming(luo_global.fdt_in);
> +	err = luo_session_setup_incoming(luo_ser->sessions_pa);
>  	if (err)
>  		return err;
>  
> -	err = luo_flb_setup_incoming(luo_global.fdt_in);
> +	luo_flb_setup_incoming(luo_ser->flbs_pa);

Sashiko asks: 

  Is there a leak of the preserved luo_ser memory here?

  The outgoing kernel allocates the header using kho_alloc_preserve(), but
  luo_early_startup() returns without calling kho_restore_free() on the
  luo_ser pointer once the fields have been processed. This results in an
  unreleased memory reservation on every successful live update.

This seems preexisting, and we probably don't care enough, but still...

There were more comments by sashiko, didn't check them yet.
  
> -	return err;
> +	return 0;
>  }
>  
>  static int __init liveupdate_early_init(void)
> @@ -156,7 +160,8 @@ early_initcall(liveupdate_early_init);
>  /* Called during boot to create outgoing LUO fdt tree */
>  static int __init luo_fdt_setup(void)
>  {
> -	const u64 ln = luo_global.liveupdate_num + 1;
> +	struct luo_ser *luo_ser;
> +	u64 luo_ser_pa;
>  	void *fdt_out;
>  	int err;
>  
> @@ -166,27 +171,45 @@ static int __init luo_fdt_setup(void)
>  		return PTR_ERR(fdt_out);
>  	}
>  
> +	luo_ser = kho_alloc_preserve(sizeof(*luo_ser));
> +	if (IS_ERR(luo_ser)) {
> +		err = PTR_ERR(luo_ser);
> +		goto exit_free_fdt;
> +	}
> +	luo_ser_pa = virt_to_phys(luo_ser);
> +
>  	err = fdt_create(fdt_out, LUO_FDT_SIZE);
>  	err |= fdt_finish_reservemap(fdt_out);
>  	err |= fdt_begin_node(fdt_out, "");
>  	err |= fdt_property_string(fdt_out, "compatible", LUO_FDT_COMPATIBLE);
> -	err |= fdt_property(fdt_out, LUO_FDT_LIVEUPDATE_NUM, &ln, sizeof(ln));
> -	err |= luo_session_setup_outgoing(fdt_out);
> -	err |= luo_flb_setup_outgoing(fdt_out);
> +	err |= fdt_property(fdt_out, LUO_FDT_ABI_HEADER, &luo_ser_pa,
> +			    sizeof(luo_ser_pa));
>  	err |= fdt_end_node(fdt_out);
>  	err |= fdt_finish(fdt_out);
>  	if (err)
> -		goto exit_free;
> +		goto exit_free_luo_ser;
> +
> +	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
> +	if (err)
> +		goto exit_free_luo_ser;
> +
> +	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
> +	if (err)
> +		goto exit_free_luo_ser;
> +
> +	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
>  
>  	err = kho_add_subtree(LUO_FDT_KHO_ENTRY_NAME, fdt_out,
>  			      fdt_totalsize(fdt_out));
>  	if (err)
> -		goto exit_free;
> +		goto exit_free_luo_ser;

And here we also seem to leak memory allocated by sesttion/flb setup.

>  	luo_global.fdt_out = fdt_out;
>  
>  	return 0;
>  
> -exit_free:
> +exit_free_luo_ser:
> +	kho_unpreserve_free(luo_ser);
> +exit_free_fdt:
>  	kho_unpreserve_free(fdt_out);
>  	pr_err("failed to prepare LUO FDT: %d\n", err);

-- 
Sincerely yours,
Mike.
