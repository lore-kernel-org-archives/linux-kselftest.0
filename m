Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B603E3D89;
	Fri, 24 Jul 2026 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903066; cv=none; b=pALLwFKZDoszipAtrwHYKHFILwPJQnSgM4GzeWMGpjinfd3QSfBk4Yp9sSAN0XMskYfO78Mib91VAoHnKsTsASOx8wQmMQU56G5536cfVHRIu/YGnXV5+HBhS6VMFABmMQwLniWgz9wIVR60ykAxGXdpp/2ht/GsZq/reHfK7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903066; c=relaxed/simple;
	bh=K7NR1KenE85O5AVNDtB+QDIDdcnCgBkPnfDjB4v98Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgBhVftKf/W3vvwuZZECJFgsCaSrj02rWw5MNMGz8scbADrYpDvZT5Vl/r7qmIdMV/6Skawddc+RgpRos6PgtS++gBCTOpSlUiP2yQ6D6JFCJrR5XMs0tcs0RpgLwwszPiCDUFo8Tnwz/TwdMqS+TGSby/KLRRQJE9CT24wc/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkjGVVSx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkjGVVSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7341F000E9;
	Fri, 24 Jul 2026 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784903061;
	bh=qVSKDC8t6hmFB8d5DchFcQsD5mrGgiBdRFoTRem4F7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lkjGVVSxy6IrXFoXa03Qc5UwKMemlqWxJ6ZPceECyfTcXzQItRF1XlPzBRA5nYTvl
	 iUW8wEAy5VCEYzUbl2aLzXuuKIhM2meRLuK//wd/koBq2qLW7/8XkGmBRBLnKyqzFe
	 2BTpcGi5T6qt9fRPdQXkpnvPp+H/vZJChl8pBerTc6O7MOclrjZm3kphetNpFKidTu
	 sK+cfBP/XGEayroxUzcEBT63urFbsAWhOBcoIP6KchBQY3ch8GcYgwctpMMkOiTH9o
	 ET2PImBCKiAiVNXbBU+AvuC3EIdMjD5Otn8DXC5fqpZR9zV5wh6kfPr3MoK8NT9YbL
	 FMKd0/Iw1zC7A==
Date: Fri, 24 Jul 2026 07:24:19 -0700
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
Message-ID: <20260724072419.62778bbe@kernel.org>
In-Reply-To: <amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
	<20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
	<20260721110713.325d36ba@kernel.org>
	<amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 16:58:14 -0700 Bobby Eshleman wrote:
> > > +	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
> > > +		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
> > > +
> > > +		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
> > > +		    rx_buf_size < PAGE_SIZE) {  
> > 
> > we should add a check: min: page-size in the Netlink policy?  
> 
> I played around with this adding:
> 
> Documentation/netlink/specs/netdev.yaml:
>  definitions:
>  +  -
>  +    type: const
>  +    name: page-size
>  +    value: 4096  # dummy value, to pass ynl_gen_c.py checks
>  +    header: asm/page.h
>  +    scope: kernel
> 
> Generating:
> 
> +static const struct netlink_range_validation
> netdev_a_dmabuf_rx_page_size_range = {
> +       .min    = PAGE_SIZE,
> +       .max    = U32_MAX,
> +};
> +
> 
> ... but the dummy 4096 is kind of annoying. ynl_gen_c.py can't know the
> value of PAGE_SIZE but needs some value for its arithmetic checks (e.g.,
> confirm min < max is true).
> 
> Should we stick with using a dummy value, or should we add a patch
> teaching ynl_gen_c.py to allow value-less consts (skip the arithmetic
> checks)? 

Let's stick to a dummy one for now, but maybe something obviously dummy
like 0 ?

BTW did you add both min and max checks? Cause the only risk with using
a dummy value would be that the policy will be rendered inline, and
inline policy is u16 so 64k wouldn't fit. But your sample above has a
max of u32_max which forces the out-of-line policy, which is what we
want.
