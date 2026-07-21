Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93A471426
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663513; cv=none; b=tT4CbLjatqSrCua+2LcCLt1tkj4dI1UmNvkldYs75J40GYqbWipMLOzXxfSPRcqutMDEzNHcx2ixPuEA96WukN0JrhHB+dJp/x3BscDkTl9c7a6ZRytjQsSlRAGyOmbfX+FsaotrKX0JgNpKc62EUWoP+mcBhs4tuHrhW5t0I20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663513; c=relaxed/simple;
	bh=pcfYZsW5GJxrppNfg2PPv6QOtuIwDObGnm8vEwV4bSI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=dIyx0aNJYTNqeiCl6FI7JpC8WhhoxJE9C0ZTD2z1Dcs8WySaq/jC6awOEZWKYyKWmLG+k+l3fL13nNydyVH76/AjmItEtLy7B47slTMUpvAML6vsa4mWZITayb1GRoIEZPqAkFbzJB6U6mjjgZA9fFH0RYO+pUcuHNqNtG5Cqw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAHIUbAy; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAHIUbAy"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ee6b2da98so58325297b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663511; x=1785268311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1hwK9utK8maH1goNHBFSjyplyEXYS61mGZKNHEb4ShY=;
        b=MAHIUbAyXVcunjvWuaQAN3mLZg1RIvE+A5wNwKH/2knkPsDnIB1mKz29wtKCtXagoy
         ambMGuR4MQSkn3c0gyy8GtA1VRKNtvwOrLOjQkUUz+gEYZMjl4s2GOHGBHdUCS8HaPQ0
         bVg5vYZWqYRBlSD3Cxt4xhnluF9Bjgwh+bHrSt3g42W6Gzj2lkFkEtohImE6TL7WUMhC
         SfYpU8lMnoTufLTYdndFijNYMh9ws+ucZbdXnk7T8m23YrHtbOq9x+BlzIK6IEez/VLQ
         6QW0G2dFF9gu8vNfoQBBGz81SjmvGkQrB1iWL/FajQ3A8OHmG6zTcf2hd0z4ZLQEt3wI
         c6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663511; x=1785268311;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hwK9utK8maH1goNHBFSjyplyEXYS61mGZKNHEb4ShY=;
        b=TXGJkwOLeVAbBVrCdDJ3fHZwBqETyCLJKRCYuj12v8SPCSyL1neQqg/4GrwN/LG4aS
         M/bOFJjAZpy1wbuhFiBrFgwb9bHBEii4GNfWGzFm18ZBjjJjBD2j4VtqjMZVhJrOnjF7
         s7kSxGVhw9IDmxogrrFHM7un7icKbJzQgQfGjtl81CnrE9sBRaqBgWky6i1gyNJRtE3u
         ALd0rgXpWBLUa7XMab//BUFvtXkXTuJBuNYQqWfQAzhTnR3NmdWN1lCo7xsIHPIw1Kq2
         G7Y2dgjP05uBzRJAsnH5B1o1QX5yfWfc+jdTm12e5POzrJolHE2hP+tQHcsk+k5hVPtr
         HEJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9c5jRUAcInFXLa1K62uUsa1yoQqCOTo+a5GiKF/HZKOeN8ALuZjjT8TI2rewni4lCBwWg0kpYYxP/kbnScO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyubPREk3AJYyna9lyS4Zh3VQTeEtfYmP0hzXjRbm08w9JVgkeL
	Ig2oz3wicVm84QNXFkW+v/ese53oyuEejnbz90CQHP62sCQJr9zxJivv
X-Gm-Gg: AR+sD13Q/hKX3rAyWD9Gnf96cNRIaTGrgvJAo+RgRzoTgHmcq7To13n/Co3pBCEZ7qP
	Md4pDVvssTfivKlTY2C7QGzhxj7s1G3dr1oiqlYHmbAYQ70lyx5Wsku6Xa+wWRsTi2oXOCwq+uZ
	YzongR2+/ZPWt3Y5OZcnXuqLqAtPlryzDw8ZreBpr2g+RAdSjRQhBMuh1AI8w2AWXrGRWG+xgrF
	LX+WP5Nn41wOm6AWu8/021mGIuxtlnmPiyClYrtFunEjTihseoch92u/8VNHEq2bATdWvEsrkWO
	01zbNpG4ReHt2eoZ3iKeqYlNH8eNuKLP3yevu9frOE7N2Uh5yvOmlMr8RC1pLBMNb9GzE2ALA+I
	HyOU2eaTIb0bP5hp6Svf91aSmD9v227n6bPuvkzy+NN1LMhsiLn1du8P6ceHY0FjdU+GjpO7Lv4
	ck75t1PXWAPwrrgOIaBl8x12Du8iDXsZIkHsbTs5d0cCtj+rFUqEyVlkg=
X-Received: by 2002:a05:690c:4801:b0:80c:85c6:897f with SMTP id 00721157ae682-81ef263285dmr61224177b3.62.1784663511458;
        Tue, 21 Jul 2026 12:51:51 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33ef0a40sm2741587b3.39.2026.07.21.12.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:51:50 -0700 (PDT)
Date: Tue, 21 Jul 2026 15:51:50 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org, 
 Joe Damato <joe@dama.to>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1c390169c9796@gmail.com>
In-Reply-To: <20260720122714.759175-3-joe@dama.to>
References: <20260720122714.759175-1-joe@dama.to>
 <20260720122714.759175-3-joe@dama.to>
Subject: Re: [PATCH net-next v3 2/3] selftests/net: Test PACKET_STATISTICS
 drops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Extend psock_snd to test drops by setting a tiny receive buffer and
> sending a large burst of packets.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
