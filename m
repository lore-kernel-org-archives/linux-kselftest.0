Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08854301717;
	Thu,  7 May 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171019; cv=none; b=MCLNbQz8mvwrWuLumdH1TdJg6U+ULXTvQZsVfnT4vgUpRGKNjgfF/Z3rQHujJhar9yvNTRmqR5W23qJ08h+nYDTbzDwOvcJa7Rdub7URi67H8l21p96ym8pWTBw2EnuWkuAYxmG7GmbSoudk02YqzF+f0WbIe9DylJfRAmnWRgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171019; c=relaxed/simple;
	bh=uIYiL9x4CPNwSjvypddtVxMGDADdf2REbF2Ck+DORoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUCrxdAWny1AgDUJYvJu4KKSvbGncus32bIgFyIpiKBEdD3bmAntsiB2j09hsYwziUQ0DtmyLUw76GOyGmVKlFJPy0CepbFwx9fFZQJRtTSA4C8FxTdo0t89IoveqehkgI+h5zat34H2b+F6EOd+6DXmsU0Ay9lMxdDuInywEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bu73JaUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bu73JaUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427CDC2BCB2;
	Thu,  7 May 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778171018;
	bh=uIYiL9x4CPNwSjvypddtVxMGDADdf2REbF2Ck+DORoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bu73JaUocAwIX25an4fEPhpc6xkdwvFrEDK23rWYdklIWGGr7h+nABiGLD2gdPUhJ
	 MUeyhH9umZLA3mLifpOLIlrVIjOg5xwwNrKx8lvVful3fp693TK4Dwg9Xl8PhBl6MO
	 8GbsxFTsLVJi+CctyF+JmKZEXZWl1CCkCvtr4Lb8=
Date: Thu, 7 May 2026 18:23:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <2026050702-slick-goofy-a949@gregkh>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <2026050739-football-dreamy-351f@gregkh>
 <afyWXIsqqgMpxVIb@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyWXIsqqgMpxVIb@laps>

On Thu, May 07, 2026 at 09:40:44AM -0400, Sasha Levin wrote:
> On Thu, May 07, 2026 at 12:47:43PM +0200, Greg KH wrote:
> > > +	atomic_long_t		retval;
> > 
> > Why is this an atomic value?  Shouldn't it be whatever the userspace
> > return type is?
> 
> The return register is `long` on every arch.
> 
> While testing this, I added the ability to modify the return value after we
> create a killswitch, and figured that it could be a useful thing to keep in the
> code.
> 
> But then I got worried about a race between a user changing the return value of
> the killswitch and some program trying to execute the code, and getting some
> combination of the old and the new return value.
> 
> Is that a real concern? I'm not sure - but making this atomic was cheap enough.

I don't think that a combination should matter all that much here, but
at least it makes sense now.  You might want to document that somewhere
here.

thanks,

greg k-h
