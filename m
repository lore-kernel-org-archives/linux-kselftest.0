Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D11E766F;
	Thu,  4 Jun 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588166; cv=none; b=LvdoV1xggZMwd1k5cxYfUDksVE95vVT4y5ys6uoRFsb5A3QMGTfrKVjluCWiFN9xxDPx5hQ6tEmavXcIN8aiz0xJv0F+ogDYzRXclpMIBnH039+qLkdN8OjAJKa/TXHCUztROFK1GjRdLU7NVbF2j5EAzA951QOlh3oHEwiUBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588166; c=relaxed/simple;
	bh=Yheoo+y7D6MHDU8a4Nq3V/CSu6re5iqIAHmk9PMYOD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMuYNaPy5cHKU1Sry/oXGe+JNwHWHS8asvPARiQiW7flE+ZaxkwwhaX7gldqdrHFR2FFc/opydxbePg9limTMoaa6uSTSHgMPSnIxrsmax/JA3z0N3YyqSLqKadfv+BHTL6Ljm8IzO5anEn/fWctkMOFTHVxHhF0+412bFGu/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hl71muof; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hl71muof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77111F00893;
	Thu,  4 Jun 2026 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780588165;
	bh=jfdmmBjS2Sz9P2/iM/dUof4bklCIFpmA3vTieSl5ci8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hl71muofP8AZ2jY2mq45xmt98n3htghNAyW8mjoEpjixHLV0p9kCUQFe5PpIRrMEh
	 Q3Yg0jHN1Tu1Sv30eAlgx+vXLHw0FryQs5sKP35K75PeDZjPnJMkI7rsQqLE9t8tm6
	 PfoNbOhj9dYI45ckPsfG759YqEjp4ABaSxAvBLEotOm7T8fCiPmfxOaE7uG4KRWdbu
	 AaVAqp/9FIHb/Rjuq9+J3Bw5oyBk7xhiYetPrqV1J7yjpaVD2KZysl8jkhNy/0QBJ3
	 VKPR/C8HfW6jkJGeJMidCjZh6IoYA1Pq4GVFyAa0Ft3tjv7+En+JZb9rcdGxaYnYT1
	 9NKpssU/COpCQ==
Date: Thu, 4 Jun 2026 08:49:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: aroulin@nvidia.com
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, roopa@nvidia.com, petrm@nvidia.com,
 idosch@nvidia.com, chirag@nvidia.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] selftests: net: add vxlan vnifilter
 notification test
Message-ID: <20260604084923.7577945e@kernel.org>
In-Reply-To: <20260604131922.3928241-4-horms@kernel.org>
References: <20260602185138.253265-4-aroulin@nvidia.com>
	<20260604131922.3928241-4-horms@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:19:25 +0100 Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> 
> Simon says:
> 
> There is also an AI-generated review of this patch on sashiko.dev.
> And AI-generated reviews of other patches of this series.
> But I believe what is forwarded here covers what should
> be considered in the context of this patch-set.

FWIW doesn't read like a blocker to me, please follow up if necessary.
