Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288738B148;
	Thu,  6 Aug 2026 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043764; cv=none; b=Zy5R0QSbOjGZUh7vSky+8+tM0YNdgMk0Gy9uqYdHOFJKaZeU78EvQ9LgzXQ0P/ANO7FOLlpMvIJ7KpIxzXPKd+c6vdr5Sauc30zIQjTkp+hGcWRzI2SDWsxkZ/etnbhu6mGIhxsagj6LFcXDLXQe4kY8Jx3+mO3chxkulTMsyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043764; c=relaxed/simple;
	bh=Ayoefe+u83fV40A93AX5I//aRU9OYWNyojyyOJjUzkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJly9atTdMDBs17+R4lg+d4ast5gdzlqbA1pQd33ShpLuGwBn4a6GqGfOnoXliDhV1SonxIUErjFKJ/HSz+4xcSHZRNUynt2EK7/WQ59RJkXjmXDf6AfWouS6IGnT5vICzueoW3rIVDolTUwKlYyEU0Tdfa8C9VcwraAn4ixu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxWkrqd9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxWkrqd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57A01F000E9;
	Thu,  6 Aug 2026 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786043763;
	bh=AklPtlKe3UTLcRSVQyR6y+5whHoeaUhYUouu2XQfPjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KxWkrqd98zLESmj/3kWcnlvp0SvGH6+nU1rvMPdvWU0QRSwrSZfZkcdTqU2p3Eh+3
	 OY2gSvjo4Ef7YfHgn4RXyrAqdWH5+tUrVH647+z9OyNB+2hJR5MPS8O1IlFEengx/Q
	 Ch831ka2CLoc9hL6BgBDnBxZI4AwRHchqfxy0W2qIk7t4KQU7dx09tqiqA2Vx6sSY7
	 TjuekrSFXc43ZY+7Ls+h9IGZZmDsYs/pNx8o5320+sewXtDH3+F6z+GHDB3V8c76oz
	 YxbSKMX3tFbDJ+8egXHrpC0KxmSYoSkonT5nC8foE6tF9SxrS3QRkCHOJUD/JsAEvL
	 rnj/rgvC+4Kuw==
Date: Thu, 6 Aug 2026 12:16:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: ncdevmem:
 gracefully retry bind()
Message-ID: <20260806121602.711dfa34@kernel.org>
In-Reply-To: <20260803181852.491437-2-almasrymina@google.com>
References: <20260803181852.491437-1-almasrymina@google.com>
	<20260803181852.491437-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 18:18:26 +0000 Mina Almasry wrote:
> During tests, ethnl_rings_set randomly bounces the link causing a
> transient IPv6 Duplicate Address Detection "tentative" race, resulting
> in spurious -EADDRNOTAVAIL aborts inside the ncdevmem server.

The test env is supposed to disable DAD and addr flush on down.
If DAD is enabled multiple ksft tests would fail.
