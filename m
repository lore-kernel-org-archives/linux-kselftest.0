Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424316;
	b=H256oMgvbaR+naSZnWf8FPjpNrZjYhosC7uB9TA92v6XU9YlECegY2fdfmZIxKVcgHoo
	 tiexiLk7efgopDvfNHwHOpL+7+rDC2QUXQP9w+vZroRLKqyDWjGfIVZBxFdXDbRF2/m8j
	 9Dw1Y2yt89tFMd+u0UcV5KmQMeTLfXu39y1AfG+svf0QVIeXpgJKmLXKOeLkR35KmkEUB
	 A5GaP29faNup4Iuql/Xv7ir7RcOKUFpU5i07GkjShBmCTNZk7BNu8jphOBGNhWorK21v8
	 0tt2JqXqF6oTnvV01GZM9xHU/9HDhvxCq/YYuOr2dRiTox2dx6t4J9mFIDgLT786gUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424316;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V+6WZHCRtJF3EdEXXqVZ/AebE53HIs1Rd0AeGRHLVjw=;
	b=42qXR+EqdNHrMD7jVj6TE4cZLpfwMa2ndOQgXosooP9GCfSiG6exSFM/tc4uIhFDOzg4
	 QSJ72WO0SnYpfeSET4KjNNIxpigF3Wzw58THk3ImLhgmDU0WpE/0k8xu1SBy7ZexkHhTE
	 xo6BFYkLw2T90d9LpAMpGVwTs9PKSVlQxeREcvljRinv1oaLK1X5VKaZxHTfoA33hrc93
	 mMvvCOMJxGPSfkUl6HlhccV9vjJ9MBkInZJJmbHzeuSvNTv4W5GbwPeUCw6oIQUT/pGOD
	 v7Cl3yx2F+2M2/NrWhbzBtkhX/ItYQLd05reWJu+pr5gkkOJKIQUqlnVX1ZPR3OOe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0Sf6r3k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510F606A8A5;
	Wed, 11 Nov 2026 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0Sf6r3k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954451F00A0F;
	Wed, 11 Nov 2026 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424316;
	bh=V+6WZHCRtJF3EdEXXqVZ/AebE53HIs1Rd0AeGRHLVjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X0Sf6r3kbjnaBzI71fNu/ftDEhVZZgXNEoIYKBoTBL9uIGr+PLZwNQYpJaSerKtLz
	 huN6et3TylS6rLj6/bdJDdTzKNvTxqBqF5CA5+A8PEUHULKwntNLhhvzmdUMutIiiE
	 WXQWtNOiaQq0sE0HzBz34wHRM5oi/vBZzkHxxb+6oZym5uFAfOEbVJrMwuM3XNirZZ
	 s4DM2FyJPs2BwLP1Mg2O4fXGSHsZl/8WG0rGUDd5e5D8MRNR+hGoKS0M+auviFer52
	 5HBFy/eaUiZX4qmfv2pFmeahVooRJZk0v21erXRAIgUvcAJbdm6awBXZVjyKg3NxyG
	 NYL4icGP8H4lA==
Subject: Re: [PATCH net-next v10 4/4] Documentation/netlink/specs: tc:
 describe fq_pie per-flow class stats
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, donald.hunter@gmail.com, ast@fiberby.net,
 toke@redhat.com, liuhangbin@kylinos.cn, j.koeppeler@tu-berlin.de,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 11 Nov 2026 19:11:55 +0000
Message-ID: <179442431519.2199510.8426788814997312828@kernel.org>
In-Reply-To: <20261109071017.438478-5-hemendranaik@gmail.com>
References: <20261109071017.438478-5-hemendranaik@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch appends `type` (u32) and `class-stats` (binary,
  struct tc-fq-pie-cl-stats, 24 bytes) to the `tc-fq-pie-xstats` fixed…
- [Low] The commit message names one of the five fields "fq-rate-
  estimating".
- [Low] The new spec docs leave out how to interpret the fq_pie xstats
  payload, which now has two meanings.

--

Documentation/netlink/specs: tc: describe fq_pie per-flow class stats

This commit adds a tc-fq-pie-cl-stats struct to the tc netlink spec. The
struct describes the fq_pie per-flow class stats. The commit also extends
the tc-fq-pie-xstats fixed header with a type discriminator and a
class-stats member placed after the nine legacy qdisc counters.

> Add the tc-fq-pie-cl-stats header for fq_pie per flow (class) stats in Documentation/netlink/specs/tc.yaml
> with its five fields: prob, delay, deficit, avg-dq-rate, fq-rate-estimating.

[Severity: Low]
Should the fifth field be dq-rate-estimating rather than fq-rate-estimating?

The member this patch adds is dq-rate-estimating. The UAPI field is
dq_rate_estimating in struct tc_fq_pie_cl_stats, and
fq_pie_dump_class_stats() fills xstats.class_stats.dq_rate_estimating.

Two smaller points: the body lines are longer than 75 columns, and the
new struct is called a "header".

> diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
> index b6ccc645b0e33..b159c4b563c7a 100644
> --- a/Documentation/netlink/specs/tc.yaml
> +++ b/Documentation/netlink/specs/tc.yaml
> @@ -894,6 +894,30 @@ definitions:
>          name: memory-limit
>          type: u32
>          doc: Memory limit in bytes
> +  -
> +    name: tc-fq-pie-cl-stats
> +    type: struct
> +    members:
> +      -
> +        name: prob
> +        type: u64
> +        doc: Current drop probability of the flow

[ ... ]

> @@ -934,6 +958,15 @@ definitions:
>          name: memory-usage
>          type: u32
>          doc: Total memory across all queues
> +      -
> +        name: type
> +        type: u32
> +        doc: TCA_FQ_PIE_XSTATS_QDISC (0) or TCA_FQ_PIE_XSTATS_CLASS (1)

[Severity: Low]
Should the spec say which members are valid for each type value? Neither
this doc nor the existing docs for packets-in through memory-usage do.

fq_pie_dump_class_stats() zeroes the whole struct and fills only
class_stats:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
    ...
		memset(&xstats, 0, sizeof(xstats));
		xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
		xstats.class_stats.prob =
			READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;
    ...
}

fq_pie_dump_stats() does the opposite. It sets type to
TCA_FQ_PIE_XSTATS_QDISC and leaves class_stats zeroed.

tca-stats-app-msg maps fq_pie to this one fixed header for both qdisc
and class messages, so YNL decodes and prints every member in both
cases. A class dump will show packets-in: 0, dropped: 0 and so on.

Could the docs note that the legacy counters only apply when type is
TCA_FQ_PIE_XSTATS_QDISC, and class-stats only when it is
TCA_FQ_PIE_XSTATS_CLASS?

The prob doc in tc-fq-pie-cl-stats also just says "Current drop
probability of the flow". Because of the << BITS_PER_BYTE above, the
value is a fixed-point fraction where U64_MAX means 100%. Can the doc
state that scale? The existing tc-pie-xstats prob doc doesn't give a
scale either.

> +      -
> +        name: class-stats
> +        type: binary
> +        struct: tc-fq-pie-cl-stats
> +        doc: Class statistics of a particular flow (invoked via tc class show)

[Severity: Medium]
Does this break YNL decoding against kernels from before the per-flow
stats change?

Adding type and class-stats makes YNL compute tc-fq-pie-xstats as 64
bytes. Older kernels send a 36-byte TCA_STATS_APP payload for fq_pie:
nine __u32 counters, copied with sizeof(st) in fq_pie_dump_stats().

The fq_pie entry in tca-stats-app-msg only has
fixed-header: tc-fq-pie-xstats. So _decode_sub_msg() passes attr.raw
directly to _decode_struct(), and _decode_struct() does not check the
remaining length:

tools/net/ynl/pyynl/lib/ynl.py:_decode_struct() {
    ...
            else:
                format_ = NlAttr.get_format(m.type, m.byte_order)
                [ value ] = format_.unpack_from(data, offset)
                offset += format_.size
    ...
}

The type member sits at offset 36. On a 36-byte buffer, unpack_from()
raises struct.error, and nothing in ynl.py catches it.

So with the updated spec, a getqdisc stats dump on an older kernel with
an fq_pie qdisc configured fails to decode.

The previous 36-byte definition worked with both old kernels (exact fit)
and new ones (trailing bytes ignored). Could _decode_struct() handle
short payloads, or could the spec be changed in some other way so it
still decodes against older kernels?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109071017.438478-1-hemendranaik%40gmail.com
