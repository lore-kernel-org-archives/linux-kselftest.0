Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F024BD03
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631914; cv=none; b=bGYV7zcVuJUpudeNQS5JVsXmrFtZlLBqAbKsRu3/AsOn3b2rY57pdOG7RcX/A9VQRvqHLQTotjJyKu9h6P6NTE38ERtW8e4/mCUns2+wo1JfotDpK3vJokxKg3Pq4I+eMG5IkBHuEF5WoUPtdIRFd6/wNwCDDWJmbS+3FmvBrwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631914; c=relaxed/simple;
	bh=jX3YXc/Uj8Q32KvLYO8PF7pOiLM6wUtucx5wZAGFeoM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=iQmezcOhjHsBhutvPdQJDJ3auHnonhoG2L3SMv1KbJIevnpjsV9mgKGr3j0ix0ErtmDOTuBpqv/DvoxR9SAa791TQovuhudgaDIITBbB2WIeZ6sfVoFTZgQ0zUHL64SibhyYKceZrxEZAfWw6X2uu1ZdqDeXWMIgnyPd3AxSBTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C17PSIue; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C17PSIue"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-809b19a7f25so4062317b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783631912; x=1784236712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G00RWwYZC2HViOKTjnb8tJyzSdAlUEMFUeiIIZqhKvE=;
        b=C17PSIueFezg7Sepxpi2zgf0IXoVvHSp1JUg5acNQaA3InHbRhR2N9HVnjjp8/8lAx
         NdKySf6YZm/3Y7WvlhFQBRwVlxOV3mOULA9EyZwy6oOb1/KSZezfbf2UbDBeBrkWvcT0
         zIbVvVYpQU1aK3b+bTkc8GTYLJsyxQi/5wfUllySgE1UYDy1lNtThreSrqIij+Cd+z+Q
         bKzy+vR6BjP5LO4ypZrzA2DZpwggmbb3CeZki0eyXq0Gld7o3ql+Z4wqqQkzEYoB0Vvu
         tDC/epnPeMrCrZ+yRrebWy0VARhNf2Uf7C/zlls0LUmcH41xeG3HzEUGSgbUIxvU1jpX
         apwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783631912; x=1784236712;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G00RWwYZC2HViOKTjnb8tJyzSdAlUEMFUeiIIZqhKvE=;
        b=kur/cLZZ7vqQTrmwJ7/NyOd/ilLVnGVrRZ4O6QtQMOiRv1jE0lZxMQgCHDu0U7KI9/
         UFmLRv+K+INTCj+wv1re5VgsMkqEokwXK2WcGehhi4jiyAkV30y+joWP78FnDLkg1+/P
         oygOeKZbMa69qfW5O/rI7qgXtkpSQa5hem0wgV4X8JfzrhzJzI0glvVb3MwyI4vGxcbc
         TiYutVbpF83UH0K6SNuyttnTiX6I+UbrZHaW5mY1n2dpAegksBiwUSC0Mi/5OlNCk0bO
         XujP4lKu7TyCWw8ET5UGcfYjVbvdqCrkKZYGi3uzDmhdzxHkRHajc2JE5aonSE+y+Lci
         Ivgw==
X-Forwarded-Encrypted: i=1; AHgh+RpjLqOSRYy4tuJXTjuabIggT9THDH6vcE5mYR4pQrAUv0g3HBssrveDn/j0OMp0rOJCIfnLHiZ93SJoYi060XM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyovkmPQ3qYWhoTKLrDfr4mJEdJGbKZLE4QDyEf2vUYcBPJNjrX
	GHH0X/UYGYijeUJkt0eKhXKWkXjHp1OYLWZNAayQB28p7R6imFMnd973
X-Gm-Gg: AfdE7clUch/kJ2y+Sg2pEK17bBi9VegdU5j7DKI1f3rUjY9jl4OqkPfhlP8ibO6G8/S
	IrlK2twCm8jJpnVl7SNhHx3BSpBzQ4kiwfTGBV/l3kimJcgTo2oSbR/BOW57ZK1nSmckgpfNWBP
	0coYbGvsguFmhv2orDSbTixE56AlyL4UIRtV4riggLH/aJtBni2ypMtRymHh1Kegg29aElaR8Ug
	omt9hMV/iNplVOs+SrS6++vJnEl2x9Q0wobV0m+rqHigQY6sQyY4Ww8K/RdJTZvK5grifpSlw15
	s0yOeXRtxMOiUfRdaDVV+Q9u48acPp+KDdy52JawCpECF7iVxhu5HBvyLrXseUY0ijkvFecjG1M
	VfZF3kDK6kaE1OltXE1KqohKqmQ2Gc0epFNAj0dGaBSt8r4x2X2+EQKktjDgOLjtiVQ7O4L7jR6
	MmQ1JbFQs9Pp8VwR7nO56fTFYmxy1gAr2kn7KqAcEWfGeD4L50zwWf+yaE2z/8AMl3mw==
X-Received: by 2002:a05:690c:9989:b0:80e:3d45:5206 with SMTP id 00721157ae682-81dbe755af8mr77147287b3.18.1783631911671;
        Thu, 09 Jul 2026 14:18:31 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be904a4sm29435337b3.7.2026.07.09.14.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:18:30 -0700 (PDT)
Date: Thu, 09 Jul 2026 17:18:30 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.159e777649f4a@gmail.com>
In-Reply-To: <alAAXv60KUZ9KYx1@dau-home-pc>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
 <5372ccac062193147e02b991d5328a5c3fa3a85a.1783372173.git.littlesmilingcloud@gmail.com>
 <willemdebruijn.kernel.2a3e532d3c28f@gmail.com>
 <alAAXv60KUZ9KYx1@dau-home-pc>
Subject: Re: [PATCH net-next v6 1/2] udp: fix encapsulation packet resubmit in
 multicast deliver
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> On Wed, Jul 08, 2026 at 09:24:10PM -0400, Willem de Bruijn wrote:
> > This helps the case of one encap_rcv socket in the multicast receiver
> > group, so is a useful fix on its own.
> > 
> > But is Sashiko correct that this would still leave the same issue for
> > other sockets in the group? If so, something to address in this series
> > or leave for later?
> > 
> > Might be worthwhile to extend the test to capture that case too.
> 
> The clone loop is not reachable for encapsulation sockets, so there is
> no remaining gap.
> 
> FOU/GUE tunnel sockets are created via udp_sock_create() /
> setup_udp_tunnel_sock() and do not set SO_REUSEADDR or SO_REUSEPORT.
> Without either, a UDP socket cannot share its port, so an encap socket
> is always the only socket bound to its port. In
> __udp[46]_lib_mcast_deliver() it is therefore always delivered as
> 'first', and the clone loop -- which handles the second and subsequent
> sockets in the group -- never runs for it. The positive (resubmit)
> return from udp_queue_rcv_skb() only happens for encap sockets; plain
> UDP sockets return 0 or a negative value there. So the resubmit case
> in the clone loop cannot occur.
> 
> For the same reason a selftest cannot exercise it: a second socket
> cannot bind to the FOU port.
> 
> If useful, I can add a brief comment above the clone loop documenting
> why no resubmit is needed there.

Thanks for that context. No need to respin for that.
