Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457C3A1D14;
	Sun, 27 Sep 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500240; cv=none; b=WU71CxCmNJmvm0qsEXEk4D0hs79SifllJd/a6I/OD9Hrmv8Acz580rPpIytLFvCsUHLkvCTIhOhoaFyOBQYaDJK1/7wK6P1qeuu4li76l1EOG9H53qayCpM4i7ZiOmTbBb9IGjPLf69dGW33Plvn3PHNrIAczjIU9cfaGJLZmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500240; c=relaxed/simple;
	bh=EIsirkzH/uyIsvHKJTedzwgxRJVZM1M4WxqOaYu2Rl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W61XLgabZTVo06sczkJE1yv5qCr7Lvfpbb1HUw6tcoBe5O2zDXYe6LAQ9Cznw/vGpnymGnYcmXBmOEf838bfzLDTnCDCu/fAR4aV1d9THFHzYw6x/IH5dlmFP9cYBxX58ojVQzqZpWm1Ak0ylpqS5XAbgH9g2lC+mKApQasAHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=v4cawgK7; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="v4cawgK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1790500235; bh=VFyFds04w0iFAQ88feln+96tQcUJrO7miVjc8rF/bZE=;
	h=From:Message-ID:From;
	b=v4cawgK7TwlLnu4/Bw3BDeNiBb0mVn+6ZJytd4po9ktIQC9YKbaQCWasC0m2kCCVW
	 yyCk4ZU8/r7DpgPOUup4JOuV56kJKucasPlWo6HRyynlsFGW0VT7vuyUkFfOJAF1qz
	 VHqn7yC40Du6Pi7Nl0WKl3FrbtjeqQogxD9oSz30=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 5417FC08A8;
	Sun, 27 Sep 2026 11:10:35 +0200 (CEST)
Date: Sun, 27 Sep 2026 11:10:34 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] tools/nolibc: pwrite() and pread() support
Message-ID: <arjdio3bN6gWIKxt@1wt.eu>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>

Hi Thomas,

On Sun, Sep 27, 2026 at 10:49:11AM +0200, Thomas Weiﬂschuh wrote:
> Some users are missing those.
> 
> Link: https://lore.kernel.org/lkml/20260923224408.3745689-7-pratyush@kernel.org/
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thanks for doing this. The whole series looks clean and makes sense to
me. For the whole series:

  Reviewed-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
