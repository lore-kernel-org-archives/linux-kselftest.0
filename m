Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA52D8DA8
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289009; cv=pass; b=V20Ryo371ugSD4ZtK3M2OvLGtXBdgNEUnMWlVPupLitK9S85RA+fuCfpf7N4XBO43aYpXtnbSF/NbeybAGywLmreyypJ5H7XC5zQbQag03SfpM0ToqPaOzIcaMJuwaRIPezh7EWm3rbNcXvAt6Ajfn4mroqstkCfNJlu7nEeHLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289009; c=relaxed/simple;
	bh=OFvFUXE9xCFsK6/kBrpheywoSYe93LHItZLxp7xrWHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aysHINSqO2AKjDULQOKgEn3HI3NcJx40wgSRIP2iodl/vxQo12uSs1hwUv/rzeJ//oU87ltuSTCiHLsz4ZeyoMA51HUsZtP3Y+UGDqCecd0GoNNxRYC+9fqucW7KRlVDnlr4HUZekR1W7yJFG4VXT49PrEHAi1GPVhe4uaVY0oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Nr0pP7vV; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Nr0pP7vV"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b056d58f2aso7839197b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 19:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792289007; cv=none;
        d=google.com; s=arc-20260327;
        b=Lywb/Y2urW00hhUcXeIQ/5PDC03h4MGTin5sGrqHEWNaZgeF3jZOn0+MnbxBR++xMj
         Eeg35gb2YGatH2k2XHF6otE6QP24zgV+7CH/4GYIS0MrgoYc81KEnuzZ3i1UUwQRfjuW
         +SQUquy10CsSoivL+rmYCqje2vUwPBc5p3xL/FGXpF+nVKMlcoJZe+zKW7p79fVtYnZt
         LVymsARiYUaniw7fo+iy0HAlIC0ntv22f4KocKLqSb4J45Lo/IFph/3Xa6LSJ7f2vwB5
         7bCcr2QZ3WJVIyiAiWEPJIMqICR++K51SoyphlQxVqvkVMiNzvpI7hNEyLB6UOm+M+8w
         66Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OFvFUXE9xCFsK6/kBrpheywoSYe93LHItZLxp7xrWHk=;
        fh=aiAGw5DQkmIe2EYhcO8Qr4T+ju4WEk14CxwqCitpJMU=;
        b=Umo7h7S6JGk5UkzJSaBhn4+CXDt17eGRwNRIM5RXzXgkNCYVNZuUlmgQPtvVf5/VRV
         XFKYEgiCMxF0jv4cu1v+ZOEJ2C4mxUOZmT8AfN9PrC7vRhGj4yZHTbDCSif0FAfRQwYG
         huh3urfzGWuF8zS+nrJxWT+M/pKQkDwt4VsX0Ma5EnTYbXR0Tk7IC6JcGvqzvg70bS2k
         ch7Cvk31ac1zUZiSOYpPjh6L/PAjRmawPP5jlsAGQsnkBANMkXcknCQKbMxIjLnI0Qpc
         6dyf4xrpRoSyuzHkqRgb1CsAgMzP6tS7vhCx/5bwvgMqG0p+laOIRJgThDaS/+HjOKiy
         CKrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289007; x=1792893807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFvFUXE9xCFsK6/kBrpheywoSYe93LHItZLxp7xrWHk=;
        b=Nr0pP7vVL4KeAR6PNJUeqzMXTnHsB97OF6gWi7jtNwt0qBvNOE0UvtQk1UniP2sCJg
         5M/VJIGIjHq+HPOlyRCYGgFq4+hcpvO/Gh7ouWmtqrJ8cOL5UppFYGMlGuMVnyz1Snlw
         JBLVKi3sWjDJ5dn9+KjaPSyVf1n8233GRJLMELG8kbFMKdotnD+w9Bt+04wTuA+d4t8A
         NRkR4oB9cTTtFiV1C3NDR9W40SApTrVU9m6y/4wWZMiNOOTTd3y+aJ/lOH4Z6k2+WrMr
         NsNwbLmjdsJ+PBiQl+QLvuUd2q63FglcqUflYsp2CgrbeXe5k3TQDgUUSxzMjniDk+xl
         XfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289007; x=1792893807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OFvFUXE9xCFsK6/kBrpheywoSYe93LHItZLxp7xrWHk=;
        b=HtJVVjjDXZ+3kqHFwTt+83GZo8uOu4+PQeDaanCQ/E+FkhA2aWv9i9WNqHlqQ7mNMf
         x92s6BTKD0Wu25567RtAHxcGB8gUcIntwEqpq3Fh5Mk9VWwr8T6TqxxZIFxCF/3nG8/9
         X0Votm6snI3MqTwS4d7rFjrdG+oWZnyTIfA0dQ6uc+qxsDQI/iiOSqzdSxWDd2AfkOmi
         SHhpB0OHa4Z5v8iQRb9U5tYdP9rdS6ICaQyZT1ZEr4Ncd3ZR8HL9CsBqdZ4wNvBJwWNT
         VrblnETWVgdFB0DsX6RWIR5Mpcyj46wxiC5HWJdCESNqVvqhzcDMnFw/EjAYDVr+fzCx
         Vfwg==
X-Forwarded-Encrypted: i=1; AKwUvBwLQ28myzxoUGR0AiaWFyHR72erYJQbB5/W7p69Dt2hPJAI0SNSgPz1Xhnp+R01rMgixY0NtvALUlwyicbuoDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvJoFI38jRecNqQCVRwz62hUhZog2nB719wPxK2uZmNxzsJKsr
	5Oe2FsaUden+lX2fDvT2LijO9UUeXXOfmfOV0OvC5CtOwH0gLpmBAM6v1w0bC5zf9yRtYgFxzfK
	eS65u2fkqOlxpMGoyA/fas74fTCNC77/yPAsTP/A3
X-Gm-Gg: AYBFou0f+X9wUcUXuzCEVIeVNdPeDwRyXhHzmdxPYq5jp6ofYAVnrQcVJBt27Q02b2M
	V3ulcvMvFhQgb0gFwarQMw9CMxk1WAvMXWzi7h4wzEydCiv6MlfJTIEK4+Q4+ULPC2qP+976AnW
	TB3fhKA3uzT0G9scbGjx8bzIvPnYeBV6GCjyoVCb/q261VCuNPq4PRCofMWA7NO5ja+lPSa5J/s
	vMUrGU+XMQisZL2pPNqVCYKcGPGQ9nwRtuovjwTG8PC8rKZBrt1zSHL/n2S8Sbg6vpvJOR3ESVz
	qIJ9JCIAGkpQNlx82n9Imdey53hu9iSBTe6in6rdQXr1Rkt+yH8GPLsCjGGxsYf5H0anyZSh2du
	Sjjmok10VnpoY+xjwvcab7g8pf31UxFh4O9nUHwHoFrpJ8Xkfl7OGg9z4GB7GN0AfqOX+J3afss
	J3BFR1lik8gGI1qa2vKahQuBg5D6V142OHF6PtTuBBMDqK0WamR/t81nbVLy7gsSxTYg2ARFb1a
	VFfJpFbLbGh4oCNwYgiiI7+MQG+VzmoFaNkb5L22E1wBVhjpwpA6k/m3V89MX7d5szuiToo6JZk
	MGLW4SEBxfr7Fg==
X-Received: by 2002:a05:690c:c4e9:b0:8b0:f04a:3132 with SMTP id
 00721157ae682-8b0f2163601mr11361017b3.27.1792289007350; Sat, 17 Oct 2026
 19:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171628.3544978-1-julius@bairaktaris.de>
 <20261018015434.3326758-1-julius@bairaktaris.de> <atQoL7WUM3BvDwbI@chamomile>
In-Reply-To: <atQoL7WUM3BvDwbI@chamomile>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 18 Oct 2026 02:02:49 +0000
X-Gm-Features: AclHuK8LcA_x4fXjqJQJo4qGB6xwiKVubMehR2hBrYfUz8uLAdhaaMXVC05SGRY
Message-ID: <CAC1t37JX5HnbU4gPxAE-PkNz=6e_pr2p6ujgEB-3gRi0HjXybg@mail.gmail.com>
Subject: Re: [PATCH nf-next v2 0/4] netfilter: offload a TCP flow whose reply
 is never seen
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, kadlec@netfilter.org, fw@strlen.de, 
	coreteam@netfilter.org, netdev@vger.kernel.org, geldot@protonmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

That would be awesome.

I will continue the development downstream and send the items upstream
after a merge one by one.

Thanks for your time!
