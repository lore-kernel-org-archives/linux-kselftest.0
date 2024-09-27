Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F87818BC0D;
	Fri, 27 Sep 2024 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439713; cv=none; b=LtAxbiMFzuxe65BQXYOdHZQfb+5mWPrhNpVYvYNyEcGgyIyGB9DFmSkPfGDkry8U+46zgUTHoSaXan6VgAPQxnkt7PexqGCSIrPEDbmwlaa510hECi8gaCShDLFts9SpkvgI5FbtZMuGAGeiLAlkD5uGmZUtys27S1Wruj82wAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439713; c=relaxed/simple;
	bh=rt3uTfl1s3qOaJP0WdbVaNH5JFBXMfLHuYehUtNr9fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdYeUB5AGfpk5F2OSrbQHt+6dH5WX3sH3H+EKIl7GwtD7EvyISgQoqh1FwANvyvBz9jhJNYSYezRSGdfdpyIHCA81vMguM50C1okialntyoDM/O/BwZZdlzZHYxTEnm08nUYSWA9+IR89o1XzgEmwiFipa0bt2febPY9W8u+YCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/8jsO4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/8jsO4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F9FC4CEC4;
	Fri, 27 Sep 2024 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727439712;
	bh=rt3uTfl1s3qOaJP0WdbVaNH5JFBXMfLHuYehUtNr9fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/8jsO4uON6UlWMS3jHVuBy6JUjgFgmPmS1653pxxbHKXXNK8RkLfOeUaqEMQFihX
	 2P2nKaHIR9yht33asZX7oGPD53Oz00SPA0zVzZPtRzVYTeb4lcWdJ2YN+yt1KljCV7
	 PUaiFjSn9m0uyoDxQAEfDdWTQEiOAoEA01XSos5k8ArhwXNDYSIfEIdzciXPJREgvz
	 b0T+KIqr7P7jrAgxVf/uJvRuIsREnxFUFte02R4IJFdQRwnDAkjcM+GkranA2fOCfR
	 YcdPZ6nUoVdc/UCLQTqsVLhTi+HVOXaPx+WIJiNhA5f+xwJrX/CYdbAl7G7rbIWgzc
	 DPvO2keDD/gDQ==
Date: Fri, 27 Sep 2024 13:21:48 +0100
From: Simon Horman <horms@kernel.org>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/net: Add missing va_end.
Message-ID: <20240927122148.GL4029621@kernel.org>
References: <20240927040050.7851-1-zhangjiao2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927040050.7851-1-zhangjiao2@cmss.chinamobile.com>

On Fri, Sep 27, 2024 at 12:00:50PM +0800, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> There is no va_end after va_copy, just add it.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Thanks, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

