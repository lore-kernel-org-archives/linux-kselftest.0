Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629192222AA;
	Mon, 30 Mar 2026 23:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774914636; cv=none; b=N+JyhJmsUhYGEbGIZcud11bKuIjUOONsucWvYQ4rwvG+szG857U00Zk7St9+a6aYRtT2gPr1mBznSUQsYXPLMPAimuBuu9AqRhRISgI66pMULmq++ejSwzZttcKjHu6dhFF85U2t4kEvk2SWX4f22MKTuHEM6y/IqyRzgN3pUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774914636; c=relaxed/simple;
	bh=JVVrzySmnic9rg1EeQ6y1WKifnCxJQGEKcDGIcyoNTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdxHy4S+erlYoFK9NXz5m5Eej7cqQlyBb7Cjbz3JXu+oolgCyE81WG8gZv30jDiKjtPwxBAxzjwjGFg5fQC1euEKs5WiVrUL/XK8kHNIgG+vzTGgOQz22wO/A5RNFVjU8YZKJBETgz4tHwyVcgenmliA8464SISbLWOaU+xxsOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDyxkL9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDyxkL9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D42C4CEF7;
	Mon, 30 Mar 2026 23:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774914636;
	bh=JVVrzySmnic9rg1EeQ6y1WKifnCxJQGEKcDGIcyoNTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lDyxkL9+3vPulSQJ3j6cAvhHtj/Yk/aq+YaNvRaHzJvA1RFSxfPDLX+2KE0HohecT
	 gNe6r2h+oX8/vAHvA5ooIZUDTsmYRMrFsWO/nSEc8W9OgtBTJt+K8/aW+aeNhbyDOI
	 6ADhAWr90LOu7wsnXfRcsJsHsJdMPBuu4WDPcdaFOvouTZ4yWoS20IEvpVKoJ/OhpN
	 ErHliByO306fv4LIvUfl7jSsjtGmGlSn5YJlK6zr0TpAYPPoAH9mLmqx+YbNDjgx38
	 ZYWDHUZBAu8LqVK0sI9Ixn8ywdbqR5zVJ68fQ3fuMtogUUa8UtL+oZJjY6MbgYUql/
	 rMUBOP9652EPg==
Date: Mon, 30 Mar 2026 16:50:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org, leon@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [net-next v6 12/12] selftests: drv-net: Add USO test
Message-ID: <20260330165034.2353cb0d@kernel.org>
In-Reply-To: <acqyCOYz7HqvnvQz@devvm20253.cco0.facebook.com>
References: <20260326235238.2940471-1-joe@dama.to>
	<20260326235238.2940471-13-joe@dama.to>
	<20260329153130.61b29766@kernel.org>
	<acqyCOYz7HqvnvQz@devvm20253.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Mar 2026 10:25:28 -0700 Joe Damato wrote:
> > > +def test_uso_v4_exact(cfg):
> > > +    """USO IPv4: exact multiple of MSS (5 full segments)."""
> > > +    _test_uso(cfg, "4", 1400, 1400 * 5)  
> > 
> > Variants are probably a good fit here.  
> 
> Is the right way to do this by using test_builder?

grep for ksft_variants, I'll send a patch to mention it in the README
shortly cause I think it's missing there
