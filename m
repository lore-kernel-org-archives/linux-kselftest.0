Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932A3E5A29;
	Thu,  3 Sep 2026 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468488; cv=none; b=e4dliwE9C3RiwYduu2BXdJb9W4T6KgPyNylGOKd4bf+XSR/9YVQK6pn0aS3/L8WfW6ukzprFZKlBgZBEwuQ9keMsPT05J4JTB/jxjrDwI29QH4JrfwdBADiL0Y6uQ+ASM8L7/Aq/EppSQsFk//1y0EK/o9vV2K6/bVGq7eK3ARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468488; c=relaxed/simple;
	bh=0tVHDldB0byJ87vmnVyBzo1m8ktM7L6UglxhruR5/f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdynaIY8FycoxunKgIPKcb3dMvvCtRkwJ3tJozLHCZgF49qVCoDmVuxPL+N7FlhBuUMA4lk9yCb9C8NDnGVOE9nmiqMZe7J/iCiyrnYbcvCifbC9+2HbtBvkxuAkvtwh080pOFx7ArQyFfGL5XZ7yDSGVDL0CuKZM/MmampWcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=LoqpdVHo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xr5+svod; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="LoqpdVHo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xr5+svod"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 35C0313800CC;
	Thu,  3 Sep 2026 16:47:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 16:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788468478;
	 x=1788475678; bh=vYh/59ueWC2tCap+cAh5Pc8XIHLmjRhWP4EF7HGivPY=; b=
	LoqpdVHoHV2WXbeG0Ma8deXG8kWbqjfIDsRmS5QAKBLANiZjMmcOZF2G44wRfhrT
	q7358SjwplUnzRX2gaBPdXs6vNgXQVxYmB7GPRPELLTUanlDrdzeMqxMQKsFPHRP
	9zoUcssP+3izMtkpqDPCOf/dgrGG0qtxNi32ikJKN44gkWRzGzKB0PN3BQg/BIKO
	Ngx+D4DeNTamsYnDa+f5XUeB9uqxq9yI8pQgXIfjpcKQQkjmQNB7FlEAvi6LrIji
	lH5BnFSP4SZUmrvni/2t28TgYULBtkALduDaxgsmkmRhS1n88gzSth1iqBQg5jbg
	L+6bETU0QxcwdqF5Y0HWzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788468478; x=
	1788475678; bh=vYh/59ueWC2tCap+cAh5Pc8XIHLmjRhWP4EF7HGivPY=; b=x
	r5+svodN6ruZd+PRXpsu2eqv87HJ6DWONZKBmSiU70zgW8faYOcBTfmVr/Nb0Y3u
	9mMKXhd+w+bRejySO8Z7OHPs3s76D6m3jlZzFhmdLcNyGsYxjW6eBPEujOjv4xtf
	dtJEG2QxWPXJ35cHNXXpUIZ/NyG9MEYOEQwR4Xgme87kSohzOVPH60wVUUGXXIPs
	Usjah0X8/fcsiyM12/MCOGbtuFlP4y9cLh29+0DG13L/IEpFliJN2mkaUrZWRAxP
	QrcbgxOHQDHfcKlxp5pik3B+CSfII+yC1jSbqiPsPLgrqQX9ZQDPRbWw6XuYh9zP
	T8n0XUB2xhdjxLxdcOBKQ==
X-ME-Sender: <xms:_tyZao2MOcBKruAzVojCz2nnR46A-cBSrNZIdTRcDro4PIvsTToVoQ>
    <xme:_tyZarSWNSfmoiXNIxwNkEIlDeOhjodv-6rS2fn2YPGPSPI6XhQDPb7RjnCT70sph
    OlRUVvd1oCE0Zz5J3Hy7Jn_px3YEuJfivaKljDloTHNtIiB9JcAmKthlA>
X-ME-Received: <xmr:_tyZasekoWZD5vT-bmFoJzKedAwixC_zArvzCCza8NjeM7r7XEX5xktcjJw-ZBp9INqmfaWqHfSTZi-vxEK7HpJqHXmaYeo>
X-ME-Proxy-Cause: dmFkZTFONURqZfnbz0P41q83IrnEBnUQeLNict9qTZuSYOgw/OZgOGbwAgN8bJfthkkaIV
    I4hzyFKmUHvWCL397ElXGN6juxpbuSPv7Nm46rxsOsdIPeHkf5vuiSg2JnsW8iLtrPch7N
    jgTVWDOGoVmZG8jroNefPNoMOcPiyzzLBTFBgoHprYiYJFyeABY1IvrNzRx9zbviTV3xbi
    aoWfDnz7460xs+RroEtKaeJGRUjNrcAvI4rCpxA2kMdCCNHGpm2bdCRpvUezclo9ePP5QN
    EGreWD+jZhkGgilHJQMZWdm58IG9xLzST5+2ZxQeB+ObwI1u3Pe9FcSNXI4a2LePdXhgla
    qG5heHvaxKCWmblHeiaFr/GY+kC6ZqPMn5m5Abt04a9M2zUU6G6LWvmjM7t9JdwP5aY34C
    BQP7nyIXhyqj/+RWnLdsClEw+FumzAiO8TobK5vzXrVU5jVV2KrN5/KRS+47THK/toj8G/
    vUQzzNm5qKRgomk81l/HDbFWKe/flOup7wSGmmtaw3bZKESHjsWLddXpyCg0M5u6ZVM6HF
    tJ8W2u3487a5XAA9DKeH5pyqXwL32hr1Y/3oe906SbT+WIiuhhpw1TucTl7nJ+lBqRT1zv
    NEMJvZGzwYdMMXmfc/M6wNgbI20m6jBPUce6KAQHmfgGFgSY/b5yDB8FYExw
X-ME-Proxy: <xmx:_tyZasd4yshlRNdmoO1heF7F8vdGRgBH2_MGn8dO2S6tbhb0zabyIg>
    <xmx:_tyZam16ekeSsJvRDhf7jX_lIhXgwXkqS9S8Ip3Pg8nGh9QlQudmAA>
    <xmx:_tyZak_hhNLNElrSXmCWysZCd8H8XOTp73lgGrxTsk9VUKnkke-aKw>
    <xmx:_tyZar4DoAvqzhiB1Pi3DnCnSLZBkS5cXmTCexENB3aYu8VzyECr0w>
    <xmx:_tyZao6ee_T23TmanWEeLQDPJP1D3w3BYb30Xrhm0nYn-Xtv9rlRd9HN>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 16:47:57 -0400 (EDT)
Date: Thu, 3 Sep 2026 15:47:56 -0500
From: Juanlu Herrero <juanlu@fastmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, dw@davidwei.uk, netdev@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kuba@kernel.org, asml.silence@gmail.com, shuah@kernel.org
Subject: Re: [net-next,v6,5/6] selftests: net: add multithread server support
 to iou-zcrx
Message-ID: <apncp9j_ie53HgYh@jlhe0197-mac>
References: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
 <178839229706.3394541.1555608492152892136@kernel.org>
 <1cf3f4de-bec8-4559-a4b2-1d946ead0f69@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cf3f4de-bec8-4559-a4b2-1d946ead0f69@redhat.com>

On Thu, Sep 03, 2026 at 01:06:11PM -0600, Paolo Abeni wrote:
> 
> 
> On 9/3/26 1:38 AM, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential
> > issue(s) to consider:
> > 
> > Critical: 0 · High: 1 · Medium: 2 (3) · Low: 3
> > 
> > - [High] listen() is now executed before the workers have registered
> >   their zcrx ifqs, breaking the ordering that two existing in-tree tests…
> > - [Medium] A worker thread that is dispatched zero connections reports
> >   success without receiving or verifying a single byte.
> > - [Medium] The new CQ sizing removes the implicit bound that kept the
> >   zcrx refill-queue producer inside one ring.
> 
> My understanding is that the above 3 concerns may affect tests stability
> and should be addressed before merging.
> 
> Thanks,
> 
> Paolo
> 

makes sense, I will address these in v7 of this patchset.

Best,
Juanlu
