Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD253F8707
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073721; cv=none; b=JZo6MBliRIg3frkvsiUlUhNsyI1YEW4Wgx78GzMPKFzl0ztasPSnbw29D8ryLnHQFgZIziUDWqo1llc1UySgoQ/Vau/KD5QQVxI5BieYMdWexUIvZAtgqYWSOXXMnWsaIC+o9+IMEon9xNvvG/4WQUGKyVOp6CCoPlY0h2nnhrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073721; c=relaxed/simple;
	bh=llW4OxFvtKWFyEC9eRxy9VUDdqj1IBqiGVZmNBrPlP8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IWh+ChPrZfjZouYk1GBckc5L55uPcUHSMr5Kr4eUOMdciXAdF/CKoU6fsKCMogQWHBnXjdg5/fkKj4Ua+++Pe2ar8twwnAOwYe4zTvWy/6RfvaLcH7tTNUd2Dm7TBtYc9Ioad+/EJ/YiGWClWhu4Le3mQvcvn/5nA211WAN5JK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiTUy1Op; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiTUy1Op"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49039a8851fso85224875e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073718; x=1780678518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg88DDtH/8BXfFFdiCpH0Ax+iqDzN9Cpw3OqPjVLSd0=;
        b=aiTUy1Op+lYKoApuLxe7JXrRYO2t/I3uULvMmUsOHz0HkpZGDgZ1iZf97sCp1yHLvu
         0cFlLa4hBdMNEMS4IppVax/VaoCcuiXYFrV6iUupCMRo/7pxUNM/J+AkB9L6yFWBIlvx
         4kJUlQ2ZaPeZXfAqqoyHLvTfRguwpAhCKAPNdV3UtuA8HC7FicRQQM5lUwxOop3dvql8
         loAh1Y6Sto5lfxtAQjA2G+L48fYNc6emeJoUO+JT8W2pvC7jgZA4AzH9qC14GWoU8kgq
         b2VFTb5VW3ECBBPZv2CpkIPqkoZ66dzgC+dQvzLlYbqnAl6H0GQv/2LAdQnXvp7M36bY
         Kepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073718; x=1780678518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kg88DDtH/8BXfFFdiCpH0Ax+iqDzN9Cpw3OqPjVLSd0=;
        b=CR4yE4RIX8x//s7Z+K9XTSMw74YaIzmfJI1GOanRjHWWcLqZfvddl6v5wxJ7EDXQUO
         DYu6DlVyUIbE24zeOqT0qA5nQC577W6F6KAXEDxzy06D+a1WtCkUx3vdFcRgmvsxleac
         Ya5zQhCHMte5n3HCjCISZdD4JfPLBzN1k63uxXJPYGTrSz+YPBmSKemS1VaXBc2Cq/j1
         NgoitVavb8nj9gAq4XvLQBS03nVkg25O9CvSeBmswZ9MWgiHvcI9oKbf5YFlhsIYmSC/
         OoFTXFKhxn2fXwf49S2b8D8KoFZ/BGghcClANzLRV+L4jUR2insqFgzzIQ5hgLhugxGs
         vhoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EsHAZSBBTVTAPvwk/BNvv2C7TsIR/fhNh8jUs6212MlwJXIa/2vNXoEDfNVYm946YUxCksPAcBvlrqoK9lMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXbfXhpnRylN/d8uWDARAi9oL40L5PuwP0ydt8Q5RMAjqPwBD
	BFe7Ecr8btLF/Dj9jnkArAw00JFwt9cB1yQD/7dUp9xs1UgIUSSOoY5G
X-Gm-Gg: Acq92OFShi0r33jJNWfC9eiZm3y3MC6eZNU0IhbkN4J+1JpDzfBcEJ4Js3GV2+E03Ya
	CeV949rSiBNs5W7WJT3q8GeIfE3LGCtBnDDCBo3Blj1tk8LH/+/3pr5O/iQImrusOzsThH/e3on
	/Z4o/YE+ztkFGeYYOTu4i7YUgS3TbP07ujp48Xa2tXSWdd6RFY6Z/XthJO45Id20bfHgN5/c02S
	I3pkRMQl54JI6KJQA3rwx57rBxfojJ7Wz3aoZ0TwBh7Jk2SmWx1+5oEbrHZ0WfR7732ErYG2jJW
	g8b+xVtpzxVjPg1ZKcSz7V+3EhvOnnUdC+pPQd6FGMrtqFPZzx2eWf3z5hm84YHxwwFGamUrmWk
	T5EFuXLk20v3JypegEwjQ1e25WYahb6Q9FAP/LwYY1M4hc+mYmzNFzEBOXTPWizrxw9axmbKGTQ
	HnWdw1Rcc/Bk380LEc9mw0s4njemDZi8Wap3yPlN541qT3+ePA//mLewyDrc4QJt9Kbo98uJE=
X-Received: by 2002:a7b:c3c3:0:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490a2941d7emr4738915e9.18.1780073717867;
        Fri, 29 May 2026 09:55:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0a89sm68444645e9.7.2026.05.29.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:55:17 -0700 (PDT)
Date: Fri, 29 May 2026 17:55:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>,
 kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org, Mark Bloch
 <mbloch@nvidia.com>, netdev@vger.kernel.org, Saeed Mahameed
 <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan
 <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v2 06/11] selftests: Fix arm64 IO barriers to match
 kernel
Message-ID: <20260529175516.06d5788f@pumpkin>
In-Reply-To: <20260529134947.GA128816@nvidia.com>
References: <0-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
	<6-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
	<ahiFxtmspbETiqWw@google.com>
	<20260529134947.GA128816@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 10:49:47 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, May 28, 2026 at 06:13:26PM +0000, David Matlack wrote:
> 
> > Let's put these in tools/arch/arm64/include/asm/io.h so that the tools
> > headers are more aligned with the kernel headers, and so that the arm64
> > io.h overrides are done in the same way as the x86 overrides in
> > tools/arch/x86/include/asm/io.h.
> > 
> > Something like this (untested):  
> 
> Okay, the disassembly says it works:
> 
>     1db8:       ca080108        eor     x8, x8, x8
>     1dbc:       b5000008        cbnz    x8, 1dbc <readl+0x58>
>     1dc0:       f9000fe8        str     x8, [sp, #24]

That looks strange, I suspect the C didn't match any usual pattern.
Normally 'tmp' would get thrown away and 'v' would get kept.
But you seem to have discarded 'v' and written 'tmp' to stack.

I'm probably being stupid again, but how does that work?
The cpu can speculate straight through the control dependency into
the following instructions.
An 'eor x1, x8, x8' may not even have a data-dependency on x8.
(Most x86 cpus just generate a zero for the equivalent instruction.)

-- David

> 
> Jason
> 

