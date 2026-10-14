Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0272264DB;
	Wed, 14 Oct 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011353; cv=none; b=NKgOp0S+pmFpvIWvzmHXOUEgmdMVYUsbQ92ZU46VB+qVybrInEG3mLCF4O0L0D+nyPc+wcj/NOH843gDC28olyPjLgVeVa/XGzyQrKKD2B5ICtiZ9GD+BYBb4xplnkT8LSJ5Vxji2C5AhGfjsgfL1se+xk8kqJLvxyjGd05nHcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011353; c=relaxed/simple;
	bh=Gvu3j0Jr+dnnUj6wsKOnSgP8tUk60dMLHdCffw5ehfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODzmkjVDpxYGnLyjODd0OadyKsy3t2UgbusWqjox7/DHiriyNiWHqHTAeD+9kWoTKcGy/Sji4AXuTn1qvQlbszcjNOhJkZ4oC5BcsBDHsO8Oo7TqryJtJggeHhB9AyZvYvoLhjCMS2XdnLnN+CzpE7a+Rs3Gq740yjH+tDIpUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=K4NvBdZu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="K4NvBdZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792011349;
	bh=Gvu3j0Jr+dnnUj6wsKOnSgP8tUk60dMLHdCffw5ehfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4NvBdZuAjvyvCR1qXKsehVGiMET79GH3diiF+Ft9kzZymyo6xY1UQo7usL286uFb
	 5jHWqj9Ixw22Zbb/siku3H1Nu1hpW7hi0oDB8G6wT5tWA5pRByKabZrZHysjo2YRhH
	 zF4xB0e3ddx4A++vVeYr0FgOfd2dBtLqDJxn4gG4=
Date: Wed, 14 Oct 2026 22:55:48 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sasha Levin <sashal@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: use the configured kernel header
 directory
Message-ID: <d7bcc69c-088d-420c-b301-50b4a94366ac@t-8ch.de>
References: <20261014200142.1364761-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014200142.1364761-1-sashal@kernel.org>

On 2026-10-14 16:01:42-0400, Sasha Levin wrote:
> The freestanding build hardcodes the source tree's usr/include even when
> selftests exports KHDR_INCLUDES for an output-directory build. Use the
> exported header location while preserving -nostdlib, -nostdinc and static
> linkage. GCC 14 and Clang 21 builds then find the generated UAPI headers.
> 
> Fixes: eb1353110831 ("selftests/nolibc: integrate with kselftests")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/nolibc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

(...)
