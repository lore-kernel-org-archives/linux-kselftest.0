Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5133F8D4
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067120; cv=none; b=LV9xNFY6NczV3yx4q5PAP/uXncABB2eSyNlr19wAxo5vtD72idTzIqRtPFukC/rqsYRkx+SVUeLtpOS25c9yUk/W5ID2M34nCo1BIeZEk8BQCGFjjXQs2niQplWPguCTcuh0A4wR3Zuo52/CCcZKfU4iV25S5B6lSU90f/bdjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067120; c=relaxed/simple;
	bh=FMD/ZdR5TV/zMpIaXaekNOgBHrcVT9Hf7I5g9Mfv/xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmVVHlARZoXbKU27/hlbdj8ZMhgGDhc+UxfSw4f6FjRByCEmK8B+McipHSyS4b4EfRq+W1ou2MFq+f7yP1X/Zuvk1Ol4vuLwLCbtwRLkvHjNhi+5EHO73cr7Ijj7FGktNZ9Bpn+IUSTa85kBdgmn0OQb5nU3MNN3s94mb3OBMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Os+GC+hH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Os+GC+hH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ba701891so1989325e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Jul 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783067118; x=1783671918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxHYpki4yEEhqIJwGY1xJ1lg0TosZM+PSkKjRYtqjgc=;
        b=Os+GC+hHMQkfgqxPFwtpcjfUFeDUXDrf5RlC1bAZYewXZlBRFJY/dz2Ffn0/h8cXzz
         +tY1L272fS+oTayj5xKzShUaJ8cJqY5AHXSX0TYCCB4H0y5tjuKh07sjWxwJauaCoBfy
         j1N7PP3AGIiC7sxNZKaeEGZsi8y2G4Los8TZM6UNGutn1kX1zXYQ9v9ew9KUASHFUpRn
         r/H+SD33Mbe/flHkLiKLoKzrt4sRjGpr3iaxQAG+JFm6gQ9Fij6SuRSAj4DosElKRfgD
         N+eWst96LQNkZKGP1ZDwpJ1PoHwzac0YjTcwx3cEGqgVLobgMqci08QSsC9T3djva+TN
         ZNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067118; x=1783671918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yxHYpki4yEEhqIJwGY1xJ1lg0TosZM+PSkKjRYtqjgc=;
        b=Wfl29piTNGfA4E9jkgi9SlQGRn9v7zDBHljln0sjD5dgmoVJwquPfoRqREEoU7czEJ
         Aq9Gr2CLwVOCnLUJLKCHrGYX6DxZboIu1KXIRJzrcE8VfdfbCXPkCgjYdmlwpV5hqXns
         7ALOp79Dpl/fnUJZ62qpm2JdzrhNOFBeNklYwfTP+3cbDxn0mrZtBwhGBUN967/c1wDY
         zUYX3WdchVn4XI4TL8TDUECCRO1BO59U9M+eJ4Kzn3vS/dsbABhwDW9OSsoyjf7/wg0D
         I4NTSoVH2EwUn0ka4Ld+R8q+Y1KEutfMnNRYK3cgC0nkSS8utW2tXbVL5nKQdNzAgZ85
         yhzg==
X-Forwarded-Encrypted: i=1; AFNElJ+pH/cSANc8Mx7zTkc7fi3e+iFGnVgp57LMQ0hPM+gnI/AeSv8RxzwoguMMCh7qKT4Xzc1hTLLrKFMkFVoo72k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuzdI31Zldgu/B8L/1zi/4ccLpyhSMFNXi8r7RFIwL5ExR6Sl
	LvML68JoNLHasWpDCBY/5NwL2M6IrtuP6ipi/wxYetdCCWu5dxzj7teFySpxXAqx4Us=
X-Gm-Gg: AfdE7cn0/s0MVBz2ZyY6B7omHQnCnAN00egDmhhA4RrdR6GD5iVZg4JXWf5JZ6jn3hX
	sQg8pfV/qhv6BaQO5NTY/e2nIRjPm3SIIfj+kEMha7ETM+t598dJ1u9qVD3AOUB5sTFk7lFQneT
	54t3a+VyE2NmMVhZvl6ss86UMitWv86014YnlJPOXlO+xpi2GChSrIzEd9sxPtyglyIHErFpkvg
	Y3q/vJxF21lhw4mmp466ns7w0/KqnqI7LxtniSc5ZC1dZ8LLW4u4m9CdN57jJuUbuhXkuhEuH7v
	mR9fpib3m0yToHomv55/cMvgIPI8ugg5NrufjhZbG/rfPuRJQw5gy1Q8/5+83pwGX+9wTqHYvud
	62lHevtL5Iv6bM/8L+aIqvmtRPZynOXDa4Vt52Rxp465cRf3r7PgRDQcObD/Ydx/7WA/rCZVNvS
	xZPtNge4KjbKBxxn8=
X-Received: by 2002:a05:600c:a4a:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-493c9bc6d44mr45352795e9.24.1783067117809;
        Fri, 03 Jul 2026 01:25:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm28999435e9.4.2026.07.03.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:25:17 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:25:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akdx6xWTuv5Ga0YY@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>

On Fri 2026-07-03 08:04:08, Thomas Weiﬂschuh wrote:
> The kselftest build system may recourse back into kbuild when building
> test modules. In that case kbuild needs to parse the new flags passed
> from the command line, instead of using the ones inherited from the
> kbuild invocation.
> 
> Force that command line reevaluation.
> 
> The same was done for scripts/install.sh in commit 14ccc638b02f9ec
> ("kbuild: cancel sub_make_done for the install target to fix DKMS")
>
> Reported-by: Zelin Deng <zelin.deng@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/

It is great that you added references to the related commit and
the original thread.

> Fixes: c9bb03ac2c66 ("kbuild: reduce output spam when building out of tree")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

I believe that this is reasonable solution:

Acked-by: Petr Mladek <pmladek@suse.com>

Zelin, could you please provide your Tested-by, please?

Best Regards,
Petr

PS: I could take this via livepatching tree. But feel free to take it
    via kbuild tree. I am going to wait few days until the discussion
    settles down.
