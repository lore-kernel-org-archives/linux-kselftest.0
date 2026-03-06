Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A702F0C79;
	Fri,  6 Mar 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772830891; cv=none; b=K34oZvowCpXaV+J9jL6AMqpcJV3u7/lM5KEdUpB+0DhKg9LeWvR/WhO8ugaCkikHXz5GYpAPq7fYfl29c/CU6CUMOSGtdIeyaivRqIqpq6IiTU69PyUgMhTEGbC0AlIt13zo5dfoaJJmoTQEdVWjoiWhZOjWqQF6DwdUZbfSl9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772830891; c=relaxed/simple;
	bh=WSE4TX2vKrSPfMke/B27gIYINKQ19826nt6K+Q+4k84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMqGZzdaMAalV0C0Lfp9qyqwRcjDimrJA4v5K4XVvZ03hZFivbvGKMshHsPAqlREOU+Id7AEXudga47YQqPoew6Ruka1dVcTQpy4VzQPqgyfOdqqUJNrNr/+W1QTc0uoLF2ZLjPLDcCMXu7DE/N2EGlhYNGqB9SY6DC2z1oFHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLLrYahm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLLrYahm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA35CC4CEF7;
	Fri,  6 Mar 2026 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772830891;
	bh=WSE4TX2vKrSPfMke/B27gIYINKQ19826nt6K+Q+4k84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mLLrYahmgBBy+fX3zYLq5NZkzMsVwTY7euuAGALIDhBWRfIZQPjVmYOEGeWywA8ez
	 Qm3hZ/0YwbtoxzAJ0b8kYB835XBlCU7kv5Gjce4calSln7T5TaQcjRSI0C45B04vRK
	 NsLgnK93X/hPJteoXU9VDCApabhdSrzktwaccZD73qycIOYIg2Pk9ejjoPNGBP2LvP
	 YS/ZtzLBvKsgsYhg+814G3AHg++E995B/zQxk4KoQcduHJKikTdTIyF74+h8uCROIw
	 pEpLbotE0OmLd5v4ICI8jX83FmYEekqqr0nIrllrJsVky3z4GA+A1UFFdN1pWg6qb+
	 uxHWsHCNC7V2A==
Date: Fri, 6 Mar 2026 13:01:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>, Sabrina Dubroca
 <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, horms@kernel.org
Subject: Re: [PATCH net-next 5/9] selftests: ovpn: add notification parsing
 and matching
Message-ID: <20260306130130.559d844f@kernel.org>
In-Reply-To: <20260304230643.1014-6-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
	<20260304230643.1014-6-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Mar 2026 00:06:23 +0100 Antonio Quartulli wrote:
> +def check_requirements(requirements_path):
> +    """Return dependency issues from requirements_path, or an empty list."""
> +    issues = []
> +    with open(requirements_path, encoding="utf-8") as f:

Semi-jokingly let me also mention that you do all this requirements
checking here, all the dependencies seem to have been installed on
netdev CI already. One thing for which you don't check is ngrep,
and that was not installed.

IMO the requirements checking is a waste of effort, things always
slip thru. But unless you have a strong reason to use ngrep maybe
switch to a more standard tool?
