Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F2366DA4;
	Wed,  6 May 2026 22:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778106946; cv=none; b=IYwGYS/tMj/fZ8yf+rRSKF8fQd8UeOcdbIOQrtD6Rdpw1BvpHSE196CZEdEF+xCfZ6xrr6ZNb5sBv3323FhP1w7zdE/xFCcg3a8nAoE0wrxnpxWFqrkVQYJ/o4TDe166xUL+umHZQ5q7mEKgt2O9jMGsq0m9KHS9OKLzJhls6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778106946; c=relaxed/simple;
	bh=hz3DyMLXYZmQ+CF5gL15MQqU5AYkOuUceBKveR4ovJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzcBbf7Kiq1KCSR1dc3+jj0AVsifXWyGYMxVzue5kodFkq6p6OzgyEDdkxwDx8fa3epvAj9thkUv8jDAv20GIVdKTqsUjtus+dNajRam3b/i45ND66n1zvtyILBxaeKHxqrBsZZ1kkzoYisS4Zm9sWoUtP5rt+CzQP0M1DHrhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsTabKNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsTabKNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB534C2BCB0;
	Wed,  6 May 2026 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778106946;
	bh=hz3DyMLXYZmQ+CF5gL15MQqU5AYkOuUceBKveR4ovJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dsTabKNgurTICP/yWqT4cvG7jXsDDi5QtUPkeYskwbaIhxRuKH6pGq7n8eNndpIEM
	 KZ6CEtHuXtv6+xs9ZWoAujb3PPtq1F5gFur0EgGQGD3vqCz5ncaqSW3EVvzSzAs+DE
	 C/k3sSNDAV1I71c0z1M0h3vp6cni0QaMa81RN4tZncw7XgMyWw9t+LbDL8EQRs4Oeb
	 yc8iYVSSkEKOv7fCYU9zx/f6NIkmQxnG6PpgerbVgg7ZqAGtAUgaoxuErEMi9NnRSf
	 ioO0XqVJGrfaKucB0sqnC3OQe90AdEfzAFk6Kk/5iGXct2raKmZm087GHufCmzpctP
	 MMi7rFjbENU/g==
Date: Wed, 6 May 2026 15:35:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 06/12] selftests: drv-net: add shaper test for
 duplicate leaves
Message-ID: <20260506153545.2850c295@kernel.org>
In-Reply-To: <aftup9Pe-RnDZVUi@gmail.com>
References: <20260506000628.1501691-1-kuba@kernel.org>
	<20260506000628.1501691-7-kuba@kernel.org>
	<aftup9Pe-RnDZVUi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 May 2026 09:40:07 -0700 Breno Leitao wrote:
> > @@ -453,7 +471,10 @@ from lib.py import cmd
> >                    basic_groups,
> >                    qgroups,
> >                    delegation,
> > -                  queue_update], args=(cfg, NetshaperFamily()))
> > +                  queue_update,
> > +                  dup_leaves
> > +                  ],  
> 
> Nit: dup_leaves], on a single line matches the surrounding style and
> avoids the dangling bracket on its own line. Not worth a respin on its
> own.

It was intentional to avoid having to touch the lines when adding more
tests. Now that I think about it again I should probably keep the tests
sorted and add a trailing ,
