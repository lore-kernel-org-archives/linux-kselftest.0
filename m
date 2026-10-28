Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227589;
	b=x+eipg4z08SJiGJ/LU6k6EJtMZgLs5H+up4w71uovGmLOUbwSW5mOJZj0aZHYr1dptoC
	 RG05p28v57UtjG/cyicgR5Y8kPfDA06kmNsh8pmB3xQVA07Qhb5W2QiaCRkEz7c1X1TCu
	 jh5qB7qiAR8aVrRvg9dVj9GKLFjk5jUSZPgzMRxNVwZ2baosNug8RA7aAJ76M3z+ZkxFZ
	 thm0hO1LHfyedZrH0qfTTPZ9i9Ao5ogWXX2LAJr8/V40hTA9QosMIdsby2GtH22ORc1nP
	 me2pyr3Bdo+Ngtrpqv6aB3mHZxTkYWFmjYk/ojbZ4qpmhpeKiDcR1IpFinegHGPNlAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227589;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HoCFFFx6j94whDF4LLrHCgTELwhIC59o3ORVPN/O+IQ=;
	b=YfcFdKcGV9F8nCqC+bzt70Y3UqAuTijLp9rtpIO3pTaA4tWfHoAvUMmL68tXLlI+D6wT
	 cNJ+st12Yn6SR5fr6YvXE3H/Uzw0pqk7YUJw5DAAQb3HOA6jiyO7U2lwXbviWUSXlBAFR
	 VKJVoheiTvVo9JQ5pasXklwMWtyTiqHWLVbhjdHRp7i6vlAkPVAsKAJGmkT5w6SouNqF4
	 tKzpgLtoumZw0+uwHD8SsFmKqmE8IwdnXdynF/MUs9mTqozlVZNAwmJYS3DD4RjOV643F
	 BZLUYTaChmI99CPVho5wHgc6Y+vduRUIK9T0ss2SwnFEU/CxCSnrULR47Rt2LCOsgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUQmneGp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180C606A31E;
	Wed, 28 Oct 2026 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUQmneGp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE101F01825;
	Wed, 28 Oct 2026 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227588;
	bh=HoCFFFx6j94whDF4LLrHCgTELwhIC59o3ORVPN/O+IQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jUQmneGpdIigvW/w7AbeLY/hh9tY8arud37Y4Nhlb0/G4MoGSBL0u1/oSWTqUcmPm
	 UpgiNjRQ6pyZJPsoccaAe0VWO6mKQWmzg1Ou9jmLulIxQVU1c+mmYAt82PyD2iVK6n
	 gOxSmjdZW4puagcgpdURD22VWO6ekMtvFDmpqQpuxDjhxYtQrZZBPoXASyG/PGckMR
	 Ojrs0e5HDQIliWJObOnpsLD+MCFdQzguxF46AC0y1nFb15eCeQ2kkemPeePlz4vl7N
	 zXzjeerV+Kq3oFjD98lOETchUnonyG1IyabHRKxg8is1EEWWmrhKgWzBLvFoZZJN7Y
	 7eX2EYheKQBQQ==
Date: Wed, 28 Oct 2026 15:46:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: add TLS 1.2 hardware offload
 tests
Message-ID: <20261028154627.00c13628@kernel.org>
In-Reply-To: <20261027171537.2317025-2-rjethwani@purestorage.com>
References: <20261027171537.2317025-1-rjethwani@purestorage.com>
	<20261027171537.2317025-2-rjethwani@purestorage.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 11:15:34 -0600 Rishikesh Jethwani wrote:
> Subject: [PATCH net v3 2/2] selftests: net: add TLS 1.2 hardware offload tests

does not apply, please rebase & repost
-- 
pw-bot: cr
