Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014F3FA5CC
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884289; cv=none; b=sIUDYRi4kzLUOMai2v3rmVUzNJZJ+os4tsARnuc2gX/xQNOuqyqtE810eTwpuHvbcFAXD4r+bBmfDXgE/uAEXBLeQK1NvpSJUC+Ga13+kcdqpk52NJt01ILCEgnclItRFrJNF0bVpFAoslfvdFQqmOCZvdfgXm7V/MtR8WnVmkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884289; c=relaxed/simple;
	bh=7CTQPPO2qQ2ZoSuCsvkYLKcbd9ZRQEFN8AaPBnDBHcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0LPC3yhUF2cpnltZdvuLdLwb7f5Bs1BehJCgFPyZ4N8+YWbiGg7wQ2i8yqye+hdFq3qS7EsAjN7bTKXmJQ/puEJlAmMUyUakYEWLUvBLt1AGul+1DofBNtsPLZ4YWJ4m1srPC1cMeBZViKtn+wMI0kNDIcXuSTBUUvo0QiPASc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=d7Pj2hLV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DMS5V+0H; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="d7Pj2hLV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DMS5V+0H"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6DC42140016B
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 05:38:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 13 Oct 2026 05:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791884284; x=
	1791970684; bh=LQCntHHIX/z5AYDFTk7naJrzWzZHIxRMf2UeBMyYXa0=; b=d
	7Pj2hLVNapNGRQ7wnzfXMXOgvRCR1WjokoAkJKXpfrqCNjb0EilV7mT4pbpdZ5SO
	j7TZjIt2+iFi4ofhRFbOhKsFH6xTicEHXV6NTQ91Gs+clfytuuhpBNiDfkzWE8Vg
	8EhpiQ3U2fufHakCY/sNtmIdfCZCPLWacUkSMCFrLvxv95LykjiaUP9vo3WnZCQV
	+qXhpnGCPU2WHUZ4tu2MO7bdIeIOTS/vC9pdZpYPAMoHPU9LU9vDJhVH338tdnHj
	FsmYXfTyq79KQqVHT1rL6yQ5WTnP6OsyopRi/xn/iHkPX86lVT/OU/vAn9N8Th3M
	OA/YnAxWJOc/aiJ95h4zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791884284; x=1791970684; bh=LQCntHHIX/z5AYDFTk7naJrzWzZHIxRMf2U
	eBMyYXa0=; b=DMS5V+0Hiq7+a/wm86w/K4lryF6eUVIC4wItQvci7eekzLMu/xn
	BMRRurukeP/ZBa+BuLl10YYWknmYIzJc8JURAZbkfz5uiY9pXa2k2pYGwha53DcG
	8+zS0A4+RrLlX62uCo83HNoNOt+zMfSlTPK5hhCiUfAi2BsehfLOiA7cw32IMMKc
	ENwMtPXGG1Yqt8FwuWIA7x9h7eHclb2BlaHPMxHEluPSTJdiUXK4rwMe9LzKpBMP
	ZBiKPzzhXWv4v41DySz/ijO0ACESyUTjfsDShAcUAIgXtrAwsMxrTrbNU2N/CnLn
	Iee5iRLTcteLRkeR6hzv/20d/wv/fze1fZQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791884284; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:nTGdZx3T3JO+p1fh3kaKT9s8I/+VVabaXBW+6LyrzR38Qnc
	ysLXuOVyJAMmoNsX+WL01j6vLATNPwDD/QuYtMZWZ9Xng8zHMDlP0ZXAmG1fiuEc
	XEm4iM7AMaJs4GrFrk+nnfhLfaV+yTwnfeneOyjvbENMnMj08dBYPQQOwtZin6e4
	J2ZKvt+8iKqgzwZ5LM+YkuNNj8XVelwsyddc0y8a49YqIybm0zvwq5Kutm3Zrccz
	uSgVQYF/FlnY7lLr1uvE4ARx/6STUpTDsmWzc9h5jrdgY7PVALehQYyiZ0sG6Qi1
	RrVfLqh5N8W3Y/QRfeEEAK37QKHx1Cg3lox1Zrw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jq0AKZ0ZMZ52TQNweCflPClrPKpb6HhVfjSHA8skpjQ=:7CTQPPO2qQ2ZoSuCsvkYLKcbd9ZRQEFN8AaPBnDBHcU=;
X-ME-Sender: <xms:-_vNaoUP1I29ZAE6SA9h4duVAo4gWSN7xbQykyKxTLowaiASwcmwlA>
    <xme:-_vNagQNniucjAaY1V91uLTPzl51hcLHEBdKWFmpPgLdXocwDP336v7MRf84fi2Ya
    U7Ivc1vM8ayA-uJF5Hbtdno6WMzxkelrTfc024lx8En12lSayOKxqJ->
X-ME-Received: <xmr:-_vNalBwJNG9-akjHytwU_FWsobZlC47zpDxbofme75B90VO9-N2hQRGPaU>
X-ME-Proxy-Cause: dmFkZTFa1h1u84m4cXgOhRTv63380DK+WDI1GkNmDzoEUq/xf5UHejNkra0evyB7asAR31
    yn52SZAx2R9zdjUsHRnU9dp8FBIRzp+3dss2aUTpXsHANFdqRa9s0CRlyph3O/AR0EG/0S
    OvM+gxGdAGvnMupgXXHufHuhCLzO7dI8JowinfWoYu2FmnDh6QBC8xDY56TTkCwp0J9BLz
    /Q0mzHIFM5k5cMTOBIKgtjpRj3oJxfMFc7tyrR1r+v9vVo8moXn1pVhf9FGKnCXk5v2bIh
    sXbkx/RpKyqeZ7XHuScTQXNYNuJWHsnAvwR2cpAKQqPxAsL72H6CTRPrZqXSwa8ew2EKAj
    mqIeCbJngjEh2q0qCF3H1ZY5+GpKJSLhskAYzhgIrep+B/md2bmkbEia4wx9DLxqZrO/7Q
    tTnJFsvv4TApfNaiPQecG5t69AWVJ1kzJtS7m/QAXeE98E1NJS0PNYYtq/vQRUd+QG5UgJ
    U53e8oVlEN2TlnZKJUTvlDMykV0KtxoHV9r3CK3aUkvtk1XEQbKereA78SQkRQVIfN6X+m
    fq3+g84a8TKl5pqwFIwUSly7oOq11mutNBbnW/B62YEt+7aNVaOmXHfA3xzStB3hCMQ2Cb
    18zxwMp9fx2I4Z9gMQS8ELb0FheOxj8uEb3LzR9mJSpE/Ilh+itEHZwEA/og
X-ME-Proxy: <xmx:-_vNaov5q-NbIGtN8DF-e5p4EYRbk7cay6Mqwv92RB9TBLidOitTBA>
    <xmx:-_vNaj-q-iepGO2biJ0HTir1qhMX1sfxEuaVjAiap2qp2xxp7WH0fg>
    <xmx:-_vNavRV4Ww0K_egHdmo8LHEcN96JtmTBMhqjWWZXNO6rOXh8Y9OfA>
    <xmx:-_vNalVkloa3BASndxzqEFYGka7Rb8tnmdb_YYw6z72EGSw8pO9GIQ>
    <xmx:_PvNakNbSIQX86AxZJ3DY9bUZugZ_TXWHVYGTn4dWQOhJ-FK5N-BNel2>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 05:38:03 -0400 (EDT)
Date: Tue, 13 Oct 2026 11:38:00 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tls: refuse RX records after record-number exhaustion
Message-ID: <as37-A3DKONrFuxs@krikkit>
References: <20261013002701.1957686-1-rjethwani@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013002701.1957686-1-rjethwani@purestorage.com>

2026-10-12, 18:27:01 -0600, Rishikesh Jethwani wrote:
> A receive socket records sequence-number exhaustion only in sk_err.
> After processing record UINT64_MAX, it advances the counter to zero and
> reports EBADMSG, but SO_ERROR or sock_error() can clear that error.

I vaguely remember a discussion around making some fatal errors more
permanent (ie not use sk_err).

> parser-ready record also bypasses the socket-error check in the record
> wait. The receiver can then accept a record authenticated for sequence
> zero under the same exhausted key.

I guess, but what's the problem with wrapping as long as we don't
reuse the same record number?

> Getting there needs an initial record number installed close to the
> limit, since 2^64 records cannot be exchanged in practice, and a peer
> that sends the wrapped record, which the Linux TX path refuses to do.
> 
> Mark the RX key exhausted when its record number wraps, and refuse to
> wait for or decrypt another record under it, or to replace the key.
> Plaintext that is already decrypted can still be read. RFC 8446 lets a
> sender retire a key with a KeyUpdate as its last record, so in that
> case leave sk_err alone, report the pending key update as usual and
> let the new TLS_RX key clear the mark.
> 
> Add fixed AES-GCM wire vectors and TLS 1.2/1.3 selftests for queued
> wrapped records, SO_ERROR clearing, splice, peek, partial reads, TLS
> 1.3 key replacement and a KeyUpdate in the last record. Every case
> first verifies the penultimate record succeeds. The vectors avoid a
> userspace crypto dependency and the TX path's refusal to generate the
> maximum-number record.

For 1.3, just do a "silent rekey" (change the key but don't send a
keyupdate) on the TX side to record number 0 with the same key? And it
should be enough to test this with just 1.3.

> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index fbb274287aa5..63bef0153182 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -730,6 +730,15 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
>  			conf = TLS_SW;
>  		}
>  	} else {
> +		struct tls_sw_context_rx *rx_ctx = tls_sw_ctx_rx(ctx);
> +
> +		/* Only a KeyUpdate may follow the last record number */
> +		if (update && rx_ctx->rec_seq_exhausted &&
> +		    !rx_ctx->key_update_pending) {

I'm really confused by this.

> +			rc = -EBADMSG;
> +			goto err_crypto_info;
> +		}
> +

-- 
Sabrina
