Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB33F3265;
	Mon, 17 Aug 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975799; cv=none; b=cPC/F6WNT7c5GCLs/etoAeq5vFseLzRDD5keZ4TlasYMG1LU5V9OvxOOEd/2bOaBxaTf/b8eUQavkp1iMXmaeSweTzw4gfbGWoUaws0+eRLrQVHrkFSQNm2H5noT/PNqUBAlSMRN6NxvOwsDVlsRXXrw+BdUKL+Zq4R2nsf6DXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975799; c=relaxed/simple;
	bh=OYquvGJzVtBPWDzClVGI5qYTrrmHWqFP/6vQd9+ufwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA+hNqhBiDZ8VIlrM1LYncjVGil5vjWrlxaJf3zwI3LV02MiQXaNN9BHxprykGSFJCG6sUvg7UPmod1VLH8gQykM5IC7gcYmr7b6X1Tcss3e2QHPiy4G79qrGpL+JIl5n6LnvRI1TU/ybzbDePhOLN9VBQ+tUxLGBlzAO+gPt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=QF5NNs0t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kBDkLToo; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="QF5NNs0t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kBDkLToo"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 66A267A015E;
	Mon, 17 Aug 2026 10:09:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 17 Aug 2026 10:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1786975796; x=1787062196; bh=vzZNttFZ9M
	PKmCoEpqflrK0pVGpNWTranp1FJupATn4=; b=QF5NNs0tGLBA0DAy6QCe1c2xA0
	6tkOHrxGR8dFDpE8IdKePvPvlgDHYyle8XlFdOEMToUVSUfiVCVj2wRDRLFh3p7D
	nHKVN9aAuUt9gGts5u3gZz5hXDifTkbsvWwUAKnlV9G2cxVnMNDARpYqccALJ39s
	/wD6FwXv4Vs0/qolkGNyQaUyCHb8PIkXxWc9qdymuWPiyZfmhhvOADgrl3YkmkI9
	N1FEN7WVg7XS6QMrg+f6rD9ntTNj60bibcoV4bACszwozBJ0YUifP8YWZCr8TkaX
	XykBRRHBRfllFesE8a0I8LVFpBZwD5pkFYkr3b4izNzBvn0tEmaNtPa1iIiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786975796; x=1787062196; bh=vzZNttFZ9MPKmCoEpqflrK0pVGpNWTranp1
	FJupATn4=; b=kBDkLTooB9JBioIKVaqXg/suLnhR7h58dEZlipbfp4cu70sa+0d
	DtVRQKJAWpTppsiaxrV8K361obnNQRq5nEkfvNERKrkX6GgLBTeDHqJUP2iBNmmi
	PolcPq7S2rXk+WfZzENSgDyHbkTuoFCwthkWv4Oy7BAmgIlAEucjR8TZkwHbXryT
	QKGcqP6zeAtQRj3YBfgeAXqSeij+3EXQcnGhGwVEOvonkBMuCPCf5gHXAVxZfvr9
	KIFbrMT7UT7TF6jS+D7Q/zmak8oZ/mawlGp7jFPLZVBbGC7otPRvz0dneLYMEmSv
	dhCAQfEKtkEw2DMCYOBves+aUzwVgG1xF8A==
X-ME-Sender: <xms:NBaDamnaWvYmLHbG_nFD88D4pgNm-Ijhns9ZgpoGDK1JMUtR7koSJw>
    <xme:NBaDaqY7gWOAA5Fsfv4VgFBgc50tYOUJ-n6duhKoM0vKar9xtYlbYWFhX4U_8b1Px
    sVeW8xGKMhHqX3n_rZNUBpPG6NEKkl1qZ14a7X9d8Idj_Ra17TrL08>
X-ME-Received: <xmr:NBaDapHCS94yFlY2W9PlLbA5L_exMIJowFQeXZNRkDJjGVlowZlBAPUDkSgjfyp9w9udW_OcRhoB2RCQjm_M6YIjfza2rIo>
X-ME-Proxy-Cause: dmFkZTE/cexVpZyXM078OQGgY8/s1GF5OZVfiKMaJzfhw/kFmWdRl+VhOlU3DhKQibHNb9
    +JQttjj8ucNTgPIRFyJZ6c0El5RXx0Hqh3kP1OAkFWfaoihMSLdGDDvYveHwrKHvQlBk6d
    XpGn6wsbZ+wD5VqmR+SAvFSxZXCPeNXJW/6orEaAoDNuh6DrzfHCQKwn45cB1fsMSr/9r0
    PlrVc6Lt9w0MLF8YEcaZx76FcwM0ncb+XLwFsLFr/A5LNdKsn2XVoN/a0tCZ9Ez018ifwg
    XlLnont+26Xgd9OcTGC5G4uPzpJRjYnoveiUfB8q5uHpfMLOSMjclDecIOs8yiVIT3t/f6
    Uy9E5A4buCoK+kRKGWAHjFZpFZNIWrcVla0YBBZJkccDvOMRdSAXX3kXTy30vNCs6mL0w7
    x+yCjdfDweivd8I0bzlDIc8/RbhS42uEyLeM/tr2lHAIhY6MrPbW6cWXUIKI3MuJimvjSj
    Nv+Z+SRjDYHaREOahPIlZ9hwch4uv8uaXyLTAwG+Gk+wEucV7HQ+a4zA+GGzbhiAzlt8IR
    P25W2yVNcHE6RPh0jBxBFIlHztsMbhIgHNbeUqPS7tuG79t7u5yfsXrGlPQYpOsqOh6pu4
    DD8UPiE0eUhgLp92G4f7ydovh2jCVQjWjvi750DciNsAvFUVUjODmJ+WjqBg
X-ME-Proxy: <xmx:NBaDahYfMQNKxREB4T1RpUwhuEZDoPmVW6yvAVaei3Olyd-WG6KMSw>
    <xmx:NBaDalzYPZbaJ1vyLPC6dVTLtVPgBOXpZ8jJTqUCvHg6H3iUE69yig>
    <xmx:NBaDarQ-ip6_GcvIQ5azY7795M1zH4fI4l68yfUJFTa94c5o6W-_Eg>
    <xmx:NBaDaqLT4i5xpf6NwfJibjp_6oqNQaMAwbv6KXeZTIABkdcGI3zUVA>
    <xmx:NBaDanfwDD2spKEyyETxQVKTm9vl0xmGH0gqZ4Ur-bO3NypVr3JL_Plu>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 10:09:55 -0400 (EDT)
Date: Mon, 17 Aug 2026 09:09:54 -0500
From: Juanlu Herrero <juanlu@fastmail.com>
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, 
	asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next v5 5/6] selftests: net: add multithread server
 support to iou-zcrx
Message-ID: <aoMWDiA1NnyqxoB7@jlhe0197-mac>
References: <20260814012348.46958-1-juanlu@fastmail.com>
 <20260814012348.46958-6-juanlu@fastmail.com>
 <34915029-869a-4a5a-9bde-060a9a6eec20@davidwei.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34915029-869a-4a5a-9bde-060a9a6eec20@davidwei.uk>

On Fri, Aug 14, 2026 at 08:50:29AM -0600, David Wei wrote:
> On 2026-08-13 18:23, Juanlu Herrero wrote:
> > Run the iou-zcrx server as N worker threads, each owning one receive
> > queue with its own io_uring and zero-copy receive (zcrx) ifq, so the
> > test can exercise multi-queue zero-copy receive.
> > 
> > The main thread owns the listening socket, accepts connections, and
> > dispatches each to the worker owning the queue it landed on by matching
> > SO_INCOMING_NAPI_ID against per-queue NAPI IDs.
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> > ---
> >   .../testing/selftests/drivers/net/hw/Makefile |   5 +-
> >   .../selftests/drivers/net/hw/iou-zcrx.c       | 262 +++++++++++++-----
> >   2 files changed, 195 insertions(+), 72 deletions(-)
> > 
> [...]
> > diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> > index f793a6c04e412..008d3f4b76263 100644
> > --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> > +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> [...]
> > @@ -289,12 +279,13 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
> >   		error(1, 0, "recvzc(): %d", cqe->res);
> >   	if (cfg_oneshot) {
> > -		if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs) {
> > -			add_recvzc_oneshot(ctx, ctx->connfd, page_size);
> > -			cfg_oneshot_recvs--;
> > +		if (cqe->res == 0 && cqe->flags == 0 &&
> > +		    ctx->oneshot_recvs[conn_idx]) {
> > +			add_recvzc_oneshot(ctx, conn_idx, page_size);
> > +			ctx->oneshot_recvs[conn_idx]--;
> 
> This needs an early return. Sorry the bug was pre-existing but I just
> noticed it.

ack, I will fix that in v6.

Best,
Juanlu
