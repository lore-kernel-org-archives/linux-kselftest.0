Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59717367B67;
	Thu,  3 Sep 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788478827; cv=none; b=oRaL2ZT0WgUf7kETzgj0TMYLn33Etdjz6MLrXN5tpVwLbeag4G1K87w8599UPqwIMrqhITd9jM5xDEGfBBAp+EqYvk12wFy0w4VrAKU6Pduhrnej6nR9VEJWuUhJFz5pzlXSEu8NRGWqp2jsrjL7FqIUPx7q1e4bWMTfcoueCAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788478827; c=relaxed/simple;
	bh=Rhr30zsDpLK1Avh30WGVYOWTvvclw8Ogz47cmDZ3H2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H52mVCk0mONKp0j8WE5912a/4sDBeW2am3skmPxxVexcuLzjJBzVUtaQrYFqwt7hKE+I6vydyNtTuxFt1DTzOADH49LeHXAHbQZNkHRqmpTNThc4gucPmGTzAMjVq/4pLnmY6cvXnumuwtuT0GGHXF40/ZukFP3fXhgjU7DVkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=echoDLYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="echoDLYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3771F000E9;
	Thu,  3 Sep 2026 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788478826;
	bh=WFeegX+RSc7YOTXkzpPq8Hf2d/jLRIPsS826zeaVlqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=echoDLYuEUh7HX+a8D+JG650N2dZwaBdBt8ag3P/bu4C1Ou7zlyF/2X/o6CE6SkmB
	 dst4nWXfzlhl743zQm0pZfv4fPk2Z4ubXtkiQwd258ZoXgciMdCmiK6Fk9mdXPOeRg
	 tr2aiWcJAqSANF/9Ej4KmDGkMtFb9F8OGS+S3Xi6C08f99wr17JegM9LI9o6j4kvTS
	 B/bfTIN5duUgw/dWdzEP/l7lkWSlNrSkpIw346faH8wczj+EkpQA7OmoAKxCca/1j7
	 o1o1xNOyiCck4ZWZN2m42w0eJEtSiJsLvyN7wwl/+9h0mj+x5LoIZBP6jHBfCzKw41
	 KnBqA8KPiFLkg==
Date: Thu, 3 Sep 2026 16:40:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, matttbe@kernel.org,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow
 cross-compiling the hardware tests
Message-ID: <20260903164025.1095ff53@kernel.org>
In-Reply-To: <b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
	<2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
	<b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2026 23:44:51 +0200 Maxime Chevallier wrote:
> We could expand the remote_ssh logic to probe the peer, and raise a skip if it's
> a different arch than the dut. Or better, have the DUT check if the peer doesn't
> already have the tool in question, i.e. the kselftest "package" is also installed
> there.

FTR the remote* API is supposed to make it easy to drop-in
your own implementation (as in you should be able to copy an extra file
in the right place and use it without patching anything). 
You can probably do some extra binary jugging / probing in your own
class. I was trying to avoid having to carry bespoke handlers directly
in the kernel tree.
