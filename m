Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B203A6B8F;
	Thu, 26 Mar 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549168; cv=none; b=dwWs/z3lhWpsxKk5xXBXSvrib78wvth3J4DPHHv5jN+R7jdfV6RRaudcOkspT3XTRCX/DNPSh8X6Urk+jakja0NBzowyfCSiT2FlZNLZqR2bA53HjAdsylCuwm85X7mQaSoXaUBpUxPRhLvnjtbq5obRYfe7mctkxHEE7swvaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549168; c=relaxed/simple;
	bh=3DaolWCTH2undXGXbRYLLz2UkHktHJCLJY4I8mu9AAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iI5Jfo1H4vq2mG+1cowXflNwEGGtYW2VoofUuZ7C/hvXO7Dz5Z7DBm9xZFo0Q1csEkdeyI9aAeSHjL8NzPFmKr9wsraBFAgOBnB4TAIOeA8bcvmvSaKf8CJTbDcv3YnseGCG0xCiaDqG3J2WockbZhZDeiyxfLKwpZXo8mPycg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3sNCAO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3sNCAO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E73C116C6;
	Thu, 26 Mar 2026 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549168;
	bh=3DaolWCTH2undXGXbRYLLz2UkHktHJCLJY4I8mu9AAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3sNCAO7z+7lQUP2nFrGHMGZAyH9J55GAM3ISIRDvierD+LlGehcNOgm+3rwmt0i4
	 uSZ6GqQW71GHzHS3XBHudkPq87jqKHe8qysxHs/O93c+jqFIwuRTSG3wnP3JJrRvpP
	 1VDzeQEyCYud5t7cIlf+1ey3hXPR2DVO4RamLep/CvrNGWFVumsozeXEST0K0dH/iw
	 h1sjjATwUtQX49lOj3sEdBsom2v5r8VuS8gXbvojAfoLitEOoPrsj76+iLp7csGnLk
	 ZQgMuV1IW3DeYygE5s33A+g+u0aLAvlFKZpFti+GOdTr1Kd5bwcDjpAc7to8fpGZ9t
	 IJVkP5pN+bswQ==
Date: Thu, 26 Mar 2026 18:19:24 +0000
From: Simon Horman <horms@kernel.org>
To: Yohei Kojima <yk@y-koj.net>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: Remove unnecessary backslashes
 in fq_band_pktlimit.sh
Message-ID: <20260326181924.GW111839@horms.kernel.org>
References: <dd0bbd48cdf468da56ec34fd61cecd4d2111d7ba.1774372510.git.yk@y-koj.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd0bbd48cdf468da56ec34fd61cecd4d2111d7ba.1774372510.git.yk@y-koj.net>

On Wed, Mar 25, 2026 at 02:20:28AM +0900, Yohei Kojima wrote:
> Address "grep: warning: stray \ before white space" warning from GNU
> grep 3.12. This warns the misplaced backslashes before whitespaces
> (e.g. \\' ' or '\ ') which leads to unspecified behavior [1].
> 
> We can just remove the backslashes before whitespaces as POSIX says:
> 
>   Enclosing characters in single-quotes ('') shall preserve the literal
>   value of each character within the single-quotes.
> 
> and bourne-compatible shells behave so.
> 
> [1]: https://lists.gnu.org/r/bug-gnulib/2022-05/msg00057.html
> 
> Signed-off-by: Yohei Kojima <yk@y-koj.net>
> ---
> I tested the patch with bash 5.3.9. I couldn't test it with dash because
> the test depends on a bash extension with "if [[ $# -eq 0 ]]".

Reviewed-by: Simon Horman <horms@kernel.org>

