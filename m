Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A5B40DFD4;
	Wed,  8 Apr 2026 01:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775611030; cv=none; b=sYKi6MklBaImqiMROhCuyWFLbvDV9LhEdKy3V3WHPbV7IOsR2XzKLMwfScFeiuUn6eQhqVqYiJSa99LCfMnFoFvNseIU7ibcAdlQBQJkS/Zuomn4BCJUNXCAS8meV/poKuH9UFnVr2nVhhm1DaUxxY5MCgUmxr87jmocsIVjKvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775611030; c=relaxed/simple;
	bh=fqf7IUVTZT6DpUe/rrYmUI3bOi7C0S5ghJSd8PoTZHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCuOKoqjc4oV0rPcONmWjeoHV7An1YWNCCvA1SH27c+0a/0/CA4YX685tRAOylcUy1PO/xqyE4zhF/cR0gLYYnw8CRLIaSwTSuzu1NXHyvwfR/BELuydlvHAUotIirirJVlaYyCcYgXDwK6KOG7TJ3SqcqpsNDJuMPV267uPnus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtCXdGW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtCXdGW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246A4C116C6;
	Wed,  8 Apr 2026 01:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775611029;
	bh=fqf7IUVTZT6DpUe/rrYmUI3bOi7C0S5ghJSd8PoTZHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GtCXdGW75T4ReDsTJTIWQOcyIgQjkRubSI2pkkLUpaBKkTFbyrMHjSaOovtJUbjXz
	 kAO8Bda2YkC5UGtunfBeYb+WP5lrVJ8DAxhltvF5I0OC/tVIZPZ9pOSx5FjwLUPPsH
	 9u9c9Q5dc1VlYVgM9pb8hf+nClJrkfwK4eLrQ5dbKRUBIau2WwoQUUcMdz5ixVhwIc
	 hcyDa8viuZSkMThh3yVgz9/trgxF3BTBlH4it+kxJNGPIEZR+L1qBPCfhyC3RZMPLO
	 HoORKZth7mu23jKxcj1H+hPmqkZZ9OrLuM1INSsTP39AIldVpmUJ4XlC1sXYzq1eJt
	 07cVTTYsPqTbQ==
Date: Tue, 7 Apr 2026 18:17:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Harvey <marcharvey@google.com>, kuniyu@google.com
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
Message-ID: <20260407181708.7a426a90@kernel.org>
In-Reply-To: <CANkEMgmeHoJkffx3B+N04buW-V0pHD9c=jajNWafmev6f6K85A@mail.gmail.com>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
	<20260406074437.3ebb904a@kernel.org>
	<CANkEMg=DOiwj-ZbTLGC3oXaQuPM=sGOjg09CTXNpguCL5dh7Ug@mail.gmail.com>
	<CANkEMgmeHoJkffx3B+N04buW-V0pHD9c=jajNWafmev6f6K85A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2026 16:06:02 -0700 Marc Harvey wrote:
> Thank you very much to kuniyu@google.com, who figured out how to
> recreate the issue on Fedora. Fedora's /etc/services maps TCP port
> 1234 to the "search-agent" service (normal), which tcpdump then uses
> to text-replace port numbers in its output. So the tests were looking
> for ${ip_address}.1234, but tcpdump was spitting out
> ${ip_address}.search_agent. What is strange is that the test already
> uses tcpdump's "-n" option: "Don't convert addresses (i.e., host
> addresses, port numbers, etc.) to names."
> 
> It turns out that Fedora has a patched version of tcpdump that
> separates the normal "-n" option into two options! "-n" handles host
> addresses, and "-nn" handles port and protocol numbers. The tcpdump
> invocation used by the selftests only uses "-n". What's stranger is
> that passing "-nn" to tcpdump is actually portable, because under the
> hood it is treated as a counter, with or without the Fedora patch:
> https://github.com/the-tcpdump-group/tcpdump/blob/master/tcpdump.c#L1915
> (thanks again to Kuniyuki for discovering this).

Oh wow! Thanks to both of you for not giving up and getting to the
bottom of this :)
