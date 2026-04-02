Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555A2E2852;
	Thu,  2 Apr 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141722; cv=none; b=c0NqDbfZHSkBC3aLZ0I3I37GjpvVorVlo+TgqsXn9bSL6w73DMnEktov74uHmxFRbT2DPpzR4K6K84b7sFsoO8jeLNMn9IukR/SlEp0aZ/d+mPUq9RB0f9ilbs96bHZHvsdrHsLkSP8XA23sIBrbw9tW0kr5A8tvxNISXLXAf6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141722; c=relaxed/simple;
	bh=4KvT27Phmqs/LlOjBq1SFGpQjW+saLchZ2yPAp7bUp8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVIxiITm0kE0wCE7JmP7f4Y7BwQgI0TRFHKimxiSAOym/BA1U4D1uA/x5aOTNDSNgmEVkfvCYk6ATpm958KSqqphQlYk5PHSnpj9shc8MyQrh0y2ov6MpW+6U0fmowQcoLPDiT1VmVH9632qY9sGvw/U2+1Fvta+wjM7CrcFy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtDrquX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtDrquX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98509C116C6;
	Thu,  2 Apr 2026 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775141722;
	bh=4KvT27Phmqs/LlOjBq1SFGpQjW+saLchZ2yPAp7bUp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZtDrquX169hQ4SwOdyyHgtr7A5xDfeZS3hAr+B/P+os04BP2c1VDqVAtuXsC5qfzC
	 hRbMYZNG2pJlBwjZQlRsww2Yidq205nkldgssA5espSsSUJCQCFPm8wshKrGMwEpUB
	 MsnRuKnyFtNw96+Hnq/6skFkLh4pcl3ldKrIcnhq7j0+ML3cTf46lSzw4aUcaR5rtG
	 z0Kqu4x60XtmYEOhcxfWfcNR2PzQBS/AfzFJarlZv20AvroSCE7On2sYp094BW8rxw
	 LHpzZErbpdADCIUYe6hu/lN2ycHXis5yVlZ3ZGbqz7m6/x4qgqckhiIrqOwkADLHp9
	 Zm7SWL3eGf2TQ==
Date: Thu, 2 Apr 2026 07:55:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Qingfang Deng <dqfext@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Simon
 Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)"
 <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon
 <jaco@uls.co.za>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
Message-ID: <20260402075520.313832ac@kernel.org>
In-Reply-To: <24aea6cc-d599-4935-8a75-34f38b852d1e@lunn.ch>
References: <20260330035604.133073-1-dqfext@gmail.com>
	<20260401081030.29b050d5@kernel.org>
	<CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
	<20260401175621.549c492e@kernel.org>
	<CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
	<50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
	<CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
	<cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
	<CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
	<24aea6cc-d599-4935-8a75-34f38b852d1e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Apr 2026 16:37:01 +0200 Andrew Lunn wrote:
> > > ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so
> > >
> > > should solve?  
> > 
> > Hard links will also work.
> > Alternatively, if your rp-pppoe version is 4.0, you can use the new
> > option `-g` to specify the full path of the pppoe.so plugin.  
> 
> It should be possible for anybody to run these self tests. So we don't
> want specially crafted setups, but generic setups which will work for
> as many people as possible.

+1 let's try not to tweak the underlying OS.
