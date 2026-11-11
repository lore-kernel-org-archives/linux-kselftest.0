Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392425;
	b=XmqDLio9sjPjBrgL9SIoTk48ExXuSVmujkuTkVWzo3IWfA/NIjFn5KrUEWMq2D+P/p5C
	 hK1qxQdzqgFVM2dEjOLG3pXdyne6nw5D84pTnYBGQfDVEMYYS6FQbJhjVoqYUeSmuGSLE
	 kKGnA/DqZH6bUdlCAx3WiqcKuV/J2Kvx3OVh9ZHDEELuR/NQvtO08HgRlk+RHRRsuO1G3
	 D2YGHKwHJEB9z8Y+AalrXRuzPOV2ph5rs1ylfmCnn34KMT01lekTER5jEbJhbooWv5g14
	 tIHZ8n7gBzbNiEyw6nBbO83dVaQxlocZXrJrsKTTrwxg14DfKRbBTGXTk29MwZzEFPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392425;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=+wcp/kB2lBcCVUGz1/nNSNwOHKuLsx1qYPo3ER8SQH8=;
	b=sllDMaXGAnMowco/fcE57qQLmqiQ6yBi96BuDLBpLOZz5ml6/CzDXDagAX9VjTegT/Ef
	 b/dwpdHhq2BgFtOktmm1F6OwZOlpLqe5yJjCrChdlNrQQuoYmirmZc/c9qKtdqAKY+Xd8
	 jg8b1NvcIwHdixJea0rN9tlHoqjpS3FYtySNYyJNkIPb/E8AC/W2M+j2PwjqGu69Rf80y
	 Z7f3FpR12OJC0xooSdkjBRZV3b7E/P1hO6K5g7h+WAVAAX7jvyAj3DVCwL6d3PmAENSgd
	 bzU/7+qBerazdFd2eT6b29qtqPSBMBbc+AgEbL6XIzR4urnSK2DO1nIXe9o0HaF6TVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Jz0coMMD;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D684C606A321;
	Wed, 11 Nov 2026 10:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D684C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Jz0coMMD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+wcp/kB2lBcCVUGz1/nNSNwOHKuLsx1qYPo3ER8SQH8=; b=Jz0coMMDNGkRDu6dzsTw5jimJy
	5x/G51dDjFkMFVlX4hFH6HPoMNkylnH0IzUazy+wO3O/fGHbIToU7LruG+P4m/j5zqsfmDbOsqY8y
	Ke/E7u8+A87rgj19j2lFNKvLAT1WXCZxiKXDnAzzbyiG099gNnlXwsWa9xj2Cb9DJVyWK4kig6Jqm
	IVHYY4flGitylhY/qLUVbgNgn0N6UM9kDplr6rfYnVvToJi3rTUSaq3H9HuKk+Z38epPEs8PStu7m
	XvqWqi7M+Wff/o6irIW3W3RHQWtrXZ+c06jlpA9/VuR4E5/QEmnXqydntz8QTVkMsoVy1U1Tq39Rn
	jnY+ACBA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xR5R7-00D6xA-2U;
	Wed, 11 Nov 2026 10:20:13 +0000
Date: Wed, 11 Nov 2026 02:20:08 -0800
From: Breno Leitao <leitao@debian.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH net] selftests: netconsole: enable the targets created by
 the torture test
Message-ID: <avRBD4SMHnfoqn3k@gmail.com>
References: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
 <avPLyMTFkhCRqRAS@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avPLyMTFkhCRqRAS@fedora>
X-Debian-User: leitao

Hello Hangbin,

On Wed, Nov 11, 2026 at 09:58:32AM +0800, Hangbin Liu wrote:
> On Tue, Nov 10, 2026 at 04:32:25AM -0800, Breno Leitao wrote:
> > create_and_delete_random_target() is meant to create, enable and remove
> > targets while messages are sent, but it only creates and removes them.
> > The helper it calls, _create_dynamic_target(), stopped enabling the
> > target when the bonding test moved that step into
> > create_dynamic_target().
> > 
> > Enable the targets again, so they come up while messages flow and are
> > disabled before being removed. Like toggle_netcons_target(), ignore a
> > failed enable, which would otherwise end the function and leave the
> > targets behind. With a console per target, this also registers and
> > unregisters their consoles under load.
> > 
> > Fixes: 236682db3b6f ("selftest: netcons: add test for netconsole over bonded interfaces")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > index 33a44adb6f8f3a..3dfab0bf1b0756 100755
> > --- a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > +++ b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > @@ -46,6 +46,7 @@ create_and_delete_random_target() {
> >  
> >  		# Basic population so the target can come up
> >  		_create_dynamic_target "${FORMAT}" "${RND_TARGET_PATH}"
> > +		echo 1 > "${RND_TARGET_PATH}"/enabled 2> /dev/null || true
> >  	done
> >  
> >  	echo "netconsole selftest: ${COUNT} additional targets were created" > /dev/kmsg
> > 
> > ---
> > base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> > change-id: 20261110-netcons_selftest_fix-4cbf633295ef
> > 
> > Best regards,
> > --  
> > Breno Leitao <leitao@debian.org>
> > 
> 
> Ignore the failed enable makes sense to me, as we enabled `set -e`
> and use random target.

ack!

> Do we need sleep 1s like create_dynamic_target() to make sure the
> configuration loaded?

I don't think we need it. The write to enabled is synchronous:
enabled_store() sets up netpoll and moves the target to STATE_ENABLED
before it returns. If the setup fails, enabled reads back 0, and the
disable loop checks enabled before writing 0 to it.

The other reason for that sleep, keeping the console messages in
order, does not apply either, since the torture test does not read
back any message.

Thanks for the review,
--breno

