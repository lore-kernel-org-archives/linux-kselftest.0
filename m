Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18EC31F99E;
	Mon,  2 Mar 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490663; cv=none; b=VBPDaJF+dvGkdj9alzKSJXZLN0+59QQOliAgTWRHWpmtUfEn8v+UqUm9xqKNNAkrthjeLYTZ/yNz+Dzoz6hO5+EpGovxJdNFI3SqwaEG8hclTdCONAt13zLkU3V3jqvGk9N5Ka0Guj3ihkuPSkk4Twf7xG06iwkj6WUSOOuHpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490663; c=relaxed/simple;
	bh=tZvLePHDcA6nPS3DGdX3TVhrRB3omFsqKk8wwChJqvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5En0S5qw0IuAkBeXiN1FqYc7hkixBNFX+zR/toWvtWkHvULf/b6YzaF3ZgfkP8+fnh0OVSiqMFPEAjIJXNSujWls6OnmzdvDHOBzPJWXloyti+YA5Xlv2tRsT0jsXkFNwn5JH0uUtfbe+iLdiMuhTYL0nb0fPr5b7/zCENL1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=p0iUcSca; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="p0iUcSca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772490657;
	bh=tZvLePHDcA6nPS3DGdX3TVhrRB3omFsqKk8wwChJqvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0iUcScaLj+aHRl5SpbKIM9COu1svBq25PEsqKZFpE07xFsXZDs+LQ8jM2fjuYu1k
	 BYix94tXaFONt3XnduyscVQnXfFDgfEaTgmtkW6pBPLAb99hz8gtAmOjgQcojQX3Ik
	 f3B32p1a3xP4zlTahhgQ3weKmOtt/nXOE6SDwoaA=
Date: Mon, 2 Mar 2026 23:30:57 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jordan Richards <jordanrichards@google.com>
Cc: dmatlack@google.com, jasonmiu@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, pasha.tatashin@soleen.com, 
	pratyush@kernel.org, rppt@kernel.org, shuah@kernel.org, w@1wt.eu
Subject: Re: [PATCH v2 1/2] tools/nolibc: add ftruncate()
Message-ID: <596c05a0-caee-4696-8136-e89081b7c68a@t-8ch.de>
References: <ebf0c9fd-9c45-4aa2-8cd7-fe8d5956ce52@t-8ch.de>
 <20260302222043.2432413-1-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302222043.2432413-1-jordanrichards@google.com>

On 2026-03-02 22:20:43+0000, Jordan Richards wrote:

(...)

> > off_t is now always 64bit on nolibc. On 32-bit architectures however
> > __NR_ftruncate only takes a 32bit value, leading to the wrong kind of
> > truncation. Use __NR_ftruncate64 instead where available.
> 
> Good call. On some archs (arm, mips, ppc) register pairs need to start
> in an even register. I assume adding a flag like:
> 
>   #define ARCH_ALIGN_REGISTER_PAIR 1
> 
> in "nolibc/arch-xxx.h" is appropriate?

I would use a custom sys_ftruncate64() wrapper function for those.
Similar to sys_mmap() on some architectures or sys_fork() on s390.

(...)

Thomas
