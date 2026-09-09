Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DDEACD;
	Wed,  9 Sep 2026 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788913833; cv=none; b=uGgdDsgYQWHrjR8YxLET+O9SXWWM86euA366eD/ednLhut1tgfe+pFGwkDOPiCVyAhraoR0tkWJ++yR3HRtZ6JEVNWO99z0Yl4u23MZ2BhROV8WnandyOI/zD1/Rp5LrmSHV2d5KhvjwwRf8XPRGDBlsKMkPAzwgJew1aZvny84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788913833; c=relaxed/simple;
	bh=jiDhcFsdWvi1YHPLBN4LN2WuoLI9q8qEiJ2zFycRVoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhShL5+dwatBkwbTIbj99+tPYXKtGVIquk18XEmJ2D9NLQTrwMq0Ar5arOniZqv1inaQT9Y233+5MEeQsDzCAVXinrEZfadfXNCXU3C5cpnWyKzNj4rU8bmx48QgpLnhw62zTwq4MrpS2aHTrKYAt4hz/0ggACtCEBAmrssjE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+H3jQ2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+H3jQ2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C701F00A3A;
	Wed,  9 Sep 2026 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788913832;
	bh=7tlqmCa+NEbwzL7I+vy7EwDUGcr4kqeo3V/X07gUPGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U+H3jQ2qm33WcNy9xygGPI4n20cVTP1NtjRXo3ylb4Xgn3DF+fiL6oRR6eDmMlRfd
	 vnBitAGMhLii5plVs7DZ3qLJoPGCmUPfnN9CxO8LiXse3NXy5UHtj3kwWw1xpS6ozG
	 RRTd3g/HLB4le1vuX7MNUVUhqA3ZZ4kfLGvBSCKGcpp21ftwvDkFI/D74YaWJyqJmg
	 E8YHGr9omeWUKhSzephTADK4Sh1dlRLPtT/GjRCRsW56J0NxZ+c0X5XEZzl28vqy7l
	 oAzU0ryy/KsEbxZlx4pXQI2FWiBfJ1wbZVbr8vnKmkbqan+fllxRkET4ZtkvQPONyY
	 Je7aejXM2jGlQ==
Date: Tue, 8 Sep 2026 17:30:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, matttbe@kernel.org, Stanislav Fomichev
 <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/2] selftests: drv-net: Allow
 cross-compiling the hardware tests
Message-ID: <20260908173031.738a17fb@kernel.org>
In-Reply-To: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
References: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 18:14:34 +0200 Maxime Chevallier (Netdev
Foundation) wrote:
> Changes come from Sashiko reviews, that detected some Makefile inclusion
> ordering issues, a stray 'Q = @' in the ynl makefiles to have proper
> verbosity support, and some commit log rewording.

Looks good enough, if it works for you.
If we see a lot of follow ups and variance in the env people want 
to support we'll have to add some kind of a build test env on QEMU.
