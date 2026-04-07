Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBB17C211;
	Tue,  7 Apr 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555004; cv=none; b=uNo5cfBped9s5K1xZwa3bl6+QV6ysF9TUflkNQ2IUiCQoKK5cv0zBiG6Xa5k9wVcvsZFuPK7R8rgVYa5bOjZnjwNhGec6R0F3rugOglIdvzR46r38wC1dVKcgJ5CTvsch2B2qh8xi9dwdbylAAEvLuZGS+84A5Ku7B2hy6HOl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555004; c=relaxed/simple;
	bh=Ap4r+tPeUBSMdbXyn++tg47PM7FG3DxtL85yOb4dXzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPoWXyYoRsabzfGhT5iEoQ2iG0kerAiN8xRYv3XCJ26H/aJeE/U323Wl/2GEwpZajr2IU+Y7bO++wXLP5f6AkX7gugAxunryxkksQq9rFXt5FWLiVtPMKiTtuCUBtWcvKkCGMY/esSxxJ50QDb+PlQAI1nKVFDYumKK2Gkl8GLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=oHnW/oTH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="oHnW/oTH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AraoNOGQyrP4BGlaGUJ/u2QG8FiBKNZjkR45jHcTWQs=; b=oHnW/oTHuaVnhBozl2VUbZi4at
	0r7dtv+rit8eBlQjJiIPRcddLosvVrydj8MdEjn6dcIg1vwdZi3r4rF7OMpbx+JuvPzh7iSZMDl5s
	CHGAKLbF4WL54dsr5m//EMnSEezNYjwY9nlXCURfRiLk8pIEFQ5oJJSV+N+n1GgjHJNcPKyEiQ/sV
	PlXN+EdyHljcqQVK+dvbWhSAVD+fMirupOIOhEEpku/S2nXqSETrXPpEc+Uw+9b9c8RUMP4E7R1ke
	5cVFYt4fEHgImUasTWf7QQ/0DDoFBqBFCmoIwYhPqofZV04++i/Y4EXACQPAeYPDxFZWfkzTVVFVk
	m84qqHiw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wA2xo-007Y9m-25;
	Tue, 07 Apr 2026 09:43:15 +0000
Date: Tue, 7 Apr 2026 02:43:09 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: adjust to socat changes
Message-ID: <adTRoJTdIOs8mu9o@gmail.com>
References: <20260404230103.2719103-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404230103.2719103-1-kuba@kernel.org>
X-Debian-User: leitao

On Sat, Apr 04, 2026 at 04:01:03PM -0700, Jakub Kicinski wrote:
> socat v1.8.1.0 now defaults to shut-null, it sends an extra
> 0-length UDP packet when sender disconnects. This breaks
> our tests which expect the exact packet sequence.
> 
> Add shut-none which was the old default where necessary.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
