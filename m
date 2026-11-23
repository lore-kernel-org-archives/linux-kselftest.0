Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448291;
	b=C3QjVV7BdOiS9uae5TzEF9aF8ReiDn8f3lkCY3Ng8qivLl9JEJBlHI5ZkkCavamxw2NU
	 1JMzuUsqUZoIFaZ6kNGRq2mpAJcKHeSHz1QZ6LV4c5K0R5u8qMYtWoS6pkbvOHe6aMpuX
	 JTQYerxOZiMJwZLpKJEAXP6CIkWeYHQPveMpYVRNgce4e5z4Ser4J0bHfz2hu/n8o9IBx
	 WD5YlOkdufg53sAx4WG3148fWHEqiAiM9c9gGgurjnUGrUtT/kYQkXA1sPVVCv2//S/hq
	 /4+jMul3zB4vVLqjiVaE9K7EYgePbBBtLNUYF0SfV/YPlBW7iJmoysEf/oKydPbpHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448291;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IP6w07Na1xzP00O84ze68WNlf1Q0/rR61f7HlDCxa/4=;
	b=chvpPfMRDjci05hykxTjXIEuMbQQYD9ixbk94+s/GSJlh8XagJA+kz/PQTsV8deRKO5K
	 USi6oVNReW60zGcSrgLEChE9/PgW19kKFvNHDaAtLfrZIWMDlNtMuXK1+lK9MNn66uwPJ
	 aGXubHoMXHX9VTNcCHwMFJdueJR2FfRJLsGzxXNLjKGnjvwjzMCbuIKFUVEYEuWhDs3wU
	 zYcasebXCvua1kOV169VXc92k+o2JwbkXZ9KCUKHZtp/druIkZJir2QOb7pFZnDik8hnq
	 x8Pi7mVdj4+pC4btEK6exjg2Wve2q68zsItNKVK05hSTHwz4wGdb13lTZ4Zbz+q6WgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L20A+qUo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758B606A32D;
	Mon, 23 Nov 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L20A+qUo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8953E1F0093E;
	Mon, 23 Nov 2026 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448291;
	bh=IP6w07Na1xzP00O84ze68WNlf1Q0/rR61f7HlDCxa/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L20A+qUoF4xxUtz78jGuSpdyIXQh8sV+EHFs30v4fTmwrARqD222/dUooQV+igm/9
	 lsY2OCW6VXwwE0XP9p2fzoi2bZdS8zQAeAG/S9sI+4D9AVcbfqJfxasaZLiXpFtyce
	 4bDgJE1FaDsTALa0YW1MnbNGLz0LzPtScsMWDMnqfk007vsa4BzyN7pUklZRmLkOu7
	 m2TxsqNHqucnCvycFxkq8R7/5h85k0mSvwVjRo0utaeqvc52Ptxo+poxKhlmtSm8pA
	 VMwar5lCVwSqH6h+XRn2Moqla0PeVuOjulfdFa9Ear6BSbMGQto6e4RjrXnJxyTF4x
	 AoZvavxtkxgRQ==
Subject: Re: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping
 header padding
From: netdev-bot+sashiko@kernel.org
To: graypanda.inzag@gmail.com
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 gwanhyunlee@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 23 Nov 2026 15:38:10 +0000
Message-ID: <179544829010.3135.9748959187466482821@kernel.org>
In-Reply-To: <20261119144241.360238-2-graypanda.inzag@gmail.com>
References: <20261119144241.360238-2-graypanda.inzag@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] At this commit, the new check in __tun_vnet_hdr_get()
  (drivers/net/tun_vnet.h:141-143) only limits a non-zero hdr_len to the…
- [Low] The commit message says "The new tun and tap selftests pass on
  the patched kernel", but this commit only changes…

--

net: tun_vnet: validate hdr_len after skipping header padding

This patch moves the iov_iter_advance() past the virtio header padding in
__tun_vnet_hdr_get() so it happens before the hdr_len check. hdr_len is
then compared against the payload that is really left. With that, a
hdr_len larger than the frame is rejected with -EINVAL in tun_get_user()
and tap_get_user().

> The problem was identified during review of the tap zero-copy fix and
> reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
> produced a 256-byte frame on both tun and tap. After the change, both
> drivers reject that input with -EINVAL. The new tun and tap selftests
> pass on the patched kernel.

[Severity: Low]
This commit only changes drivers/net/tun_vnet.h. Which selftests does
"The new tun and tap selftests" refer to?

They appear to be added by a later patch in this series, "selftests: net:
check padded vnet hdr_len in tun and tap". That patch adds
padded_hdr_len_exceeds_payload and padded_hdr_len_zero to
tools/testing/selftests/net/tun.c and tools/testing/selftests/net/tap.c.

Pointing at tests elsewhere in the same series is common. Could the
message name that selftest patch, though, so stable backporters know to
take it as well?

> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> index f4c652b1fa44d..0b96228916814 100644
> --- a/drivers/net/tun_vnet.h
> +++ b/drivers/net/tun_vnet.h
> @@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
>  		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
>  	}
>  
> +	iov_iter_advance(from, sz - parsed_size);
>  	if (hdr_len > iov_iter_count(from))
>  		return -EINVAL;

[Severity: High]
Does this fully close the uninitialized bytes leak that the commit
message describes? The check only limits a non-zero hdr_len, so
hdr_len == 0 always passes.

On the vhost-net zerocopy path, tun_get_user() then falls back to
GOODCOPY_LEN and does not cap it by the remaining payload len:

drivers/net/tun.c:tun_get_user() {
    ...
	if (msg_control) {
		...
		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
		linear = copylen;
    ...
}

tap_get_user() does the same:

drivers/net/tap.c:tap_get_user() {
    ...
		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
		linear = copylen;
    ...
}

Take the same 512-byte vnet_hdr_sz and a 14-byte frame. The
handle_tx_zerocopy() threshold (len >= VHOST_GOODCOPY_LEN) includes the
vnet header, so this frame still takes the zerocopy path. After that:

tun_get_user() / tap_get_user()
  tun_alloc_skb() / tap_alloc_skb()
    skb_put(skb, linear);                 /* linear == 128 */
  zerocopy_sg_from_iter()
    int copy = min_t(int, skb_headlen(skb), iov_iter_count(from)); /* 14 */

Can that leave 114 bytes of uninitialized heap in the transmitted frame?
That is the same result this patch sets out to fix.

The trigger needs vhost-net with experimental_zcopytx=1, SOCK_ZEROCOPY on
tap, and a large vnet_hdr_sz set by the host. With those in place, the
guest controls hdr_len == 0 and the frame length.

Two later patches in this series appear to close the gap: "tap: clamp
zero-copy copylen to remaining payload length" and "tun: clamp zero-copy
copylen to remaining payload length". They clamp copylen to len with
min_t() in tap_get_user() and tun_get_user(). Could that dependency be
noted here, or those changes folded into this patch, so this fix is not
backported without them?

>  
> -	iov_iter_advance(from, sz - parsed_size);
> -
>  	return hdr_len;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119144241.360238-1-graypanda.inzag%40gmail.com
