Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993582;
	b=GC58+RLs0pCTyGiwWyWdLwAx61C1vF55T08eCENPJAV7RVbm4ff9RV7/kmbpiEjMMCNh
	 N9ZiBRQtEPEcI4z5XT+de11uWo3qlVRj0N6++H5xWaDpwCDf7OXlsYGcGL02VEgVeEA/Z
	 UuWC3bFer/SnBCC1mtyVMw8Wz6NdtDYnm/jq9YX1A8W1Xt2YvjcAq39ZscWgo1z8hUv7L
	 PGu3xOyDWkmpb8Y7ax5+GgXnPMtnHrdxu2mHSaNoBjLPEludJCeXk6ITK/wlMY72VgXjz
	 9i0UbOKn5F08UJy3Qp5Xi7M8uGsOXRRnUCAB76xQjK48WyXmRVswlNyh7RD3/FI67Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993582;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ri397ivyt6aPfQFFNso09dyLrQMfhGhibx0HBwogbaM=;
	b=POaGIYCE/2+MbhAZoTOTGqXtazViTEVjTMasMftVw9eybcWWVLBwJ9J3NnzwCCfrukp8
	 2OSi5FrjMnTXzTXQrZamjc1PmNjeZX98PX2CGStyKHFMVebAJg3pOXdY2Eo0hA14iY1pD
	 u0in65YLhhImQDiWQU1pyYtKbYHvlKFYm1Mw0cUJzPb0TdVdWtYjwJ7QY8H2Z3JNUy9hv
	 WWCim1TP5smGhB++U3/b8HMerxZi3YcS1PRUp+v2dTNvSdTMr7QOy5C4UKRNTXfNnkmKw
	 GAHywFbr3UUOzb9cDM8J+JAuQJ3qoUTzaphnmvSo/8oD9eNQorsHuAyAnf6iYQB1zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PRn2oYbE;
	arc=none smtp.remote-ip=91.218.175.214
Received: from mta0.migadu.com (out-214.mta0.migadu.com [91.218.175.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645C606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 09:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3645C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PRn2oYbE
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yz7Wt5y85at5AxmKuuWhCUSqjxdfBYCurbD5eS1YmfU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794993580; v=1; x=1795598380;
 b=PRn2oYbENfLPgMH7rdWqUIVdpLCQsd7QQYZNfW2Odh37z6+IsbFCYyKG1TC9IJFmzS4CyXkr
 yqIC4y3qBKfl4cg3vnyAy/K+RED+RV8EQCYu3hvUofM4jgl5lK0GORNEYp0f81/vIdJ69KPteEv
 R52est+iZkMBiRaCpWSXfKIs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a2db3085dd474efd;
	Wed, 18 Nov 2026 09:19:40 +0000
X-Mizu-Trace-ID: a2db3085dd474efd
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 17:19:24 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <av1tnEmaTM2pAtBc@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
 <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>
 <av1OftpFCWPLimPx@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av1OftpFCWPLimPx@fedora>

On Wed, Nov 18, 2026 at 03:06:38PM +0800, Hangbin Liu wrote:
> Hi Andrea,
> On Wed, Nov 18, 2026 at 03:50:10AM +0100, Andrea Mayer wrote:
> > > > 
> > > > Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
> > > > review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
> > > > fcff:4::0af1. I think each adjacency should have its own SID. The
> > > > SID could carry the adjacency, as the C-SID already does. Then
> > > > __setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
> > > > as suggested above, would do that.
> > >
> > > Hmm, do you want to set the adjacency like xaf1 or xxa1?
> > > e.g. ffcf:4::2af1 for 4>2:psp:End.X, ffcf:4::3af1 for 4>3:psp:End.X
> > > or
> > > ffcf:4::42a1 for 4>2:psp:End.X, ffcf:4::43a1 for 4>3:psp:End.X?
> > >
> > > The second one may also need to adjust the End address. e.g.
> > > fcff:x::ef1 -> fcff:x::e1
> > 
> > The first one you propose, fcff:4::2af1, seems reasonable. The adjacency
> > takes the place of the leading 0 of the Function (0af1 -> 2af1). Towards
> > the host the 0 stays, as in the C-SID, and the End SIDs do not change.
> 
> What about noflv? e.g. 3>4:noflv:End.X, should we use addr like
> fcff:3::4a?

Oh, I saw your example in the earlier reply. We should use the format like
fcff:3::400a.

No need to reply.

Thanks
Hangbin
