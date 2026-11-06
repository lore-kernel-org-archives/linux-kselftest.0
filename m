Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001226;
	b=x2nyx1dTu/VrW51Eiqb6Jt8RSGUT256gczj4CdDTKU5cfl7jAbM7yJ0M999Fg5fg/JkW
	 78ztb3+wbsZ7+a/opw2dz31IZL9UaBx59sT0nVxPmQ7FKtX4mRqRl0N3Ri2ED91j0yFyp
	 cfXhPjK45y3pwiMzr+KwIpzC+oKGsbdeXOXvBzCN4SHIogU1vyBMazDMaVgU94Q+VsUvb
	 aAlqTjF55VeZEmWGBzXV9AVhykq+/qlWWdJGpor2egoor8ITZ57avIV1+Zv+LJbnCZ8nH
	 4UWpVwCnPJG1JyEvmZPQ2owA20difUsga2J3vxsydjoIV7WkwRDBsvDN4Zx8BeHjQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001226;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NJjSZ6byjU0nT7L6gaConqvJnvZsIcsiEJ1Ekt21ztw=;
	b=y/mOpoA0tSHGzCvrwQa+MlM3dqPfTNeeQwqOF7gXEwOXIN52nazdlI+1/cZpefIZgIDB
	 hnxd191c6AlkQ84yFtnyGm717dwEu39ePRo7scX/Ti9s4qSLFf9x+E7NGj0RksuQ/Df4D
	 j2Q0sbmpJ7fWZejmoFFQdcjlDgbCVT7AJBOiGjR8a/Jh1gYhew3Nc/qEwKgckI0vYY1tQ
	 dI/AjkloUMgNVi5Ga0w+K9n0+dXCVj055vQXr8v+icP3clSx6JaDnlKt+iU6Bpra+DHG1
	 Mlpd3a1HgrT9lM6C8/R8DL1/uWE+zGbVwyzfBmpYlDokRqax1YQ0yqvMfLLfggfbHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=VbXKoh6X;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HrZFzyHX;
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C62606A32E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 21:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C62606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=VbXKoh6X;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HrZFzyHX
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id 82F711302AFA
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 16:40:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Nov 2026 16:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794001217; x=
	1794008417; bh=NJjSZ6byjU0nT7L6gaConqvJnvZsIcsiEJ1Ekt21ztw=; b=V
	bXKoh6XdJyGq+d0PHagyU/VO7NO43A/j4OxLLPiPkWXoAckGZs0jaQPVkCUnALtg
	jzpmF0Q3YDY9izjVrhSh4rci58x9KXUY5m2mMkdeKuutH240OFML8ePMUyrE3j/d
	qk/o5CRfe72f2JEq9e3HErJ3D98F49jDyWj+BqDlrGM4V/GJWAQXibMfgKaM8zFH
	aKVOiP79t7OBSg1Cyem/60G5GvmoUr1xp8zIjGC1OVVlOWRhmR6cWfXkaGXPVsef
	LYZX2YuM9L5i9btS8BZ4kKjOFRMDBmou/u/MloGcFrNNfEop8oFfUFQY/rJbly3f
	kghkXB6Df5jJxei9OhojA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794001217; x=1794008417; bh=NJjSZ6byjU0nT7L6gaConqvJnvZsIcsiEJ1
	Ekt21ztw=; b=HrZFzyHXLxxGiwjM2/JxHjs7v5CI89BrAoFsjwT/ROQXeSF7QQ3
	ypzII+RA7DcpW3+EH6N8+K8gy14E2vecH8bf8b69/lCmaMC/9X59GNs8qskIt85l
	+LFXwtOq+MavnpjqH46vYdZlBuZrJy21FnABeULSbGNv/3v6HEyGV21+pyQcJN4V
	RfXMLzZ4QR+6KyFq/HDI4/BGWAdnVUwZ2HY1M2shj6dI6Wu5KqdGfi6MitanbSt4
	U/ayL0mFo7JXGWwNibevlM/JHoRax7ykhSUaBS+ZIZTqDmVo4xBc+S4bv4sbNOJn
	VZIs45IFZctIYm7TxhTjEMAuCAS3K3kt1Dw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794001217; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:O/PPALjJDmaIMN20W5zX9xSfI0yIEywtjKN8uNvOvJCslxK
	nPbRxu70xfnwZCDFsB2tbziQSPgXFqxk1pgyUFrOeYce8GZUhcVuvcAM7bDdJ+Il
	Mhi9mGPviY4qt07pBS1mn5sr4lPxFtffiQ58doJ7bbmNzCRsLWSJE0UbwptZWRZI
	SvGy0GUf/VM3AgJachvKZHiuEDgKeACaSQtKz4ZQykas4aoCFYY8+3g++BRVzvGH
	C3AksjVNWTeDnPBKjfXsTLu/Pn5EYgJC5TGjvw7zXaoXrYA9Rq1ZDDCAEeVDlf6M
	7LKFa2hqnRGzAlf6fFpwtai2BZnTdnw8hea2gBA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:5uTqlFLn19dD44/gE58Slrwi5vVzLuLCOhbMiki6nmM=:xLnDSRjbvnVpHAU9sGg0qmA1gw9coIREWUdi5megVz4=;
X-ME-Sender: <xms:QUnual3N6gXDSunVHf5kPWqX6zSV_da-OP2ZQzq_EKpVUp6nLurF9w>
    <xme:QUnuatsFAIcNhZxLzCkJB4dkuaiIvwVBvYRSNj6cxCaAYzHJ7LVArAGTzF5KhkOe3
    hI1q1cDUlGruJqlL0kNKsMMVd65fwdKVw_GvE6fUmxFJI5mR73xyEc>
X-ME-Received: <xmr:QUnuap8l6zZZ6ADu7UbQHFD6tdiSPw4hctckQxZFwEwqHh8hmIITjRKZHeI>
X-ME-Proxy-Cause: dmFkZTFgaUn+qN8zY/WvD249UuGoto6ZaA1UpOS6Y/NjMRSGTpdPvTJQdB1AGpCs1OAohV
    2FiWGqFD14+gKwJTds2Sqtgp2lyBLEl9dUH0DroKrJNwldmZGFO9OA8AxcIwXn78XvwCl6
    UTxjcYbkwNdt6C9Xp2Lfwmc+GqJnjkrfpfxXaPL/ejhTIIhm2xYDmhKo0q6/6JBTIJhVZm
    7ilSkX0MPkqaD/DtEj6cW4Tk2X+3uGEns+NC6qfPegvcWFo89T/ajLEZwgfYQkrJEr0Dtz
    d9IEH/0NWR19s46M3lJMIByJMb/W+fGe+POAqIaETGM/ZXb60cJKie9pltbrmiZLtmxumI
    Ok9C3loa+YL1IFfCgD9++ADmdAS7sYFV4dOUjzJYOEPur80bnaOIVIfJd9SW+NTv6+ck5Q
    V7O64kPt3dQJzDlNDUxChCaQ1qfJgjIVrnqcPgTw7WzNRpuyqAAyUSoqfhV0jbTQ5P2oGn
    j8mHWs6EHVsInTLRlumkzHDykZfK/EY0DK5IZPxzzCpdkcHZ8+qqSBRT4jJQPsw00nnMhe
    i2YBjI32K3DdIRZ7QG2U03cXPrVLXiEf6AENnYbCrqELP0zN3SPOnA6cITlk/WGP7z5Tvk
    jBO7gz2Fz0JIBG6rpICLMEv9V6fNUx4PEYNcA77VNNYxATCGUhMZwTOiDpOA
X-ME-Proxy: <xmx:QUnuapSFkfzL10W_gr3DOflIRgsXs-pUI2NOADwxVnfi8hdzEYKl5w>
    <xmx:QUnuanB0Y5J8Md6yyA_kZ44bUjfl69FqF4Q2AsvnLf8u3UuJBfN5Kg>
    <xmx:QUnuaiYnhigLuiX0jK_iCpPIJxFwryOwsArNS1yz7Acig1mLcYv8WQ>
    <xmx:QUnuagLgfiuZ5qhm9y3E1UPowuQMQLPjOEIeMwEtAfTe9pgt6bPEQQ>
    <xmx:QUnuaifxf6jGg0L2AC3BnoMgezqV2djxGuWsC8FF0F-5VKJCmM9KN4sS>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 16:40:17 -0500 (EST)
Date: Fri, 6 Nov 2026 22:40:15 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Martin Belanger <martin.nvme.dev@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Martin Belanger <martin.belanger@dell.com>,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH net-next v6 0/6] tls: perform TLS 1.3 KeyUpdate in the
 kernel
Message-ID: <au5JP__7P_PzwDUe@krikkit>
References: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>

Hi Martin,

I'm on a medical break so I won't be able to give this a proper review
for another week or two, but since it keeps landing in my inbox, I
want to make a comment.

Note: I haven't been following the discussions, and I can't give this
the attention it deserves for now (the cover letter is already a bit
much).  So this is kind of a "can we slow down until we agree that we
really want that?"


2026-11-05, 11:30:36 -0500, Martin Belanger via B4 Relay wrote:
> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
> KeyUpdate.

Because it isn't meant to handle any part of the handshake at all,
just the record layer. The user gives us data, we stuff that into
records and send the records down the TCP socket. That's it.

So what you're proposing is a very fundamental change to how kTLS
works, I'm not convinced we want to go this way.

> And when it receives one, it blocks the socket until the
> application installs the next key. kTLS also does not enforce the key
> usage limit on transmit.
> 
> This applies to TLS libraries in user space as well as kernel users such
> as NVMe/TCP or sunrpc:
> 
> - GnuTLS sends a KeyUpdate after 2^24 records when it runs its own
>   record layer. With kTLS, the record layer is handled in the kernel and
>   GnuTLS therefore never runs the check. OpenSSL never sends a KeyUpdate
>   on its own.

If userspace libraries don't do the right thing, we can fix the
libraries. They will anyway have to be fixed to behave correctly with
only the "old" uAPI, since they can't rely on this new stuff being
present in the running kernel. Or they'd have to completely disable
ktls if the kernel doesn't support this new uAPI, which would suck.

> - NVMe/TCP and sunrpc don't have a mechanism to install a new key. A

And that can't be handled with the existing handshake subsystem? (I'm
not that familiar with it, nor with QUIC or NVMe/TCP and sunrpc)

>   conforming peer that sends a KeyUpdate ends or stalls their
>   connection.
> 
> RFC 9846 (July 2026), which obsoletes RFC 8446, makes the limit
> mandatory (section 5.5): "Implementations MUST either close the
> connection or do a key update as described in Section 4.7.3 prior to
> reaching these limits." Long-lived connections with small records reach
> the limit quickly. One NVMe/TCP queue sends at least one record per
> command, and more with large I/O. Depending on the load and link speed,
> the 2^24 limit can be reached in less than 10 minutes in many cases.

My math says that's 28k records/second, it's a lot.


> Why the record layer
> ====================
> 
> KeyUpdate must be handled where the records are built.
> 
> The 2^24 limit is a record count, and only the record layer can see the
> count precisely as it changes. A user sitting above kTLS can only read
> the count with getsockopt(TLS_TX) after each write. A kTLS user writes
> bytes, and the kernel splits and merges those bytes into records. I
> counted send calls in an NVMe/TCP prototype trying to guesstimate the
> 2^24 limit. The count was correct with 4 KB I/O, but was 21 times too
> low with 1 MB I/O. Each send call translates into a different number of
> records. It's simply not possible to precisely guess the number of
> records based on the number of send calls.
> 
> The KeyUpdate must also go at a precise place in the record stream
> (section 4.7.3). It is encrypted with the old key, and every record
> after it with the new key. When the peer sets update_requested, our
> KeyUpdate must go out before the next Application Data record. The key
> can only change between two records. Only net/tls has control over that.
> Fixing this in one driver or library would leave other drivers or
> libraries to re-implement their own (imperfect) solution.

I'm not yet convinced this is a strong enough argument to justify
changing the model under which ktls operates with a change of this
size and that also requires 500L of new selftests.


> What the series does
> ====================
> 
> - Two new socket options, TLS_TX_TRAFFIC_SECRET and
>   TLS_RX_TRAFFIC_SECRET, are used to register the application traffic
>   secrets. The secret is passed as raw bytes. The kernel derives the
>   hash (SHA-256 or SHA-384) from the cipher installed with TLS_TX or
>   TLS_RX. The TX secret must be set first because the RX secret needs
>   the TX secret in case a received KeyUpdate asks for a reply.
> - A third socket option, TLS_TX_KEY_UPDATE, can be used to send a
>   KeyUpdate now. It can also optionally ask the peer to update too.

Why does this need to be a socket option? It feels wrong to use a
socket option to trigger sending data, why not hook on sendmsg()?

-- 
Sabrina
