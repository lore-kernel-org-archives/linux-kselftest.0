Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327512CDBE;
	Thu, 19 Mar 2026 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773882583; cv=none; b=e6kq8tP8vHCCRhBxSYjGS/IkpE/WFg8X+cWCvCmsN220aNO4og7Bfla1MG9WhyDcbQFkYxFxA+6OiqrCSHCtR9yit2afsENAx9lZ6lsrNafkjAl2lI1OQ7gSl6EWQhTNaU5nZPlwMTByDWbBUJheZuti82RMthczbzevCewKuvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773882583; c=relaxed/simple;
	bh=RhMB3/fHMzbhw16EY3EgqZfIYShBpgY65aoZHTTgXnE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSjKoSu9Rr6G6rW3ywKNtfkI8KJHolIK7Y3NaFIo7mlbEyveIVz2HiVeELICIpTCk2/PN03cEoWu179F2/0o37X/o0znzHRwqbTfZx02nHuY13DQTQRTv8IO7JYI9Xigk7BenCyHyl+rZHSDgLrhXZJq/ggonrsCiodnap0407A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCOwA5cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCOwA5cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3D4C19421;
	Thu, 19 Mar 2026 01:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773882582;
	bh=RhMB3/fHMzbhw16EY3EgqZfIYShBpgY65aoZHTTgXnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SCOwA5crE2+APr3zQAzRsZEWEyOS87rwJOYBM46cKJIDXjAxrEse6ijIT8ExAsMeg
	 MaU99JIgcJ+XR1od/tkWvQssz+JAvhLzGCQgKHYF9gVgdoIWeQeP8ciVuScih5MGgG
	 +RrtaIWycmQt+Ft9neEObC7I8f/obI22CvddTw66nrYKFaL3MtGMK8OhKl28XUNHVg
	 VqbWwenR/6VAgBZXTU8xTUSNxM0ldGts24p6VdveH9q15R6ZFX1OgUEh2DpaZMZBsW
	 MNG3yo6dcfdK4b8Q1d8FdtHNjMKoVY1NTJy3Ig0ZdtgWnX//q57AXr7O6rHw6rIT0/
	 o3t6cjuYf3rnA==
Date: Wed, 18 Mar 2026 18:09:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@shopee.com>, Jay
 Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2] selftests: bonding: add test for stacked bond
 header_parse recursion
Message-ID: <20260318180941.40dcf453@kernel.org>
In-Reply-To: <20260317031435.364094-1-jiayuan.chen@linux.dev>
References: <20260317031435.364094-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Mar 2026 11:14:30 +0800 Jiayuan Chen wrote:
>  CONFIG_NETCONSOLE_EXTENDED_LOG=y
> +CONFIG_NET_IPGRE=y
>  CONFIG_NETDEVSIM=m
>  CONFIG_NET_SCH_INGRESS=y
>  CONFIG_NLMON=y

Sorry this also has to be sorted and the special characters are a bit
tricky. As you can see from CONFIG_NET_SCH_INGRESS the sorting algo
considers _ to be after letters, so you need to move the new addition
down.

When you repost you can target net-next, FWIW.
If the selftest is part of the same series as the fix we let them go
together but standalone selftest postings should go to net-next.
-- 
pw-bot: cr
