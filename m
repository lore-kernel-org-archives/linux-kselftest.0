Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7263035CB7C;
	Thu, 22 Jan 2026 01:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046307; cv=none; b=coLkie9YAr2HZBcjZh0xmO+7nZbfuBsktD0w0siSqIWXHS1I8eFQNe/8Qc5cwGVNoUL2j6spoOtbtO+eznbn51JckAgmYSul2q8y4DCeUWIGWYyTpnurgeSs/Kaqowx+HcAJ2we+ywG50NDColhtta60JIT6N9iVt13bSCZVrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046307; c=relaxed/simple;
	bh=Vcm1qOWkB8oHILUnwnZvnc0LrLfTguH+RX9NkigA/7E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1DiXQr/eGk2AfmuWqJObyguRte1HW5KFzUwx4nQ1/xXpuk3rVU3hM01j/dcybMqJtyf0Qh9DBKpfpWrCdHbs5Q/X+AKZYtZv+9jymiBEUxcWm/4Km+E/9fsPmCO7LkrLb0uUkUKE0P4qefg2KVtHwH0z30lIrdst4q0u6gu8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJPwb6+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJPwb6+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A20C4CEF1;
	Thu, 22 Jan 2026 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769046307;
	bh=Vcm1qOWkB8oHILUnwnZvnc0LrLfTguH+RX9NkigA/7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BJPwb6+BCZSce/4Ucq/sR7FZR0l5p8pfengCDy9M5UHcsTMzoQTi46A2/2QdpuHfU
	 2+w99z9AlbkPS33/D1qslqE8Eeg0SPD9GdGO1vsJCLPnc0jYP2pca+1Ecxv5XGfXqk
	 GxL7n7hDXycJq4Wni1hfZhYbUnQP6D2L/rPPor3gbTX4D0rre1aL9+jLhiFHotyyWY
	 Fj6PeFz4lvs+gzDIsjPCq7OES7nV6AIHDSkaoRcF4erj5kLB524DrpqF0UvlGuZG60
	 EsSJSZ/MbAojH1fOeRLrUEE1aPxzyKGc4FzpbzjSRtUhxvgE7OV19ZBejT2WrQdP1x
	 8OVwO30QJO13w==
Date: Wed, 21 Jan 2026 17:45:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <20260121174505.5e710b0b@kernel.org>
In-Reply-To: <aXFIk1L8G_dHF6od@archlinux>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
	<20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
	<20260120172057.6600eefe@kernel.org>
	<aXFIk1L8G_dHF6od@archlinux>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 22:04:23 +0000 Andre Carvalho wrote:
> On Tue, Jan 20, 2026 at 05:20:57PM -0800, Jakub Kicinski wrote:
> > On Sun, 18 Jan 2026 11:00:27 +0000 Andre Carvalho wrote:  
> > > +++ b/tools/testing/selftests/drivers/net/netcons_resume.sh  
> > 
> > There's too many of them now and they keep failing on real HW.  
> 
> Since these tests are only using netdevsim I was a bit surprised about the failures
> on real HW runs.

My main point is that even if we fix the HW setups to do the right thing
in systemd policies - the tests are running against netdevsim, not the
precious HW present on those setups. The HW setups have actual physical
NICs, driver tests are expected to use netdevsim if $NETIF is not set,
and if set whatever existing netdev $NETIF is pointing to.

I don't remember the history, it's quite possible that Breno wanted to
have a separate target for netcons from the start and I pushed back.
I think we reached the point where we want to create a target.
