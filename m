Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480A3815D5;
	Thu, 30 Jul 2026 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432075; cv=none; b=ctyi7PVaSzEKxvJVUbrvRLNMZK4dfUZw7/h4C3Zx+uvNKNbcUzvk0zOkR8Z/+Kka1cmWURykV9E45X7T5l+3bVOLtpxNp+sbsfFH0rYI0n6TF/Q0hW64gORCnWH3Aat3rKE7HsqKvBhlTYb+ZTvs0gxG4Qy0JHawHc4ZeipXCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432075; c=relaxed/simple;
	bh=iu1m+/2AOaAgGsmwOrKPlvB0lSOtrV4PblnI+gQhbS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bleSqhmJoXu6xTpkvCqISZsduBVpl4VjDLcwiY3WNQ3osrbkQ0NITtYqzp8nnVwn/7zSX0BNhnNOulWIka9hktmqYGwCTvyjSKxf4jDYvX+6InPmJA+pRxojOXr9yVBmHXKHgMnrPz7QizWAjjkvuWPkdv4acVa09LOLaTw2ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=aDYJtQmU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fmVNhXBS; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="aDYJtQmU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fmVNhXBS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 32E02EC018E;
	Thu, 30 Jul 2026 13:21:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 30 Jul 2026 13:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785432071; x=
	1785518471; bh=ADIAqMH4tRhMsCcZXT83cTQECWUs0qCQY1Htxbl2RW0=; b=a
	DYJtQmUPPlYecmiyIJXa0ooT4yMxNXTosi7oRTQtp6FVzsZMZnXwgcncgUeMI5Cr
	8hkHgFgU8kEtKeuF+B1Lz3X03dkKeAOnGQBWWOPO8FlqKP4VEbxzl7TcMcZ+TyG5
	/wnYG6oneaeicAv90tsxG1+Vtx6VXm+/xZbQbdDjz03WJ2kV3t0AdTlpHQ3eeOyd
	ZS0l+UN2lKJIO5/xHde+vqEiSLv0ylLFevV8sXFiRIiPyXt8etDUASWcJfHQ1MvZ
	zT3jjGp59443MCCi1tMzr4MZalz0sE+CtyNVv454MJbCtKmWV6LdTLk1T88td8bf
	AZUX5K9A7H5j6NSliqyyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785432071; x=1785518471; bh=ADIAqMH4tRhMsCcZXT83cTQECWUs0qCQY1H
	txbl2RW0=; b=fmVNhXBSSrawFwZkMiHwsDYK9RM4U+2eYMMVNKU47c3RZMyoBvG
	f5E0Kj/90UgOu+oMV0b2O1kO2ZemmY2iiU4PV1hXAhpBCETk680riNp4sLAn+LFe
	I3u89McnGACRaRYOWHBUTPh/l9dlcUbl5Fc9OK34NuV49xiOhkzdW3fny9hvUKnB
	J5XppUl9qBg4sSKljkClFuz/eUa3ANbCAAkONhH5Ptr8d2zhPclN7QDPoFwQdhHh
	R3mE5RK4D/3Qkw1uzQ+dOY/Vq/CD8tUcir1LzAK7oSXWR0Tk4cisMtCheayzdqyl
	62ATht/fjG6OFnXjSR/kkyJAiIr6TSZmRjA==
X-ME-Sender: <xms:Bohragsp6eK4FeINiCv3YXvg_VGYAYkMm-o7xfYIMtm0oYmcXyIl_Q>
    <xme:BohrarvhwtqJOOd5VeDAz4e1PhhyK10yP7KhS9FtjmqztRWqey8aRFa8KrEqDemgA
    BsGRvoXxJyPbqTpCbZ7P0TQ4jDdQG-FLmGmxJEtu4DbdYvbKt8LCLo>
X-ME-Received: <xmr:BohralFienVgHSiXAELw_7AKAKK2jHZbFhzrUXbp4kVbVp05bTBxxDKLycI>
X-ME-Proxy-Cause: dmFkZTG0PlGSwIEyh1lUlAkeS6++o87AMta4vyzTBKzQGb/4j1g/YpJC0sGmrTUwM+Pvcb
    HEPZ24bG2/uDoVmbs6oCXe2S2khQwPkOryDO38aAMubet+6eCI7eobwHGS8Gx/KnayKjzt
    GUfiyPMVd2Mnnk1YpeTpniL2qeVTpWPDi7B31Jhq7zKiEi432jakss8XC443zjDT35khv7
    r1MPQMR1cZODRNuEHSdv2bLNKFzXL7aRKVDImR7LfaeePiS6vsrv66CARoPx5dlvbwnpku
    +JwPxtbKoBT9YbPUjBNRLcrzZn86p929EtHOljHLQovD7b2Ox8VkZWRlhnN8XhWAHmpoPp
    +CHO5XBfNGyJq0mkhE25NkSPYm7fih3F4QL1eRDbfs76E/pZH0Isjg5Q7bzHsFyYpkpvgv
    jOOUbAcrOX9PJAWfQgTlvbIQNH8CbzgL1tSkWEF9/SkP+JtFaRRnSL3Mk/lFEjibjGynZk
    BfIWlJ2nWNs4ieYaYdHCa2mMHbtkjLOdSc6g6qJ780YFwu9LA8Yh1lEx1GCLlALemdMsWd
    Jfgo/9qpGx4w9K6ZJmmajm1nFfUyCbgm1CHSzxhAblJw5uCtuSZdR046CPj19lnh/2SxdC
    8eOmBeCw9g0lyWw9drD5uur9rBULs/ygCJukwVooC9t7Jh6vx/uSOoNYdk4g
X-ME-Proxy: <xmx:BohramN1AdHW50HUk5jI5RJHiBeC-Z0NqFTBOPCGsVVtA1CclDfLNA>
    <xmx:BohrakIIJS5lWudjEUlm4GTAQoxLZ9fa2zxHvPFwpKKlLCL7vHqnog>
    <xmx:Bohrav86OYF2vK-wcqFA4UXxkBEddTsyoa-O-8EqwK6X4yj6btqB2w>
    <xmx:BohragFyxL2gQA07BkgpDYCbn8ha2SFX6p3dVcH_UZ44Iu0TunUeTg>
    <xmx:B4hraod7eVMrni570DrhXx-7zZLZG8nisU5RV2FeWqV-SNw0f9U8ub7R>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:21:09 -0400 (EDT)
Date: Thu, 30 Jul 2026 19:21:07 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Message-ID: <amuIA8GjpwBf1ecB@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
 <amsVm65P9E0_SUT3@krikkit>
 <eaa66ad3-fd50-4ec5-b097-e60bd11b2bc9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eaa66ad3-fd50-4ec5-b097-e60bd11b2bc9@app.fastmail.com>

2026-07-30, 09:05:17 -0400, Chuck Lever wrote:
> 
> 
> On Thu, Jul 30, 2026, at 5:12 AM, Sabrina Dubroca wrote:
> > 2026-07-26, 20:33:29 -0400, Chuck Lever wrote:
> 
> >> Bound a run of such records, as net_rx_action() bounds a softirq
> >> poll. The first record that delivers no bytes arms a deadline
> >> TLS_RX_NODATA_NS ahead; any record that delivers bytes disarms it,
> >> so a normal stream never trips it. Breaking out with nothing copied
> >
> > Another thought here: I think a peer that sends "some" 0-length data
> > records followed by one (possibly very small) data record, and then
> > repeats that sequence, will not hit this "rate-limiting" of no-data
> > records. Is that right? And if so, is that a problem?
> 
> That occurred to me too. It's right on the cusp between still
> making progress and gumming things up. Neither the packet-count
> limit nor the time-bound address this case.
> 
> I don't have a good answer.

I'm not sure that can be addressed in a generic way within ktls. Maybe
the caller needs to do its own accounting of "this read_sock/read_actor
dance has been going on for too long now, let's stop".

> > [I'm guessing that the caller is doing something equivalent to
> > recvmsg(WAITALL), so it could be stuck for a long time even with this
> > new bound]
> 
> Still digesting your other feedback. I plan to send a v2 to
> address it.

Thanks. There was also some from sashiko but I couldn't force myself
to read it.

BTW I'm not requesting you to also fix the existing misbehavior I've
mentioned (EOR and timeo).


One small thing I've just noticed in this patch:

>                 if (rxm->full_len == 0) {
> +                       err = 0;
>                         consume_skb(skb);
> +                       if (!nodata_deadline) {
> +                               nodata_deadline = ktime_get_ns() +
> +                                                 TLS_RX_NODATA_NS;
> +                       } else if (ktime_get_ns() >= nodata_deadline) {
> +                               /* Queued records raise no new sk_data_ready(),
> +                                * and tls_rx_reader_release() announces only to
> +                                * saved_data_ready(), not the consumer's own.
> +                                */
> +                               sk->sk_data_ready(sk);
> +                               break;
> +                       }
>                         continue;
>                 }
>  
>                 used = read_actor(desc, skb, rxm->offset, rxm->full_len);
>                 if (used <= 0) {
>                         if (!copied)
>                                 err = used;
>                         goto read_sock_requeue;
>                 }

If we hit the nodata_deadline, we break out of the loop, read_actor
returns 0 since it's an empty record, and we jump to
read_sock_requeue. It doesn't make much sense to requeue the empty
record? Well, we'll start the next read_sock with a record that
immediately arms the deadline, and it avoids a small additional diff
to handle that case in the "used <= 0" block. Nothing serious, I just
thought I'd mention it. I can live with the current change.

-- 
Sabrina
