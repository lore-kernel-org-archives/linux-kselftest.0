Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94365352032;
	Mon, 31 Aug 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200142; cv=none; b=Ie+p8sbOcYe1jxYjE5D5GV3E6Pep44eajL2p9MgXGX9C7paetC+mGCxsCma5YYoeylBbrYVx8qmwhvBCKb1D5ioaSpOv1YC9vU0T6J+/11bDzCP/7HB9yYDT99K2+JibHYF6aT5OewUYAN/PsA5RxbXsY8YjnHKdnrDvFstrPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200142; c=relaxed/simple;
	bh=0UT81JsnIuFGUKH2cxSw+/DMhXh+7KmHeomOzTIaxfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWWZodRi+lPzUDuHAJxM9sGDaCoef5LT9HJz6UPMdcKsDc+ej1Q/kdQyr6EB22MEE+EOHyqeAGrs7PFW3JKP4yYJdEAW7sqPQ3GJYxIUKvYIJOfu1FrUAtZK7kl1w4A3hZ+Stt3ySBG+6/rIgzntOYW+THz/iojlr7IRpgkHo4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=fhiJLAsP; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="fhiJLAsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1788199756; bh=CenPuybaOHtf9oU4EalY8y+g9S3LEtP7yeAyA5WH+/g=;
	h=From:Message-ID:From;
	b=fhiJLAsPUkpb+XKrL72ZXxax9+WWpasCnAwDwqUYlDJtrHRjUCa39oMO0yUOGP3P7
	 Qmvt4LkdqjyEXOXfvZwLUZZahHSnFh4YDGKpzEXNchWFVPkncLiAoEFS/rxW5o9gI/
	 6GTtn7Tl/lJAmxMcSMbtszz7Psdb7FoZ56wSak88=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 50A0BC06B9;
	Mon, 31 Aug 2026 20:09:16 +0200 (CEST)
Date: Mon, 31 Aug 2026 20:09:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] tools/nolibc: verify that a directory is opened
Message-ID: <apXDS0OApeUHy9Wx@1wt.eu>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>

Hi Thomas,

On Mon, Aug 31, 2026 at 06:04:58PM +0200, Thomas Weiﬂschuh wrote:
> If a non-directory is opened, ENODIR should be returned from
> opendir()/fdopendir() right away and not only during readdir_r().
> 
> Validate the type of opened file during open.

Great points, I agree this is much cleaner this way!

> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

For the whole series:

Reviewed-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
