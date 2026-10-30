Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373081;
	b=2FLO2cG/0wXEZGFOLrjnsAtA/BFjt3xxfmdCGIu/bdAxxmZ/XnSkZ9VLdYyfesgfvlNN
	 pNyypQBPjb+9csjbhzhdCO8cUQIZmiy7L+mYNxiIJC4IxfhHrHPowqqxaJPpAokDcYygY
	 L9TfkZm0gx6A3PDSWZM7Bo4/P/S6iWkFUWDX3T/8eBK90GsyWHljAS1pqzoK/nalndjuz
	 3STGQUILTw9yT4tzyBHbUrysWW19P7/TsuTZgIt2NHhA9WS5zW3PhKpuerL2ox7t6ZKbK
	 QKk0xxbUwtWufp0ypWMqYyP5z1IZp4WU0QHQGI9YHd/1onQg+fVhj6F3R4cFTxEsBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
	b=iCwp7pQ4+YK+IALHav4KTkDLGXC8VOYYiopnS6O9Dej9hTXTxVprWgrbkKqJcBuzW5L3
	 TfxB1+cennP5lR23NPt+QLlk++nGGZBzKmCWHwZbceR3yw7F5QCKFqgWGhlxPo9c7X/RO
	 FuReVBHiCwIGH8VwVUTbVNkpvb03HjiYViEzpJrYaIh5YjU3U4gltAJniYBxpwiYnDPw0
	 mXLGpLANzpZ/3xyWm0qWBgaEr2OilF3qh54v5N+pdG0hR+H6NbMbs30Un7PD/hvM505/7
	 Ce6f4u+Fr63LeSxkzMq52+WaN2CbBt6qGqtmAhIIFYUq7yBwHRfGqWsfYGWfnBbd2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VAnxgq+X;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27B606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C27B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VAnxgq+X
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c8fef5ce2so10281076d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793373079; x=1793977879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
        b=VAnxgq+X4QCFTDu9AfTIw48AdlrmXvNeSuIaONQhqFkWoVPXZBz84mze+bQQdrgAhR
         Yb1qIjdcTWGrZL1vyxFrdGovjWe0C1rwpn88C7tgXg3BW1x/vT+4lppONNZ8N5T4dIZF
         A86w3AiVzzJlHYHoWjb+ZBekF/EkxgqB5kFZzSlRgpVyxvegFwpmbFlwECZi5LehdbEw
         fPlvuM+bv9BCs3E+qbixvAbLVr2hTUtX7fpfDGGuE5hdiG5M5JPOPvHVD91ix6/f0At2
         dnlRKLnPnupUvjaDpJdUG/mHdwTGSxDI+PfrEZRHaKDbgB1fY52C8lRrarj8WAIdi77C
         HTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373079; x=1793977879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
        b=oBzJtx0Tz7tGIzhbsSYs6dYcK2YiIt8NTsRv/+215fZzZf/QWZoHZQdO6doD0uAGzc
         rKr712rBxX4pR6GjX058RjDbj9hUm13+sPXLBs08BtmhMdLJ0ttQuHFpxe66trq4OHZp
         AdjMCrFs9OKAA+yLXmkDye3lSkE7Xc1ILhV60hV90FkYrcuznBIGf/Nohv/zA08Bj4Tp
         KQcD5hvW20/XSvhX1MKG9R8gk9vqz9AyPbwZ2Q250iDfzqKOFmRDMEUt0rSV+hbpcZcR
         J4c0bwIIJjnDBLZLgsCX5VAE/lwBi14UR0Z/8mrCvUrt0LNFnz0HtmXIx9GNsLg0o0F6
         wY1w==
X-Forwarded-Encrypted: i=1; AKwUvBzYbXwbnWbxEYTlpf05ARAy3DQEoH+tMTle3pzT37kzKbYVt9NFgMzAOYqMRxshVt7/Q9lHDJFUlYlmup+FtwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyGX+dDEPfWlDwwPAyu2IJ/11HPWemI0zKmZs8pVLRH6W0SPQ+
	xZxrawRgkUL0Px5U9v3lzs77XTeYFwKSvqjlB9e2oiK29bKSU/ozsrRCUWvq5/Lq1K0=
X-Gm-Gg: AYBFou0iEeFRqm5SgyKEM0QtzCxMlerYhVVHxMm3Mn/fZN7F3SA4y8APM6tIlGFFbt9
	l9hwrV0dFLuaKdA2+X2fDw/gMnCDZNSvoLaYLOw6drahErw7vYOnFqBfljY4GDGARa6LoSDh2pO
	c2QIGZvzNxfwXYp+k2fRPR0eP95AUzTKoT0jAbOyPE6VekUZNh0sv5f7G5y6LLuYLaAaborRRFm
	fchf0m6QzRYOMp0tAx25eO5aecCY56TI2/jU5xNvsPpANcuOP1U16igxV+KQAOsKxrLufwr4wOA
	I7eBr/o80ZvVnlhSdpSeXxZ17hpB1hxx42gaqR7eaqC9yeM4qh/sQnCkgpQXRBrQUqN4J/Zze16
	AjL1Nn4TicvJksQiSjWGVIhrNhSlIfRQWXMJ6eEXQhv9prISNRwYbAGjIlcQ45tKm64+HDzNxcM
	SezTU8LcCHzoEi6GYAqW9j6A9r31GTqY7GXfODwzV8vfF3lbsi7V4YzklsUpI3YnchkcCNixORD
	5b9bkVdck4ZvRCfgT4WLtf4lcA2cFtEzY+djM7IipQoMRxdc2MSgRxQrMlHE1v3I2OtzbFEF/pE
	xz3TTfrF4E1pxubfr8+fCtE85HEx6HfP/yBeQYZ6lRTEk6dckDaHnXUBwMqTjPRbDPn0Y3C/2ED
	vxm//XS2l42U=
X-Received: by 2002:a05:6214:29ec:b0:91c:5fc4:ec2f with SMTP id 6a1803df08f44-91ca4b0dc32mr40691666d6.26.1793373079235;
        Fri, 30 Oct 2026 08:11:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807047bsm17117606d6.39.2026.10.30.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:11:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMoGB-00000000v1Y-0kVg;
	Fri, 30 Oct 2026 12:11:15 -0300
Date: Fri, 30 Oct 2026 12:11:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>,
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <20261030151115.GD3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
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
In-Reply-To: <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>

On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:

> >> I don't see a reason to make userspace (that should not shoot itself into the
> >> foot) a kernel feature it must activate itself to not shoot itself into the foot.
> > 
> > The issue is live update doesn't preserve those background punched
> > folios and now we have created an UAF attack on the kernel across
> > kexec if you don't do something about it.
> > 
> > There was some notion here that with the right sealing flags we could
> > tell if everything was 'live update compatible' and then know that
> > these attacks are impossible.
> Just remember that there was any hole punch and refuse to live update this instance.
> 
> We could likely implement "we saw hole punch on a pinned folio" as well, but I
> don't think that's required initially.
> 
> No need for more shaky seals.

Ah, yeah that might work out. It has to be checked really late though,
after userspace cannot change the memfd any further.

Jason
