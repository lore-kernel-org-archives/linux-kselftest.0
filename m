Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893528314E;
	Tue, 17 Mar 2026 03:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718781; cv=none; b=MRWdb2ovKlAGP/EYRJGstwR2Kezt4HtPyksJ5Uy5C6ti0/eF7+oD0mriwYWHl1HO3WqOHkSQdFvxJdxdvvASJys2ZWlbh2LOmGXlS8Xje+rZKqfuo8+5WXLX8FnAdgsrUoCBLrXnuUUZbAwXQV8dXM23eRcv9ZeWoH6bJU5auVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718781; c=relaxed/simple;
	bh=8hAg0zyKA73FfN0mgQFWxOrvxGPICMcp9p0vfIzXr0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dH+YsOuFUcBsgmvu8EV4OUX2WipYaZagyh0bkUDACVFZvlc0DiXQJDjw7AMvpDdz03hh5BiBwQsI1X7HSO4ZAOp00eJwTjRanOjlOzgRP46eaWRQ2GXKGDOVmdICCCm9cw2Vu0Zf+9JEZXj+0DeAFxK8fx7Ax3rApdUIh+btHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3/f5Xj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3/f5Xj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE3DC19421;
	Tue, 17 Mar 2026 03:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773718780;
	bh=8hAg0zyKA73FfN0mgQFWxOrvxGPICMcp9p0vfIzXr0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u3/f5Xj26oC+Xc5dBDvC9c7X32Cu7H5EZrFwvC4Z76fUwpYtWYjD6o9eKhHiGfbaG
	 veb4hxLWtqwa30Tyx9C+ML0M17XdES4hQ07yAtvkNM9s8EPgCfzHnKZJrZmnJb3fs/
	 Nrnsz67vJ2WSoq6jMgx7FwzSff6Vl2tdazDYaD2ROFrm2a20RjZDmJzmd7FovxZG4Q
	 rFuoi+1vG+kevJyJQ05+XOUzz++CD0M/KDVTpq/3e544f0xoHmcuT6df6s8nuKuwWI
	 GmwMntQUqoP1tMyDBHzrBn2GVouHytsgkL7YOLMDvC1XsUD8odi3fFV3/lPPpEpr8R
	 EniZ+VgqR0Fww==
Date: Mon, 16 Mar 2026 20:39:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] net: dpaa2-mac: extend APIs related to
 statistics
Message-ID: <20260316203939.7629aebf@kernel.org>
In-Reply-To: <20260312142249.297192-2-ioana.ciornei@nxp.com>
References: <20260312142249.297192-1-ioana.ciornei@nxp.com>
	<20260312142249.297192-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Mar 2026 16:22:47 +0200 Ioana Ciornei wrote:
> Extend the dpmac_counter_id enum with the newly added counters which can
> be interrogated through the MC firmware. Also add the
> dpmac_get_statistics() API which can be used to retrieve multiple MAC
> counters through a single firmware command.

>  #ifndef __FSL_DPMAC_H
>  #define __FSL_DPMAC_H
> @@ -170,6 +170,50 @@ int dpmac_set_link_state(struct fsl_mc_io *mc_io,
>   *			      pause frames.
>   * @DPMAC_CNT_EGR_GOOD_FRAME: counts frames transmitted without error, including
>   *			      pause frames.
> + * @DPMAC_CNT_EGR_FRAME_64: counts transmitted 64-bytes frames, good or bad.
> + * @DPMAC_CNT_EGR_FRAME_127: counts transmitted 65 to 127-bytes frames, good or bad.
> + * @DPMAC_CNT_EGR_FRAME_255: counts transmitted 128 to 255-bytes frames, good or bad.
> + * @DPMAC_CNT_EGR_FRAME_511: counts transmitted 256 to 511-bytes frames, good or bad.
> + * @DPMAC_CNT_EGR_FRAME_1023: counts transmitted 512 to 1023-bytes frames, good or bad.
> + * @DPMAC_CNT_EGR_FRAME_1518: counts transmitted 1024 to 1518-bytes frames, good or bad.

please try to wrap netdev code at 80 chars, especially if it's just
comments where wrapping doesn't hurt readability.

> + * @DPMAC_CNT_EGR_FRAME_1519_MAX: counts transmitted 1519-bytes frames and
> + * larger (up to max frame length specified), good or bad.

Other entries in this doc prefix the continuation lines..

