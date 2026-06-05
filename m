Received: from mail-108-mta91.mxroute.com (mail-108-mta91.mxroute.com [136.175.108.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135647A0C7
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672578; cv=none; b=pDeR81EERtBHUGjajEk4k9BMVqW9UZq8OR62bpV2Q8dB3KAZdZ77mtZesq3ZGwwc9mQ0H6H8om0noi79OveOvzQAzTs3dYrv2EnqSHNdAsCbEFOctGDpDOpwInCRVmZMh8mvRO4YWZRoM+6VPkuqCjQuUMoQopdhsbVZFc1mOgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672578; c=relaxed/simple;
	bh=f55aN1txy1W3ZNJZzI0g6mF55n+29ND8pnH+Eot/5dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV7Nqa+i2fYfOjwiPfUAxekDYoGT54osRcGWzjUo8OxsKkjwlMYedgg/4v3rlWN9wrdiQ+MbZ57RqOxnar/0sqPQ4Xiy1aC1/bW7xjwVYsVHk1xvFXoM97Zy9NCeTAw2EKdRX5AQIkNknVjpZv74BWHmCKuIs+V/82ld6LvFJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=ciSppfqQ; arc=none smtp.client-ip=136.175.108.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="ciSppfqQ"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta91.mxroute.com (ZoneMTA) with ESMTPSA id 19e98566deb00067f7.00b
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 15:11:01 +0000
X-Zone-Loop: e1202497312ab82b134527c0f4ec3a4b38731169f442
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vOOeEl9PEnfuR5KUMGDXPq7D3smUMqacba4j+2QN9u4=; b=ciSppfqQKYMgINTv3KkuFpXWXK
	Q75JJoFcYT0+oFafv4Hr/iZTRqPVEyveegSwbqiTko+ZHCM83EjKhKLQNcY4x7wNzMfb9VQ4y7Nus
	i8FsXQc57x5Jos3fLAYTOnlH46QzCctxvQI9YcZXb6ZQLK9bPrKboy3CvbvUYVGvYguqN++Ypf4Ys
	i31IDCnWalauBxhL6YYXpSywWzomMQUhrV5WVuY0aL4oZYr4G3BddonECEfSDNBDJ8wizA5AJN+Zw
	6SSOL3R8P/4bkzS+DSMxh0WZJxtQklzVhZ1N0oji3QBzBIRXSLRY/iFDFLIx/+ZQlejYG3HeKoT+t
	ywd/g4jQ==;
Date: Fri, 5 Jun 2026 15:10:31 +0000
From: Richard Patel <ripatel@wii.dev>
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
Message-ID: <aiLm58Sjuj8XAaSF@wii.dev>
References: <20260518183918.322545-1-ripatel@wii.dev>
 <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Jun 04, 2026 at 04:40:31PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Mon, 18 May 2026, Richard Patel wrote:
> 
> > prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
> > unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
> > be permitted.
> <
> > This is a uABI breaking change (fails previously accepted bits
> > with EINVAL).
> 
> Thanks for the patch.  However, I'm not convinced that this actually 
> breaks anything.  The behavior of the interface changes when unknown flags 
> are specified, but I'm not aware of anything that relies on this specific 
> behavior.
> 
> Does that match your understanding?

I agree, yes, happy to rephrase the commit message.
