Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BEA2F7F00;
	Mon, 27 Jul 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153309; cv=none; b=fSwt7vClIkQXpd2WPQlrrrTdREDui8OdlGWvmMybsM+hznWyN+Uq42f/aIHQv+T9Aa9ZxjZ6jNDfiL0fO/Z1hG8P7XNCnC0W2lMYtjVCCDXV88cjNxHlPmz3Reg+7IvfM7q7mHA0VesGFJe7Y4nfZ7MYcypuHVvvl5LMJ3uxdl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153309; c=relaxed/simple;
	bh=YDm++PBz78yrj4Mo9DYPbca0wLNFAgnaEc4UoJoICIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9qtq/ztY1umzpuoUZbiZMNMxyzLhWD4RzGHelpbU7igUtuHzzNfMTi45tQC4EeRzpUNyq9Flb/4fS3/wKpHLvnHPeihbZvsErupW2cgMBP0HgITEXsJxIjtsH/x6gE0bfYfUv1lPtMSNLRIzVuSSkfPZcl/J7WbeexE6oSeTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=nBmVjs1n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mINXaGn6; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="nBmVjs1n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mINXaGn6"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6325AEC007B;
	Mon, 27 Jul 2026 07:55:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 27 Jul 2026 07:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785153304; x=
	1785239704; bh=1n/Khldtg6xbHy2jtiCSkAd5klR193GG81GnZWYs2W8=; b=n
	BmVjs1njU/gdi3MZQXViEmYQDyBFW8F66bkXt5EoriZlIrkUPdy32Gdlzep3fJzd
	sUfQy+RbkmoaV92vAXq7W8mh7C5geUhcZo3YCJKttmj0G06SxGZM28EDg9/PTIZ9
	NeD5w8jBA3Hul7NLxzdycaNvY2OmQ0YqwUMEyhH2kx4ZigX3ZtmcRaBWqAXrqo/T
	z355R6OwPC0qqjv+VtfHqoMxW1ZoGzjloNkfZphLd6mgX81W2lO4kicXSW6VTNHt
	KdZ/ArBpU5+ZyS4DQh0YN8w6jeFeTs79dWz3dIshGLIMRtmfx2FuTkQx5tfi2aYE
	d7OjpDnq7+A2Jv6HmTW6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785153304; x=1785239704; bh=1n/Khldtg6xbHy2jtiCSkAd5klR193GG81G
	nZWYs2W8=; b=mINXaGn6bqBsSWwec2QLRJdtUjKm88G0l6jnSKyveE39yXUNz/j
	XQy8kvINczP9spG6vqwmeO0dTfQr401srmydpOAzdRtixql+6wxdlNuHSbavXaX5
	iGAoe7qNrpzko/XeHUZSFfExW9hyaZvYksh133hUgRZiin7awbRSiNl0/7YWggYq
	D6gXPU58fs5hTnktDE7UZO/kjOO9iGZciJukOCMHi9tlmqAazO/3fXn0n5IayLhD
	f4Ts/E3cpdm4RNIL/4lGdtA+CODAni5OMSMVZU8G5tVFhsV07r11LVQYH9njlqrd
	5uKInanwQYlUdNPrp4SvLo+CN6fLV+DcjcQ==
X-ME-Sender: <xms:GEdnajmEe4WixFsR3CxQWICer3vV18xTzoajEWcLldUHz3an3DcDvA>
    <xme:GEdnanjwna_MWsYTtLTOBFElkhc9rFxaF0Bmk9IWiaBSjk0fxYTzgPmHdR9IADyw7
    wGW6iyAsqnRWW5SCEnqfvXLLAJdzRP2bPlZcm9j6ae3i2DHPzssJkI>
X-ME-Received: <xmr:GEdnan0HoLKh5V2R0pUfxVYBZS96memdh38c1Kbbc7FW0c3asdmKNXMPX-8>
X-ME-Proxy-Cause: dmFkZTEiaK2Ock2969CkF6+OcYxcbRC6FoAxf4St2dKsRvYdj0MWk6nNQrSq/KGlylvMgn
    hjjop9ZjXKiLyW5w4/th1Wx7nh6GunxVGIqSnExzjLEFxNbEDEmB4I9l4+svrmKexLHsP/
    gG+MSS+G5mue6/e2pmYTnYbq2wVcgWLZPZlR6BLmtQyPw+DesR92upaLa3+J8ca6M+W0RI
    CtjznfgLPMNxUYxZ+e38Y97y7uVrnKuwXdDg7fzCbyPgo0yOm2NQkVKeVzXkyqyvehB4Zb
    YC3eeB0C/NFsYjrf5AaW2mCoHbgSA+DegRXX7vsbG7oz+izbVmFQHw/I0D84Uf4NHp+bGb
    Fyt9GgtM/H4isU4hwX/1wjYXHkfFhkxrUL6Og9uhGoWtbdIE9wcbdE7kZjDhNOIfqj+N4N
    7SdbKAkxf5buy7UmvJaQnH/KqgrFTmRdS9B9EX4dWR5GiMvUIWGV0PJjCjwoSaJQVDygfe
    Z0AosAWLmdNNPf23w5cfm1pPPMGIkdM6oDbHmxr3Uin6QVnc9An14uieR8uL5dKNz/BbJ9
    3dNz07zAZAwYTJLjA7etG82sS6ZHE00p5qqWjKqibr4pH4K2rXIfoxlujM80hU7Q0Y9E2j
    r0nmE2FE64QBcI3nb7DWfvjVghny0wOAv/+gi43puo4HpLn6fNnvHA5CgsrA
X-ME-Proxy: <xmx:GEdnagLeZnQkpL1Rl4QyQztO6P-IgmzOQxYqws7Gdg-6zZoKpZ1xRA>
    <xmx:GEdnanyu9NQ-GuWB18xzlSiEAWPdz1x119m0lCQTxA9zXwD_YA_LpQ>
    <xmx:GEdnauWtqnEFWCCwtv6orgf1jn8YfgnFRFAB0IXQSNaDdhLnsF1iLQ>
    <xmx:GEdnaniGkDYgx-mp7xRhj69Bn2brHrW1cMtbz55DSSBqnQ3SpgxVMQ>
    <xmx:GEdnaq2_d-TAse9Ye4BRAd-h-eHZL2NK1jTDfhOTFZRLXeIHL9iPQphp>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 07:55:03 -0400 (EDT)
Date: Mon, 27 Jul 2026 13:55:00 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: chanyoung <ppoo1220@gmail.com>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: tls: add a test for splicing onto a
 full plaintext record
Message-ID: <amdHFJlOVpACBir6@krikkit>
References: <20260726105556.2719227-1-ppoo1220@gmail.com>
 <20260726105556.2719227-3-ppoo1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726105556.2719227-3-ppoo1220@gmail.com>

2026-07-26, 19:55:56 +0900, chanyoung wrote:
> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index cbdd3ea28b9..d2666884ea8 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c
> @@ -835,6 +835,58 @@ TEST_F(tls, send_and_splice)
>  	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
>  }
>  
> +/* Splicing into an open record whose plaintext scatterlist ring is already
> + * full used to wrap the ring's end index onto its start, after which
> + * sk_msg_full() reported the full ring as empty: further pages overwrote
> + * live entries and sg.size desynced from the walkable scatterlist, which
> + * oopsed in the AEAD walk once the record was pushed.  The ring is left
> + * full and unpushed by the copy path, which does not push the record when
> + * the fragment it adds is the one that fills the ring.
> + */

This comment (and the other one above the loop) duplicates contents of
the commit message. Please drop them.

> +TEST_F(tls, splice_onto_full_record)
> +{
> +	int frag_len = 100, extra = 4;

Why 4 extra splices? One should be enough to hit tls_sw_sendmsg_splice
with the skmsg already full?

> +	char mem_send[5000];
> +	char mem_recv[5000];
> +	int nfrags, i, total;
> +	int p[2];
> +
> +	memrnd(mem_send, sizeof(mem_send));
> +
> +	/* MAX_SKB_FRAGS is configurable (17 by default), so sweep the
> +	 * plausible range to land the one-byte send exactly on a full ring
> +	 * whatever this kernel was built with.
> +	 */
> +	for (nfrags = 12; nfrags <= 45; nfrags++) {
> +		total = (nfrags + extra) * frag_len + 2;
> +
> +		for (i = 0; i < nfrags; i++) {
> +			ASSERT_GE(pipe(p), 0);

Do we really need a fresh pipe for each iteration?

> +			EXPECT_EQ(write(p[1], mem_send, frag_len), frag_len);
> +			EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
> +					 SPLICE_F_MORE), frag_len);
> +			close(p[0]);
> +			close(p[1]);
> +		}
> +
> +		EXPECT_EQ(send(self->fd, mem_send, 1, MSG_MORE), 1);
> +
> +		for (i = 0; i < extra; i++) {
> +			ASSERT_GE(pipe(p), 0);
> +			EXPECT_EQ(write(p[1], mem_send, frag_len), frag_len);
> +			EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
> +					 SPLICE_F_MORE), frag_len);
> +			close(p[0]);
> +			close(p[1]);
> +		}
> +
> +		EXPECT_EQ(send(self->fd, mem_send, 1, 0), 1);
> +
> +		EXPECT_EQ(recv(self->cfd, mem_recv, total, MSG_WAITALL), total);
> +		EXPECT_EQ(memcmp(mem_send, mem_recv, frag_len), 0);

Only comparing the first chunk ("frag_len" bytes) and not the full blob
("total" bytes) isn't very useful.

> +	}
> +}
> +
>  TEST_F(tls, splice_to_pipe)
>  {
>  	int send_len = TLS_PAYLOAD_MAX_LEN;
> -- 
> 2.43.0
> 

-- 
Sabrina
