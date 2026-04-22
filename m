Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08073C1413
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849207; cv=none; b=Ru/3oA3C1HwPIxo2G+IF2fiusr5fUzFN2xaKojNEGGPcnhxn5ptIhXevvEGnfQ235qA5fAbYgDWXmRvMbkHnX+TswtcjyxLere2Va7JqHDCjXqMrUqxgy5yyrEQqLhNsdEsikm8aAa83S5chW4D3ea0smW9rhjBYbjvaL6bpd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849207; c=relaxed/simple;
	bh=lnDH+L5FeyefzEiOwoi//zMzH528ayKYykWRM2wp6vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXKHC/rgsGZXdJdE23Um5FcB+OFD/O7BfbE7cvUU2VDMl5lbG9PMyWRpxnqLwK0Y/RchYi2wlVoj5V6eLVCmziSNzXXDdSTKeirs0jjimFS7Bdy6c8Gmt/+zEum+Lu6UR7xm3SRxiLle292JIy8RjUJApq9nWYc12EVyeKwxOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPzbSsZ1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPzbSsZ1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so561466466b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776849204; x=1777454004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKsuHuOjVnQIcIxkx06GjcZGC/dgb1PFZKky9ByNtmc=;
        b=jPzbSsZ1GuZlxJ8NV3SvUI6vf3xLYDDj4+haUtF8zUg5blgFOCFfe9SvorHViNWXM7
         oaocCs11Retpkh+ON0Z8qyeCboBWIBKGTpv22Xceqf0R3WqGxLBk6+Z1SXU3vJw+/J37
         ldxjS1BfTsUb/krcK6CDgqzfjtOoom0hJ9Lzblxs11TX2q7/NYYmndx4DHcek3sM7tJ0
         Hu0F+9GkikWaGznKgA2sJQet5Br5zVSg9vAurjoxzs+2s4WKOsrd0IEN7byuRUxO538b
         5/kKkLcp1DVuRW001D9REi9z9eEGnQSroYhy94ZqgE9pMkU/Qw/GZvTvbet4aWp4gPio
         gjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849204; x=1777454004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKsuHuOjVnQIcIxkx06GjcZGC/dgb1PFZKky9ByNtmc=;
        b=tKhKDv3d+ImJQeMX49/0KFT+wNyFiSquXZ9IJeJLaX4h0koYHqZsChcWCURRVjPK5l
         uv4vc2YzIs2fIYO7rsPmmQqtzTgsTkdK+PZPjqxTIXlB4A4bUb1YTQDKuQKRd90OWG3+
         M/MWGC7GjBjrI7eTMVugFi/oIkLleRj5CjIgaVGwDZ1kFQPnJF00y9znspx50bi7wCUA
         uUlh8F/FT33lEkvJReAqo9SNov/UUdejXaqLPMbGi3degvBZcnRIyvLOU0CXznjA00dS
         pQtKYoabfYi5GI4SEQRTLqtNeuEat0pVAUbYKYZ1/kSZXWiswg5yVaQhmMhMBoz5WgeD
         eeIw==
X-Forwarded-Encrypted: i=1; AFNElJ8sYHmMFZm5cSHA9SpHmk+gQfBo4e0zCW37h3me/m9r3H9QgGw4Yrv1d170tt+id46HLaLRM7y0LOJa2b49m30=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFXai0dZxvXdk2SWu2/n8OicN/BIkZYEjqtOnQIzAvv4ubYKS
	csJN/Onofa8H75KJdIdFmjYO4B1U0KOk6KFCwSVVfOhT7RZYpeopUe+C
X-Gm-Gg: AeBDiev75nom/yZrNhWiubUJNyPLq2HqW3uaKvOcIIqCyKswW3G91342vsc29UW+Usp
	ydfdAbqdTq0jUWR8Ugize1y2GkdQRr2OiShnQeQDIFwlYFK1J72MZ8vPzGcaVmvfeBaFFgvwsDQ
	yNp4+YZ8WzJ6HLqjLWbNpqseTwRjTfPgVCzY+3Ig0/c6XxRbDY3aENLBsMH6xS3i71sAwQejpKO
	EUi4yzmRXFG0OJJk0F0Vdoper08+F5c2GxWkCj/13HcWZ+b/jEw+Z28lDLRR5ok+coyktlfTNaD
	vC5OixB56Ysa3YmOusOb/TFDD8uC5pYzBpa+mNmw29fJRBgBN26mFi7ToK/wK2n/ClEr8j7ZACi
	vzwSsnczGUu6Kai70zdfR/9EXJe5A2z1mWWNxO/v08LlxUHZPs0asQD7I+lVapWQDnJM4htEsbq
	EhRghN/7TcGEbccracKoau+dr2LxwiKDqOgApVqDlhNNpYaKQTO5GqZnOyiph1bcwnBxLHBq4Mt
	RWi2DMfDSdv
X-Received: by 2002:a17:907:3d4f:b0:ba8:d9b6:4993 with SMTP id a640c23a62f3a-ba8d9b64b32mr476670466b.8.1776849203836;
        Wed, 22 Apr 2026 02:13:23 -0700 (PDT)
Received: from localhost (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm464634766b.15.2026.04.22.02.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:13:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:13:33 +0200
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, vkuznets@redhat.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with
 udelay()
Message-ID: <aeiM82FpO-CcqBlI@arch-piotr>
References: <20260421172953.191345-1-piotr.zarycki@gmail.com>
 <aefZrtpivxh0eK_0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aefZrtpivxh0eK_0@stanley.mountain>

On Tue, Apr 21, 2026 at 11:10:22PM +0300, Dan Carpenter wrote:
> 
> How did you test this?
> 


  I built the test using:

    make -C tools/testing/selftests/kvm ARCH=x86_64 x86/hyperv_tlb_flush

  And ran it 100 times to verify it passes consistently

    results: 100/100 passed, 0 failed
    average time: 466ms

  For comparison, the original NOP loop averaged ~537ms on the same machine.
