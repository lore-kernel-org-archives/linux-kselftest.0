Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699059;
	b=5bMYupvgrGSe5erurRxUsjcFmoTNIJedUCzixHKsVKaqYYWUxCrdwA8zgdKsVHjBkRmP
	 7k6saCvFBKKDFsRpfM+CPZb0gitvQ6BcgPX4I+bPxptYNo8mXzV1o8Gkrwo45LVUmgU7O
	 lIkR2Di3Vev89Gk/9rp/87giT/5wbwOweJWjC1UbjRt5UVGrpUp/Wx1yTUcCNOWKlNHWg
	 0y31OAr5wfUfxLK5Vzh8S4YGPs19o7omc50oqNSJnaG15S1U7/D4wOtz50kLvpS9kyY4x
	 dFg6W3COBbyC/A4Hmvjyv7pHfzH+YMcc7otUsXhu2xGBm3fG8b27TKs8cC4gMp5KAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699059;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iBvVCxS8o32Gutem6VL4VG0g7X95pS786Gjq6RUsRSc=;
	b=zzuQkHxlPqhQ7jwhDoPwH0ErYBzNHAGQJnOPVA4tHqNmttlIiZTD+LUTRrgzx7l7Lpdy
	 mcxfJfHwXIRmjsReV0ul1ADUtlwuPnFQjPS1qlf9akvfdj/YZ3mRsyp/nIUfkwUPj7YDO
	 0n0gtJpPvBvm9ILAHo6J8w/rLYdmGNTTIzh48HY94jTwWvrAzWeFAVcONZSrf4nf3d6/E
	 UNrLp1sj2stkpQUjPRvpBPDopE74tRrdM+Cwu4ATbwbZNez3mA2yPjlASMHDZHeVlHxXS
	 VM+wek79owWaPeVtQtF9S2PCfZ/SxkRCCUkiY2kHfF53S22w6hKDIdllz+u74SRnpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooaoLVY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677A606A324;
	Thu, 22 Oct 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooaoLVY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D56E1F01825;
	Thu, 22 Oct 2026 19:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699059;
	bh=iBvVCxS8o32Gutem6VL4VG0g7X95pS786Gjq6RUsRSc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ooaoLVY3787X3TWnKxSb2ExdSGsZTtIsg+0vK3sumyR5UR3Pqfx8gvc70YOxwg6II
	 qYo+nAPURAV8cxu9JX4lG8uEyQQhp13usMokO9QobOTtwjgSDIArFLJvQ5T0RN++Rr
	 KNC+3G8JGIGcD6fzJeDygFkECms7kcE1ANqPOcwuh81vxFCqBL9NFLu7fzG7zKCMZO
	 /NJLEfWVX8kePYf2rMZcEfxS4s1oi3s/j/gtOi6LefRhso4vuujxIKZb243CwOc1MD
	 McbwX9IGl13sLFq9X97ypHmTyUdY9fp9+fszKkb8OCx/Ae41eygJiLxsSgXzkJrNS2
	 Cs6ML/DIot5FA==
Subject: Re: [PATCH net-next v6 8/9] selftests: tls: Extend coverage for
 zero-length records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 22 Oct 2026 19:57:37 +0000
Message-ID: <179269905793.1189532.10522541488678622443@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-8-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-8-ab01c4ecca0c@kernel.org>
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

- [Low] This patch adds TEST_F(zero_len_splice, test) in
  tools/testing/selftests/net/tls.c.

--

selftests: tls: Extend coverage for zero-length records

This adds the zero_len_splice and zero_len_peek fixtures to the TLS
selftests. They check that splice() and MSG_PEEK get past runs of
zero-length application_data records. It also adds a data_0data_data
variant to zero_len, which checks that recv() does not read through an
empty record sitting between two data records.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 0bc43728262e..aa66d0bbd1b5 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c

[ ... ]

> +/* Splicing must skip a run of empty data records to reach the payload
> + * behind it, since a zero-byte splice reads as EOF. Splice reports
> + * EAGAIN for a run with no payload behind it, and EINVAL for a control
> + * record behind the run.
> + */
> +TEST_F(zero_len_splice, test)
> +{
> +	struct pollfd pfd = { .fd = self->cfd, .events = POLLIN };
> +	const struct raw_rec *payload;
> +	unsigned char buf[128];
> +	ssize_t ret;
> +	int p[2];
> +
> +	if (self->notls)
> +		SKIP(return, "no TLS support");
> +
> +	ASSERT_GE(pipe(p), 0);
> +
> +	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
> +
> +	if (variant->splice_ret < 0) {
> +		ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
> +			     SPLICE_F_NONBLOCK);
> +		EXPECT_EQ(ret, -1);
> +		EXPECT_EQ(errno, -variant->splice_ret);
> +	} else {
> +		/* ASSERT so a zero return stops the test before the read
> +		 * below blocks until the harness timeout.
> +		 */
> +		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
> +				 SPLICE_F_NONBLOCK), variant->splice_ret);

[Severity: Low]
Both splice() calls in TEST_F(zero_len_splice, test) pass
SPLICE_F_NONBLOCK, and nothing sets O_NONBLOCK on cfd. Is the socket
O_NONBLOCK path in tls_sw_splice_read() ever covered by this test?

net/tls/tls_sw.c:tls_sw_splice_read() {
    ...
	nonblock = (flags & SPLICE_F_NONBLOCK) ||
		   (sock->file->f_flags & O_NONBLOCK);
    ...
}

The earlier commit "tls: Honor O_NONBLOCK in tls_sw_splice_read()"
added the f_flags check above. It names this selftest, run on a
nonblocking socket, as its reproducer.

As of this patch, SPLICE_F_NONBLOCK on its own makes the wait return
-EAGAIN. A kernel that lost the O_NONBLOCK term would still pass every
zero_len_splice variant.

This looks resolved later in the series. "selftests: tls: Cover splice
on a nonblocking socket" moves the body into zero_len_do_splice() with
a splice_flags parameter. It also adds TEST_F(zero_len_splice,
nonblock_socket), which sets O_NONBLOCK on cfd with fcntl(F_SETFL) and
then splices with flags 0.

Would it make sense to fold that coverage into this patch, so the
reproducer named by the fix is in place from the start?

> +		ret = read(p[0], buf, sizeof(buf));
> +		EXPECT_EQ(ret, variant->splice_ret);
> +		if (ret == variant->splice_ret)
> +			EXPECT_EQ(memcmp(buf, payload->plain_data,
> +					 variant->splice_ret), 0);
> +
> +		/* The empty records were consumed, not left queued */
> +		EXPECT_EQ(poll(&pfd, 1, 0), 0);
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-tls-follow-on-v6-0-ab01c4ecca0c%40kernel.org
