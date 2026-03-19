Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272FC40DFDF;
	Thu, 19 Mar 2026 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773880084; cv=none; b=eAQR+r7AH3KYgYtqtNgnrEsCOv1MNBh0rwNSmXNaU2ht61rd1TPT0hyfBzUuBAnuo4dWktQn9HoB4df6IiVcd5l+ECjZaw+cDCAAnU804+6hY0oWBnL4U54TZ5Z+ZLP3CGwVytKw0TithEbBjH73I7bD7jFpQkwCc4CN9od/2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773880084; c=relaxed/simple;
	bh=/B8NFzYa5ZF8jqU9nSokZOddilWhFqaNRouBCkCea4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/NjiIg8wL5HzLBIb8kI2b8K+u0MYoQiLAyRXfKBv8uqyjhb+UWxWJ4HCAQixGI0v2mKwKEvm2D8XwBcD/xQ3/nFQvuAIo3BhFmSjMpYDkrcZBLfNOrhb0iaFGlNrsVRhFxgD5AHcD4XQclLIcfuyrRGundYLgMvUyXo3vydJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W54R4pGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W54R4pGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AF1C19421;
	Thu, 19 Mar 2026 00:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773880083;
	bh=/B8NFzYa5ZF8jqU9nSokZOddilWhFqaNRouBCkCea4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W54R4pGTywSLevE3BZFYhAgGVVj5Y5E7liMzxN2k93bjICMOx4GmhWgOg50t8ZLl1
	 RpUae44E25HmSxjETscUQgbb9U1NrSt2XWnMIoWod2btCqT3GfuEZ1I0Xg5XcXMsTM
	 PM4uUFguA91OHxz6z4dADA1ZZ4Hi+Pi71qgAqjUnN83KNqUK1nP/AAnVMW/w5e/kZj
	 h9Prgv0iGt4/x/k1KMvL62KNG+okxZs3TKXm7vG8K+FPeCr6XnyWcKjlX/LXLp8zvb
	 wMgXB/SdQuSuRDp5aTqJhZKVoxcxrdoBMojvte6JkKZataLC01Gmwn7rWC7W0iOy4G
	 HAYT3W8gCek8A==
Date: Wed, 18 Mar 2026 17:28:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Pin-yen Lin <treapking@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Taehee Yoo
 <ap420073@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, Willem de Bruijn
 <willemb@google.com>
Subject: Re: [PATCH net] selftests: drv-net: ping: Wait for carrier after
 toggling offloads
Message-ID: <20260318172802.46c1fef1@kernel.org>
In-Reply-To: <20260318010325.2003395-1-treapking@google.com>
References: <20260318010325.2003395-1-treapking@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Mar 2026 18:01:17 -0700 Pin-yen Lin wrote:
> Toggling checksum offload (or HW-GRO via feature dependencies) can cause
> certain physical interfaces to undergo a reset or a temporary link-down
> state. In the ping.py test, this leads to immediate test failures if the
> ping is attempted before the carrier is restored.
> 
> This is observed when running the test with GVE driver when HW-GRO is
> enabled. When checksum offload is toggled, HW-GRO is toggled as well
> because of the feature dependency. This leads to an interface reset,
> causing the subsequent ping to fail.
> 
> Add a sleep period after changing these features to allow the link to
> stabilize.

Sounds like the test found a legitimate problem. The configuration
should not return to user space until the operation has completed. 
User should not have to sleep 10sec each time they touch NIC
configuration.
-- 
pw-bot: reject
