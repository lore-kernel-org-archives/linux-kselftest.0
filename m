Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5AD3E44ED;
	Thu,  3 Sep 2026 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476376; cv=none; b=LWX0UKfOrJ4vozLsls24WB/myLz6Q9vJWfY2G2Knb6DuOQjkqvsrvj47EEKpeN4e+TnbhaEiSkSGwE4b8CfXAfiUOgdznHSLASE1k5b9qxmDFLpfC9OM0BLZ+JbQADuOEUFgP5cz0O2HsQ9koW6NXcRcQKzlUutWyXUq9iE0/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476376; c=relaxed/simple;
	bh=JKdZvFZ3LKZRNyuUk7gA7WxsrCA7B1Vvkfx2jt1x55o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubg9DAPtKp0xyTFLVh8nIgSPD7JnsbOar0bAm4M9nYoXrnhUhk7RegI3gBlZrbL82mYSkPK1q88hK6ng9gWSiQAe55xEQ3O9OVP7iadgsMff3yUP/kHm6khcO4V39Yh6sV3bJif3PGTNwu3Mv5hwhm+cvyz9ZvRbo4EK3VkQuMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvOxozwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvOxozwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE9D1F00A3E;
	Thu,  3 Sep 2026 22:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788476373;
	bh=jglbHv45sn/kgN6oIp/wN9E39sy51rSciV8vOlAW0Z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DvOxozwQrEmZ3cqPHzxEssLU8HFiNv8K0HAJB4DkHxqQos/vkN11yVg9ckB1VRlPa
	 WuB4XURrujgP9RzPRAMe77FrK+Fn+S9K9dteyPQGvf0okV6qdYr9wPbtse1ML/dLWm
	 vQrAS1e3DoVVeuD96mJqvtrkUMERwEXeoTvoHvoKN9EPOqwi7uvoDsBFZuqIPjQzQd
	 cKlhfXUw7bg1FfOLJxV+jXuOF4nOWK6xxdxgVvB4stNEGXNs/SFe1nw8f7SkBnP9pD
	 +5nZcmuwpeBljS6Gk/VnNbYdmNpIM0ntxDlORvKZNEaEK0UVaBTCKyiAV2qiz5jNdG
	 OC244CKVeW0eA==
Date: Thu, 3 Sep 2026 15:59:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v1 0/2] netdevsim: add TLS device offload
 emulation and test
Message-ID: <20260903155932.6b4528de@kernel.org>
In-Reply-To: <20260901154914.11637-1-jiayuan.chen@linux.dev>
References: <20260901154914.11637-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 23:48:55 +0800 Jiayuan Chen wrote:
> It helped me find
> commit b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()").
> 
> So I think it is worth sending a formal patchset.
> 
> The kTLS device offload path in net/tls/tls_device.c has no test
> coverage upstream -- selftests/net/tls.c is software only, and the
> offload code needs a driver that implements it.
> 
> So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
> advertises the TLS features, patch 2 adds a selftest.
> 
> No crypto is done: TX puts the plaintext record on the wire, RX just
> sets skb->decrypted.  That only works netdevsim to netdevsim, but it
> covers record assembly and the offload lifecycle.  Real ciphertext, and
> more on top of it, can come later.

Please don't post selftests to net-next which depend on a fix going 
to another tree. If we merge this now we will have a failing test 
until the fix also lands.

If we add TLS support to netdevsim it must be paired with a test 
which can also run against real HW. There was a selftest posted
recently by the person working on TLS 1.3 offload, we can use that
as the target (feel free to add that to your series, just keep 
the original author).

We can add special netdevsim-only cases but the main focus should
be writing tests that can be executed against real devices.
-- 
pw-bot: cr
