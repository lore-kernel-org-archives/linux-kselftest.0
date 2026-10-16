Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A2447256;
	Fri, 16 Oct 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177677; cv=none; b=vEl1d6q1dZ86m0wRqVklMcslvqdixjpXtyZoKCP6aCGnHNZaPPHXXP3OzThM8XORw8iiq5zrR+1T8PUDlYByt+jp0lL4cHuSoG1Cka3COZ8o4Mq7EshIwUKWVg5q/aDGmQTCGXy4HeqLbcSLt70y3Hx916TZT7q6Ab1Q3jx/p0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177677; c=relaxed/simple;
	bh=lUdXSaUK5fXyHCQH30RThA3DVtx4NR78pQljp7z6GHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww5qL5CW4UfaNzZDXMqCVYAQvu7KCyvsy1pGS80r54wkyXN8YTm+ixDQqes9nWMjHitRdW089Lwcg/Wtdp4XbBimcLV+KPwUy6jzwF1rS2mZTeYczcsuq2+KOghvBvnqbMcJKjAA8e1kcX6z0XkDoA2itUyxUmMyxk2Lejq1L+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4XHN9m8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4XHN9m8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7860F1F000C4;
	Fri, 16 Oct 2026 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792177675;
	bh=R5jhCuNMad3ADLAyJRGsEfJSnn5mHRKo5srAv35iPBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4XHN9m8mX1rdjH2orMnxRDrVCOrwGYLqU2Nsck8lE/9e7U/ZA6ADZBeSJDQaSVBx
	 57zumMQEmmEB5X8SjuII2x0bkE732XIEAdWgXj+fdTK4HiaEDEW5uzvlHEeIHBItRU
	 hlHgjxOHurln5RhRp1sr5+xOGvE2jvUTcDETT8OJynZiaMMmr9syFJz2hEXoyziPNg
	 m473xqVdLY0v1o+76wjt7z4D/C49JZAc4LyutdGXTbQICpikNN0F2XAvA2FxD01ooJ
	 kVxvNRTFMA6lwc2lOO7mGaJAAPs+6jS8qCeSzmTqDFNX81rMIMSUSIE1it91WZy1O2
	 IxT0EXyorkzIw==
Date: Fri, 16 Oct 2026 20:07:51 +0100
From: Simon Horman <horms@kernel.org>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Martin Varghese <martin.varghese@nokia.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests: net: bareudp: Add stream tests
 with software GSO
Message-ID: <20261016190751.GO363352@horms.kernel.org>
References: <20261011104300.1606351-1-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011104300.1606351-1-yanhaishuang@cmss.chinamobile.com>

On Sun, Oct 11, 2026 at 06:43:00PM +0800, Haishuang Yan wrote:
> The bareudp tests only send pings, which are not GSO packets, so the
> segmentation path of bareudp is not covered.
> 
> Copy a file over TCP from NS0 to NS3 with socat after the IPv4 and IPv6
> ping tests, with UDP tunnel segmentation offload disabled on the
> underlay veths, so that the GSO packets encapsulated by bareudp are
> segmented in software. Raise the MTU of the underlay veths, so that full
> sized packets fit with the encapsulation, as there is no path MTU
> discovery through bareudp.
> 
> The MPLS overlay gets no stream test: bareudp does not set
> mpls_features, so MPLS GSO packets are segmented by mpls_gso before
> they reach bareudp, and are dropped if mpls_gso is not available.
> 
> The ping and stream tests share the result reporting, so move it into
> report_result(). Without socat or ethtool, the stream tests are skipped.
> 
> Without commit c57b2e60d4bf ("bareudp: set the inner protocol to the
> protocol of the packet"), the IPv4 and IPv6 streams over UDPv6, and the
> IPv6 stream over UDPv4 in multiproto mode, time out.
> 
> Suggested-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Reviewed-by: Simon Horman <horms@kernel.org>

