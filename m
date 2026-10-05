Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3B445AC1;
	Mon,  5 Oct 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242550; cv=none; b=EbHXIYLG2KYm2f3XzyJAwtYZO2C97c8kDVLOje0PANqcyGKujVzJvxpun340U6G94RwUl/xqa4eAbdYYQPsRI1bbmzgAk7BQnzq3zNCjExF4pDZiXjQXKU1qd9omt2/Y1WWTOF/SvPIp1k157LlORIQgep6NeCOTPtIhFDwJYqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242550; c=relaxed/simple;
	bh=00Kg5MALvVxFvrWbdob68nE3Q5JTMNac6ziXc/JIktQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHEI8U7Yn3kb4JSZ2F3RZKKUprp9RpYEwO8D1x450UihsaDGGXkR3ug1KhgHwj1TRNopFeagaIBp9wP67dZyMePClYxhMmD7VWxXb+7kMUXjgUrSaJZopJI8NgEasqkcoPWv5SpQdxMk7GrP72txs3n4wxpXE1ZRdV/cUU8FevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcKghzW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcKghzW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1221F00893;
	Mon,  5 Oct 2026 23:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242549;
	bh=oJhvDBVMKhT7pVqm+AD1ISvpddS4/k8DLOL5TTe+Kf0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CcKghzW7bKCPMxw7OZE07RQD1HwnjZ23mAhoC7wz9ZCWm2LgdMsqZsirKEFt8AcbM
	 V9CrdR4r5bRmwCbMAwIco6obD5PL52ZpJB8hG/+Jdp5JqsqTsO92HfiJf5VKd3HyzT
	 ZIR1tVukI6KsIpAcYsOBhl9/uLhPjd0J1FcxTVZoATH0IBFSyeeYCeDFDMwL/LzP1s
	 WGTldJxF/DBkDYgN2+WMmINDt1tRbUQdkpcmVyBO1H5bTwLiOWkYEAzcFpfnQO7RaJ
	 OFIrvLNUuL6FH31wNMvN03R7EpMjQAL861g1DJnYyxbhRB7+jSQ265AUJT6bwK0xY8
	 Z4yLNSO2XycCQ==
Subject: Re: [PATCH net-next v2 6/8] selftests: tls: add peek and splice
 coverage for zero-length records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:27 +0000
Message-ID: <179124254789.434549.2899145941558316898@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-6-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-6-2dd1947bb642@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] zero_len_peek in tools/testing/selftests/net/tls.c passes on a
  kernel that lacks the fix from commit "tls: consume empty data records…
- [Low] In TEST_F(zero_len_splice, test), the last check is commented
  "The empty records were consumed, not left queued".

--

selftests: tls: add peek and splice coverage for zero-length records

This adds two fixtures to tools/testing/selftests/net/tls.c,
zero_len_peek and zero_len_splice. They inject zero-length
application_data records over a socket that has only a TLS_RX key, then
exercise MSG_PEEK and splice() against them. The socket setup and record
sending code is moved into shared helpers used by all three zero_len
fixtures.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 9d3cd4fff062b..419c6cc0cc5e1 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c

[ ... ]

> +/* Peeking past a run of empty data records must reach the payload
> + * behind them, and a run with no payload behind it must report EAGAIN
> + * rather than the zero return that means EOF.
> + */
> +TEST_F(zero_len_peek, test)
> +{
> +	const struct raw_rec *payload;
> +	unsigned char buf[128];
> +	ssize_t ret;
> +
> +	if (self->notls)
> +		SKIP(return, "no TLS support");
> +
> +	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
> +
> +	if (variant->peek_ret < 0) {
> +		ret = recv(self->cfd, buf, sizeof(buf),
> +			   MSG_DONTWAIT | MSG_PEEK);
> +		EXPECT_EQ(ret, -1);
> +		EXPECT_EQ(errno, -variant->peek_ret);
> +		return;
> +	}

[Severity: Low]
Can this test tell a fixed kernel from an unfixed one? It seems to pass on
a kernel without the "tls: consume empty data records in tls_sw_recvmsg()"
fix, which adds this branch in tls_sw_recvmsg():

net/tls/tls_sw.c:tls_sw_recvmsg() {
    ...
		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
			if (!darg.zc)
				consume_skb(darg.skb);
    ...
}

Without that fix, the peek path queues each empty record on ctx->rx_list
via put_on_rx_list. In the 0data_0data_0data variant this leaves three
empty skbs on rx_list, and then tls_rx_rec_wait() returns -EAGAIN from:

	if (!timeo)
		return -EAGAIN;

That is the same -1/EAGAIN this branch expects. The comment above the test
contrasts EAGAIN with "the zero return that means EOF". Did the peek path
ever return 0 in this case?

The 0data_0data_data variant behaves the same way on both kernels. The peek
returns the 11-byte payload. On the next non-peek recv(), process_rx_list()
computes chunk as 0 for each empty skb:

	int chunk = min_t(unsigned int, rxm->full_len - skip, len);

so each one is unlinked and freed without any visible effect:

	if (!is_peek) {
		__skb_unlink(skb, &ctx->rx_list);
		consume_skb(skb);
	}

The commit message says:

    It reproduces no failure, because the unbounded rx_list growth needs a
    sustained flood that three fixed-sequence records cannot supply.

The retained records do appear to be visible with three records, though.
tls_sk_poll() in net/tls/tls_main.c reports readable while rx_list is
non-empty:

	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
	     !tls_strp_msg_ready(ctx)) ||

Would a poll(cfd, POLLIN, 0) after the peek in the 0data_0data_0data
variant catch this? It should report readable on an unfixed kernel and not
readable on a fixed one.

[ ... ]

> +	} else {
> +		/* ASSERT so a zero return stops the test here; the read
> +		 * below would block until the harness timeout.
> +		 */
> +		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
> +				 SPLICE_F_NONBLOCK), variant->splice_ret);
> +		ret = read(p[0], buf, sizeof(buf));
> +		EXPECT_EQ(ret, variant->splice_ret);
> +		if (ret == variant->splice_ret)
> +			EXPECT_EQ(memcmp(buf, payload->plain_data,
> +					 variant->splice_ret), 0);
> +
> +		/* The empty records were consumed, not left queued */
> +		ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
> +		EXPECT_EQ(ret, -1);
> +		EXPECT_EQ(errno, EAGAIN);

[Severity: Low]
Does this check prove what the comment says? It looks like recv() returns
-1/EAGAIN whether or not the empty records are still on ctx->rx_list.

If zero-length data skbs were still queued, recv() would go through
process_rx_list(). There, chunk is 0, so it copies nothing, frees each
empty skb and returns 0 without setting *more.

Back in tls_sw_recvmsg(), copied is 0, rx_more is false and control is
TLS_RECORD_TYPE_DATA, so it does not take this exit:

	if (len <= copied || rx_more ||
	    (control && control != TLS_RECORD_TYPE_DATA))
		goto end;

It then enters the receive loop, where tls_rx_rec_wait() returns -EAGAIN
for the non-blocking call.

The payload is the last record in every variant that reaches this branch,
so this assertion passes in both states. Should the comment be reworded, or
the check replaced with one that can see records left on rx_list, such as
the poll() check suggested above?

> +	}
> +
> +	close(p[0]);
> +	close(p[1]);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org
