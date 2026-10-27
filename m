Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101752;
	b=Xn2fqd6D92uQJF/Um9ar/GFDz61vnwPAtJh8q9xyxDsdCMNdwI0zJjJAjIh3HCjBXiIh
	 ydNBfFSmiGBGsoN7VVrSYnhxqWsj52Iqu0NdVzs6ukrCf8aYMbibPJ2tiAlkWlD/wiE2o
	 1balM8pLEWepz4B/jVV2VjgPFNXsgA2CRbVcRW8dIJBsqRBRJFbLne5cHTxCYkNndpsI5
	 IErhFEjf0llw5wtHAN6tA3TNpkcMVp+SxPJU+zO69CSUdDoRLFIggIUvILSKL6mU3prDQ
	 6sm58hpCVHRp6Y4YnmigzhwX5Yrqfzi9WIuT2Kdj+8ESBCNgdHHgxiOH0skCFxS8EKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101752;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4fyuBJ+a3h7buKYW0HFnv+SBVn1FNv0YDNNGL3FIiEM=;
	b=i3nCIrxFerqlHIzlES2SZONBDKVKmqGqw0S8GPwbe/VA0qR4cpu0+vDF3OxgqlnsMbOH
	 zz8TP1ela1sTMA3W70Sly5jMdFNRdjG2+SlyUQXuHUmi/PIhsLJtvL5JCWGlDupoV+Gts
	 6GHkXHsLQKKN232TPstLGIqzJ2IS/DeN35ST3vb5QL8v/oADCF2pIWuu+xnZtmGif4585
	 idiOvZvdjDyh58CCHAfyRe77BVDzguQ8PpDDDpjKX8bgzf2LSlTnsQPE3/Oxnwn0Mpebp
	 vzrgJkS6jt3rE+YrVdEx7/oaIP0DuwxQ0bDiWCuqOR5zlXR+oG+Xm+ZmFtVtZGrrlzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARq3XbOw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88545606A327;
	Tue, 27 Oct 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARq3XbOw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943CF1F01825;
	Tue, 27 Oct 2026 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101752;
	bh=4fyuBJ+a3h7buKYW0HFnv+SBVn1FNv0YDNNGL3FIiEM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ARq3XbOw+OUFVGZRZcouLDKo1UTdUsaKCYr6QMSAFCJa+y+ZowBtWS7nHpyyw40Ya
	 mtCUj9CuSXig6qpjMiU/Fqc59+7sDHcl2liIQz3WCt+/ESXN+skbSBStbQ3RwjTasm
	 ziC3bAEDdeVsPyljX4kOiBE+sY16m3PF/8Enf/gd93Lp+swSHPV+vD8IKwBL3Efwyn
	 JwgVqreEyxEhnqxPi1XDAW1WqqZhSC/7x7e9XL9pjWH+wvyCpeS/NACpUstvW3CEA9
	 v9ZzyeqzYKjh6FltEyDNpagt7pWqbzoQKSTPATVxuk0sFKm7gntH7oYF1xOjiev99r
	 VtO4beVAIkn3g==
Subject: Re: [PATCH net 1/2] netlink: retry a dump skb that does not fit with
 the minimum size
From: netdev-bot+sashiko@kernel.org
To: jhonata.poma@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@google.com
Date: Tue, 27 Oct 2026 11:49:11 +0000
Message-ID: <179310175111.3134.9177648236285208856@kernel.org>
In-Reply-To: <20261023-netlink-dump-livelock-v1-1-478214a635d2@gmail.com>
References: <20261023-netlink-dump-livelock-v1-1-478214a635d2@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: the ENOBUFS livelock it targets is still
  reachable whenever a minimum-size dump skb also does not fit.

--

netlink: retry a dump skb that does not fit with the minimum size

When the skb sized after max_recvmsg_len is rejected by the sk_rcvbuf
admission check, netlink_dump() now frees it and retries once with an
alloc_min_size skb. The goal is to fix a livelock added by commit
ae8f160e7eb2, where a reader that peeks before reading, such as libnl,
spins on ENOBUFS.

> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index a904dc3bcad6b..b750e79fed2ed 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2318,10 +2318,21 @@ static int netlink_dump(struct sock *sk, bool lock_taken)
>  	if (!skb)
>  		goto errout_skb;
>  
> +retry:
>  	rcvbuf = READ_ONCE(sk->sk_rcvbuf);
>  	rmem = atomic_add_return(skb->truesize, &sk->sk_rmem_alloc);
>  	if (rmem != skb->truesize && rmem >= rcvbuf) {
>  		atomic_sub(skb->truesize, &sk->sk_rmem_alloc);
> +		/* A skb sized after max_recvmsg_len may not fit next to data
> +		 * still charged to the socket, while a minimum size one does.
> +		 */
> +		if (alloc_size > alloc_min_size) {
> +			kfree_skb(skb);
> +			alloc_size = alloc_min_size;
> +			skb = alloc_skb(alloc_size, GFP_KERNEL);
> +			if (skb)
> +				goto retry;
> +		}
>  		goto errout_skb;
>  	}

[Severity: High]
Does this fully close the livelock described in the commit message?

The admission rule is unchanged. The minimum size skb is still rejected
when rmem_before != 0 and rmem_before + T_min >= sk_rcvbuf, where T_min
is the truesize of an alloc_min_size skb. The comment says a minimum
size skb "does" fit, but nothing here guarantees that.

On the recvmsg side, the dump is only re-run once rmem drops to half of
sk_rcvbuf:

net/netlink/af_netlink.c:netlink_recvmsg() {
    ...
	if (READ_ONCE(nlk->cb_running) &&
	    atomic_read(&sk->sk_rmem_alloc) <= sk->sk_rcvbuf / 2) {
		ret = netlink_dump(sk, false);
		if (ret) {
			WRITE_ONCE(sk->sk_err, -ret);
			sk_error_report(sk);
		}
	}
    ...
}

When sk_rcvbuf < 2 * T_min, that check does not guarantee
rmem + T_min < sk_rcvbuf. A few configurations appear to land in that
window:

- On 4K pages T_min is roughly 4352 bytes. An unprivileged
  SO_RCVBUF=4096 gives sk_rcvbuf=8192 via __sock_set_rcvbuf(). Any
  rmem_before in roughly [3840, 4096] then fails both the large attempt
  and the retry.

- On PAGE_SIZE >= 8K, NLMSG_GOODSIZE is SKB_WITH_OVERHEAD(8192), so
  T_min is roughly 8448. With iw's 16KiB sk_rcvbuf, rmem in roughly
  [7936, 8192] fails both attempts. A few notifications that are still
  charged could reach that range, since do_one_broadcast() holds them
  via skb_get() until netlink_broadcast() returns.

- When cb->min_dump_alloc is at least the capped max_recvmsg_len,
  alloc_size > alloc_min_size is never true and the retry never runs.
  smc_diag_handler_dump() is one example: it uses
  SKB_WITH_OVERHEAD(32768).

In those states the original sequence still looks reachable:

__netlink_dump_start()
  netlink_dump()            -> -ENOBUFS, cb_running stays true
netlink_recvmsg(MSG_PEEK)
  netlink_dump()            -> -ENOBUFS, sk_err = ENOBUFS
netlink_recvmsg()
  __skb_try_recv_datagram()
    sock_error()            -> ENOBUFS returned, nothing dequeued

rmem never changes, so the peek/read loop keeps spinning at 100% CPU.

Before ae8f160e7eb2, the dump skb was admitted whenever
rmem_before < rcvbuf, so a dump triggered from recvmsg could not fail
this way.

Would it be better to relax the admission rule for dump skbs, instead of
adding a second, smaller skb size?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023-netlink-dump-livelock-v1-0-478214a635d2%40gmail.com
