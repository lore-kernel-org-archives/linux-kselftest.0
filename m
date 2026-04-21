Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D53DD51E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802233; cv=none; b=KN9MnypmEOUZhqGsmUyaPxBK2/PYuB76EFDB/6yt/nY/YYPXneMRMW7SgSw0HwropaFocJ6aHw3w/FEZucPM6HV+ATMgEjWYY1uIxIbjYBrJPsQEy9ImGlyigJGEKwnm4QkPJJkIrnWCkhDZrwFteeWGuKUo7izP/FBZfZUqcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802233; c=relaxed/simple;
	bh=jJhdMmDpEI4YTob6x7tbe+0j9Jno+gpDkiP83eoohPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVGqkNrOf7JCvHLMhDkm4jiuy0bmOTxri2ReFWIvgmXrEFucajlTgxftH+ZU87kk1CWapa36C/0iKEo0zWEjG6GxK04Kwn255ywaUoIQ8AyFHaWgbLJhhV64vJmsoAmCgbNei7Ra0ggIeIe6RKqUOr8xt0FjXq0FZZ9KnGax/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMrAJCNO; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMrAJCNO"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so60055421fa.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776802228; x=1777407028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/5oU7amdu0z7nvjPYd6YcR/1tXxonAi/NB6llIwWbI=;
        b=AMrAJCNOiEqPKluuJdYQxSSApHcmlo7sWVvjotUXs7dmSMvOopSUbwXUSBMYsEiIqY
         xSYCckIFdfMgS9RfhgmVgTDrem6taeTNs7xrjX9jZpO6oHOfOCgzuW3jBZsd/djGXMRr
         6LTK0zbKnzU/4wlhkv7dlJr0rl4kvk4HjeRihC6D0Rljd0DeKFZw5aoTzTBptIYfKnNh
         Jc4mMmmeFVznzycdPmVxMKZFwKmlPJm70dTY9b9B2286WsUB1XMQk39PrQ6Fpwuj7f2q
         uojIeqVBEbg6bljNQw5vkNgi8vQwJXRPenjEgaw5eWgidP6eTfrADhmU1LKlNKlVwW6v
         bA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802228; x=1777407028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/5oU7amdu0z7nvjPYd6YcR/1tXxonAi/NB6llIwWbI=;
        b=NxfgTAPns7FsuPik/uKz9YWLf7ukbretAWevegecF37z/oLKw3M1MId6KX8SG5BJB3
         VdzGDH3FcEeN2267/1jBn2WDJ6cd5lVBPKp0shORKrfvjD5jo8RWilKfQRtcLaU6QHkV
         4vTRA8MrDGF4/X9CHOu6O9DBHyXOQWDC5XOJ25tQMf+joru4wOsGw7Q690Kl/IWyTSQZ
         piVJn1sYZ8mWMVbhAr9KRlLMR1rer5KIMAwOjK29OVjiaih1vDfDgUtjWaYDAac+ezTK
         YP9JxR4ygult3Z1iP5Pb0csBDjuvGCFzxhRkazW9A+ddEnLepeNQ8FCBY61PDm9USWsu
         TSWA==
X-Forwarded-Encrypted: i=1; AFNElJ9S7VUmH9zSX2dZfkAHTOOWs4Ox3MLlK3VfJ/+aGNWjkUqfnG3MQ6N0tHdjVqJByqSOftdloIVOHuUQCFs2LAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRmrNXptHVXqEP1OoXBnwHpbmraLZIK7a6MbFo9ouOGdw6Xg8
	blHCZHsXPNTvzWvJS9C067HtQ+1oG8MML1MmxSfjlEENiY8PehaobUov
X-Gm-Gg: AeBDietzO2xYG9wY3JZm0lo8fi8oe6njggkz3mrOF5FEXWreEzl76gnYxVJJj7BSacc
	6iE9Z6PW3Cna2P3SWtv4PPFHNs9jaxFo+QtsxrOve//DvMAuBLYGmsqC3UToCsemxRcOgOpGB2P
	8k4v7K+entK+9ivSHcneOm7hVsooFCZFiUX3LGS+qz4CLHaMnav0dPwD6Cere+F3SnVUgalOv9B
	TBYM7V/J5DHqlyTftKOzeutHCfTi2J8qE5xzap6nStxYztjlKX7tiX1vUVdlJVceQlrnCqLlPqN
	+XdOUiXkA3jSul2reZfxVI8w9sLyth5fEnRnmuanmL/Gzu6AhxctsHPOfCe6YCGRcnzcSKSU2c0
	j2JSZDLtIY+suM18DFzs9o2attKy+wkDhx72TZdiajqtH+pTuxqTgPBisOH08jXJZW9D2i1Nw6Y
	N69WHt8feq6FkJ1Q99XqU8/VpicIXGjw==
X-Received: by 2002:a05:6512:3e20:b0:5a2:c962:59f1 with SMTP id 2adb3069b0e04-5a4172a3042mr5526839e87.16.1776802227777;
        Tue, 21 Apr 2026 13:10:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm3858063e87.74.2026.04.21.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:10:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:10:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
	shuah@kernel.org, vkuznets@redhat.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with
 udelay()
Message-ID: <aefZrtpivxh0eK_0@stanley.mountain>
References: <20260421172953.191345-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421172953.191345-1-piotr.zarycki@gmail.com>

On Tue, Apr 21, 2026 at 07:29:53PM +0200, Piotr Zarycki wrote:
> Replace the open-coded NOP loop with udelay() which was added to KVM
> selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
> utility for x86"). The NOP loop is CPU speed dependent while udelay()
> provides a deterministic delay regardless of host CPU frequency.
> 
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> ---

How did you test this?

regards,
dan carpenter

