Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204B4A13AD
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640922; cv=none; b=CC10pRx4VD1qF6JVf6R2zYcbOzJKgS/8n5QHk8/Jtv6e/ACylG0Hm9hL+V+I7Rr+KzQh2KiV17tbCRwpsVGdWJt4wJW8tKv8pJvr/Z2WzYfIzpu6FlI0TG+JHu/qkgX8kEPkNSnkrdtmCZlLiLQS5uRefVIDFGA7L4x3Oqv8B8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640922; c=relaxed/simple;
	bh=u/oFrMjQ0HW4ClFV3qEE1V3wir5uA423tg2pTQTXT/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDgFtoAzzSDqzp2JB2Kv5W+VfZ637bgf9/TiYxb+pAFV9+5QlzNwAAzvUQvgelPh3uGdIMgf61DPTCCxXozSn94EymuN7MinIbjXJzQPt4JEhcDvhYjtCOELoQ3p0/0zln8WD/FIlDYu76a3oz8bPWycWeXTVgiPS0SxZvDFoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=Kuq3lzRj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="Kuq3lzRj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8486c9a946bso321640b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1786640920; x=1787245720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eYHtd96lDOI7CnVEXFbNgDWMaZC6MCbdvBlqoNmSQ9g=;
        b=Kuq3lzRjCgjMKzPYEBJSgadzBBruWwqdy6aeJ4vlWs/b5luV4JPJM5kIxhimORLYAU
         4/y4DOe34JBrrkbohiL1EtqVldLd/txET30GReQLDluNcWkqTKp/23aXaIcmqFTHNcIm
         6R69TqymiteOSYMwsJKPz6ryfBK7lUYxz8DX2O/YvSO76qLDayVj0htQGoKHu4Rb2/rN
         3udbD2f6ktmDzSsTjASwvgv+oltFXqrWT3S7d4FoDsYCA+1hZiKFXHvpEb9d53/LyDOP
         kb7yU2N8GUtuxvF3wJn8ZCckzDIAMdpqC0ZBp9ZsrWKqw+wlMoPrVAa3DeQY4Z67Qcku
         dMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640920; x=1787245720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYHtd96lDOI7CnVEXFbNgDWMaZC6MCbdvBlqoNmSQ9g=;
        b=egnaX2JsNXJ0ihQ56qoW7BiqLfG+ZdYkYYJs4ZCXRJJwljkmO9jkgGwT3Dx2Gt1HBf
         PaU9DbJ1AZpXuSi5l8Z9ruL9kbpGu0VDtjuijSUaHCoJLefFBG/nIA59EllZ0bXXoil/
         lerbG9YmJ2kNizKds+ygBEUzJLFnDa/QRRmmJNP6p2H5oAoS6FjoaVl3H3winA46r8UT
         u3kHwz1ipWRKk92m1RRgbVyaQGYrq2E9YLWFpXzrNS3v8n3N87C00H3FYCMtwPqK4dwd
         I31ECgw6pp0NGYqSO3zHonKzSG0+SmCDFM+YszmVGHEXuMm8y+ERejNQ55I3Go+9TQ7Z
         0maA==
X-Forwarded-Encrypted: i=1; AHgh+Rod3gLfWMddaY9L9QJC7lph7pfXDwgtNveI5/z/TPHnNHAw0dRJilc9ZpJm+SHF2c+UqA9KhgAfGLgDTFHFhUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHqR5bYdybU8lInJNYQC3ZgTwIA2HgXqhiNV3gU8xxLW1KqdX
	Rvsn92wCVOuSgVh3wmtNFHjV4J5bToMna1y8qudA1tbTVpxFz43MV6D+Py6F1cQmiGI=
X-Gm-Gg: AR+sD119xw3sER6PAYPmWsecx5I6Pnra7UThQ9k+LuaA0rNvgZ1dmA6ibMNrurnYKd6
	cKl4rnTNs2u2Sibx6b9Dle4cjo3OGt5tA9R8X/SfoyTqv0GlWsyTE2gmyYsddrlq/c/pr/GXB5a
	HJJz0n94LCJK3vLMEouzKy7CO7TKDXx/wVAekwHmtIAAEHjPyqcypNWT1xkTZc2kLsbk2BAWaOl
	HeS+96DrghKLw/arcDbhbB/0KInRx1k9pdyYJ4ZWfwhnRefIxIGJeB+/AJF18vqKWqgyyU7dtRd
	br/U4OMRDJkhxx7zNUQ7AY3lPKPNMoIjlDLVEo/PjdaXHWIAumFZVfHUPAx0E1pYxWPJYHvDDBm
	kw4XzRu0gDqxxGAI1np6TQEu+z4dOLeqIGkLMiSMXh+4My8oaKRr/quloMDINL/Chy3AlVj4AWf
	bGxK6ezcVf1XrhbQuPWXCr7eXDZRUIBgymcs8Vp6Wf5UigInGKTNiS8HfJu0XQ4t27zHCjoqhpL
	VyuUDhVcBCTVFhjmL9VB1EDakTsQppzcBY9C6XtcTU3LtUIRU899HTq
X-Received: by 2002:a05:6a00:7115:b0:848:4d4f:d481 with SMTP id d2e1a72fcca58-84fc75d543amr4090389b3a.2.1786640919729;
        Thu, 13 Aug 2026 10:08:39 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4565c6bsm1232055b3a.3.2026.08.13.10.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:08:38 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:08:36 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jacob Lalonde <jalalonde@meta.com>, Josef Bacik <josef@toxicpanda.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jacob Lalonde <jalalonde@fb.com>,
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/11] coredump: allow to create sparse coredumps on the
 coredump socket
Message-ID: <an36FFL9ALwCPhEe@telecaster>
References: <20260811-work-coredump-sparse-v1-0-cd3e8b1e356d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-work-coredump-sparse-v1-0-cd3e8b1e356d@kernel.org>

On Tue, Aug 11, 2026 at 05:27:21PM +0200, Christian Brauner wrote:
> A coredump generated via the coredump socket ends up transferring
> zeroed data when a mapping contains holes. For a large process that
> maps a bunch of data that's wasting a ton of work.
> 
> Jacob ran into this and Josef has bitched^wcomplained about this to me
> before. I dislike the coredump_filter bit solution in [1] which stops
> each PT_LOAD at the last populated page.
> 
> The problem is real though. I don't think coredump_filter is where we
> need to solve this. That mask says which kinds of memory to include and
> it propagates across fork and exec, whereas what is being selected here
> is an encoding mechanism.
> 
> I also think that the usermodehelper - may it swiftly die - isn't really
> salvagable for this and it's not the future anyway. The coredump socket
> already has a handshake for stuff like this.
> 
> I always had an idea how this would look like but punted on it back
> then. So here it is.
> 
> A server that raises COREDUMP_HEADER in coredump_ack->mask doesn't get
> the coredump as a plain byte stream but as a sequence of frames. Each
> one a struct coredump_frame_header followed by what it describes. A data
> frame carries its bytes. If a server also raises COREDUMP_SPARSE, zero
> frames are sent for unpopulated mappings. They only indicate how many
> zero bytes need to be written and to not include data. Reassembling the
> frames gives back the same coredump. A debugger and everything else
> still see an ordinary core file and nothing outside the coredump server
> has to learn anything.

Hey, Christian,

I proposed pretty much this exact solution to Jacob, so thank you for
writing it :)

There are a couple of reasons we still wanted to explore the
coredump_filter solution:

1. Our core dumper application is not really prepared to run as a daemon
   that listens on a socket, having been written to be a transient
   usermode helper. But thinking about it more, maybe that's something
   we could paper over with systemd socket activation?
2. More importantly, we sometimes write core dumps to disk and sometimes
   upload them to blob storage. For the former, this approach of sending
   holes over the socket is great. For the latter, we'd now need to wrap
   the dump in some sort of container supporting sparseness that all
   consumers then need to reassemble. The coredump_filter approach
   doesn't require any changes in that pipeline.

To be transparent, I still prefer the sparse socket approach, but Jacob
has different contraints that I'd love to have addressed: it's a
trade-off of more work on the core dump server side and all of its
consumers vs. in the debug tooling side, which is mostly already there.

Thanks,
Omar
