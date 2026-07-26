Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32C5464D;
	Sun, 26 Jul 2026 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096095; cv=none; b=iTmmgxcoGJbW5iEbcfDfpwvqUZuca4y3lGJjF5a9KX4J+WXlCRUij41+2Z00LUMHhxsOe2yMH9XFubLgdp9SvfI3IvbMHfKrmB4mTqQkT8G2Wsc8cQ42A9eCqF5itxv57WeTsd2c4TZNxV6cwKIWzioAk1/XgMfZCcFbILFd34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096095; c=relaxed/simple;
	bh=Hu3AI8pgU6xZJZWGDz0zQco+MEGtVph8wV+cVRs6WUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc9Ynu5Cf7iuD3f8W6VQral3ILwpT+Wcw8Qvqa5lqdMyDgtV5xZyM6PQw4OcwHN+FRrlQ9f8Eiu5rq+ioYWfnNsMrHCNmtw2FWnYJkPT9ffjdjbq5+kJ52FFYis0K89YDU6Bjeg5FPY5hcPLhOud+6qNMC0QEKTpdQLftucz8go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=B+oLABrG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="B+oLABrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785096091;
	bh=Hu3AI8pgU6xZJZWGDz0zQco+MEGtVph8wV+cVRs6WUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+oLABrGZ200hOOqF4NtxE8cvDSvdMmCQnfuKjp6xfDNaQDOKydIr1m5lEkxvMFqK
	 KUo0OCxvu+YePduYdaIDaNx/RW01JUJ+nLDf7MkbGn0bM9+i69l1AD43xpGV47RWBE
	 2WpNC/cXLk3bAWWGbTpWt1pSJ5Ggj1SJ1VfCidJM=
Date: Sun, 26 Jul 2026 22:01:30 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 4/4] tools/nolibc: remove dead __ARCH_WANT_SYS_OLD_SELECT
Message-ID: <b4b49ae5-c918-4300-891c-9f4b1ac2fe53@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-5-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726101306.3772237-5-ammarfaizi2@openresty.com>

On 2026-07-26 17:13:05+0700, Ammar Faizi wrote:
> The macro lost its last user when select() was reimplemented on top of
> pselect6 for every architecture; sys/select.h no longer looks at it,
> and nothing else in the tree does either. See commit 668e43737279
> ("tools/nolibc/select: drop non-pselect based implementations").
> 
> The comment that goes with it is stale for the same reason, as neither
> architecture can end up calling old_select any more.
> 
> Drop both from arch-x86.h and arch-arm.h.

Thanks, applied.
