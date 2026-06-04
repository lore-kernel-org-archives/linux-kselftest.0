Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917E3BBFBD
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780615242; cv=none; b=VFpAw8HklJUuKmqWKqncuNXddIf2RG5kkmK0FBlBCj6wXJpdTlvMYqY2rjjIv7uKyuLqs8hH3vLx+XjacLiMWRPL2W/UM2vxGTZwDHaheghy1NCjXOHmbvxzIf+obJ61f80KLIgopIGVDEso8scbUcvPc06kC+lKNDeApvKJnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780615242; c=relaxed/simple;
	bh=5KbGAQnU1LUTmYDxmqgD9KiE/ny5+U//DZK9fmTYErE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZASiQHJDVH/tj1nE9FLwRndfvpGK5Cimg7cUnwe33Qf+5tJ9nJiki1gYmPxsZGIrDkiN5HYiD272zfCQb7AD+8D7YPkzv1ackPLOLXM3GKY9M9V8nEApcmhhJXpyFbfnwbfddsV8Jb+y5ZacRJUa4dOfnUKme27AlNtQKwa6osQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=c3xSFLjQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="c3xSFLjQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so10766375e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 16:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1780615240; x=1781220040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OVg1AyRtjY/5nIONDyIpivos1vriwmOKtOXnyNgkiY=;
        b=c3xSFLjQsv6PpRfdZoG8PSbIHSrvKbv5ewshbDMRSpTCC8RPkt/S5m6aIImu+rXqgt
         hiza6JotKYjA1oYe10Np2zQfIJbS0H3ElwuwXO5EbdAuwkVE3occmrFwH+UfANnA6XU4
         WN3gyf2jkPxEl1BFQGuymQ2Z4o8qOsgQX7utZaqRj+N6s0EUeTn4+gXW57/TjF41kyfn
         I5SHwNY09Ee1RxaUWtdGpoCiF1FEuxY7LROGZMJxq9n0f3VwPRc5exPbZ1JA1pCC0PWN
         jBu6wrjtqd7NaCuE4n656vic2Q4dTTBtjeeUEhVSiuwqebVuMAwO8fxz+UXc89wfB3vV
         PUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780615240; x=1781220040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OVg1AyRtjY/5nIONDyIpivos1vriwmOKtOXnyNgkiY=;
        b=HnHJJW/QqsScWDowi4pIBQJsegWVHtg1wbCkR1rFNiuE2e310Jq67fn0cg1pSdQF9o
         zLxOi5s37bb/JhhClEunx2ooTgWmrgI2A2ojvkVzeKvdnDl/IOup8fbrsFUettzVS4wl
         AhR5KziKqSZBB3o28OtLn422IQ/f9dqj2DonBDscryTCKGc/WBOiEY22nB9VYWoZciJj
         Vr9BvOyl/25+JPWlnaeyvZRJ+i4V/uxqeExJtJPkQapZ4w5cmNc84McmvnN6WSrVQH0O
         TEX2G7p/8Ijvqt4sE1cijsmm95FDQJoz+1gL6iaC7BXtlzoHFAvQ0LYWsnuNLP07+oW3
         nb3A==
X-Forwarded-Encrypted: i=1; AFNElJ+v9kR9oqo2+oPnqVvfEQBiPSQcO623C2QJSQ1/eheqU6VHCF4IxWmryqRd/aghvT9xtLX+1K5NMFkzGR5OFOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7nHDiq47vmcYhgcaV2hFJcCTdCBTaimPDTmIYdU1cWxxWs3s
	6JwOJApuMycxeIY75a3LtIEWwVZ9BKZ5K0ZaDebsQyiNpicQWSjY7Wja6wZQQJJr+0u2bk+372j
	kdfNMpEOQJT+BheJ7lrbB3WCIB4lMUDXyJJ34DFQUzMJ/gRPd+6Ytx1n/cn6Pvk4=
X-Gm-Gg: Acq92OF6cqFIMdIqi1cni0t2rP9PyoasabZ6PX5+I53t1v3VuPmoYftzzOJS6F1I1uD
	j8nvbsw3GT1KK7fRHZVJbqzyd0ICX6fa7h+P2EgARPhu86K0rwCpByjB2SjhFncOwVljXKXjDl9
	eeeLlzjdSCjoaGuFNKiokwCyOd8LI/7RI8/WtcO0vA+7vIAbJBNkwH7QyvBFGnMGOJ2eJct4eQN
	obodlWBHdls6w8IzdjJ68cu4j3JGOrM8wGxtyT7a2F01a0H2rHsa4bsZ3FmAQKreDpXjHdiD1FM
	9fWmKDxUGj4uPGNje4dI5bqzi3WRkKD/4EXmZjoi79w2nI3K4K7bZfrH0mr90cT3/LAR4n12GGL
	aF1lHX+9uSPkvibelDnPIDYx9oX+pCQtg2mi4Tec3MoZyeBd4Jo9aJnrWCYLD3eq2F+ktYS5+qn
	xDxaGtfzsWOjwonC9eUW5I2zOZpnV4x9xTYWBtMWPTAoGplGVzVK/0gbZD
X-Received: by 2002:a05:600c:8216:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-490c261ad21mr8824055e9.27.1780615239732;
        Thu, 04 Jun 2026 16:20:39 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:fa7c:9be:762e:2666])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm113832875e9.1.2026.06.04.16.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 16:20:39 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: Antonio Quartulli <antonio@openvpn.net>,
	sd@queasysnail.net,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH] selftests/net: ovpn: fix getaddrinfo memory leak in ovpn_parse_remote()
Date: Fri,  5 Jun 2026 01:20:30 +0200
Message-ID: <178061521511.606049.9561679736600280727.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603072741.1097-1-yanlonglong@kylinos.cn>
References: <20260603072741.1097-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jun 2026 15:27:41 +0800, longlong yan wrote:
> The ovpn_parse_remote() function has two memory management issues:
> 
> 1. When both 'host' and 'vpnip' are non-NULL, the first getaddrinfo()
>    allocation is leaked because 'result' is overwritten by the second
>    getaddrinfo() call without freeing the first allocation.
> 
> 2. When both 'host' and 'vpnip' are NULL, 'result' is an uninitialized
>    stack variable passed to freeaddrinfo(), which is undefined behavior.
> 
> [...]

Applied, thanks!

[1/1] selftests/net: ovpn: fix getaddrinfo memory leak in ovpn_parse_remote()
      commit: 932f10d0ca3acec477a1e6d05d08dc933b27c89b

Best regards,
-- 
Antonio Quartulli <antonio@openvpn.net>
