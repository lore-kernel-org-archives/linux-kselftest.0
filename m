Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819657;
	b=mUegxyo2Q57+IBf5uB1uyIAni6WR7QoM4D4dtQBKswAV3lJREQpVpQUPe8TT6dMHD6je
	 f2m7vq3MiFz1bx1CdWPp0/kYvgU0Sk0jfKAVUpK6+Ka5ODsg7rTY0oK1gKBdOWXN4Oe2D
	 1EOPCGLkBVtym1GLWNKWPEvhKZK0qc9DA4wu20+sHoev0jApetA9WJtZeDC1OANtg9oM0
	 p5FhdqfCUvaA2TcteMdMyEtBDb4n1rIlgeaj8qkA8cy2IqYGRKp2hg/hIJnOAaKNIkfoG
	 7s0AnlKV7czYYaTU/0M+FBHGa2+6iuIcs3ctql+uhawo7lOTrhmuTSL8BzbsupSH9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819657;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bQVXGhETo92AKISatgFNDUiRPbC3/5ePFN0uePhBudY=;
	b=My2tfYb3QJowRkkFMpk/um6sTYRmmaN+NnMXOf7i3mjndKSX/LpusxrfhguFhFPnQsoG
	 LC3A8aa4+zEWwZ3VPK21GXMIaPmhVfW5jCCojQoP7Hx6PtZV2HCQmuE19Rs9Gk5UNJSaW
	 L7m9mU+UakvP2byZ8DpVPuWBV+lGWse97Z76ESKOtKsoz7VV/2Ke/LgjQMCP0YPPegsPU
	 K2sNMDT3PG8wj5n8j+xdu87Kbiu0jHPJfE5p1YB4SS1Y54y8czjOfgcWMuVlPiF7eOIe9
	 EBiY7YNsVspG1g189EgCeUy29Ux1DeFu5N3vVXmXXuCoH0iujgT1Lv8nB3/JquVtjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=mu4Srim3;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726E606A31C;
	Fri, 27 Nov 2026 22:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9726E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=mu4Srim3
Received: from L30177.local (unknown [IPv6:2a02:8440:2604:bcb1:9487:132:7b93:c36c])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id BE5EA19F57E;
	Fri, 27 Nov 2026 23:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795819649;
	bh=QQnXt21QBcoYN9ihBG1AdSlpziK8CZYgiUONtMSR3Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mu4Srim3XlYr/lUB7DYPBUjPmCmQq/653xjmh22YkV2JUmVS8KmQeq5pamKZMU3I/
	 tuW1W/Sc2vFcDBCwMKTB7ccJ9bI6I2Qdn93amD5XW3Z7SstHZjFxqX1q8GOMExnZjq
	 wkHsdFwJvodrPVzTObR3Z/L7o6OdELnQ4uQZdect+NsU3SipPVxNx03U9QPQl9C+mv
	 BFyFMdXEpwccn7oN/0d6chmO/vmUdS9f1Ej855crqvlngSG3Ck8ZfQJuW4cAIlM3+H
	 Zt7feBOBg7qSBj/TY9UHioApE/RTlj59zjkmyR5fF52PWKwbr58bPUzdfs+Ox9fuI/
	 2gQmW7eBTZy4w==
Date: Fri, 27 Nov 2026 23:47:09 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] lisp: add a LISP (RFC 9300) tunnel device
Message-ID: <awoIbalLDr9gwEE5@L30177.local>
References: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
 <8707e3b0-c948-44ea-8afc-d33387925173@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8707e3b0-c948-44ea-8afc-d33387925173@kernel.org>

Hi Matt,

On Fri, Nov 27, 2026 at 11:24:55AM +0100, Matthieu Baerts wrote:
> Do you mind sharing a branch on top of iproute2-next with these patches,
> please? (or the patches)

Please see the patch series:
  https://lore.kernel.org/all/20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr/

I'll start looking at Sashiko's feedback.

Your comments are welcome. Thank you,
  Vincent
