Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197321;
	b=rhitFq5cQHFdazw+51AIqgaRjgvXev/aLbRrYzuBwjUm12nYW2MeqBXF9Od9KSrmQLCJ
	 c+HNdcTysfeqE4/hWlAzKa5w+97TjlH/x0vyC+pgEHODPvkMUPPaQBTih6pbWyAIupX3v
	 ztcX2gMnsgCO2IgpvwKutdvLXrEj76VcRogdCUoyKkWNKK76Rzblm9d1DW9+z7FBGF7i6
	 7nGUauwE6YiGZXxQdWDz+16SweybglWokxtE/7rlxL0YJpec/sneKeZmynHGu/AlGyvLB
	 PaO7IzznbH4rqH97p9RIiO2EadFJs5pEyl2YGJVrTzjyIRB/HYxPN1zh4d+t7rLoYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197321;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=2DFl8D5AbpYniLCVgRy/mQv0p9Nen7WB6MhNchHMoOY=;
	b=bfrqykSekg7Ju4C/elvg7/RS7CSlH+f0KaAJfF5D73HgXc2eNegcOIHH1A0pJnZ60IHo
	 jfgsFq3pSXrNJxSW9EZO10oW2J/mq1zvylzNkNn6bXABQFTP6FS5Hw5NFCVTkPT+Ywbrb
	 u3BnLxKHm4FP/M31DWQmeMAGv/kOhNnRdj1YutfDq9X6kJ8fq86tCVNqRjnQ87AktvB+S
	 +B7e1w0u9kfIcm7wcdGE4PgsZmkEKGfkIxbvh9vE31ncS3RnzbYmN96/686sBpR4cF83v
	 ZcyDHkogqXORHHFCYguAu05CIBbf3r1JqEoTOHMhBJtuYCEr2vX7u4nDXoyH4I6ILQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GV39Z3BM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8A606A31A;
	Wed, 28 Oct 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GV39Z3BM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5BB1F01825;
	Wed, 28 Oct 2026 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197320;
	bh=2DFl8D5AbpYniLCVgRy/mQv0p9Nen7WB6MhNchHMoOY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=GV39Z3BMq8guOH1JNEh5l5Ykd0J5SIsg2ewcgDSRWu+Futb2/mbkTZyplVKkgIy7S
	 denrPoKvlnuvGNbYRIa3C1LmYhjR9Toh312qygfMtacXZCv9ZioO3kmFDFGNSeDzFY
	 21gJQLrzZpGgOHU1eBnMoBfgw2UhAmMxlmbbJAdYn+ehZwezDpmbqqaxng3cAWHjR7
	 kO3dUSJM3+nP0n23H/3IE81cCJjblZjitfUyEKfWzR2Hv/zzsZs3lSZb0gE25LZIzH
	 mKHEDfI8y2wMeYD+i4rul3lqLYJmQT21fKUI3R8RwbXn8qqvsZcnAXsblNvOpSDqBc
	 GDDz4IduI64fQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 642FEF40067;
	Wed, 28 Oct 2026 10:21:59 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 28 Oct 2026 10:21:59 -0400
X-ME-Sender: <xms:BwXiatPXCbP-mp8vFfVEJMQs85u7B0HKspOfkV-WWhxo1jlFOGDYSQ>
    <xme:BwXiaqxKK99o0iUCmiK9H7aiVLnrpQPFHvKbPB6TGwcRRN5Mq7A6bdKSgKSK-m7Me
    D2FEMI-lc3OlmHDzit-D2MJXv0ueoVMlI6u5qtVFzn3qyRO5QAv1u0T>
X-ME-Proxy-Cause: dmFkZTFFPdKSGxXAGU90y/2PmLAq1d3yAok18Viynk+2E9Rp2Jph1WStD7I9eXrOzvN/h4
    61kg/APA9V06T1Kntch14dq3W4Vw66kbX4eOYXTe67S3R3s7oiEQcFyDCzreJ7yGIqragv
    hE9OtMEDbHmYCl3HSJu833sj/zOLrYAD45WtbQ6LkNNHizBVEgtvJT9sjdQnaKYBKOQlfw
    wHBcMT2xtjlZWltOAFGN0MOE0Tiy6kPoqtqyiD/YLFKo+v9KocQX5DyHDK1xJwXTBtdpa3
    OVrn6lPPAZVaD1/onu0X56dz7YRI+G5JUqq3E3cTnQIhz9doi2pLkeB+ba5DY1wKqmhlHA
    diD/2ofebl1gXJ83jFfTDjMJVdlEQ+JzVHweoBegGXd57xbf3sMwHTXNwdLGkyazFNH9xI
    EtXZUzfOP9q2qzYbj0QBefIMUmhThE/MygZdbt/3qNM6pK7u17QZkJ+YLX6Z/Kcg6LX+JS
    lOGXbrbCeyOHrNqNsTSfxSZYHa2YFgOHRhGwddC7Pv/IXS/3EGf8hkAx9ktG6Fv3YQMM/U
    Vi+67yixenT/XoTyvaUUoTPQLwI93Ha9QPAT+zUqZ+e4RixPfStCOnySgh4lKlsEE1bFYk
    OWxIZdhFQZjcx731tdvDm93YNNqub2FsYP26/FXoSyNyRcP0swFtW3uYAAsw
X-ME-Proxy: <xmx:BwXiat9SZVLNiki8y2LvBHRWb8LvWjSZZAVofPW-HHPQm6hy_YDQ1A>
    <xmx:BwXiaiJqmQA2uW4lydBfo3mAkA7JbP44z5pp2oDZXeDu6uXJtGD0rg>
    <xmx:BwXiagcAwz61a4Hy4EMbuCVJ2TSMNQkMHytj2PSHuaTWFKQT57CRvQ>
    <xmx:BwXiavajuRnu-Ta6mF9EPk6Y4IbkqLZ0kXGwkX8FTVlwaOiK03OTCw>
    <xmx:BwXiamBM2S-DzU620tQew_1DvMy718vukuGPXYrKvJAtUK9MZXyQbUBy>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 32AC3782738; Wed, 28 Oct 2026 10:21:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ae7b_N49t5D-
Date: Wed, 28 Oct 2026 10:21:38 -0400
From: "Chuck Lever" <cel@kernel.org>
To: martin.nvme.dev@gmail.com, "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Sabrina Dubroca" <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "Hannes Reinecke" <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 "Alistair Francis" <alistair.francis@wdc.com>,
 "Martin Belanger" <martin.belanger@dell.com>
Message-Id: <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
In-Reply-To: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the kernel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Oct 28, 2026, at 9:52 AM, Martin Belanger via B4 Relay wrote:
> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
> KeyUpdate. And when it receives one, it blocks the socket until the
> application installs the next key. kTLS also does not enforce the key
> usage limit on transmit.

No argument here.


> This applies to TLS libraries in user space as well as kernel users such
> as NVMe/TCP or sunrpc:
>
> - GnuTLS sends a KeyUpdate after 2^24 records when it runs its own
>   record layer. With kTLS, the record layer is handled in the kernel and
>   GnuTLS therefore never runs the check. OpenSSL never sends a KeyUpdate
>   on its own.
> - NVMe/TCP and sunrpc don't have a mechanism to install a new key. A
>   conforming peer that sends a KeyUpdate stalls their connection.

The design intention of these consumers is that they are supposed to break
the connection and create a new session, rather than stall. If that is not
happening, that's a bug. KeyUpdate is complicated enough that backporting
to LTS is not really an option, so that bug needs to be addressed first,
IMHO.

The argument that was made that put tlshd in user space is that we do
not want the kernel to handle something that the libraries are already
good at (IOW, mechanisms that have been soaked in commodity usage by many
consumers).

Is that rationale different for handling TLS KeyUpdate? I see that the
series adds back the HKDF functionality to the kernel. That seems like
an indication that KeyUpdate should be handled via an upcall.

Are there policy decisions that need to be made during KeyUpdate (like,
has the peer's certificate expired, or has it been put on a revocation
list in the meantime) ?


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
