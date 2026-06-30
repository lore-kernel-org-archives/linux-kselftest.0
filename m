Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431F8287E;
	Tue, 30 Jun 2026 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782861054; cv=none; b=gMsF+9P4XRj0t109j+PO305ouw1COqzIKYccic2YzrDt8IwVS5sbOOdtBUAJflTX6kAIjzKP0XA1bqwC9SJwC93mOKgCP+O+oX5kULC6OueV3iqfUawjDzmTjxskRIK9VJ3KdONrBVn7nj7Bqe76rWQJ22EO0sgZslwXJ8mY+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782861054; c=relaxed/simple;
	bh=AL4uozShYOI1kt0IXqbXn0Czx/rrSXJSZBL/coKto0I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxXFx8lo0Rn4HZMeKKfldCzcJ3m44Dg6vw8tQ58wJO1JVCHR2/PFWaZmyENuuAksQGMhM22uHaBSUlwQ0AeA1z+xKmCpkCe+L1BasvexwfELJVCYCpIiMs6F9NLxtvRTnf1jehaBy7wljO+Uga3if0yRNp7l5duTZxzf4tH0Qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOps5RWp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOps5RWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC241F000E9;
	Tue, 30 Jun 2026 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782861053;
	bh=tcyq1Z/mLzF0BxxZDLST/jGqYX4Y9mNzgVvE2Nh4lc8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kOps5RWpguUX6bjMG5yXxLNm4QMUn3xAuOSq4hP0Gqq9p0O5n9O7VHYLDuWRJh69A
	 2x1jujG2iBOGpeqmT5TpSrmZzBotaeFPWnkHESIEYXae0/GL+lBGPnDPgHaHaj5sRU
	 S1zlZ1lhd88e3WVDrs7ZKA8+rKAaBvH+nX8tvCRjLWRPQNyVq5oGufq343oWNmvc+J
	 RTPJk0D6OQPMdWCv1VlS9VbWqR6TGdsKhFh2FT0caRY4CrBFem39t9Zx5i+d4JMFXu
	 LMYUuzwRN3AStVOBsa8ZuK1ZJvxZ7ZCyXr7P+UH58zRtbejA7L4g8V0BUD+IKoG2Kj
	 YF+GIC6S3K8WA==
Date: Tue, 30 Jun 2026 16:10:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, noren@nvidia.com, gal@nvidia.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: toeplitz: cap the Rx queue
 count
Message-ID: <20260630161052.5a6c2ec3@kernel.org>
In-Reply-To: <willemdebruijn.kernel.23684913d1fd4@gmail.com>
References: <20260629234354.2154541-1-kuba@kernel.org>
	<willemdebruijn.kernel.23684913d1fd4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 13:11:15 -0400 Willem de Bruijn wrote:
> > +def _cap_queue_count(cfg):
> > +    ehdr = {"header": {"dev-index": cfg.ifindex}}
> > +    chans = cfg.ethnl.channels_get(ehdr)
> > +
> > +    config = {}
> > +    restore = {}
> > +    for key in ("combined-count", "rx-count"):  
> 
> This assumes that combined and rx are not set at the same time.
> SGTM, not expected in real devices. But technically they could be.

Ack, some tests just assume the NIC uses combined, which is most common.
If this ever causes issues we should probably add support for
provisioning min/max number of queues in the env setup itself.
IIRC someone even posted that at some point.
