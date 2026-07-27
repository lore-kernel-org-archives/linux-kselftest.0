Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C342EEE73;
	Mon, 27 Jul 2026 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161260; cv=none; b=OLr0+Kui7v/cbM2t+4HpDFneeCvBmgPrDui99eBsnbsSLdeTdZc63iiSUwT0VrA4gyYbD1iByDHwrKT34hfWj1xotdRGm7pXjWN+52Sg/lB5xgtXS1hYlHQDO22Z7KeT/yQqc12M4g5qbypEPXOhEJS/NeZOfSFjtGHqZIGdzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161260; c=relaxed/simple;
	bh=qvhB9kD5dEJDrgz2f7ItrBLjIpW1Oj8pX6/+/ypRseA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPAUgTIdQTq29Cek0uNxpkduhSPlD4a7x5a3WVLfad9iVj/hmzYphSqmOFiwLf/B5sbJsstj3xwzTtskzpoRhFGWXSGftrRFSBuoMpx3i7OiA9wYki5a5WtUoJEBmRzy2+2n+A/H2F4JWMHAxCXSnpVwvp5Tg233ChUDyIh6J7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=ObKBLQPf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o0MQnYPV; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="ObKBLQPf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o0MQnYPV"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C764EEC0114;
	Mon, 27 Jul 2026 10:07:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 27 Jul 2026 10:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785161255; x=
	1785247655; bh=fpIZzEqmIchKck74VgdpPLMJwQFIDMxSjrwtFlym64k=; b=O
	bKBLQPfqytjeI81KuA9nkF43KlFyFWiJ8O0B7uVzv9eafdflnZUlcGH7YS+aVQDI
	o8UTOHXKZYzUbE+hrZrMrycIhnuWvblX9ikMOmmvR6n3sxesRIHvTrfO4TrhCXe0
	ZGHPtyidXA+/QVuB44pFhdmo1JXYPaPLv31yCpYmu9W/27saURWg5bfZDywrcSZk
	FsCSkAeKjyvn34UU5GkWSJaK+L0CsVw2b3sCE8EKlx5SvWPlxOeLOVXkYMC/3XY4
	S+LEPp5fE6uJE1sA+7I8uSFOh3lMPcYez4CQT6fXtXRBhZ4zsiQK79iN6WePKMJH
	yHRXB6C3HBkDG2QLKHw4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785161255; x=1785247655; bh=fpIZzEqmIchKck74VgdpPLMJwQFIDMxSjrw
	tFlym64k=; b=o0MQnYPVg39bOSpcLvX1Bsr5Gq8JSYrbR/jkvBKO9tQip5NGTPo
	Z2yAg4jlVbSwIF6tHdOFyai4cRyFQCZNSvY8hubdy4Q2lB4wZuhvzb+xxyK0DE+f
	O3liz9odEO9PQAnTnbr5kTdJLtp3JJ1lit2rD0eAruYfDze3j3snx1tB2prSlNeh
	CIrTKocmB0VHq1latbZsgFX+Cne0hnEtZrzXq5t/rmhUK065Z4m6fJvf8LopK8bj
	V3fi1y838o5sLcZmEabvVhWfH2K80LXbGKYaVP4b+3yTEnbJT5H8cdLjpCfgOz1N
	v3qv++kx8EeGLPyKh5qf7B6ZpMPU2jPY3dw==
X-ME-Sender: <xms:J2Znaof92BG7QeQpkGuQxqbNLSdxMtP7qaT2sEkI0ciK9WBBFSy4WQ>
    <xme:J2ZnaofCF7rbMp49kJIfRtnUPV5DLXkhe-M4atrWugpzGRpmij-eBsqp1V_EAmbuk
    I29bDcEAa7gh_OmFejtQW4Y2a4GSG76RRnHMLnrLouesw8rCgagIw>
X-ME-Received: <xmr:J2Znai1hpfJWPSf9B0IQjpEu7yoZPAfEWOiN8nvl4u-PvY67sayPQyYTk84>
X-ME-Proxy-Cause: dmFkZTFBl0T3JD1uS8KsFNuSph1IT0zQfuhDGz3Gq/mTnjFGJqOpnG7VlS/9BlMGOEgfhu
    SfjUmnsV4ul8KhQ5g/xc27PYY27WsSurQTcsjHt0jLZx66Rn4yiQGUTzwZXa59wg+8EFT8
    AHhsSS+4cLmroVvzt52WoZlmsNyHT+bTbp8J2vRDbrzXAPwAVjsGD4F1qjnFXQWzY+0/bb
    6ZUgy1jMeolhLRLY2tevGYVzE3MtrIWuFMsS4NXi6GmLyCupM/ecpro3ga4FM/VNUe/LQp
    gNVHUXkoZCCdaImBTpwMk0UUEyVJHs67Wkac7//dmouDinYgB6GvR5ar8WXoAit56cWaJY
    Y1eAgHIR6gOCSeQbjXc+cfceEKaynwP3VdbeQVgUR6bBysA7JNyKwigAg5CoPac0ywRPdh
    fkpvvKb9Di6bg92vO7+8vUNYdQS5hfx1uNyEA6hkYnR/yqW0EmdFGXRHhAbJOj0z9pezo2
    iymPWdTTxxMw8Flpoi93jEp3UWqlPHoe5pSnjzbVMFa6CoSzo2MFzXdmUfNVCpCv7JsLdz
    nUn3Epb2TU18XVjj6IbLNd4TIVCFVn0ItqNkVaB/N2oTuy1FMODBWLAZCI6N9sJx1vvdK1
    pKb1aVEEC5acd9DK3v/9g4KddO8NeW0Ujwlcae7NtpvtID2wJo6vEA0pQTVw
X-ME-Proxy: <xmx:J2Znag-hGXht7580WWQVNS5Jqq0gJluEwpyUVzyJgjR5Qvz4EUTSzg>
    <xmx:J2Znan4oPHXv5NZwKuLOj2JQNhl7tCmzQ_iU59_60vOCpR43RP1E4w>
    <xmx:J2ZnaovcV0xsvm_3ajjr_cBqN4qvEQZJqgtcR0otaKetykpp_r49Mw>
    <xmx:J2Znap0CAxTKvjxT1P9i7mx7czYF6oS7dyzf8za_SdJwTsk0bZhg8Q>
    <xmx:J2ZnapMa4lxCY_rNDGJfImv4XahySKjyu5KP-hXH9ZFsgPJgdVZuqO9T>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 10:07:34 -0400 (EDT)
Date: Mon, 27 Jul 2026 16:07:32 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 6/9] selftests: tls: add peek and splice coverage for
 zero-length records
Message-ID: <amdmJHNBGL4tzQVH@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-6-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-6-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:34 -0400, Chuck Lever wrote:
> +static void zero_len_sock_pair(struct __test_metadata *_metadata,
> +			       int *fd, int *cfd, bool *notls)
> +{
> +	struct tls_crypto_info_keys tls12;
> +	int ret;
> +
> +	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_CCM_128,
> +			     &tls12, 0);
> +
> +	ulp_sock_pair(_metadata, fd, cfd, notls);
> +	if (*notls)
> +		return;
> +
> +	/* fd stays keyless; these fixtures send raw records over it */
> +	ret = setsockopt(*cfd, SOL_TLS, TLS_RX, &tls12, tls12.len);
> +	ASSERT_EQ(ret, 0);
> +}
> +
> +/* Send a variant's records; return the last one carrying payload */
> +static const struct raw_rec *
> +zero_len_send_recs(struct __test_metadata *_metadata, int fd,
> +		   const struct raw_rec *const *recs)
> +{
> +	const struct raw_rec *payload = NULL;
> +	int i;
> +
> +	for (i = 0; i < 4 && recs[i]; i++) {
> +		EXPECT_EQ(send(fd, recs[i]->cipher_data, recs[i]->cipher_len, 0),
> +			  recs[i]->cipher_len);
> +		if (recs[i]->plain_len)
> +			payload = recs[i];
> +	}
> +
> +	return payload;
> +}

nit: those are identical to the existing FIXTURE_SETUP(zero_len) and
the TX part of TEST_F(zero_len, test), so they should also be used
there.

Or since you're reusing similar variants (for both zero_len_peek and
zero_len_splice), maybe just add the new TEST_F chunks as subtests of
the existing zero_len FIXTURE? There's only partial overlap in the
current version, but there should be a set of {recv_ret, peek_ret,
splice_ret} that works for each.


-- 
Sabrina
