Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6649EC72;
	Tue,  6 Oct 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301530; cv=none; b=Tc+cXb4i3lIyp4aaOb6N03hQhS2633Tr9PcLCZqJZLygRT734aZXXgWxScx9H9O2Z756VFosRiYYxLRx2beGOx8ajvuI8KglVlfuQWoy+8HOZTZBV1eiwcGqv7Km0QfusiePCN0tVziKPAXvEJ/FH0Nb6pZuoZWDtVfEAjQKD9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301530; c=relaxed/simple;
	bh=X/O0I4LpPHtogNMYtXLD0WCzRBADDWNhnD4zHqvU3RY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Yfyh/09FXQFQTlIa89NnSpl2Zu7CWqmbDZ0aakf7pc/JB8r6+AZ4RK8R9D/EPZYdJ7gPU3g6cyJ/cKuFkPrabLRLwpZr8hdhAQekoBlBDEYq0OqkAINjCp+hxqyFI209S/LoLpTu0M6OT28dD00KG3aVWwiyFZaAdaktJYIj+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NItb0XBr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NItb0XBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DA31F0089C;
	Tue,  6 Oct 2026 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301528;
	bh=vw3zGUCrHcTccKtvmlM/qfJrydp6xrDKgIoZYr5Loyk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=NItb0XBrAt2PXTnmfB79KTCSqCwM3orsrSgIf/SvhJaRKpn1W5DWIe+Iwx2bVy3dt
	 PiNn7siSqk0uFn9zNxSziYMVgQgHBTJcbxXzxDg6Q0+8F495n861C74W9Cef41Z8WN
	 Sk+zRR4tlj7ogKHSuOKr44Or9SfUkwiDOj9trqzV9hLw5EyEOehb2YTahSPwftkERN
	 wTMwHc/G3nO1m2ap3Cs+8O2yL4Ih9BcuBpoeBoTmZXL3QjCM6a5dM/UeUEM0kfEZUY
	 joQT9lngK8I5mJXNDpy8ml7ehC+GIjLQ4FCcscwgC6upHNOPYjTEllRtFfhNcl4vhB
	 dmPLkYDyEB/TA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 38A80F40068;
	Tue,  6 Oct 2026 11:45:27 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 06 Oct 2026 11:45:27 -0400
X-ME-Sender: <xms:lxfFaootPAhG9MHphiDANkNpUUJgAv5262PHtq2UzK3v1l0D6iOQDQ>
    <xme:lxfFapczUBXz-0k48pA8cT8-EbnNZQhbPJa0sx4Z_oI1gcyo-DN3m-K595mlAfJLl
    T16gneGbmo_mKPd2mm5wrQrYvmZgIdoZHAhtvaoeUUtjz-En9w8e0A>
X-ME-Proxy-Cause: dmFkZTEETS+GD4maES+3ru+sYQ3899595/uPTf6cj/2mYXB8gx4Uukgx9LnTRm2rITM88V
    c2MTpgOX4mM/V1HPUSuZx8Vu61Zqx1WzwhiO1WzcD5deNHLzLmuvuVoPFSIX+6zAasJAGj
    psvgsn8iKNmHJsVsQMqKkWILmVpDsgYaHjqoUTHk95O8lLFkSrIAs2u/+8U5UWw5ISlJEU
    fzKpFaI5GdQsvdI95JjUVozRtE+QgEDT+Ep7hpfqq7/yHT9tFCM0f/C93sr83pcYCcZCR+
    vDJjdoMTWBaI8pELhMlfD7V2fHiYiL540DOKLnrRucGlUiwWFEYySUPBKqk4RbTSNTFOkO
    FCFLIwhYLKR3lDRkrmqQ4jY1+Ly1NsFTPkxFc32RAjLHE5VGIY2cWplfiJiafekuMf1G1n
    M/QOtyGQsnoUHlFWITyAa/kYYRyZZE+9s5XwZBFBkM8uBEOz4jEENBmlNOPO5okL1SBHQV
    WtkoLG5Zn5DtICren+qlaD03np8P4JsyQHw9yWjz+2MiecOPgZ8LsyCsp2ZHgPgyPbfBpP
    nKDEVsUiCcqzQYhP0F4sOHQjeqpzqKjOR0SDTpKAnl/TMJa8oSv+2Wo57bK0f/cV96KegI
    ag1cy6F/UXquqw2FtwYFfV/CZaT8EExMzXADMlL6PFBRUOGHvNrER8inKUjQ
X-ME-Proxy: <xmx:lxfFardONSAZ0w8IGevbVn6mGVWSRZpdq6x0e5vXNJDba2kA9oE2hw>
    <xmx:lxfFat45yeszoiqagDJF7RyhpXVx7wYtQJdMW6MP35BuaaObg3qWeg>
    <xmx:lxfFaob6QIXx5U-Yok--slkHD4tFv--P2wk8AGVxZpfSmR3xl1SbFw>
    <xmx:lxfFanECDeNV8_yCm4a_XFYRAUqPRugnyjEIsYE2jZ6TxHeq4tMYWw>
    <xmx:lxfFarndXmLCpdTT6IVZrjgBFg4H6x06BJBXaHK3NkmfuU13zEABAmli>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1BC78780070; Tue,  6 Oct 2026 11:45:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3tzHq7RhY-3
Date: Tue, 06 Oct 2026 11:45:06 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <8f5148a2-fde2-4156-b4c6-ee573cf46539@slotpi15m67>
In-Reply-To: <179124254296.434549.14396716806687989116@kernel.org>
References: <20261001-tls-follow-on-v2-2-2dd1947bb642@kernel.org>
 <179124254296.434549.14396716806687989116@kernel.org>
Subject: Re: [PATCH net-next v2 2/8] tls: check for a pending signal after an empty
 record
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 05, 2026, netdev-bot+sashiko@kernel.org wrote:
> > +		if (nodata && signal_pending(current)) {
> > +			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> > +
> > +			err = sock_intr_errno(timeo);
> > +			goto recv_end;
> > +		}
>
> [Severity: Medium]
> Can this errno be lost when the empty record that set nodata was decrypted
> asynchronously?

Yes, at this commit, with TLS 1.2 and an async AEAD. The empty
record goes onto rx_list through the async arm, and recv_end then
replaces err with the zero that process_rx_list() returns for
async_copy_bytes == 0.

The same assignment already discards the -EAGAIN from
tls_rx_rec_wait() in that configuration, so a nonblocking reader
gets the zero return before this patch too. But the patch
description promises -EINTR, and at this commit the reader does
not get it.

5/8 stops decrypting empty records asynchronously. In v3 that
change will move into this patch.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
