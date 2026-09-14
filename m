Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C62931D5;
	Mon, 14 Sep 2026 23:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428649; cv=none; b=egMaTwpeYYxo6xS/j7tM3/Cq/PIjdMm3pnn/Ul5OWx/OgrxtCxgoTPIacxNQi5bONeFuB2RRcqrQH2d9IbTQP5Y+q9s9dKknEb9VIEuiZ8cd9NVEyXLv6C+d1RLW2t7HEcI27uGpkh3AijpvUqhL2Cn2C86IKMW4f/ADwgM48oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428649; c=relaxed/simple;
	bh=XAFz0MiuvVSfxcOO1LZF3GLJP1qs4uQmOrbUmZVpD3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRGJsnCiJwDF4Iz+oni8NLnPEZYaDozQ4vFzx/D3IrHDqytRTYQFM8cOjLJZXKb0WDKhBEPmrpCnwTv4KsqoYTyLVax9cLwlCTPX3Rm+F/rQPmi09YdN+ivwPcYQiWVqmej+6qmn6sEiT0iC80DhGJS9+qf6SXFuEMhNwJHLsAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWqoJXF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWqoJXF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA341F000FF;
	Mon, 14 Sep 2026 23:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789428647;
	bh=XAFz0MiuvVSfxcOO1LZF3GLJP1qs4uQmOrbUmZVpD3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hWqoJXF0R3Fhd+kT4bDhPARHgPeqTjifzNa1tf2/FoAJyLG/WVJg3IE5rsnJNqWAW
	 OnntJ4pwIHkIxYoDkocgUynXdjEJIe6CUooz1O2tgaGPHdCWy2Zl6DHaDa14mMyhSj
	 qQVMmoqcaPaUDnyt0lafz6pIbrccECvXsFicCfY0ErSftZ1YAkvAwh+rSbQcAQeXLD
	 Dm1Eote9WE/fsnoEwW2w5VRdrWgnMTIQy3wWV8QLETYpfJifPhc+0A99nqyvig+l5G
	 H46gpKpYmHlJbtUQjhRY4s6zevLtFsLwZRsUk4MAtViRvYXdhGKWNm5L0O+afBDWEK
	 zJg7ygeK7gpHg==
Date: Mon, 14 Sep 2026 16:30:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Daniel Zahka" <daniel.zahka@gmail.com>
Cc: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
 <pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 2/6] psp: don't report the main netdevice's
 ifindex to associated namespaces
Message-ID: <20260914163046.601571a1@kernel.org>
In-Reply-To: <DLF0VHGQ0BW3.V17URE6WVGN4@gmail.com>
References: <20260912200426.121025-1-kuba@kernel.org>
	<20260912200426.121025-3-kuba@kernel.org>
	<DLF0VHGQ0BW3.V17URE6WVGN4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 08:02:23 -0400 Daniel Zahka wrote:
> As an aside, this got me looking at psp_nl_fill_assoc_dev_list() again.
> The PSP_A_ASSOC_DEV_INFO_NSID handling there looks a bit buggy. Caller
> sees -1 when the assoc dev is in their namespace, unless they are in the
> psp_dev's main_netdev's netns. In that case, a self referential nsid is
> allocated with peernet2id_alloc(). It probably would have made more
> sense to just only include PSP_A_ASSOC_DEV_INFO_NSID if !net_eq(cur_net,
> dev_net_ns). I don't suppose it makes any real bugs reachable.

Ack, I looked at the netns id situation briefly but deferred.
I think we need a split between the "netns went away" and ENOMEM
cases, and then have the dump act accordingly. This is a problem
all over the uAPI tho, so felt quite orthogonal.
