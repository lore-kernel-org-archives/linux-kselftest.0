Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A73D75A6;
	Tue,  1 Sep 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291902; cv=none; b=qvb4WV4jGC2x/WWpSzeWmMpC9WR6aVMe7la+S5a6o4eYe8SPU2mfrHo9Lt02UmmVqVKkhUTmC1vSPmI3sZ+66EcR4Cng2eJukrc1qoEEJyO7s72QyNGIaOsldmdZS414ttynJ82N+je4bv8b9iaXUsdKT+/Rda9bypjN9ZlEzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291902; c=relaxed/simple;
	bh=bHCHhvUcFXrc7jtqYq3GgkzC0r75MgG9iRoTawtOo68=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2/K1kyaqKrrK1OTbQXMPXTmfT9KVv2LfsWa2Y2YVulsNabROtOGZXcHJY9Y/Pe9aGAqUHxukFKdHdl1tHPrNONXGQJnOpkkTixFjEb1nkVqogBNT76TmemVHyZpWA9k+1As7JxDfrW3s6WYFeD6x3U0077p4swv9g7rzphgobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fagLo42Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fagLo42Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6BE1F00ACA;
	Tue,  1 Sep 2026 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788291901;
	bh=LxF/Rg4+kQ3io3xffo4a7oXM/qXJ6e0Gg4EOV7ZOvAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fagLo42Y11DNqcz1Er9L03qsT7b2bLdQC6Mf4UvKLNLPz2bjMjUQ8bFUd8CFvj6FA
	 6xemH4ih71azalwzvqu/5cB31G+Mx9m+jAKw83wa0yzd/Z6axGU+xJajADJ9i6JftM
	 ke70cdn3T8SVFV6SpqvllkTGORzlFoAhM2lymcFjkYfXd4ECHABgZwQv9JPPXxDvR5
	 8paISbIZpe68C5R1QVDFctOcz2mDEgi+QtC354xby8AiOaroVOYgOGef3sFEeA5gyI
	 DzDZxti3m7YhGzIh6gKMGkNr/VsZ7x+KKc4ywPLFHKFwU+Vl7l4nBsrpQtImW/q9sM
	 gCP2CD9cEvfJA==
Date: Tue, 1 Sep 2026 12:44:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, petrm@nvidia.com, linux-kselftest@vger.kernel.org,
 noren@nvidia.com
Subject: Re: [PATCH net-next 2/3] selftests: drv-net: split gro.py into one
 test per coalescing mode
Message-ID: <20260901124459.4ece3818@kernel.org>
In-Reply-To: <20260831163734.1121891-3-kuba@kernel.org>
References: <20260831163734.1121891-1-kuba@kernel.org>
	<20260831163734.1121891-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 09:37:33 -0700 Jakub Kicinski wrote:
> +from lib.py import ksft_run, ksft_exit, ksft_variants
> +from lib.py import NetDrvEpEnv
> +from gro_lib import run_test

ruff is nit picking on the order of imports here, I'll have to respin,
sorry about that..
-- 
pw-bot: cr
