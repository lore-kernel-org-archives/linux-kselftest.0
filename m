Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541418;
	b=5geNndxAFdeLvs8tEVFgL7D6pPVy6Ge/nY4LuYcFNJjSUp87rUW2Vp1agMV0h8sy8ld+
	 0ce+gEXE8d5l5KbSPXBlkFbr9brkG8DyC/xRKZH8uX28QOgFy0cAiTy4ANTBwEzmrvNkO
	 BMgCokO/EtQEaUK4Fd+IywMsnwe3WmajJ0fEbca3BJsDlA6Ag0d3kdp4xFOQX2ZLsdNuK
	 I/TmVHLTRwot1FlUiO5xrvYA7cLGrlQSj2MGbhtqxSJyoyIukUN4LaC8g12uo78Crvutq
	 w2mabPeMUF59HyFRwRiVv3XWcDBXnuc+m6jwkWL+W/y/E1nxccPIOqKiUDWNwmLXMew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541418;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HsGkEro8HuxBLRoCIFXQ+xehN2F2sy5GeuRlei0vFA4=;
	b=QvHi/rHSmW0vGbkh6Qvkg292MPd/ahm4oL/dQJK85tgujf+nAkUBiqf0ZVmB/m5/CoPW
	 PeqebP+hFFEhVApidPmnyHwafg5BjdKkxk267F95JVqqJ1vSQdO5cP1N9uat4+TaMxUaG
	 AEq3hmwQ7kSrpcTNIdGWZH8oQCRTTCshgXgrfZse9RqzSsQFWsCiebDv5n6oKPVtChJX7
	 lZpzKj6MWxvCpzJBG/P1bukJbqBUQsxu8++roEhEZo6PymgwrDqzGBC7JLR16umPX8Snw
	 7/7xX7Ztki/jXlOG0OcYJ43Lm/MbEZVKM4oW+ienYklH72vS90N7Qq6OPMhBahy7rOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ba042zpi;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4DE606A329;
	Tue, 24 Nov 2026 17:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4DE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ba042zpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HsGkEro8HuxBLRoCIFXQ+xehN2F2sy5GeuRlei0vFA4=; b=Ba042zpiCWyA7HYpeKbS2Izc+w
	g0lHU4hBdilPyzNu3D/wEXntRxs1Smf7rsiVKHZ/2HumSkpiFSYj6ssdbOUGuwZZm3rTqqzQqEW1a
	cGyYDPsm0s16UADVk+kNFCedn556kpcjSK3a1ln4vua0eMitQynRrHCW6N7O11nKWFF8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVuL9-0017Dr-0x; Tue, 24 Nov 2026 18:29:59 +0100
Date: Tue, 24 Nov 2026 18:29:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Breno Leitao <leitao@debian.org>, thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
Message-ID: <ea5f29db-dd1f-4476-9766-1453e92234a5@lunn.ch>
References: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
 <4148e81b-ec5b-4374-b74f-4f5cba175c7b@kernel.org>
 <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
 <bd804c6d-0294-40b9-a6eb-2b1ab2ad357e@kernel.org>
 <39d50105-c550-4925-bf63-6f0fcbb897c3@bootlin.com>
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
In-Reply-To: <39d50105-c550-4925-bf63-6f0fcbb897c3@bootlin.com>

> Looks like it's rather the HW or driver that doesn't support this :(
> 
> But that's OK, I think we should ask the least possible features from the
> remotes, the rest of the selftest should already handle the missing capabilities
> just fine,

Supporting nway_reset is trivial, at least for drivers using
phylink/phylib. So we should encourage it.

So i would say if the device we are trying to test does not support
it, the test should fail. If the link peer does not have it, then i
would be more forgiving, we don't want a developer to be forced to
hack on somebody else driver in order to get their own driver to pass.

     Andrew
