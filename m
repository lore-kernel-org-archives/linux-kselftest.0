Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D637105A;
	Thu, 23 Apr 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948068; cv=none; b=B8woepHrUgI3JyyuN8ipevvRZ6hM1f2is718jZC4koUkN4zJgN4AbiE+X0+qVa/6x/PtSStZ61obXWc3GgTGTXO1b4yekFyKtTnmG1G1p/P5iISNnvoNVb3FRypgon3DUvBMhgzepChluJvQE6dn6lpZY1AMFnRBHbFLdlQg2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948068; c=relaxed/simple;
	bh=waRGdMVTGVjwfTHHNSZiaOBkzZauKK4J5ylDPvGMmqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp8HB+PMTPtpOYbDfM6TiHjC0DBRUQ5dtJ7tvVxnne2RZouaadRldhQGrOX080OQ7AnoMFdUK79uE/pSgU24IfA9oI4cNoVxN49QKBt2yT5t3eBZt3pO9s9abjkZIxJVxp07jOre/N8160G8ecAJjiDpyb+J1TKA3lrZxby4MHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1gFEBpC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1gFEBpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACC1C2BCAF;
	Thu, 23 Apr 2026 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776948068;
	bh=waRGdMVTGVjwfTHHNSZiaOBkzZauKK4J5ylDPvGMmqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1gFEBpCXaCBrvHhG7Fi7ZdIDlUyoXwTmnxT4GelYwpaox6L0EHL56esiwLVXT+dp
	 1GA+DaCiB+4RtExyiVDvFcHpcPmtlUhrG+CiRW4KjiVqzbuOqthQ/rt+qRZ6iteWsA
	 j4AaEF7Ymnu+4hABQkBgRHqSzwwLdZOkBlGwkkK/rkYMxjI3v0FucRcYP8EQZ4hKpY
	 zpWfu6h5qy144PW8xEtEWdUPQDKR95V+1rt+5ZUgwL19Pl2WEBZwhzakNcodTvdGRx
	 zoxNxXja2HHMiVGcGIeP7CcMNtqg8R6hNDKuv6IzmdNYrhKw0cdaALkeGTQl/rVkvX
	 h/3Kn1qOTRuQA==
Date: Thu, 23 Apr 2026 13:41:03 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
Message-ID: <aeoTX_6nK6oHw5OE@willie-the-truck>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
 <aei87MmXaEdg8YOf@willie-the-truck>
 <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>

On Wed, Apr 22, 2026 at 04:55:05PM +0200, Kevin Brodsky wrote:
> On 22/04/2026 14:19, Will Deacon wrote:
> >> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
> >>   * This state needs to be carefully managed to ensure that it doesn't cause
> >>   * uaccess to fail when setting up the signal frame, and the signal handler
> >>   * itself also expects a well-defined state when entered.
> >> + *
> >> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
> >> + * of the remaining fields is valid (has been set to a value).
> >>   */
> >>  struct user_access_state {
> >> +	unsigned int valid_fields;
> >>  	u64 por_el0;
> >>  };
> > Do you think it would be worth adding some accessors to make it easier
> > to keep the flags in sync? For example:
> >
> > /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
> > void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
> >
> > /*
> >  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
> >  * Otherwise, return -ENOENT.
> >  */
> > int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
> >
> > WDYT?
> 
> I did get a feeling having helpers would be a good idea. I wonder if
> getters/setters aren't a bit overkill though, as they make accesses to
> the struct more cumbersome and we'd need a pair for every member (unless
> we use some macro magic).

We only have one struct member, so it's probably fine for now, and we
could group related members together in sub-structures to help in future.
But it's up to you -- I don't feel strongly about it, but requiring the
caller to update the flag manually is going to be a bug magnet.

> Maybe it would be sufficient to have say
> ua_state_has_field(POR_EL0) to check if the bit is set, and
> ua_state_set_field_valid(POR_EL0) to set the bit?

I don't think that really helps with my concern. I'd like to avoid callers
having to remember to deal with the flags when they update the data.

Will
