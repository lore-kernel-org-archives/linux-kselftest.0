Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F77224D6;
	Sun, 22 Mar 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774169237; cv=none; b=kWP2Jc0KDqk6Bo1Fh18KkokSi5eTUYYvWGAQ3zz/JoYDOv+vmb6ZOBQkKcS3QmxqD0QhwoEessrjpApKWx3xkUeKbOv1hjG4EmDCijK9dojmXhFwakQP2IlqDqy7jWkMn4Vzi0wu+Lx7UUBEyDXksRvXAmDriExXk0ryXcSxDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774169237; c=relaxed/simple;
	bh=xA4YEzZDrf0ROnCiGegg3dQvyggXUmoLvCGOnR7EVdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+w9KjEfUUSufov0nC294d2yErF/Hjtxv7tJeEa5jcE++IP3a3bnR4zsA/Pe4mWUoldmwiiz4ldsprZ8adHEop2bMWADL7kRGVuQu6D7doixamFim/YvH4Mo4bhSh/6EwkXfKdD59OnsfKCX7HVHWKjpvR2AOoRqMTwL4IdTX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=JL0uFhRE; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="JL0uFhRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1774168694; bh=9ZlEPoWAkXG2lqMdFtwqkUwg/O4qUwlYtAVrGNA5j6U=;
	h=From:Message-ID:From;
	b=JL0uFhREWgaTf3Bkfx1wr3QfzeewX+SNsX9GzQahqXRfF+Obc6tkvD14gyrow017d
	 PwUvRh2HHT3o0YwULeClHQa4gShdd1d2rsmJ4tY1c9q5HySEWp6v0Kf/2hzBlKnVp4
	 afsqfDRO/Zjc63Wdt5JtCYdpgKSucMnNLu4aSMJA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id EE51AC0A40;
	Sun, 22 Mar 2026 09:38:13 +0100 (CET)
Date: Sun, 22 Mar 2026 09:38:13 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] tools/nolibc: add err.h
Message-ID: <ab-qdRNeqbDPjsBW@1wt.eu>
References: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>

On Wed, Mar 18, 2026 at 04:50:15PM +0100, Thomas Weiﬂschuh wrote:
> Add a few convenient helpers to print error and warning messages.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thank you Thomas. For the whole series:

Acked-by: Willy Tarreau <w@1wt.eu>

willy
