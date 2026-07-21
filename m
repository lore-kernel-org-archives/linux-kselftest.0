Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058DF415F0A;
	Tue, 21 Jul 2026 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657237; cv=none; b=Kt/4NaEH+Z6eeHGPG24hxfr+W9YST1/jyxt1ntBFEvkKQlAblaA8srl/YOv6jP9QSQ0hdNTjtP2rYNgqdtwOU+fiCe/xxdqeYkdip3DkZP/68dH9sWoh6RlSxC0N5CmsXOKLIlTcrdZxep6lFGgp81LX9fyReaj5oBpQXPELR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657237; c=relaxed/simple;
	bh=WgxtnRTwJp1h60BWd4QOULmHHIyqZ0VFpP6dCKrQ7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxmGrJht74sqsFATmp5LLenTIGHXKc871akAhAi0+vs+a26GI4nkUTgcJGoj4g74BnXtOoTYfoY75x+J92k7pcMwHd1hPhwNj88gW2YQsV/ozHj4Gxr9eH/C8xf881P3Hw0y4hWB833n9oJzDJ2fgZxW6lWJGLfmkcujLa61TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNvEhFP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNvEhFP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000011F00A3A;
	Tue, 21 Jul 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657235;
	bh=RHcGoloNYmYwH+aPEyfH+QAtWnrh9cY7GdbPjNJEb2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PNvEhFP9645lghGJsCG8GgCfsizcixDocQTZP/Jk6GkO1SWpREEYImH6pjG10Gl0i
	 qj/FMGwx4brGfBsMKCXRYjtv5+vDX55HWlMdfuL15LlTQgzc0BEsba3ImS0cHxT0Us
	 lYqa1cl1tfW/f5herNlKVyqbQ/VV8Dj1qN/CFOPELPW2TmxWjl8apxqdgFMhO/vi0z
	 +3GXyZBMFYqUQD8HpTQJqzeJIP66baWdBGSAe3lwxkBv/IaAAclBbW2jBPmiguqhy3
	 8fiffwJdgqX1Giiidq+xUoXUjrIjedRr6SnaLTrApnjuYdkZ80JCIctPla2k754m2n
	 +xQyCICMamqMw==
Date: Tue, 21 Jul 2026 11:07:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <20260721110713.325d36ba@kernel.org>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
	<20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Jul 2026 15:55:04 -0700 Bobby Eshleman wrote:
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> index 5f143da7458c..70b902008bd3 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -598,6 +598,13 @@ attribute-sets:
>          type: u32
>          checks:
>            min: 1
> +      -
> +        name: rx-buf-size

rx-page-size, we're modeling device pages.
rx-buf-len exists in ethtool and is something else.

> +	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
> +		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
> +
> +		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
> +		    rx_buf_size < PAGE_SIZE) {

we should add a check: min: page-size in the Netlink policy?

> +			NL_SET_ERR_MSG_FMT(info->extack,
> +					   "rx_buf_size %u must be a power of 2 >= page size (%lu)",
> +					   rx_buf_size, PAGE_SIZE);

This must point at _ATTR, the _FMT is unnecessary.
-- 
pw-bot: cr
