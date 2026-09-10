Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C194A689D;
	Thu, 10 Sep 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055974; cv=none; b=H7VHGtADM7OGNQcbHTIhBh4HiSIAxZQucHaDnfL1DdBKHKwB67v/+7LXVTjkSziS2/8zygJAcsSN4wC201RjPIWlW1DK4eXfCOi81YzMERUdvOJrB5WSxsC8uefpD60fPLF6jjU/5Xve5tjWqq2L1YWLnKInrBaFugsmV8jRBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055974; c=relaxed/simple;
	bh=VdDPLmFJ59/KbiUMKtdpeshRYrxad3WQQQnpPrHP9WM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cICRQE9Gcs8YCdHPNO2nqlbiWo54ba1VcdgKYLwojgrrXW7w2V7ZLDv17GCcTAfaGuPYPlgW7ps419tO0XQEK/9JHoJcH0Q54XPMAAv/avtI7NZ30b/9t+u43JJg0OKw7Z1WwoyAf/1MynHeBu9TwUoqpuj6Gnt0j5dT+fyyM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nszzFJhI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nszzFJhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536E41F000FF;
	Thu, 10 Sep 2026 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055972;
	bh=6ctFY/43UUF0cp77KH5DJu3peGAb0YebxAUBcJ4p3ts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nszzFJhI0pNRTWSrXZUBZC9NUUnFIL6PQmEa8pcMCviM3CfoBGQ2AsWKMDumex+1R
	 moui1N1XSji+DvLtMQ0FfoIBErFXulOvlqQgFTS17ojUTAVa3wK8YuLaQ21AABGKOc
	 +OmayvF6TP9QkPN3JOsSmx1uVXsmyT5vyqOhD83daWXfWavbj3rkIKMfelqSb9K6WX
	 /GZkKvj/gxYgm7IYE8YCJBe52LadxFEoJylcvw4BhWnBJ/qFzf1ETiyebYb8BVaPh6
	 D91DuvAO1PWijI3zGrH4yx3ZVbltpw3+SLjwWD4bEDVIUtLfgeQJS0TX0OSRjsLVoD
	 zf84PmMllADKg==
Date: Thu, 10 Sep 2026 08:59:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Bobby Eshleman
 <bobbyeshleman@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
Message-ID: <20260910085931.3c64f2ab@kernel.org>
In-Reply-To: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Sep 2026 09:11:54 +0200 Maxime Chevallier (Netdev
Foundation) wrote:
> thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
> Subject: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool

Hi Maxime, thanks for the quick fix. Looks like this did not hit
netdev, unfortunately. It reached lore but via a different ML,
and our patchwork only trails netdev itself. Please repost.
