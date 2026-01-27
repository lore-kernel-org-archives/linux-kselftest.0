Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FF2C0282;
	Tue, 27 Jan 2026 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536814; cv=none; b=coCEyThNYafh9NnBmqQUwiUXmcAZNyQqNdOMNczbdiWoqr/62qwmCkWovWk7qngFDcFWqBed2sW0o8RfY2a90GU4lFTf7pTuEh6lLyVkSwsnmHMdK6mjMcuXBiIhhGUW+liw0brBJqQbxM/dO/4jYCxZT+UGnvkAI+dilKmnR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536814; c=relaxed/simple;
	bh=7XL7Py3+aVjo8IiXzVX+qAEE3FyovJHqGhf7VbEhlzk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPhYgGM5iyO6+asr+BioNJttDuT08VSb3ABfMoUCuzLITjH0NrKDXIA3UxMKbBiT8+5LQdsNtlohH4lZJlXZnwU0l6x+652LyHJKx6BUrQXaSfBu8PxnR+PgVxIQCxbMzYdVHenjVy5jnmaa9eWw4WIBjiUbV+QnOJYYoIP7cTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CagD2o3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CagD2o3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267AC116C6;
	Tue, 27 Jan 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536813;
	bh=7XL7Py3+aVjo8IiXzVX+qAEE3FyovJHqGhf7VbEhlzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CagD2o3eRxQ3/jdIwRz5RynvfIR5+6idsJhl/GoF3ZGK16hCVw6c59Xr2cTZCuSZd
	 sz4w/XYTbh7e0s/h+jC/Zl7zxoFr3VxrTFjfCDmTa8jVzNLs0Z+FdWFxnVJ8DxEaJj
	 P+eqGZSLPnylb/Skt/yBTdcO+S3Is3N1wUoaoBDdcUGuQG2MGDr/bxiyerc0ru9egX
	 d7FnDCmvO1895+zVqwN6778pKKpY3+qiyHllwSsmtkmWUtqmssmKS2oBEyxeKCOx+J
	 kvAKL2IrXPPuVE+OeAVmO+tgKyHK14ZpvA6qe8gb38gbj327hwKXcfy8UIHx72rwjO
	 wWTwpXamfiwkA==
Date: Tue, 27 Jan 2026 10:00:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Shuah Khan <shuah@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] netconsole: selftests: Move netconsole
 selftests to separate target
Message-ID: <20260127100012.0b7b7a56@kernel.org>
In-Reply-To: <aXdYwphLx2O-Hxis@gmail.com>
References: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
	<aXdYwphLx2O-Hxis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Jan 2026 04:10:18 -0800 Breno Leitao wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 92768bceb929..d92927ce87cc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18016,7 +18016,7 @@ S:	Maintained
> >  F:	Documentation/networking/netconsole.rst
> >  F:	drivers/net/netconsole.c
> >  F:	tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
> > -F:	tools/testing/selftests/drivers/net/netcons\*
> > +F:	tools/testing/selftests/drivers/net/netconsole/*  
> 
> I don't think you need * here. The following might be enough.
> 
> 	F:   tools/testing/selftests/drivers/net/netconsole/

FWIW I'm expecting v2 that'll address this nit
