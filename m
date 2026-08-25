Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC95346FB3;
	Tue, 25 Aug 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675406; cv=none; b=bW/TqMu3PWIVenJt7gEX6szDIWTcxdmCo0R+zktPaYQUSdjboFZz3RBdGbfVBLLB733G158CFkRqN/U9+ghVkLJ2tbbQXVxNuuoqNgcQ6wYbTXt7a3Da0RJgrwdworyTdB7Qr1oI6vJkQsUWzrCvEp8UIO+aAiKSoV44DgEzArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675406; c=relaxed/simple;
	bh=BbWXWnYmStBdSKIJlAwOfEk+gI7p0iK8eUKknAAR3Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFeoPS6PlUOiTJBV2PfOvuJAd02zxZ1AvQwTNMWOjMtCNJODNu/U6NYI1jXjs9cqpGVNFwXepjakslNS3V+tY3Y/cEQZYUL0r1kvxOCf1kmfVeB/N5mJxnmGRYq5xZR9AgEGioZ15ZRkRNKmLUZHYnHBAuHTDD2oQS25xWxwwnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D9NObmfQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D9NObmfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787675402;
	bh=BbWXWnYmStBdSKIJlAwOfEk+gI7p0iK8eUKknAAR3Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9NObmfQIY15l5u2aaSltrS1NZP6RtCzS1xRqK67RM9VAelAuhenUAOmbI0S7IjRB
	 zqtug2zp1o/W4pDa9d+M7wn0rtaJrapvB6Gd3ZnVGnavkBE8diV7FxzQvA7DR+stH2
	 kumSC3c167xkzshMdjjCEvA57vUunbSgQ3pAqY78=
Date: Tue, 25 Aug 2026 18:30:00 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Message-ID: <e797e567-4341-415a-adde-9146f7ce5dd9@t-8ch.de>
References: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
 <3058613.47OiXYuuEM@eto.sf-tec.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3058613.47OiXYuuEM@eto.sf-tec.de>

On 2026-08-23 21:19:53+0200, Rolf Eike Beer wrote:
> > +#ifdef __LP64__
> > +/*
> > + * This override is normally only meant for 32-bit architectures.
> > + * Put parisc 64-bit has __NR_ftruncate64, so this path is taken.
> 
> "But"?

Ack, will change.

Thanks,
Thomas
