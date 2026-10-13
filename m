Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AB50B8DB;
	Tue, 13 Oct 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907901; cv=none; b=LYXSn7xrbLPkUUd/cWaxnTtm0xCOjQfhxpcZlzNpvnrNnWwCkSO0uVl/Gk7FqfSVssvV4jyaShUFAIZYvqe+l9JygWjOXLoRNWlK/pXm7Z1y33tEdrAKGSxsfz4L2WEo070GvDkR2v5lGVHkfwUSs26ZLmDWqsfX3suK9dOXmT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907901; c=relaxed/simple;
	bh=/aKWQ8icT6FR8c5sZWQQrY4dxlCZ4JQcuOfnwccfaJg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rEURaSoI3M2tusnXbZeKYTf1dDUjuI0ACRJTe7XLQPHbnrNogFQfp7VFiD27ukkIdOfciIZsSDATBkyrKiclUHGboGhkmlD4Jx6Gdv24i1Aydf2DKGn7TFDjIxOJU0MKYpSe1JbKhED0Vh9iQbzMDBeP2Tmukaba8lTwrwK3hyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jursb735; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jursb735"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF751F000FF;
	Tue, 13 Oct 2026 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907900;
	bh=hgER89ZqCG0UMvDPfUqicWk5mAF6XbUv6Bque0n6Jk0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jursb7359uV/DMCA1wx5n4CiLan0/1erjdYA/58cTd7/2R+sny/iLFc3Xqd9p0nt9
	 r3qqPHFnBY/hlqfyKHkwl4ABUuxdCMqJNL2TF4kUSwSAefSuq2ze/pb8HP/GYXnm1P
	 tGr/NPZ2fxIh2ErKqOzMObchvsPkiyv7kwsQWKOB4GyCn+cbObjjIZi+7bx6RFZVSs
	 fLZzyFSHWFMkAYoRTBsnI+mJtVXFyI2vlfBK73ATHFaTO5My8euGKF7f2xk6Jh4Fwq
	 QXsobM03AbS5qAu86XT/IlT8YWy4o4pGvbGe0rTl+cufIcZuJK6n1RfS7kRuzO1+ZO
	 xPab0eH3UKdLQ==
Subject:
 Re: [PATCH net-next v4 3/9] tls: Honor O_NONBLOCK in tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:39 +0000
Message-ID: <179190789933.434549.342786122614239566@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-3-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-3-8cea429565da@kernel.org>
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

- [Low] The commit message of "tls: Honor O_NONBLOCK in
  tls_sw_splice_read()" describes a poll-then-splice stall and names a…
- [Low] At this commit no selftest covers the new behavior in
  tls_sw_splice_read(): splice(2) without SPLICE_F_NONBLOCK on a TLS…

Pre-existing issues:
- [Medium] At this commit, tls_sw_splice_read() splices a zero-length
  decrypted DATA record as chunk = 0.

--

tls: Honor O_NONBLOCK in tls_sw_splice_read()

This commit makes tls_sw_splice_read() treat the socket's O_NONBLOCK flag
as nonblocking, in addition to SPLICE_F_NONBLOCK. The combined value is
passed to tls_rx_reader_lock() and tls_rx_rec_wait(). As a result,
splice(2) and sendfile(2) on a nonblocking TLS socket return -EAGAIN
instead of sleeping, the same way tcp_splice_read() does.

> Polling first does not avoid the sleep once tls_sw_splice_read()
> consumes zero-length records. tls_sw_sock_is_readable() reports
> the socket readable while any record sits on rx_list, including a
> zero-length record that delivers no bytes to the pipe. The
> strparser announces a record before decryption, when the record's
> plaintext length is unknown, so the readiness test cannot screen
> such a record out. A splice that consumes the record and waits for
> the next stalls every connection an event loop multiplexes.
>
> An LLM audit of the TLS read paths found this defect. With empty
> records consumed, the zero_len_splice selftest, run on a
> nonblocking socket, reproduces the sleep.

[Severity: Low]
This isn't a bug, but do these paragraphs describe code that exists at
this commit?

At this commit tls_sw_splice_read() has no retry loop. It splices a
zero-length record as zero bytes, consumes it, and returns 0. That means
there is no second wait in tls_rx_rec_wait() that could stall.

Also, tools/testing/selftests/net/tls.c has no zero_len_splice fixture
yet.

Both come later in the series:

- "tls: Consume empty data records in tls_sw_splice_read()" adds the
  retry loop.
- "selftests: tls: Extend coverage for zero-length records" adds
  zero_len_splice.

The current wording ("once ...", "With empty records consumed ...")
already hints at this. Would it be clearer to say that the stall only
appears once the following patch is applied?

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index f2062e141512c..f5e329b75976b 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -2024,10 +2024,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  	struct tls_msg *tlm;
>  	struct sk_buff *skb;
>  	ssize_t copied = 0;
> +	bool nonblock;
>  	int chunk;
>  	int err;
>  
> -	err = tls_rx_reader_lock(sk, ctx, flags & SPLICE_F_NONBLOCK);
> +	nonblock = (flags & SPLICE_F_NONBLOCK) ||
> +		   (sock->file->f_flags & O_NONBLOCK);

[Severity: Low]
This isn't a bug, but does any selftest at this commit cover the new
condition? That would be splice(2) without SPLICE_F_NONBLOCK on a TLS
socket that has O_NONBLOCK set.

TEST_F(tls, nonblocking) sets O_NONBLOCK on cfd but only calls recv().
TEST_F(zero_len, test) never calls splice().

Later in the series, "selftests: tls: Cover splice on a nonblocking
socket" adds TEST_F(zero_len_splice, nonblock_socket). That test sets
O_NONBLOCK on cfd and calls zero_len_do_splice() with splice_flags = 0,
which closes this gap.

> +
> +	err = tls_rx_reader_lock(sk, ctx, nonblock);
>  	if (err < 0)
>  		return err;
>  
> @@ -2041,8 +2045,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  	} else {
>  		struct tls_decrypt_arg darg;
>  
> -		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
> -				      true, false);
> +		err = tls_rx_rec_wait(sk, nonblock, true, false);
>  		if (err <= 0)
>  			goto splice_read_end;
>  

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. What
happens later in tls_sw_splice_read() when the decrypted DATA record has
zero length?

net/tls/tls_sw.c:tls_sw_splice_read() {
    ...
	chunk = min_t(unsigned int, rxm->full_len, len);
	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
	if (copied < 0)
		goto splice_requeue;

	if (copied < rxm->full_len) {
    ...
	consume_skb(skb);

splice_read_end:
	tls_rx_reader_unlock(sk, ctx);
	return copied ? : err;
}

When rxm->full_len == 0, chunk and copied are both 0. The record is
consumed and the function returns 0.

Will splice(2) and sendfile(2) callers read that 0 as EOF? RFC 5246 and
RFC 8446 both allow empty application_data records, so a remote peer
could send one and make a live connection look closed to the reader.

The next patch in the series, "tls: Consume empty data records in
tls_sw_splice_read()", fixes this by consuming the zero-length record
and jumping back to retry.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org
