Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345219;
	b=uV/BE+S/ao9p4uLcayGqYQkCAlWx1Ue6u05d2uHgC4MeCjfGvRoJLL4dL8i/92nbMbvA
	 tCX5cHLEFWToWv4GDT1plOw07Em7mDDxfJfkp9fepu1nFBRWz6id04QXp2v45d/Q99GWk
	 0zwdmb1GRLoQXgZdvZi9pP8K4RAw1YpmwtGbBWtd2Zqqnu/E9Gu2PA8JP4Q/Wd8gU4n3i
	 t5KoZYmAgB7kJA3n8CX3u5OF28N6kVfBcgPKmxAL1iWMSuwh3T0Yv8ptFcF3GkKec0ltN
	 0Pme9ch64FRQCzpWvLCK7RCdbExMgVDzZ9DQoiEPkP3UkQbWvszxq7myTvI7v29wjFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
	b=y3pBWSyfPdqAF+08udCIyhxDMNbmZfsugi0Za4l0GKtCROJm3dYVu1vQOh7tx09CQkfa
	 xtRSljHcKpTCHH4fhyrqwlGrHNE5z0em/ka1jovoT2awROwwaPVOyBvoID4JxtDhR6ASH
	 1z60MZXo/Him5q4w/po/vopUEvF41Xr6wPHeHKUzor3ffQrUqF5TYtXtG83z4cEmI79is
	 85moHYcEaqm6/M8wcueVONdFH8DGpyX/x9+/vYkeDThejI6RYIFADc2skGFFYdjgCJjpz
	 G9BYcp/a9Hx0aroBmJgEzC4wTDHk30hvr7aVbla79vZ9fuk3e2+HrFYDuQ6BPK06Mzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vo3EESPq;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89CA606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 21:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vo3EESPq
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaae62796dso23819515ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794345218; x=1794950018; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
        b=Vo3EESPq3s9qTUdHxZQztaVmL9/aC6NA99RVdFQtk9Th+ZTKg9qYYfhND0p7bl2Ono
         TKEZzBVyUDd94dL+EodmR7LYSoJwCjvdZgB9ZeAC0kJ6A92dJk4tVSiVyBGJNxqXFimF
         863enSCvrOFGp8vbu/PLMUTiA9LrYBwY44pEZQJreOVW9JJ95WuqfvajZPQIEZ67wlDR
         pxFbIaMkVWIrXSbv+vQTTqOPl89SM1A7fIpxKzX9w58tvNljYUThGupW7rB+ztbIsNpX
         l/x2bgq17uZi+Hnx3ht5YlWb/3u4BMoXjgx1i5np6J1DvSLR/gg9laH+hxxuXT/Vt214
         crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345218; x=1794950018;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
        b=gcDFvUL/f6YxQ21rYra3ohsriyzp1yDGZKMgP+dwGDltKoxfefTtD6IfnUiyW3NjR/
         LlRi6bufESrSVX5/DPsS35ST2W4S/9sv51sUFzRKZtrVGZrL0lGJDuh2ju6lql4YjrFf
         3h+RxStIHTjeG9jr0wWETHrbY0m3OTGZOaeYv+A0zuwlcmjF1B6gmLYGRW1Q6SQIKJ6W
         gpMtrMM/eiQTFjzc1sK9Lbik8BBriySSXuoyarbYK1jMv2p/5cZosjgB3sfZ0cxET12W
         yFvcccShUppGTwHSA+4q1bbMnepTte10a77lCeNHXWMuDvt4x6RDHRvYDxwaxp5fLF6T
         tmdg==
X-Forwarded-Encrypted: i=1; AL+hErFQ4IMH4X+L7cMv/OTybUvD+I68PK7Q7YixUdqwAG8/IXSeQMZ9kbBbZXY4LVRnE+9Bp1vjySIeSdo2Z6J8Tco=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zMxnwKq/6Ndgo+xh30a4ZpBdCGLAedqzh+FPMmyNG0/Kz8vgz
	E4NzqmNkYdns0DCEwgJOTBGhzsjsFDrY1xy8PJS4kgw8XddrRcGqa1Sz9iIkkOwnvZFbVYimVUC
	dOCDPiQ==
X-Received: from pllh5.prod.google.com ([2002:a17:902:7485:b0:2e9:fe74:4523])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c8b:b0:2ed:2176:2455
 with SMTP id d9443c01a7336-2edd7b864b2mr3011055ad.38.1794345218010; Tue, 10
 Nov 2026 13:13:38 -0800 (PST)
Date: Tue, 10 Nov 2026 13:13:37 -0800
In-Reply-To: <20261103220337.3578111-1-skhawaja@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103220337.3578111-1-skhawaja@google.com>
Message-ID: <avOJAY8HvkTClshx@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3] vfio: selftests: Remove libuuid dependency
From: Sean Christopherson <seanjc@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, Samiullah Khawaja wrote:
> Replace libuuid with a minimal uuid_t and uuid_parse() in libvfio, and
> drop -luuid from the build. libvfio only uses libuuid to parse VF
> tokens, so pulling in an external library is not worth it.
> 
> libuuid is often missing from cross-compilation sysroots, which causes
> the VFIO selftests to fail to link:
> 
>   ld: cannot find -luuid: No such file or directory
> 
> It also complicates building against glibc alternatives such as musl, see
> https://lore.kernel.org/kvm/c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com/
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---

Tested-by: Sean Christopherson <seanjc@google.com>
