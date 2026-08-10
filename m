Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664AE3A7F70;
	Mon, 10 Aug 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352585; cv=none; b=JNYhHWRcN3m2T3FUjjVjPrwJ3BmblnVCY2WWg/eJXwdFrwcJrQH15UuRzMBT6YfkkMFif4T3LwhLXsoOiV01tWBKVv65XbX6Z7WsmVI4FLQfyHm8WAd72yi7I/BYYXqjwG/6HqpCGuJfjX1JC5W41xWtDWH06nYwnS8vQToc3vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352585; c=relaxed/simple;
	bh=/2uZwumGt/ZXteExYMBlsPb0ZBj0kcYhk2JZpnsFq/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=En2Ootq9hlwTtTPylwPgfy7Nh1XHT4J2jfgz0cI/QZtSkx9DXmP7LMQq2UQaKphbslsl8hH65Fhq+8hc3KISsKpdOH7/jHxzKDl8b6FGvK6LRLxhjpANOBcmiteZqmZt8i8ABPwYYyswqdQ03m6FxlWLoDLM5TmOwohD+LbplJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=mnWhq6j0; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="mnWhq6j0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tpKqHS25l3eXJnK+XCFqL4sXwz2jVJLk04lOccvzrac=; b=mnWhq6j03gU9JfYHJSlxAgDX0r
	M9lZTO+bxNRPSWdGzIT/hwBRDvIueavF0UNLql/fR3eM+c/kKI8MqJFHhKsjxggtaC/D4YGnYuX81
	1l+ivPZ4Q6HWipo8jBhopWoXo+MclPs8rAHcXD3bR+beohc6UsiHmnufXq0Xx/SVPYcv5STfOf6xn
	wOMGaYL6LvNpkcQicZ5e2sQm7ABY7CVv7jPLClIPoj172D99tef13sGCSG8QgeA/Qyhfww5wYlNVJ
	5CUuR6rCqmwgEGGXM+A84BtWSfS3laetT6hAqdQNo1Fbj9XrvrYCUW141O3LRgmr/lSSBGJGl8fdJ
	TYJI5hJg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtLu7-002ddk-0l;
	Mon, 10 Aug 2026 09:02:43 +0000
Date: Mon, 10 Aug 2026 02:02:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, gustavold@gmail.com, 
	asantostc@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 0/2] netconsole: replace target_list_lock by
 RCU on userdata hot path
Message-ID: <anmTnb3a1m6edg9H@gmail.com>
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
 <20260807170908.53188cee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807170908.53188cee@kernel.org>
X-Debian-User: leitao

On Fri, Aug 07, 2026 at 05:09:08PM -0700, Jakub Kicinski wrote:
> On Wed, 05 Aug 2026 03:58:18 -0700 Breno Leitao wrote:
> > I would like to move netconsole to use RCU on the hot path for
> > a while instead of target_list_lock. My goal is to have no lock on the
> > tx side at all and eventually drop CON_NBCON_ATOMIC_UNSAFE, if that is
> > possible [1].
> 
> Bot says this didn't apply when it was posted.

Sorry, let me rebase it and update.
