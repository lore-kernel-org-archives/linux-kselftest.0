Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263EC221DB3;
	Fri, 31 Jul 2026 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785462131; cv=none; b=HCcrTNjD896mAImm0DRIECKK+TKfx2f/DIbRTd19aBVGKWfH9rsCYh0j5MZOG7T3ZYjKozcX7KymXxEIsY2EtdXEOiPZ+alQXczDvFAjuVrqQtEM6pVgLZqDu/IuAdI0h6C7ZSf6Dr3GV/XizKRrrm1DI60rgZdOe1UxDCeI4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785462131; c=relaxed/simple;
	bh=+Y3H4Bc1TXol2OKezF2Tjytb3A+qGq9nIIarJ/sVEp4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lba3/OejE5kgnVlv93K4ABnucQ1d+5/luifAfNX+fFPFkLaKDkcJvv1hhTYhjIKkEqnYGEOOIVn6D64PkQKurh8Qf/3fszob6KwBhCgpHNBk4ioiIVGGjpIUuCyIR4gHs90oJjVOn4TZ/WyC/4jy8VsKS8W2DqFMPLb9YYOtFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgdmJ3zQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgdmJ3zQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C78F1F000E9;
	Fri, 31 Jul 2026 01:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785462129;
	bh=GbcRackIHB4hpQiFUBskj53V2goC+Wn9APAcbK8QKtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FgdmJ3zQgDrqQF5++DYGuqOTjHke8Yc4xzAswT/LySQQ3eTksqUvOwEemPQXc49jq
	 m6Hm4GaE+YUt56Rdpzugo/MuP/qUalvXcssEevGDKjOUyKUy/ft/24+V9tz41omkEb
	 Wzn3KDaMF1IowAnws0HQ5HY2/tKTYSAt/7NCevtHkEx70skEbKbs6LdC2VMelZrgSr
	 qhNJx+SQQ8G181jm9n2UMbpvLerzRfvRCzxwHSl9LwtW//9vxKsdRXHO1X5EJwIZan
	 k2e4/n43FNcr6o1NiCLqpoimqpHuGozbt9Nr4AdhASxq5HLlQ9Grhab321pwOf80Vx
	 Ua8D1aARxnq5w==
Date: Thu, 30 Jul 2026 18:42:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Marcelo Mendes
 Spessoto Junior <marcelospe@proton.me>
Subject: Re: [PATCH net-next 2/4] selftests: net: test IPV6_FL_F_REMOTE
Message-ID: <20260730184205.20e85357@kicinski-fedora-PF5CM1Y0>
In-Reply-To: <20260727043516.93101-3-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
	<20260727043516.93101-3-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 01:25:08 -0300 Marcelo Mendes Spessoto Junior wrote:
> +#define INIT_SIN6_LOOPBACK(name)					\
> +	struct sockaddr_in6 name = {					\
> +		.sin6_family	= AF_INET6,				\
> +		.sin6_addr	= IN6ADDR_LOOPBACK_INIT,		\
> +		.sin6_port	= htons(8888),				\
> +	}

Please avoid magic macros

> @@ -183,6 +239,21 @@ static void run_tests(int fd)
>  		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
>  	}
>  
> +	explain("Prepare TCP SYN for REMOTE flag validation");
> +	int remote_listener = tcp_listen();
> +	int remote_cfd, remote_afd;

and don't declare variables half way thru the function
C coding style applies
