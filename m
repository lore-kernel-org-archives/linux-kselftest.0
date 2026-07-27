Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C474282F13;
	Mon, 27 Jul 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165580; cv=none; b=SiFz1pnLkOssaBANEn82cRehICsSn6G90dpD3neS3fogsnSi4xHf49VyQg/pq+LajK777BXLGBEirNDHUU4z5ds+beXGysAlVJ96TxZVZLD0xOFf01WZ0hFAgepKqVayqHmfrODHY+E+U/rr04lmirJsLjE/+Lb2NFupPhdDCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165580; c=relaxed/simple;
	bh=y284ozQRIy2WqiSA2VvwQSCB4293kWQm6TX5I57U+lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktAULoukH85Nje1oMuO9YzWxrOkOuz2F7ZIG04IXyk84mV4nG76er/NVkV0i4RY5t3lj+nzDxl3XY/jf4/p5SAjQ5W5bpCOAF9KZQV8nDOA2Yo0nyOYIWZHW3FSn+9c1AWOHUs204AzPWohsJafDNmv6mn72kwEmhUKXmLXWmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=awJbRnlZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MPHdlgbm; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="awJbRnlZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MPHdlgbm"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4ECB5EC01E3;
	Mon, 27 Jul 2026 11:19:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 27 Jul 2026 11:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785165575; x=
	1785251975; bh=CYAAxNS6WnMJ/vbrsWotGsCU8qry7A5N9QYkKo0TX8o=; b=a
	wJbRnlZp802wCY2PtDp2jHhCY5vsr4ba/P+Z+7F0rpJvh293jIFKXTHvOtR1slHN
	b5JYdUIuutoNoDWiOGa+wozgPRFdlMJ5Y9C62aFmBhZIExEcux9GTEOKO0sf33yC
	GExEHuO1D4kknKSIeC4BHsxMciGCjFFNhVpcXZM1UophxM8U3L8CYUG3yGymjbUu
	4hbZp8raBcQ4oKgFwebXMGCeHHsaSTEpWFlsg0B0eAcR948J0KwjvGShp8kSayqJ
	e8uBwfjdlctoqM7Swx2sn2S7tYZdyIY1bl1pqOZs6kNAFPT5xNqblhRZRG4Q/pNU
	70nsDyny2tjRnTBwPvJMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785165575; x=1785251975; bh=CYAAxNS6WnMJ/vbrsWotGsCU8qry7A5N9QY
	kKo0TX8o=; b=MPHdlgbmaaK3dqvonQ/QEE4RIxXWOtnDOz5jjIT17biatUuOAOs
	9LR/crgY9EEUiNr60XcQMLy5uHPFQp0qs3mvOInV8Pj3QKnxzMp+Ck0D3LAKQY69
	Cna73dGGByLYp87S3k5e95eyLYolV5MIWRazW8EOatXT4uQGyCXqH7JVaFDXuTHL
	dI7xTPTcJCINwspw7QOTy/bo/oVaYDlplhdJNHntAGL4IuWqtGIM2i93pFap2rKW
	SsFFpGe1ZZAf01yeatz8A60pEs83eiOUK6VRaMqPG/BsJIw1/SEQ+vCnCrccLX59
	wtZA/aQqBj0YNeHGulL9RptYss1vIEnHvDg==
X-ME-Sender: <xms:BndnavhYQmTtAUFR6GOoxY_iU4XGF0JNBTeQ4ismA4K16kT3GA8jJQ>
    <xme:BndnaqQ3R8OZO7wG0wASbDuRetjCFktwBr2pnbxHsLM4Iwsym-wciM_RsJepWH8pE
    TMhrrnJpMHS0xjCHko8TB-ivxa6lEl8t2u92QmjCHo821BNSneoEQ>
X-ME-Received: <xmr:BndnaoZMzptY1sSfEjHZPQSXJ5BsGDub3nkCUq6VLCe0X9nWjp2p0qgsLYE>
X-ME-Proxy-Cause: dmFkZTGwWkNDZbREeSoU5lGq7hE+MYOZvxXBYofejvLM/kll83ptNjKWEoZV3/3XRjUffo
    okeTnihgOaynxDe3P4dyqYmviXiJfJ/QSXhd6SJygrNKgnaftemtApOdzelgXWV6fGojko
    S4S+QthGmbGGN8m645v5JHqkyP0lFq/qGVh9L4fj6sxRVpQqys07x2rUkE+oPWTvWzbXj1
    mCmOPiL/kw9UyrtdeklQ/54sn8HmCCiSO26Mdj5zwa1VfUfoWMSatJ1frkik+EUBW2anIL
    vypVAFNVVeBAStZk5C5pEE5ujRF0l/eqq3spwmPz7/19exYYvuknuaPIZmzzQCnA9FZyJI
    7LdUZqG2vRMxmBu74G5wn9Ahxu7GXR3NWKw6TcyZhAuZxgLIbOZX0ESadM4qorfvJ/SnYr
    fRA+4I8lGjtnYbMmbgolYpXNaAm41IY5qKdRXU8yv573vwTaabObdOjBxXCuJgVKz6Fasi
    O/wfpJUVgJJOyUPyvNLWgDTCMsGbt62pKG+fdcu7oOjfZDpRnjcm65usG77RYLup+UyJGh
    FjvlWAnY9oe26wl1PLMlZ8WMYNvVmBeov3SLmoARVm5GfYyb6mlLZKRmbpp4xgO/6c80VV
    pzywIbY6n5aN0J8gK0aNwzF72c511nmEW5QRMlSi/YnB+rAUE5TK/ildGLhw
X-ME-Proxy: <xmx:BndnavTLA2bnO53F4KBPXQ3mFuLCsgH59ElTqfXKwHkENsVAGYbahA>
    <xmx:Bndnav8plkUPCSp5H3a4Js7lmfQN-G-H7kw-seolJKz_YgkWrco1xg>
    <xmx:Bndnanhm8CBab6ZX8tkG67j_3Ejnqgyg-Q-EPGHJD-fcwL9KNUg1Cg>
    <xmx:BndnaoaqXFE9kGKHT0kT4GqIpzvlbC16iLtFtAuPneSWL5r_Jm_fzQ>
    <xmx:B3dnaiC_J7PfnmPlZ95DehjXKJjqmQiG3n_GTXzyD9urD2vOhwPBTRvS>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 11:19:34 -0400 (EDT)
Date: Mon, 27 Jul 2026 17:19:32 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 9/9] selftests: tls: cover splice after a failed
 decrypt
Message-ID: <amd3BM0nTJBYlmtm@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-9-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-9-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:37 -0400, Chuck Lever wrote:
> Nothing in this file splices a socket whose last decrypt failed, so
> the check that fails tls_sw_splice_read() on a broken connection can
> be removed without a test noticing. Such a splice hands the
> application plaintext that recvmsg() and read_sock() already refuse
> to return.
> 
> Extend the bad_auth pattern: corrupt an authenticated record, confirm
> recvmsg() reports EBADMSG, then splice the same socket and require
> EBADMSG again. A synchronous decrypt fails again on the still-queued
> record, so only an asynchronous decrypt, which needs TLS 1.2 and an
> AEAD advertising CRYPTO_ALG_ASYNC, reaches EBADMSG solely through the
> recorded-failure check.

async crypto is going away soon, I don't think it's worth mentioning
it. (but first I'm finishing the surgery to get rid of skmsg)

> bad_auth builds the same corrupted record, so its construction moves
> into a helper the two tests share.
> 
> Signed-off-by: Chuck Lever <cel@kernel.org>
> ---
>  tools/testing/selftests/net/tls.c | 77 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 7c178541edf4..8b68dbfcc592 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c
> @@ -24,6 +24,7 @@
>  #include "kselftest_harness.h"
>  
>  #define TLS_PAYLOAD_MAX_LEN 16384
> +#define TLS_HDR_LEN 5
>  #define SOL_TLS 282
>  
>  static int fips_enabled;
> @@ -2883,28 +2884,85 @@ TEST_F(tls_err, bad_rec)
>  	EXPECT_EQ(errno, EAGAIN);
>  }
>  
> +/* Encrypt a record on the TX-only socket pair, corrupt its last
> + * byte, and hand the result to the socket under test. cfd carries a
> + * byte stream, so one recv() can return part of a record: take the
> + * fragment length from the record header and wait for the remainder.
> + */

I'm not a fan of adding a 5-line comment for every 10-line function.

[...]
> +TEST_F(tls_err, bad_auth_splice)
> +{
> +	char buf[128];
> +	ssize_t ret;
> +	int p[2];
> +
> +	if (self->notls)
> +		SKIP(return, "no TLS support");
> +
> +	tls_send_bad_auth(_metadata, self->fd, self->cfd, self->fd2);
> +
> +	EXPECT_EQ(recv(self->cfd2, buf, sizeof(buf), 0), -1);
> +	EXPECT_EQ(errno, EBADMSG);
> +
> +	ASSERT_GE(pipe(p), 0);
> +
> +	ret = splice(self->cfd2, NULL, p[1], NULL, sizeof(buf),
> +		     SPLICE_F_NONBLOCK);
> +	EXPECT_EQ(ret, -1);
> +	if (ret == -1)

nit: The rest of the tls tests just check errno when an error was
expected. If we didn't get -1, the errno check will probably fail too,
but at this point the test has already failed so IMO it's not worth
adding extra conditionals.

> +		EXPECT_EQ(errno, EBADMSG);
> +
> +	close(p[0]);
> +	close(p[1]);
> +}

-- 
Sabrina
