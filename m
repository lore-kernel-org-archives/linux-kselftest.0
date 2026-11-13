Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528026;
	b=cEIz3q6Cng73LzjkmleLkk6/hmiHFMyfgTD03EhWOfYrt+0ixtqNymof64BVpWoJaXus
	 Zgv/U5o241dFnaFJCtDYTzTsWc1ZJ4rLLUTlBqy5e8fdlgNup85fZBOlQK8z64w3KXLLp
	 Rl8zoCmpsUfTArADGzdSZ/TtjdoDOL2CijXP+S7bJniej2R9CRn5SOl+N3rYU1rU3Ew0q
	 bMSKQrQ+X0yGXxNorLL0+jn99ciPqFjyn+anm6rpaqThhSwWhKX9NM+15NUWhq2COEXYs
	 Ol+hlqvzBbZz0nk5DD8c3u1Tr0EQqqxlu8pzjValASSHH6n5LVVjNoK3ae1/9cBfWlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528026;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=l0yMB6mlk/d1VpWv746U3qT6RZU6q+fzAlO7lXQIGnI=;
	b=R8BlhsNIYDAJzUYyOD4WgNXzW39kqF50s43OCXt+xLxCytNbmwDHCOekdyRvRFWkBYbc
	 0qhomCDTG/NVFGwCB643s/2E4s1UBedOVO/LU2/Pz8xYDeKFbjU7ERVa97LUS/hXqrof1
	 0PZPMNOh7hAibnDOkFzts162j1iH26I8sEaV9Qdkk9silQo1l1tf7zsTvET/EOwhk1AeI
	 i9rNgb49JasNKCGKRiOLvKhVnURxJNm6owihfVvq4oTLrkIH8PFDcf80lG1z78qw5saZO
	 WVZDK3N0asSR0bOhIQ654EgE6bvT7Be0B03j1v/TFjVOdcDFms2A23wGWjDqqbq2WCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2586GRy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19EC60A2613;
	Fri, 13 Nov 2026 00:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2586GRy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1C31F000C8;
	Fri, 13 Nov 2026 00:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528025;
	bh=l0yMB6mlk/d1VpWv746U3qT6RZU6q+fzAlO7lXQIGnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q2586GRyE3dt8Q899oXIFd+blAcEbWua/0dQaWTKvxSQ9Y4h6rCYN4BX7Ua8RNqrh
	 m6lfvhOcUmsHh/mcphYTn6MZuVKs1F2JKFHLCEH5up+biX60CkMzm3zC+tD4kqhq3C
	 ZOVknNPc8ZCH3csCKPkvm6cItJwKy1C9qpSxzIJlkbFsNk7KkIoS0DnPRuHAqr4pWc
	 G8ksJqW4J2F+f2M//9bHbVs8z6f3uFsRMUIwqKTVKOcK/9V8F3rUlwLf1LfJVC9YKr
	 vz9V6JXDImf4EKwCEkUrEr87PocoiJrNxmlQ962LdNyKOXl7cx+rjj8glyKYMja7qP
	 oZGpNSHYseNmw==
Subject:
 Re: [PATCH net 4/5] selftests: tls: Extend coverage for zero-length records
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, shuah@kernel.org, cel@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 00:00:24 +0000
Message-ID: <179452802477.2199510.16293896103281965784@kernel.org>
In-Reply-To: <20261109175836.1246840-5-kuba@kernel.org>
References: <20261109175836.1246840-5-kuba@kernel.org>
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

- [Low] The new MSG_PEEK test, TEST_F(zero_len_peek, test) in
  tools/testing/selftests/net/tls.c, cannot catch a regression of the…

--

selftests: tls: Extend coverage for zero-length records

This commit adds two TLS selftest fixtures, zero_len_peek and
zero_len_splice. Both inject pre-encrypted zero-length application_data
records and check that MSG_PEEK and splice() reach the payload behind
them, or return EAGAIN/EINVAL when there is no payload. It also moves the
zero_len socket setup and record send loop into shared helpers.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index ca47576220d3e..ed7feeac1cc41 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c

[ ... ]

> +/* Peeking past a run of empty data records must reach the payload
> + * behind them, and a run with no payload behind it must report EAGAIN.
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

Can this test catch a regression of the peek change made earlier in this
series by "tls: break the connection after a burst of empty data records"?

That change replaced "if (is_peek) goto put_on_rx_list;" in
tls_sw_recvmsg() with:

net/tls/tls_sw.c:tls_sw_recvmsg() {
    ...
			/* Consume empty records, even when peeking, so that
			 * they cannot pile up on rx_list.
			 */
    ...
			if (is_peek && chunk) {
				peeked += chunk;
				goto put_on_rx_list;
			}
    ...
}

On a sync-crypto kernel with the old behaviour, both variants still seem
to pass.

For 0data_0data_data, the peek queues all three skbs on rx_list, including
the two empty ones, and returns the 11 payload bytes. The next non-peek
recv() goes through process_rx_list(). There, each empty skb has chunk == 0
and rxm->full_len - skip == 0, so it is unlinked and freed, and then the
payload is copied. The last recv() still gets EAGAIN.

For 0data_0data_0data, the three empty skbs stay on ctx->rx_list.
tls_rx_rec_wait() returns -EAGAIN for the nonblocking peek, and the branch
above returns after checking only ret and errno.

tls_sw_sock_is_readable() reports readable while rx_list is non-empty:

	return tls_strp_msg_ready(ctx) ||
		!skb_queue_empty(&ctx->rx_list);

Would a zero-timeout poll() on cfd that expects 0 after the EAGAIN peek
tell the fixed and unfixed kernels apart?

zero_len_splice already has that check, under the comment "The empty
records were consumed, not left queued". It only runs after a successful
splice, though, and tls_sw_splice_read() frees empty records instead of
requeueing them.

The later patch "selftests: tls: Cover the cap on consecutive empty
records" adds zero_len_run with recv and splice cases but no MSG_PEEK
case. So at the end of the series, it looks like reverting the peek half
of the kernel fix would not make any selftest fail.

> +
> +	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT | MSG_PEEK);
> +	EXPECT_EQ(ret, variant->peek_ret);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109175836.1246840-1-kuba%40kernel.org
