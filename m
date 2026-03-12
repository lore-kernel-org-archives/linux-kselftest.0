Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9851286A4;
	Thu, 12 Mar 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285346; cv=none; b=l4bEZMmGJ48OW0SdWmot7RH+j5Izl1kUqeMO71WjANaN1AgbctagVsX1e5lt3tEDlvhq7/c25joNOfe+9OfkJrtqP9aNdm40Wx1L8GwtMpoV3o1moadAM6Q8YnNW2xd8RzJHddSTf9h32gCqOPabZJ4iyt3TDLFd4x68rSfQqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285346; c=relaxed/simple;
	bh=Lg+JQzF6fOos28oQVgVHHV5qTXUpQ3WVMHfnWXRcCmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzKFcFLDyaNOkhIgyQLOHN1TdoDSn9LjKCALrUL3nEXUV0CoJsFEsEGwmMC00SlB2Kjd2QERfFKohbtJEHke9NB+qO+Keo4yg7thy7+Ocm77GQulhp5PQ2rwvPWxE4Pwn7LvLdIcoFlE4qolPKxyUTj+Z3lQzr3Y4V7+B18+7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=EVHW4V1N; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="EVHW4V1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1773285336; bh=4iZHpOdAVXpNh2r9Vbj8mbl0RRHXjRoXxyhU9wJEK98=;
	h=From:Message-ID:From;
	b=EVHW4V1NmrdtgjbBMxb2sPNsKif+c2xzPA0w3p8kMhINdvOtMkIBHy8xbySY5hUBw
	 KlW2XqzHqon6OzY++S7IxgTKLND0SzATr3DLgssVvzj1mGo2Jnaktfn9pcbQENDPIJ
	 4dR0K3VTb/5y9mEtMQGKWXR8j941u8nhiefk/RSU=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 183DEC0A04;
	Thu, 12 Mar 2026 04:15:36 +0100 (CET)
Date: Thu, 12 Mar 2026 04:15:35 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] tools/nolibc: add err.h
Message-ID: <abIv181_v65xAfMP@1wt.eu>
References: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>

Hi Thomas!

On Wed, Mar 11, 2026 at 11:00:48PM +0100, Thomas Weiﬂschuh wrote:
> Add a few convenient helpers to print error and warning messages.

Nice! I had never heard about these variables but I agree these are
convenient and do simplify error messages production.

> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

For the whole series:

  Acked-by: Willy Tarreau <w@1wt.eu>

thanks,
Willy
