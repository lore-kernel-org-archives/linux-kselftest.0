Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438D4B920A;
	Fri, 16 Oct 2026 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177896; cv=none; b=qIiusWTlFIm3iNFOmHn0qASqoROC/MbOMppKtL6Ujn0r8SwR8PXomYYZuBFNm3pakoY3NDiHKIrVedhSlpB7Ka7ASpLuYGS+3W+ZSakPd0GRiY4kjx+t2qlrj1F/bmaLBIwKYezMkKn9wGSyQg/ga13U3BJL2vzVzue4LtsBK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177896; c=relaxed/simple;
	bh=gjH6ux9/CigwD9+Mq+IjIYt7czfNODQFlEwDOIEcbgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKYbwf7beH7xfYlan2WMLNUQ/PVJD5pvpO9lN6V13QmbaylGKHxDJdPQY68NY06uiDGonvOWIJhyRjNM+e7i4P+HhrfXNpG84uFbV9ojq6C8UQXKrnRHzSbY+JeYyPg7+tJJSGmHE9BUNpoMH+cVE/x55H0/EOpIUHPoeuTfInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGSsUU16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGSsUU16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30201F000C4;
	Fri, 16 Oct 2026 19:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792177895;
	bh=J2j1LNLr7By959XSlo4ZiGSoARkrvuevt/yFJn5g9kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IGSsUU16HpYSWfBbYe/HiwYqYejiEqzKDe1Klh5HULcrkXtkVrZeeUaIn19OOwDPq
	 4zOdaryBP3t6Sfv0m+BTWAZXU3Hn4Ap0jTJXjhKX28oW3FacMl3k54P5k/1jT+IGf+
	 KpKBbveEuAkIookcSlNfxgi0N1L1A/qwTIxCdj0WSSp7zq5oJga9heCqotXgNGw3j/
	 xZFmeQx0bXV7vdUnhXqUBEduXMzaC8R1kEcGcLceKRBlORfd/tEgyZfl01NkeHtqE5
	 MJBXrNc+wULcOZ5i761qXAcCfrsc+t9PtXJ7ljeI2hSqVvkJ9xjHxf3fhJijuIKiel
	 JOyeh9HN52e2g==
Date: Fri, 16 Oct 2026 20:11:30 +0100
From: Simon Horman <horms@kernel.org>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/2] selftests: net: big_tcp_tunnels: Cover
 bareudp
Message-ID: <20261016191130.GQ363352@horms.kernel.org>
References: <20261011102023.1603595-1-yanhaishuang@cmss.chinamobile.com>
 <20261011102023.1603595-3-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011102023.1603595-3-yanhaishuang@cmss.chinamobile.com>

On Sun, Oct 11, 2026 at 06:20:23PM +0800, Haishuang Yan wrote:
> Now that bareudp allows BIG TCP too, run the same checks over bareudp as
> for vxlan and geneve.
> 
> bareudp only works in external mode, so attach the tunnel metadata to
> all packets sent through the device with a tc tunnel_key action on
> egress. The device uses ethertype ipv4 with multiproto, so that both
> IPv4 and IPv6 traffic can go through it. Its MTU does not account for
> the encapsulation, so lower it to leave room for the IPv6 and UDP
> headers, otherwise the encapsulated packets would be fragmented.
> 
> Assisted-by: LLM
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Reviewed-by: Simon Horman <horms@kernel.org>

