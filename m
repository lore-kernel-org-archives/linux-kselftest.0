Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A2637C11C
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108858; cv=none; b=jNqWdj5BnU+kfwzHbgxR8vXoWrpg5Hcqa5OqGBgq2+MZisIJjQQiG4uPkx46FepMclvD7solf9NpEOEzFS0qlkjEDqn7Br9r2NB0bnhLvPZvae3Hv4i/4UJiGkoXZS62bzK5u8yyjfaG1SBXjI701D7AQMoR85BZ35fAlKxQVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108858; c=relaxed/simple;
	bh=ePE2E+AdpjzDX1Dv/2T3Ptj9iazcYPXbEFUDKn34kIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuYnuPPIdRBuJhKVe+Ft06DQO8FZzHRPw2Zuu5rw21cPrILE/gGC+cilFoqCSQ7S5PDv6ZLk+VlWmfJZXsHZ54UFPqSyeT/NISh1AohpLrPbM73vDGP0l7gySJpznKhWJsfZdfvc6DoySnxdmrjX9ZRxKzwVcU9zulbvkEpYvKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eHnxBlpl; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eHnxBlpl"
Date: Wed, 1 Apr 2026 22:47:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775108841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Vtgi/Z4gP8WecPRIsC4VJpf13leM+WQF79E0/GqHtY=;
	b=eHnxBlplQyLxLgkR4ElenGlRnbh0IYrqzk/tlwlTaiy3H5lwK3EhKulsEm272L7AWghqW+
	vBLEoNkLuXay3W6BxcxvKDg5g1HjbBjSaT2etBoB7lZfBpAaBWAYU2u1mh8PI8spIb5kZ4
	14y7f4HSrIw8jfPy25OF69PlIbZUWDU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v5 1/2] bpf: tcp: Reject non-TCP skb in
  bpf_sk_assign_tcp_reqsk()
Message-ID: <ac3_SCbLAwVOFKDC@devbig1721.ftw5.facebook.com>
References: <20260401110511.73355-1-jiayuan.chen@linux.dev>
 <20260401110511.73355-2-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401110511.73355-2-jiayuan.chen@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 01, 2026 at 07:04:49PM +0800, Jiayuan Chen wrote:
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 78b548158fb0..f251744025e2 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -12248,11 +12248,23 @@ __bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct __sk_buff *s, struct sock *sk,
>
>  	switch (skb->protocol) {
>  	case htons(ETH_P_IP):
> +		if (!pskb_may_pull(skb, sizeof(struct iphdr)))

The ai-review [1] is correct. skb_header_pointer() should be used.
pskb_may_pull() could invalidate the skb->data[_end] pointers
in the bpf prog.

[1]: https://sashiko.dev/#/patchset/20260401110511.73355-1-jiayuan.chen%40linux.dev

It needs one more spin. Thanks.

pw-bot: cr
