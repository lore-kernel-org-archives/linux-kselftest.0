Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4073A2549
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628006; cv=none; b=qdHDQMuO45/WeoYxOjcWQt+vMpj2fqSV3oiwVbUG1WRGWxMGxtMrnuF75Msmxnelrgp+NCwG5ezmgC2P7RaxanPBkwxASR/tipnspg+4zvu1fXemVpGhIL6vWjL/C+rnwMp3BEZerLEpg599n8VE+g9lV1EOUga6zTxpjXMo3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628006; c=relaxed/simple;
	bh=T+GhzX9+HMfNc1mPl7NUwWfpwuwo0OQ6m2yczx+qhDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ32CB3JudIgqQINauXO4mdLTiCsKLq5eYiOSGjYt4MNyrfPTls+qQzInDkBFmBlZfLAR3hYg6ZAREH3+J3dM+WObHp47/ZTt7Xxz3UeMlueyktkb4PmiGKxEaWmGp8NWiF51YWftFz2daMfsKxOGQSMixhSFueHmGGo2oopOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIPEpG29; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIPEpG29"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so924105e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 13:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628003; x=1784232803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJkGeObDaOcMT+Iq1Xd1zHQwKIn2ZUrSxLhR2bO5jzg=;
        b=fIPEpG29nG9h/AXvJtL+F0NewzC3yozxUlNxQR7BcUL0yqfHo+rtC1v7dxoKYtsl3F
         8q/FBfDDk/jrdCCr/HXF3hxpr7sAm0lCdJq/cqwCVpF92KX83d2c98u5EKO/4+/fkAbT
         kP9sL+O81H5PcMnZtXgRZDQ0T151Xw0nzXzAns1hwL3P0MlvCrrQv4fNUrzrCT87JQdq
         o4+n+lNuj50/GO6JpoF/RvUppGkWSzD3SwdwGuU+4QZYbhGjNn6eS22fd7C570Kbt4fq
         sRHly98ewLokwSElExUm12/inpqF4b9vqSrn56+SCaop5kBWu4bowcGZmOgl7yH35eYw
         rc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628003; x=1784232803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJkGeObDaOcMT+Iq1Xd1zHQwKIn2ZUrSxLhR2bO5jzg=;
        b=o0gF5eVePlgmqKrzhFrTV4QATP6WNERu4v3cH4cquPpwVB7xCW0IIkdNwdgTTRAo9q
         7dUghKmzSBstWKgBNX6KNZpS8oJx34v9qHdne37AObIQ4Lsu0g6GNWn9su3MtDoIwSvv
         ersN2B1MW/v4sMGH4vV2/arEAOQU0wcs0bzF3GA2ur/5FFWNeE7YRBrRZEBiCI1+lnYE
         4qU4B3BWob6LJEfu0oNU30wauWwcZEpb4AevgouprhBZKqnVabmtzLdtILm1kReFTPdk
         WA3zk3yFs0mnb1IS4MkYNjUCBnPlsa71OuQaMP9v2xPuG85x63asbEVH0Ev8l3Tun44Z
         9fYg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ7J1hholHQeCU9+E7hshUsrv3fU9pHNAuqtUsrKNZmcL6UqJcb1nX7mXiFkzyQlThUOSSNQZfRV1hFMWxbJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMHW0vpkGKik0urMzMQ7jrfQO3zSTnwY1F884uQx7xeFTaq4c
	LGD+1VwiDyLR5qzbigNLJx5aLJkW8A/gv11qX8wSuioPk6t5L0lKvxJ3lowWnapL
X-Gm-Gg: AfdE7cnhJVyfEN1PFaLvHC2uVRSbXxrhZw0IJ1z0WqwxMsLbVowF/CcBvz8+/FvJGLi
	0QUzaF2NLi8XI8GyZ1D8z6sBJ+uh2AJmNHFuCvFMNM5K7u2qUth8PYagDa8DUkpYcJOGGyb4NLS
	vMOnBoc3wAsLDmQTp4SYo5a48G0XB9Yfo/ELNVnxA4ZJpYl+PEWXQfv1PE1LABM63/IVlhIK54I
	0f3DJdwVyfTB23cyKwk/b1+J6QOigZ23tX51Q2OS1MKVblKpG4IPgLSxQBpydMMnj8YEWvUPSDJ
	7PMcYsEgXpFjeCHa58FqnNSVo/Sbub8nn1mMSwIm1hqrBoCRoyA6LG5xsJi+Gft4Uqrcov7W4C3
	TmSbW9H3+puo/GJxwR+IJay1bRcfADQIqVeC8pRTdgiyVq/De8qYaPu91S57k9OUzaXXJT8qLl6
	wWOW/2CAiYwPq4V1koKFApIrPbDyzbcTJXzY4HP8KW
X-Received: by 2002:a05:600c:3515:b0:493:bc92:2a2f with SMTP id 5b1f17b1804b1-493e6894936mr89946805e9.1.1783628002879;
        Thu, 09 Jul 2026 13:13:22 -0700 (PDT)
Received: from archlinux ([143.58.204.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm54980016f8f.22.2026.07.09.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:13:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:13:21 +0100
From: Andre Carvalho <asantostc@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <ak__tD5QKz1jX99T@archlinux>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
 <20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
 <f398373e-2cb4-4649-a491-9763df94d98b@kernel.org>
 <ak6jtwbct3C5lZPA@archlinux>
 <1fb14039-b56d-4757-add9-22b97d3c9f44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fb14039-b56d-4757-add9-22b97d3c9f44@kernel.org>

On Thu, Jul 09, 2026 at 12:21:29PM +0200, Matthieu Baerts wrote:
> Good! I will send this patch.
> 
> Just to avoid a deadlock, do you plan to send one to handle the MAC
> address that has not been modified (and eventually one to get more debug
> messages in case of errors)?

Ack! I'll send a patch to making the test handle the MAC address unchanged
scenario (taking your suggestion above) in the next couple of days. I'll follow
up on improving debuggability across this and other netconsole selftests as well
as a lot of them share the same issues.

> Cheers,
> Matt

Sorry for the noise here and thank you for testing the fix!

-- 
Andre Carvalho
