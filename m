Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651424B0495
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061876; cv=none; b=byBe6IfqGpDI5gdqTv9UUFjXwZGGnomIzMuUDCCEE/DTLxHschvytOV2zK12PovIs77wAKezRaWzEF0XddwV674a5GVJVWbzwMQQmUi0ETVb2tS350TgZ2yjP+QMBtDH1jdYEZTpIGTbcSoGxn6qA/0O7oOuzPLsPniuky4SnJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061876; c=relaxed/simple;
	bh=VgncDmnLpV5j4nAmnp54PyOYRb9MX84DWvxwoXbrfPc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KsJhKkUyGZQpyPt45omz+y8ie7tvobRiy3dRE4xfmarP875kj5V7Vxb7n720ei6wW6MJcyqqvUVkHwjAus35pj6wl6C7LbZFfu7Iqh67Sm/PDCIJp7B3Fp/+EwR8GCJNTQAsYB+LEuc+2C3F6oTNBW4SgEHYFiNXXBox4firEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2YZazkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2YZazkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69A51F00A3E;
	Fri,  7 Aug 2026 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061875;
	bh=2YbgrN5QJ/HCdjlIqSCLm+xT0EJ1uk/RpEylLMinMy0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=W2YZazkch/DemYGo3V16oP57pv+VqrS41axCxt6Xr3OAZaITMW77sF4HPGiEDCVfB
	 uFdCtQpLp7gtViLv1R4URzCQJ+4f5wdEIU9NL26aJInLutWQ7y1iJkS9JoMt5YZ8M3
	 x1udvKgrW/2fwgHmQXjJjpB2MOADIQLaeDqEKYjZxVhQuz6ADY9O+Yx0oKFkF5Xz88
	 OKyYuZ3YHn33Ajc3zax65vRkT7wfCDlj0U652jD3zUmjHsV0Y1Xd2nJqk6OYXTV7jl
	 58lUvE/7li0KgyYuNShFrSQT9qhBr7ixzpVb7iIEb+DYMCLiirb2kHq2xh+JAXEGsO
	 GnvKnTTdqf0qw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id C211CF4006C;
	Thu,  6 Aug 2026 20:17:53 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 06 Aug 2026 20:17:53 -0400
X-ME-Sender: <xms:MSR1atQVQF3kU_Kqhz40L-VIXUwHFzZP4JuXmSsHm_TPMBmCO1oL8g>
    <xme:MSR1ahmX5Br5MBwYOSaWPmyqbZRh4tFSZF6OlIMFxbCvINti_rAVYJo5UGa0YnbAb
    lYuXjCpV_PNRCTWrnrhcqSSCI2JSAcGHEx3XYcbElkBMgmqgYF5v1uO>
X-ME-Proxy-Cause: dmFkZTFIF3yBPe+YwGZSPnYigUANaFs4vrAmKV2+PKRTgi3H0D1rH/kT8gAkHvenWEG9mM
    Nq0iI4ovMP6dcsYS9+WMNTDEAooFtwvqCgaXzqIsCXR3a+X8uMPwvJIPZqYc+6tQ/SMUr8
    y+7WO/H2y06C/v7+XkjyXD3SatL0t8Vtxkgeagm5wpsnlPj4S8DO7HF7g3XMUaUEysItkn
    NtfLY4bzbLTQ5wEM6/zLmSQEZNRpygFK5aYguEKtHxm9yV/ZdIjjWUzwKNWJzlaXHu/w4B
    aC1hngXx7oOS+lRCgyubND/RE+lRp9CiggMCUE0rwJMSTQHPOFk+FuDqkp/4fuEG4ENeZF
    pMkyJU5iJEW+gjzSXqhUpeLjC0rcFAGWVM6wMJQ17J8Gnap/aZeHMT1bI1RBSz0VHcDoX4
    7za9bp13Ipv+I9Nv590SuZXZqGvdOphr3TiLP2RxTZjicn59un2eqfcUKc9ggRv+xA4uA4
    Gtwd4kVIIvvizSqyOAhSQT9ALGA8PkofBBpkkwOp6/+ov55b4ISK4+p7nUU5xEtWAGP09b
    tEsVzD7SrBNaEFPFVbRS+vzZ1VdIhnI9PP1TWf4IZWYZ75RiMTHRROBHViROA8uFv2dmPa
    AoOhQ1NlnI0YBbEvU5Fum1idTPGZ99B/G+rOe3FT2DLLQ6qdA55UP9FsN5fA
X-ME-Proxy: <xmx:MSR1ai2t4TQy0V76NFhsM4hJkB7nt-ZU0vCFha8jMzMUxrLNeafPEg>
    <xmx:MSR1ag_9DehKWCnCjEM602oLzu9wJYPVkuJHl0Gw9jhnt3LavsoF2g>
    <xmx:MSR1an5U73qHBe8ox-mfH9szpOUIX9xaJOEzqVnIn4JvbLNu0Yxbcw>
    <xmx:MSR1aouYKUPHwVQ2S1UtozesPYyUXMCwiPmMoSneOBFFi2pHp9ZLNw>
    <xmx:MSR1ap0OOOrOGl2uQ73yEguycLmBqTUM2-S0lyzCro8CudKba3INMrPu>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F889780070; Thu,  6 Aug 2026 20:17:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0WByMxMWtsc
Date: Thu, 06 Aug 2026 20:17:33 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Sabrina Dubroca" <sd@queasysnail.net>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <2dc8c2c0-7b5a-4c1e-a9b9-e4d06977c0d1@app.fastmail.com>
In-Reply-To: <amuIA8GjpwBf1ecB@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
 <amsVm65P9E0_SUT3@krikkit>
 <eaa66ad3-fd50-4ec5-b097-e60bd11b2bc9@app.fastmail.com>
 <amuIA8GjpwBf1ecB@krikkit>
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 1:21 PM, Sabrina Dubroca wrote:
> 2026-07-30, 09:05:17 -0400, Chuck Lever wrote:
>> 
>> 
>> On Thu, Jul 30, 2026, at 5:12 AM, Sabrina Dubroca wrote:
>> > 2026-07-26, 20:33:29 -0400, Chuck Lever wrote:
>> 
>> >> Bound a run of such records, as net_rx_action() bounds a softirq
>> >> poll. The first record that delivers no bytes arms a deadline
>> >> TLS_RX_NODATA_NS ahead; any record that delivers bytes disarms it,
>> >> so a normal stream never trips it. Breaking out with nothing copied
>> >
>> > Another thought here: I think a peer that sends "some" 0-length data
>> > records followed by one (possibly very small) data record, and then
>> > repeats that sequence, will not hit this "rate-limiting" of no-data
>> > records. Is that right? And if so, is that a problem?
>> 
>> That occurred to me too. It's right on the cusp between still
>> making progress and gumming things up. Neither the packet-count
>> limit nor the time-bound address this case.
>> 
>> I don't have a good answer.
>
> I'm not sure that can be addressed in a generic way within ktls. Maybe
> the caller needs to do its own accounting of "this read_sock/read_actor
> dance has been going on for too long now, let's stop".

The consumer can, but only by killing the connection. During a run of
empty records, read_actor is never called and nothing decrements
desc->count, so the consumer never regains control. The socket lock is
held throughout, and __sk_flush_backlog() takes only sk_lock.slock, so
sk_lock.owned stays set. Anything needing lock_sock() blocks behind the
reader, kernel_sock_shutdown() included. The one channel left is a
store to sk->sk_err, which tls_rx_rec_wait() tests first in its loop.
That works, but it is terminal for the connection.

To be non-lethal, the bound has to be inside ktls. v2 of this series
will use a count rather than a deadline, as Jakub requested.


> If we hit the nodata_deadline, we break out of the loop, read_actor
> returns 0 since it's an empty record, and we jump to
> read_sock_requeue.
  
Well, but consume_skb() has already run, and the break leaves the loop
for read_sock_end, which does not requeue. read_actor is never reached
for an empty record.


> sk->sk_data_ready is tls_data_ready at this point, no? I'm confused by
> "the consumer" here.

It depends on which callback was installed first, and unfortunately
two current in-tree read_sock consumers differ in that order.

svcsock (to become a read_sock consumer soon) installs svc_data_ready
at socket setup and the handshake runs later, so ktls sits on top:
sk_data_ready is tls_data_ready and saved_data_ready is svc_data_ready.
The release-time announce already reaches that consumer.

But nvme-tcp is the reverse. It starts TLS in nvme_tcp_alloc_queue() and
installs its own callback afterward in nvme_tcp_start_queue().
saved_data_ready is sock_def_readable and the announce never queues its
io_work.

The explicit poke is for the second case. v2 of this series will rewrite
the comment to state the condition rather than name a function.


-- 
Chuck Lever
