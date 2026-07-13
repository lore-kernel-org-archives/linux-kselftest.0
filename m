Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4A2F363F;
	Mon, 13 Jul 2026 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934542; cv=none; b=QL8YZ3qY7GWlwCy/csO1PJU8TJ88FmMxwrvlp3XH6279R0rXBRX+tU9o9TPsv/ndNR+jqxy06bQa35yj3TDuY4PojF0+/egxVgTxXIEx+yaQdlQ6CRVqZTO/wawr9roZQT6KsAWtCuctstZLbfevBxwfz0diH52xfToOyhp/1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934542; c=relaxed/simple;
	bh=qP8XOitE3bvhG4/VIko6r5b2wuxJRhlBiaYBGv1++mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql515TV3CrG1W/p0ZtELrUZWhMyxE9XAz1VG7M0luptBDIeH8tMV/sCP9nvzARbo9RGFUVDWA/QRZdbn1wGPpJH0Xpe1JDKiTBRsWP173IbDJokfnUlVqZs2051K1fd2ASikW5eV1kMHc+6LMRa53bmAhCVQkBZGbhMbNrRSQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=M6Ua+eW1; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="M6Ua+eW1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C49UCBnagYi0u9epW2utXyNEG2RnPuwvn7fBwawWwtc=; b=M6Ua+eW1F6A9fxLU+ZwM+gg6n1
	T7mYb5jtfJ3Yz9DLATL6teTLdNtdFxWVZq7BxdPvGfVlIIDcqSyaGe6N4+AlOUYOrSXy8HtxemKey
	8pJg6AMZ0Bp2fErWB5POzBuzRK9OjRQqM7V3nv+DxL2Ib+hUoZXtTTD8GUmyJNEvb7Ga3zZxByJgp
	P671arP1zGFB+1S20R+1i7ay9jKxQShlIF2kR3RvWt7Lk48/6xF4OnsTK/FmOj1eZOrRtw2swkHBF
	RlctKSgJDHTNpSKX2Y5um71jBG/OpK3HBl8KWpTKwajLlpCc5sqB2IKUTBoXKgacxdiFWLL9XPyBp
	UuDfMwiQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjCrc-001Oj8-1d;
	Mon, 13 Jul 2026 09:22:12 +0000
Date: Mon, 13 Jul 2026 02:21:59 -0700
From: Breno Leitao <leitao@debian.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	matttbe@kernel.org
Subject: Re: [PATCH net] selftests: netconsole: only restore MAC when it
 changed on resume
Message-ID: <alStwYm2uAU6yugK@gmail.com>
References: <20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com>
X-Debian-User: leitao

Hello Andre,

Thanks for the fix.

On Fri, Jul 10, 2026 at 11:19:17PM +0100, Andre Carvalho wrote:
> The "mac" bind mode reactivation downs the interface, restores the saved
> MAC and renames it to trigger a target resume. This assumes the recreated
> interface comes back with a different MAC, which is true under
> MACAddressPolicy=none (as on the Netdev CI) but not when MACs are
> persistent. In the persistent case netconsole resumes the target on its
> own, and the down/restore/rename flow instead drops it and fails the test.
> 
> Guard the block on the MAC having actually changed so the test passes
> under both policies.
> 
> Fixes: 6ecc08329bab ("selftests: netconsole: validate target resume")
> Reported-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> Closes: https://lore.kernel.org/netdev/f398373e-2cb4-4649-a491-9763df94d98b@kernel.org/
> Signed-off-by: Andre Carvalho <asantostc@gmail.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

FWIW: netdev CI got yellow for this patch, but, this is not realted to this
test.

https://patchwork.kernel.org/project/netdevbpf/patch/20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com/
