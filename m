Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9F4A5EC8
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301703; cv=none; b=fKQ+nvgG9Ezq1iTFLQkIDmi54QR61yCA9bTtEpZGhRry+Pt4hPuKimFj17W/HL1oK8sVhy6tk9YbGQQDyDuPo2SKWIDw4ipx6qc6P30I/mE64VqHWymSFlBWYjlOOwlW8mYR0fEqQiJCwrREoYzE7Rlu/Fsk8rwQzda9VgEgpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301703; c=relaxed/simple;
	bh=lKOZUGjZ+uHNLlR0+eB7FY20wqtu7JNyVUkRRBkeBoI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ML1wAzagV8QziRecd1vr5n/+c76UuoOfFpAbYEofbe1HmyAu6a5vjPsWxMYuJNu56V6LhwRD5TO5kGRpu9GKXC/KVE69I84qVR7SZc1nSQgtBZ+1egMFbCDeyy0Y+JqU82Ha6lsEY3Vfr+A2IhF2FPJM8gvaJK8P4wlH7oxHhAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIyzY3+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIyzY3+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E551F0089D;
	Tue,  6 Oct 2026 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301673;
	bh=kVowoP7VZnQDX9PgysE1dWoJq42lh4xpwwB8buJwczQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=DIyzY3+mvykTt6d7/nXA7uNGH0fzJdxAeIl8CukXjDPFOJGtj3DRmir5UVlKqBttM
	 jLHQEEuUGymp/pVzyv82IaUb3rdClbU86gKxc1as6sVVlMiWdUqgyFmoV925hMOzn/
	 jDUkhDOEg7n1Zbr8mAKWhBTG/JEtRdxjbHMhMdqq9/y8Gmjo6o0+pfDe7z6Pxd9dLk
	 joiuCva6s5eM0bAnLUZwVI/WhXUaAtolUnU4b7XNWuHh8YO7QXrJ+RTOiTQcfRdVW1
	 SefF07dBSPEmqdrWvObityNOu2C8BNomIA1ICeSubJqcgzu6ZCdYdjwP7EeKzxVltq
	 WkRavjnlrd6Hw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id D5004F40068;
	Tue,  6 Oct 2026 11:47:52 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 06 Oct 2026 11:47:52 -0400
X-ME-Sender: <xms:KBjFaivcYKIyvZonqdC4LTC3DRDFFj7HaF-ei2szWjNv_qfhJueJlg>
    <xme:KBjFaiQ0P0aYiOVhadPbEfd__WqyI42UvWSgWfDeTiRt_kOv1_NNG7FaN1faMyBtF
    Ktn2_XT4q6mSIOa-7u68lGsj80IAiJRItW06yZ031HQM4IQ_vh4_ZM>
X-ME-Proxy-Cause: dmFkZTEcVlZu+6LBrAeQVkXnyusqZshRr2dagiKOUaI1LNxig6tvrdh9TxLCeQz34hmv6J
    Y7DEX3AQgBypM/5uzuGrAilJDzXx0DUMEfuPDgWNqpq6bLu0m29fS/MoCaKJwQWmTWZBWQ
    4oLqbh0s6c2TLfwRNcZqA7Z2jZePUeNifHxnR9kdyOQoAZzO5MyMC6+lU8OrKVXDcF4JeB
    ceZlghUlszVYL2ba4bEa7Rh/tdAdREC9gBc986ivAgIf6bpaj5wLae3avf6w6QxavWgOk/
    ReL9XLOXcZPh+JB1ucR21MMcXPfO5drhdW/DRRDMmDJgMBs3CMMsSPY1QzlgO76vAvykCN
    zQtEDA5zML2dqQsit8zA+nwKHvmjj8l16f+a5I4TkjhK1rzQYzZLnKHTk19oQHaTrQGkcv
    T183oePUOpjP0eqcJ+TE6AftnhuIuTe5UAnSI5xhb4rTGVNELv16Q6rxsgvxOTG/QLOCLn
    w9Ru3Bq8yObHqbHUYEmL6kPISQt52Lp5/1my2ahp59iGe9vkroJSecXL+2b5lJconPIwQT
    IhOorTgn31JGH6ZVNOTiquj9TsW/973dpZhI7xcrnrobdtu+mm9m2ExMkxC0TsBZwxGriX
    +ksMd+jHMeubs0yiKOvWzgN2atr3pKgIo53UXU6RheYYOJjSM6fQ5b3JnY9w
X-ME-Proxy: <xmx:KBjFaqjNBWzmAHQCqoJ2ZeXdqd28q7Kk6Mm2fNd67BoWWwo_-5JtdQ>
    <xmx:KBjFanvMx4myNpD4sVeZJ7ptOf9VJZ-IgV90Yr1K_Affc71XPUKWpQ>
    <xmx:KBjFal91GtF1kXONPzq_f-Oc8ZIxbz3QvKTrWIbeV73mKMm6Sr-Baw>
    <xmx:KBjFatZGEQHVcxbL28UFChVb81G64NTdwNkw3E5kYgVX7jUWMM4Dog>
    <xmx:KBjFarq6vqIcWc47MeWCDj19WuoeyxPHu6udnCDpO_gYn1PdEStI-TWk>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B3AB8780075; Tue,  6 Oct 2026 11:47:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXy3qBfHjxQs
Date: Tue, 06 Oct 2026 11:47:32 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <578d77f7-7d4d-412f-964d-e6e94180221a@slotpi15m67>
In-Reply-To: <179124254665.434549.12245680127262431659@kernel.org>
References: <20261001-tls-follow-on-v2-5-2dd1947bb642@kernel.org>
 <179124254665.434549.12245680127262431659@kernel.org>
Subject: Re: [PATCH net-next v2 5/8] tls: consume empty data records in
 tls_sw_recvmsg()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 05, 2026, netdev-bot+sashiko@kernel.org wrote:
> > +		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
> > +			if (!darg.zc)
> > +				consume_skb(darg.skb);
> > +
> > +			/* An empty record still marks a boundary. */
> > +			msg->msg_flags |= MSG_EOR;
> > +			continue;
> > +		}
>
> [Severity: High]
> This keeps empty records off rx_list. Does the receive loop still fail to
> make progress on them, though?

It does, and this patch does not change that. Before it, every arm
of the loop reached "decrypted += chunk" and "len -= chunk" with
chunk == 0 and went around again. The patch stops the peek and
async arms from queueing those records on rx_list and leaves the
loop's bounds alone.

The patch description cites the loop to explain why rx_list grows,
and I can see it reads as a claim that the patch bounds the loop.
I'll reword it in v3.


> In-kernel MSG_DONTWAIT callers never receive a signal, so they cannot use
> this exit. One example is svc_tcp_sock_recvmsg() in net/sunrpc/svcsock.c:

True, and also true before this series.


> should the empty-record branch break out once decrypted + copied >= target?

Returning bytes already copied instead of waiting out a run of
empty records is reasonable, and I'll look at it for v3. With
nothing copied, a blocking reader has no return value that is not
EOF or an error, so that case keeps looping until a record with
data, a signal, or the end of the run.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
