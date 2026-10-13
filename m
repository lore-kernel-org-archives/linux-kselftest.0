Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F33FE347;
	Tue, 13 Oct 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907905; cv=none; b=n2InxgkhAxOEBFV6kAOPvz7AXWmqtrknYg0dg4maWT6uEC4Gfux6b+YkcOdyxsj5Xh6pH+fne7wIXu9G4vHUmDbYG6Gk7PxggCTTtWf5Q529oObfr4+aOua+39cBoGiLfpQ+QgjunWXWq6fPXGduONTlTOrIbadDcxf/LcTeAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907905; c=relaxed/simple;
	bh=seZ5jYBkFFDj6LzktqK84G593VFjwTFFSPdG+PcZfLg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4jd5rv5aUz+O5N34oyWsBOQ1JMSyb2thRJ9lLnQ3EFTQZBl41yUu2bHwfqOtFJa7MA2V2Me/2rTc/VniM+YCAl4O5Wo1nEhSkBU2pFrb/4HPFMA223rMYrckGN0Q/AMWVz/O1+ej6CW+uHtCLumsgofSDECVZ3pZUgGHcSe8wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfhftFFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfhftFFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D821F00893;
	Tue, 13 Oct 2026 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907904;
	bh=xvlHbLOS9Yw6gWGukPkO6rgjjMSKMlO6OYRVK0OS9yM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CfhftFFGF8x9LJqgEAjyCMZ+KqqtKXmzfp2pTOwbWAseX2zFoMhY75p5u3YwJGhIh
	 vCnYH9T9d5O2G4nXYiaXDdIPqQ3VEXnrRUYCzyHHpHYfm9A3sph6UESVjKPJtQ610U
	 oH7UCEPis317NBMe2baYizwP8dFqx5wKmTVlyXh2uecLXugd1lrAZ6rto+JtnlzVNe
	 nvbAZjCmi7qZQNms7zTNPCWkgleo9BieX5W7vg/T0fCELv3v/alPqV6Dvg7ib9v2J8
	 1JM+9QDVtDWcLNUNew9jQnaAorTeW62A0ySA2+MtgwfRuUOm6ZCfF1K2VgI0zqX1vv
	 mRbGbIvxXFDMQ==
Subject: Re: [PATCH net-next v4 8/9] selftests: tls: Extend coverage for
 zero-length records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:43 +0000
Message-ID: <179190790310.434549.10358607982241497690@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-8-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-8-8cea429565da@kernel.org>
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

- [Low] Concern: TEST_F(zero_len_splice, test) in
  tools/testing/selftests/net/tls.c passes SPLICE_F_NONBLOCK to every…

--

selftests: tls: Extend coverage for zero-length records

This adds two fixtures to tls.c, zero_len_splice and zero_len_peek. They
check splice() and MSG_PEEK against runs of zero-length application_data
records. It also adds a data_0data_data variant to zero_len, which checks
that the first recv() stops at the empty record.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 0bc43728262e0..8ce5a90329600 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c

[ ... ]

> @@ -2671,6 +2698,177 @@ TEST_F(zero_len, test)

[ ... ]

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
> +		/* ASSERT so a zero return stops the test here; the read
> +		 * below would block until the harness timeout.
> +		 */
> +		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
> +				 SPLICE_F_NONBLOCK), variant->splice_ret);

[Severity: Low]
This isn't a bug, but it is a gap in test coverage. Both splice() calls in
TEST_F(zero_len_splice, test) pass SPLICE_F_NONBLOCK, and nothing sets
O_NONBLOCK on self->cfd.

Can this test reach the socket O_NONBLOCK check in tls_sw_splice_read()?

net/tls/tls_sw.c:tls_sw_splice_read() {
    ...
	nonblock = (flags & SPLICE_F_NONBLOCK) ||
		   (sock->file->f_flags & O_NONBLOCK);
    ...
}

The commit "tls: Honor O_NONBLOCK in tls_sw_splice_read()" adds the
sock->file->f_flags check. Its message gives "the zero_len_splice selftest,
run on a nonblocking socket" as the reproducer. In this version, every
splice() call in the test is nonblocking because of SPLICE_F_NONBLOCK alone.

A later patch in the series, "selftests: tls: Cover splice on a nonblocking
socket", moves this body into zero_len_do_splice(), which takes a
splice_flags argument. That patch also adds TEST_F(zero_len_splice,
nonblock_socket), which sets O_NONBLOCK on self->cfd and passes 0 as the
splice flags. The pipe comes from a plain pipe(), so the socket's O_NONBLOCK
is the only thing that makes those calls nonblocking.

So the path is covered by the end of the series. The gap only shows up when
the series is applied up to this patch and no further.

> +		ret = read(p[0], buf, sizeof(buf));
> +		EXPECT_EQ(ret, variant->splice_ret);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org
