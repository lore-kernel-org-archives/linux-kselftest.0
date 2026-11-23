Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443847;
	b=nrICjiFwFwLvzuUEppmuU/ChbKDMxXl/ue1CTR1K/7sZxgcGDE3W8nIqSphnVE9KYgqS
	 w8baT3Q3OFV5l7V5QdbbO6KY69GXRcxhbwe3sa+cTW3VLBvsVfSn+xZhG+L0LgPJmjV5/
	 gRdVJ4RTNC56PHc3mjhWhWkdWZFRhrnOYnSKUBCRTXSUJX0IkA+MM2e7GYNPHL9TzfN1i
	 Ct3NnICpAXHHolYGB9DveVOYsz3IOd63H9KeOoq+Drw5m0bo2actPDy/TggnDITqqBA9M
	 hIyqt3/l2pVFYXoLQaAOJveGjA6dae96OG742ZplnlKZOXZhPHQBuJ953Lo7DzI9Eqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443847;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=prwmaVnbCjyaRJffcSjvnkMyFdfEKslxgo8qURrx6eU=;
	b=lHimi92UCMdnD3ue/rarMNcdIkyv8lutDHkEJumvUR6mBGaAX+R338W4ZdQONFm2Vzyl
	 +vH5uKt/GcjwSnlmYw0zaGBMwQ9XJrWENfxoofc4xIsGcUusf7dFZDR0fj7WvvgBbTj/O
	 IqGvBuTfdFjwKgQoupRQpfinYlIselkxtmtLDdl5UmC3+D66tjvCJBhY1c+kR5SBjDEwi
	 pstPLeLBfcr2FGB51DcJnLuUu5boOKrz366/TxEp9PPC/hvdlhIXI3pBa7dtuqRs2FE/d
	 /z3xdnY/k/ZAliKVr50HJyPh8rjr8WUndrzW0nfvmNVvuACTbFcstwuCpaRwlrQwlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4qKGXHX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674E606A31A;
	Mon, 23 Nov 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4qKGXHX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999D71F000C6;
	Mon, 23 Nov 2026 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443847;
	bh=prwmaVnbCjyaRJffcSjvnkMyFdfEKslxgo8qURrx6eU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c4qKGXHX5N2Uhyz57aPN8cuJxitm3xwzr0Tma53/RHA7aBIdiE33OIvmQ3iTaNTQU
	 8VTXMd4lGds0SbCVZHJ6Tb6M70JI0i2FbaCFUNdtAtzUK+30HVUpL0FI1kh3Y5lCHH
	 y/gECyi8EtZu6f4JDKA19larefXe6XWTPlRk6BbDrDr8KB0v8aaFipV2c30SSngyNV
	 7a5WWPYZuIgj0bVAW7Lk3lT4eYIEh7VfD61HA0p4whTaYEg0tz0e4OnLF4J17ZF8px
	 /HOSegxq8iETO5+gEHPd0PGGYK2zho9qkmmkJrGZmvXDY+9ygqNtkrRGmPt1Q5kRa7
	 A4ClxnIkBCrBg==
Subject:
 Re: [PATCH net-next v4 2/5] seg6: add RFC8986 flavor support for End.X
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, andrea@common-net.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Mon, 23 Nov 2026 14:24:06 +0000
Message-ID: <179544384617.3135.5029512029947084048@kernel.org>
In-Reply-To: <20261119-srv6_flavors_endx-v4-2-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-2-284cdb484eee@kylinos.cn>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The concern: in net/ipv6/seg6_local.c, the patch adds
  SEG6_LOCAL_FLV8986_SUPP_OPS to SEG6_LOCAL_END_X_FLV_SUPP_OPS.

--

seg6: add RFC8986 flavor support for End.X

This commit adds SEG6_LOCAL_FLV8986_SUPP_OPS to the End.X supported flavor
mask, so End.X now accepts the PSP flavor. input_action_end_x() now handles
flavors the same way input_action_end() does: NEXT-C-SID is evaluated
first, then end_flv8986_core() runs, then input_action_end_x_finish().

> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 65d552f87fa39..c827a745fe176 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -121,7 +121,8 @@ struct bpf_lwt_prog {
>  
>  #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
>  					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> -#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
> +#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> +					 SEG6_LOCAL_FLV8986_SUPP_OPS)
>  
>  struct seg6_flavors_info {
>  	/* Flavor operations */

[ ... ]

> @@ -986,12 +987,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  {
>  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
>  	__u32 fops = finfo->flv_ops;
> +	int ret;
> +
> +	if (!fops)
> +		return input_action_end_x_core(skb, slwt);
>  
> -	/* check for the presence of NEXT-C-SID since it applies first */
> -	if (seg6_next_csid_enabled(fops))
> +	/* NEXT-C-SID is evaluated first, when configured */
> +	if (seg6_use_next_csid(skb, finfo))
>  		return end_x_next_csid_core(skb, slwt);
>  
> -	return input_action_end_x_core(skb, slwt);
> +	ret = end_flv8986_core(skb, slwt);
> +	if (ret)
> +		return ret;
> +
> +	return input_action_end_x_finish(skb, slwt);
>  }

[Severity: Low]
This isn't a bug, but at this commit no selftest covers the new End.X
flavor configurations.

With the wider SEG6_LOCAL_END_X_FLV_SUPP_OPS, netlink now accepts End.X
with "flavors psp" and with "flavors next-csid,psp". Both used to fail with
-EOPNOTSUPP. Both now go through seg6_use_next_csid(), end_flv8986_core()
and input_action_end_x_finish().

At this point, tools/testing/selftests/net/srv6_end_flavors_test.sh only
tests "action End flavors ...".

It looks like the later patch in this series, "selftests: seg6: add PSP
flavor testing for SRv6 End.X", fills this gap. That patch:

  - adds setup_endx_flv_psp(), which installs End.X policies with psp
    alone and with next-csid,psp
  - adds host_srv6_endx_flv_consumed_srh_tests()
  - makes test_kernel_supp_or_ksft_skip() probe End.X psp
  - runs the new tests from test_endx_flv()

If that patch is merged with this one, nothing more should be needed here.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-srv6_flavors_endx-v4-0-284cdb484eee%40kylinos.cn
