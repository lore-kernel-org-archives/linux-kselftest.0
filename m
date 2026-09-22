Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D6348C7C;
	Tue, 22 Sep 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037933; cv=none; b=qG5MNLVUlklF6UJG8mPhj4uCxcJNxbt3e7gk155xMiboP1ArrQcVGvwk6eH71hPzdYA5+ZJ1YZqDHm6zy8sJrRVeeOESTfHXTT+mhBzNHstuLxZv8y0V0iWUqXbFKSYIUtMNlC8eAZ23cXNcZ9rkLqCksz6NymIVFp+5nlEiSjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037933; c=relaxed/simple;
	bh=IeG5bo43O2qmr0hxjbFyfZYjX1u5+SC023GZByEl9kg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukk+SiXrikBhW4C3xEHk02uo2ykXpbcOdSMgmmYfgFgBDMDV9v6rtaO+pJRIYxJhwsJ1Buzap56fdwg6ZNhqScDm+K5xveC88+IBcP0WrLBQHqOcn/0dccFcEIYVx4EuGxpip2S92cLs3Gbku2O7giBTBzObwLTvjbb16jvHt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvKz5DO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvKz5DO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392A91F000FF;
	Tue, 22 Sep 2026 00:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790037930;
	bh=V4ZxAsF1Yx8w6WrpnfvJK/rnJJBlJSiMY2AZh/6DT6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZvKz5DO26opZxwvrnjAF/6D60kK2PMISk/pDJrR3o5752ABk60C39ocUDevkfCkb7
	 g6Y0MArLzSK5lFEAMF39IzlBZsxEclf7VQRqNPyboe+ajtGwVOGunuyEjT5XN6q58k
	 a8p9N4n2BaszphgE0QlgkUVcwTCQMfDzn7VISLzzd6x2l3jNRh4Q/w1IiU2RdUcfSq
	 lAsVZPaIi+/WmIHB0YprHzdE9ZoKhcBKDLvfAFzUodJwRy89JbuoIRLNnyT7nxhecT
	 pXdWypIGcBHngmwmAruUZoanAjb4DLMjOtk2oe7l7EslqHGNgXo1BVIJZCmZNcQiDl
	 Y2HlB/eHOowpw==
Date: Mon, 21 Sep 2026 17:45:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gabriel Goller <g.goller@proxmox.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: seg6: check extack messages on
 SRv6 lwtunnel setup
Message-ID: <20260921174529.045f0d65@kernel.org>
In-Reply-To: <arD-5t6LiBiPXAAa@luna.proxmox.com>
References: <20260918153544.1178884-1-g.goller@proxmox.com>
	<20260918153544.1178884-3-g.goller@proxmox.com>
	<20260918150256.1a1ca82e@kernel.org>
	<arD-5t6LiBiPXAAa@luna.proxmox.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 11:55:27 +0200 Gabriel Goller wrote:
> On 18.09.2026 15:02, Jakub Kicinski wrote:
> > On Fri, 18 Sep 2026 17:35:16 +0200 Gabriel Goller wrote:  
> > > Add a ksft/ynl test that shoves invalid RTA_ENCAP payloads to
> > > RTM_NEWROUTE and asserts both the errno and the extack message are
> > > correct.  
> > 
> > Please be judicious when adding tests.  
> 
> Got it. We can either drop the whole second patch or I can simplify it and only
> add test cases for a few error messages.

drop, please
