Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8579D3112B2
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783627877; cv=none; b=jjO9sbj2XVHCKeEZPcNMxY9HFNxT8bI8cdm3o3TvQDsUUJYMnzjaWbvj2mVWVeEgW3m1MD1Ml7katFVM54ag6eMKicqpQ1TPlLZp2iVocemorgWrIh180fwMDUTEh33+J6Xe0D4/N+k1heTymQun8pW+HomOszbPHPifHGWqMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783627877; c=relaxed/simple;
	bh=4VRlIT3ZBlyJ4lDFsiB1qMzVSbBMDnfmen3AFlovMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etYWkbw64nP/hba0gxb2z2GAFv8o3SbmcGsLt0WQ/OIreyDhmM9UvVXROz42XXdvnBOezCzFCKgSaoRmyH1M76n+oZD3gKaXfIiCm0Czyxwsq8FGrXy4XkSxP150u4MWZ+y2WDwXGeITdEPT7ns2+ClVA3la+8k5/c26Z7RfBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJQGrk9C; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJQGrk9C"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15e2dab83eso40603966b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783627875; x=1784232675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yROAaYjafivesMnTmLgsnm47xYMDJuFO4ZbZMka+vDE=;
        b=oJQGrk9CWVLaFCLsiZ0uV6nVFSUAmJQW0QLImL9n8gQHD9UiSfrxfXUY5+m0GwIY2E
         nF6qmBNS3tvIW30ScpuUiCbgDLPIJcpKrLDcB7CjetAR0tWMRliQ9+18/9SWFxk7SRDq
         723d4JD3wT858Ly6av7rcWPmylQSGw4mHmX5aojlzx1yODB1vDvROmWAjAskpvFLq0+S
         y/FZ9T+2Vs6MsXVV9nFiTEXIjwqzEOf6WWOUKav7wt65lZIF56fHRMK0qLHvtyY1mRHi
         toCd3ANxa1dErysegLgkKz1s+hHCehe/J1NnRA9QHmvaQs3SVvaJPC2WCpIKe8wvxmMo
         FPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783627875; x=1784232675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yROAaYjafivesMnTmLgsnm47xYMDJuFO4ZbZMka+vDE=;
        b=NGzbzsoTTaHJtVUpaFOGvzaXgjfb12PuWqV+Sp2Xba71yS2BzU9jk3FvW4Fy2VJtMa
         zVOJOIxdpSLG5a4DQ2J8oopW+7kCSmK6mjpgbIdTO5MTemCI/CNhZFcil2d5JvoWH9o3
         TyEieQbrDaMW+9TpDl0jnOOjGh/HDf+gaMUUzpWOMy+98PNPTrT1it+eEIUVXQkxTgKl
         usklrVUMqUfF2VXq7XX2FnpifyufAAZpE7gcfhlVEVw4xROtOOQZuNoOkWLzE8gBxCdH
         tVC2NNkk26UaxKx/tp6sg+kvsnuU1j2CjNhRuuQGF2MDAAfJyTuVmxeA9KbjcRu6EoS/
         4Skg==
X-Forwarded-Encrypted: i=1; AHgh+RoaGKq21+d5oJXwq1mc+LZdvyFm50VpidK5768dfQCuo+hN6hmaXAmV3hUHv6HHb1M+K42wB8nxPdR3VE0ireE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGcFX8cyo5/jfqyEwpRIJUXsacS2rA1rh12I74l9GO32xQTVJ
	NuaQZJvY4fgCM9f6TuiPtNU7N1R6xhMCfdZCtoqY+MUb2mnMOMWWAIOY
X-Gm-Gg: AfdE7cm70zzyxK4mZK9hrnmGIl5nkRcUiGbTMm0QmLiR6wmLTINsRfTanWc47rh9sdg
	T15WYLuN85utBpStDBSs+N1bflN5hG4CQxhk0hbuee2d0m2tTT1c3Lp1pv3ofaVOE6pyMeeFPao
	PZrx0Hk0MQZquzh1AVJY73vroglQ30bYrGVpQBuGhl9vuSJLe39v5xrbPbH/4MxddPvapk+soid
	2XgkOVix/lARYoNDJ3EPdHNYlsyBYeBIdJ+jUO9XjrBQaRiSVmbfb56NtJY24RAIrOXlbALiNHq
	mswE7tKDYzttEG4cKC/+xWkpnouC8KKrYk2s5kVw7icpO3sJ8mBoKntqDfc5O0UDU2bK203HmvP
	mIMJzVAaExNatPcGWYJaVQG9BpPhL9dt3wJxobzn5WLMzxqfKv+OA0lA/VsSpMqrwQ8PBti7tL0
	ufFLmyrnGBHch74sGEd/5hs3jvjqx0MegBYAbhYYB6FtVCDzeAC04Xd4aHgf6D1IC7Ig==
X-Received: by 2002:a17:906:4fca:b0:c15:f704:4e05 with SMTP id a640c23a62f3a-c15f7044ea8mr74668766b.38.1783627874887;
        Thu, 09 Jul 2026 13:11:14 -0700 (PDT)
Received: from dau-home-pc ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm308319666b.44.2026.07.09.13.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:11:14 -0700 (PDT)
Date: Thu, 9 Jul 2026 23:11:10 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v6 1/2] udp: fix encapsulation packet resubmit
 in multicast deliver
Message-ID: <alAAXv60KUZ9KYx1@dau-home-pc>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
 <5372ccac062193147e02b991d5328a5c3fa3a85a.1783372173.git.littlesmilingcloud@gmail.com>
 <willemdebruijn.kernel.2a3e532d3c28f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.2a3e532d3c28f@gmail.com>

On Wed, Jul 08, 2026 at 09:24:10PM -0400, Willem de Bruijn wrote:
> This helps the case of one encap_rcv socket in the multicast receiver
> group, so is a useful fix on its own.
> 
> But is Sashiko correct that this would still leave the same issue for
> other sockets in the group? If so, something to address in this series
> or leave for later?
> 
> Might be worthwhile to extend the test to capture that case too.

The clone loop is not reachable for encapsulation sockets, so there is
no remaining gap.

FOU/GUE tunnel sockets are created via udp_sock_create() /
setup_udp_tunnel_sock() and do not set SO_REUSEADDR or SO_REUSEPORT.
Without either, a UDP socket cannot share its port, so an encap socket
is always the only socket bound to its port. In
__udp[46]_lib_mcast_deliver() it is therefore always delivered as
'first', and the clone loop -- which handles the second and subsequent
sockets in the group -- never runs for it. The positive (resubmit)
return from udp_queue_rcv_skb() only happens for encap sockets; plain
UDP sockets return 0 or a negative value there. So the resubmit case
in the clone loop cannot occur.

For the same reason a selftest cannot exercise it: a second socket
cannot bind to the FOU port.

If useful, I can add a brief comment above the clone loop documenting
why no resubmit is needed there.

