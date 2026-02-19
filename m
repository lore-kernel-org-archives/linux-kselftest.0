Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902D2EB860
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771517169; cv=none; b=gf021tAELPBQwip03yWbc5JQJiswdXQDPQ99t2ax5oubuZh6rcrEOWQsw0CnZSojyIPRwZ124MkU0Az0aMSJUv2YALajYveEa/Mq9pJsww4cPfyPNBEtSqLYPkie991BeBwoMlFUZW1octM18LijiLwM5AonvkkQ83mAdeo/Cx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771517169; c=relaxed/simple;
	bh=4yMC99NeJMMCPXT8o7FBF9zbcjvh5tyBVPAtjWfERlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rc/MWkk18RaCiumvXVawGEfo2D+1t0XNgmP+va0+ZXQG3wDiUDZhG7g/Px39QqNRN5rD78b6JauCMBtyg917oEj7MrnoijSs3ZqI4OYc4tE33UQ60h8FR9JkD3Dh785gCKeUn+WI0VmLr1bc7w0dNWBgrBMSgLU7KugS28JL6x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTKRA9Yb; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTKRA9Yb"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-797de0727a4so11079437b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771517166; x=1772121966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJXEV0fGE0delcXeFKX2uACQoYyrpadO3o4R7qcFW9g=;
        b=KTKRA9YbazNu4TqwFhNxX59aOrp4Bfarg2kUPhdqFTSL+QYD0G35e6yUd2F6zM4TFs
         pQyqh1x0isberlefOWaH84y4gz7qinX4PeFFvXAH+feHCFxnRT73YRCqwsUZyD9phlga
         cueD7ZcuWCwYP2C7oXyDClKe3Af0YGZapEECrJY27ZqN5s0Gnhv8lMgvNGKL9wgXLuLP
         m6RLkbt04EpZ7JRtyvL0PuPsJaciyLOyPIyjTewh78YblNhYi4060Tg+hfbgyhvymz91
         3WkBX0b2MATxczn2pB/hBzLPDmJskzMw0gjo8bgdn7Zd1EEHClku4uNHywliEt2sBjPw
         zTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771517166; x=1772121966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJXEV0fGE0delcXeFKX2uACQoYyrpadO3o4R7qcFW9g=;
        b=gPUXI6I4hZvVtfjHZ54fHnn52fUmwb3GNPQeRLaG9U2KbOrYUb7qz4y25Fo9vYITfO
         bMT6NfzxJPJP013JDYEblogMqMTIX3bit/i//U+LryL0U2cRL5gZj+UocMJCZh/H+lQL
         D/1NojMu3ngycWEUQThoxzW8AE1SwavJB/wvbvZgHaauZjpZM2+dwH/hwHumM2gF3yVR
         94fYIN6jiMQVHVqCuMr8jYmBlOGaLQuasXNF9ese6pNXcEySI/Qr4LNa3o0G0rqRCuvt
         CySmfR9jmQlZIc5eny+//4ZjH7i9+vISoncX40GCNxqbYhJUGjkWDGrSRtHPc0e+kQ/j
         LoJw==
X-Forwarded-Encrypted: i=1; AJvYcCWPHFFKFPDW/Tng4qLe2VHurkcVYGpZeVcUNuu5HU5TSaYEMAimK198P+hqRtPYjmVxWgOuVt2GteaqVKIgDTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylumocsy2kWSl/X5FWwFDhsfxnxNyoIZ+g1qPfryIu9tMyj/np
	bJ4WVzN4GoDnE0GUkMUJO9VlbHCh+iaAhlt2He7twZ2YaCF9UKqZ6Jbo
X-Gm-Gg: AZuq6aLBlYjUjY/DEk3g3ebK1fHzXn6dYsp4urSer3mf9CvfU+ZQdZlsC6+4H+9aU92
	uAG3LNeIGbYwuWppkrHM9CkadrKc165BaZnESV4hG9KY6of8JWfVRq59UpitwfxjTFCu7C9KMLH
	vbG3BZC5J5Dye4aWy7W9Y8NZnD+yBD2pDegy5jOzKcopUT9EDwvWkMTUr214v10kXbRsJ3te12v
	O4A7R8LyUJPnzNu34OFNpJgPfOfHr9Orfq2H7qyfLR1kBpOSYIoK7V/5ufaBb8IJyhW/DoISP4Q
	D5VGraQ/oH2uv4dX6dWrJFjAVHnhzoJSbvwu0RuycwV6pOc4PagnRSxhPMx5qLi0HaxYApOZpOa
	map8XaJl3routYzxwadxBeUsL7CJKcyzF3LDK09YtPrUnvR/tSFxvcDaU3bXHoJh/y82SK97XpK
	RmnPwb8iNmQotq/Bvi98Q7Yxg3y1mXWy6P1IjWUXhxzXr5tgY=
X-Received: by 2002:a05:690c:6c86:b0:795:c78:b633 with SMTP id 00721157ae682-797f73f4d48mr49916427b3.62.1771517165867;
        Thu, 19 Feb 2026 08:06:05 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:56::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18b464sm135320017b3.13.2026.02.19.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:06:05 -0800 (PST)
Date: Thu, 19 Feb 2026 08:06:04 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Message-ID: <aZc07N4BFw0hhnoZ@devvm11784.nha0.facebook.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
 <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
 <aZbN8fXtCkhItSV8@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZbN8fXtCkhItSV8@sgarzare-redhat>

On Thu, Feb 19, 2026 at 11:36:40AM +0100, Stefano Garzarella wrote:
> On Wed, Feb 18, 2026 at 10:10:38AM -0800, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Update the vsock child_ns_mode documentation to include the new the
> 
> nit: s/the new the/the new
> 
> > write-once semantics of setting child_ns_mode. The semantics are
> > implemented in a different patch in this series.
> 
> s/different/preceding ?
> 
> IMO this can be squashed with the previous patch, but not sure netdev policy
> about that. Not a strong opinion, it's fine also in this way.
> 
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> > Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
> > 1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > index c10530624f1e..976a176fb451 100644
> > --- a/Documentation/admin-guide/sysctl/net.rst
> > +++ b/Documentation/admin-guide/sysctl/net.rst
> > @@ -581,9 +581,9 @@ The init_net mode is always ``global``.
> > child_ns_mode
> > -------------
> > 
> > -Controls what mode newly created child namespaces will inherit. At namespace
> > -creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
> > -initial value matches the namespace's own ``ns_mode``.
> > +Write-once. Controls what mode newly created child namespaces will inherit. At
> > +namespace creation, ``ns_mode`` is inherited from the parent's
> > +``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
> > 
> > Values:
> > 
> > @@ -594,6 +594,10 @@ Values:
> > 	  their sockets will only be able to connect within their own
> > 	  namespace.
> > 
> > +``child_ns_mode`` can only be written once per namespace. Writing the same
> > +value that is already set succeeds. Writing a different value after the first
> > +write returns ``-EBUSY``.
> 
> nit: instead of saying that it can only be written once, we could say that
> the first write locks the value, to be closer to the actual behavior,
> something like this:
> 
>   The first write to ``child_ns_mode`` locks its value. Subsequent
>   writes of the same value succeed, but writing a different value
>   returns ``-EBUSY``.
> 
> 
> Thanks,
> Stefano

Sounds good! I agree that is more clear. I'll also remove the change
above that adds "Write-once" at the beginning of the paragraph, since
this clause does a better job explaining how it actually works.

> 
> > +
> > Changing ``child_ns_mode`` only affects namespaces created after the change;
> > it does not modify the current namespace or any existing children.
> > 
> > 
> > -- 
> > 2.47.3
> > 
> 
