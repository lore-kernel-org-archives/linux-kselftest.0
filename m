Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744DB4119E4;
	Tue,  1 Sep 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275203; cv=none; b=FNmW5ddKVK6L9ukiJOru8jnjilTmuSYo2wxOtOd2Twt8UJWnJchZzPtLdLoFd5dwGMl6X3lKTggVSJUW11gnrM2QgQFlIY2J706HMszApPvOrP4GFoZR2YiYyvr7Lc1253MqpZOiIhH0k+IMsu1JK+UOaU+gsx+bC4fwgO9yfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275203; c=relaxed/simple;
	bh=kBGdIs6tL2YDFvrQWw0NVS53D5C78gFzHlgb4m/1KD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsVwDxEDvWef0i+8rtXFyKGSks5HUt7zahva2kqluUNyNV3SgawNUMT5n7BKSBFXRLk1NakCLUz2p/d/42rBcsXeXVQCpZFWAD5u3dnP6+7V3uHkDk3EqjFjGPDA+04XgfOeo4S/cS8MJ4It610+qwkFeOp5XqvhJC9MZtzq2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWHdsn+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWHdsn+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91FD1F000E9;
	Tue,  1 Sep 2026 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275202;
	bh=hg1WaGzLW3//vGBymCcNQa4v2i+BurtB/8YHsEGAvOM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VWHdsn+rCnLeTko6mGamN3z4sD/W4HgKNp8JTjoqRXAQvj2hR4bRHcus78BK1lniy
	 CfO02NfD75PkYbHr3Gw3iI0Av5gtM1gr6DGsh0mSEsg8IM8h2qKYgcDNmqY32Ri9rC
	 1LBpgmatTTjxg5WdV3Xm89l7+3Xgo3GXxKWgqN9w8pL7esdkEMTeGvK41GQbHdgBJj
	 KaAbBhqW9B7tje4QzWzHLvY7V9Cp0yOCbESSh+iW08RxEt6MsgIHeB8k1PzK9rAylL
	 j/9RKPQdg4MqGHfBr4KPPcjBKCsHzgxw6er/DRhsIQB+3YhRglXIJti5Jj0Szgxrq/
	 Xh5zJZKF87e4g==
Date: Tue, 1 Sep 2026 08:06:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 2/2] selftests: netdevsim: add speed testing
Message-ID: <20260901080641.45d02005@kernel.org>
In-Reply-To: <apZzvvEQPNHTT26c@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
	<20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
	<20260831150642.68f28691@kernel.org>
	<apZzvvEQPNHTT26c@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 14:42:06 +0800 Hangbin Liu wrote:
> On Mon, Aug 31, 2026 at 03:06:42PM -0700, Jakub Kicinski wrote:
> > On Mon, 31 Aug 2026 11:28:11 +0800 Hangbin Liu wrote:  
> > > Add a script for netdevsim speed test. Make sure the speed and duplex
> > > could be changed. And the speed can't be larger than the max speed.  
> > 
> > nak, this is not a meaningful test  
> 
> OK, I thought we should add selftests for new features. And there are
> netdevsim ethtool tests like ethtool-pause.sh. Since you think this test
> is meaningless. I will drop it in next version.

to be clear - the entire patch set, not just the test.
