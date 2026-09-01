Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2B49F139;
	Tue,  1 Sep 2026 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288908; cv=none; b=Uy84g6T6rV8H2wexg2nFHxSuClxyjvr45hQFG8jbxQc6PJXNKCZ2HUHcZiIpIN1QcgEnRlGj21Upr4KpzAtlxhY/JE5Zaei+lF7BpuTo8V5UTB5iLYCKCKtdmqTy7OahvtsZ8VhuPvBKW5YeTHXT+Ya0iHuudJtQobOeu6H9d9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288908; c=relaxed/simple;
	bh=J3YpnJBceEVXLHrkWQYyr9i7ImLjPmY/KVm0+cPktOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgODLydk/ue/DQYCW4+T8E6S4uTDcy4RUpI5gOnUUmidJ49ROze935YO+E9mdthOOYlbtxlD+zgBImSg+1YoU9ip4FYyxjyXoD/Yhq8t/79io+HWqdoTORBvxXt5I6yvGLXLvj5eD92XMJ64boxuzRiaN7nAi2aZMl/nMuR2ZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ilE3mH5a; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ilE3mH5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788288898;
	bh=J3YpnJBceEVXLHrkWQYyr9i7ImLjPmY/KVm0+cPktOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilE3mH5aOHiBAtk8ms25PQyqyxr5blbzZgxovbadDgw44gYJkvXZU73jZtuonaZu7
	 /QBj81TDA5u8c/4XcCpRhkYcVbunxHbwfmXJK3f1jAzh6uhPATefYROvBbZ+lq7u1X
	 jBx4IKX7Ik9lM5A6K7durqKUaA8VzUXQ2Z6X8EUQ=
Date: Tue, 1 Sep 2026 20:54:58 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/nolibc: validate directory with O_DIRECTORY in
 opendir()
Message-ID: <56e20692-a13c-45c7-8ff7-23810d99575c@t-8ch.de>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
 <20260831-nolibc-fdopendir-enotdir-v1-3-8cf0e79c4e6f@weissschuh.net>
 <20260901095158.2de73aa8@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901095158.2de73aa8@pumpkin>

On 2026-09-01 09:51:58+0100, David Laight wrote:
> On Mon, 31 Aug 2026 18:05:01 +0200
> Thomas Weißschuh <linux@weissschuh.net> wrote:
> 
> > fdopendir() requires a call to fstat() to determine if the opened file
> > is a directory. Currently opendir() inherits this extra syscall.
> > 
> > Switch to O_DIRECTORY and remove the call to fdopendir() in opendir()
> > to make the directory type check cheaper.
> 
> This should probably be the first patch.
> With the changed fdopendir() it leaks an fd on error.
> It also fixes the errno return.

Good catch. If Willy doesn't object I'll shuffle the commits around.


Thomas
