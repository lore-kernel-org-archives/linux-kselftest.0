Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E53FE35F
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886912; cv=pass; b=bTlitCPS7/6pwFG4Qocd/4xfyh8SET9+yTIMZpWc7ZESIHkRA+iSlrrTuRjpAHXufDaKPB2kVFtOmMG1YdLGK79CYf+jG46JOCAZCh2Jd1Z9chRRhtd7OFn6MWNId2AOQ+hRy2/dXR5X1qEU1sHbZz+VxPaTIHQHDlSKDC1OySA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886912; c=relaxed/simple;
	bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjPSjCqXug2JdXpD460cBoz28xXS6kqtyh71ge4JdAnyYo3+NlQwYNvc2l95kXVPPSAXChuBxkYHapkCCc8a8UOQHvK9NbdAUQPCJOKl3BLVl65Akl2owTmbVKcte8qopMfjE7qUpkH3s4rCNGgIFh5kmmAQzIDotWZy+H6m0d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMb/PDFr; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMb/PDFr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso2298690e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886909; cv=none;
        d=google.com; s=arc-20260327;
        b=kA7UnvHS70PTJKcgVKSAGasuiZZpKnEUOmHlGId+cKY8Uft4oayebj64VvnnUiOj1V
         GTWmhjOj0kL1soBkUSwRHNGURoqiA1a0qQHEo27+efcrPK2cg4FMV2viyDbTpCN9HE5j
         ud9FPNrHfoaQ+cWgcws7dA4RCX0ZDiBsWpSkm290ycUY2g+ABWR0503J+/7hCz7sxtGB
         VXw/ct6e0CZCFoUqwfsGe4RUgCnMgQsuSvwBGdd9v10SO3HftTBzAgmBiu5EQUDDJi6r
         MRtp3J9w10/80SMnyC3c7GDURoVgKxIy17kTveIvpZ550eTIjdM+nkF6XdhClxH9PrLb
         EtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        fh=BzKswxdRqOFF8HFb5sv06RnlIDHR7h2stvR6fXFKXKA=;
        b=qc8IUMC/toitrwduP9KJLlpvfSvKwRxxFu0Z2WmcJklR5KK+5/4f9aROr+E6IvzJIK
         UYZGmWaj0BVuf1ozyAEJcgtRmA1y473q1rS6pFYN4SFFJsDLXvu/QIWRufI2dZ+RYjyA
         XZ556rIFrs8kxMJgmwVih7uqwSqsr3ja92X2Du3VHrUUyq2PxE6MhYO4HS36HUgS5V5Z
         fG+4zFemZJdh5AiKwlBFXtOZeWLFwXOwfbbD4UsyWGFjYCqEmx3QEl0Il58a6/KZ70oC
         qqoR7xFOGjw58jXeSWPycboJvHipCN5BqqbpGhtPf67Tu0WbepcKLDVr6i1FFZltQ0i8
         rb2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886909; x=1792491709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        b=GMb/PDFrWoHJRy9pBHdTZo0/lj8Cg472bjve20axVR+DmIqGmLXL/J5FQr2lH0o+sk
         5nydQS0hHGSFh2Fixw7CV3fCrG9ZVkJGzEqLYfvS/LIdZ8DGZrSMGnRB3V0e5dQrb0tj
         GnKR8QJs/8IJhdGLSXgNcOPq/1dAUtyr/t//GhSGYxA62aGyTxtptqRuQaQizH6AhrAr
         kjX3vMYK3hx2QiF0x8qlGFTRSmXLHANPyVFQfkxR1QLP1iU/z1cZMX6f53hd6grXJFm4
         q7Pm2e2riBVfBSIWE8dgwbwNViO+K3MY2IsiG7XqfI2KUVZgdArq5OMNNUp5FmvsI6ky
         nUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886909; x=1792491709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        b=c8AHFin8DYZ7rp+D8ghqXmRbaC6QApECbs8ZpLVaMng2OkCmo9TSzvuS9N5umYGPv2
         E63070O2fU0pjYn8TsnZctuTKYKmN4eJ0KVwj4Dnm5fGjV13mZqBiLabAtF6CtgozYZS
         dOm/pu6WhgpG7fDDjQxV9SaSAOsNrbl89V7fuJUMkn85plSJSefXWrLeKrpVpj8aOkBl
         RxovjZXngQG9xqEJ7/bqWu1ihz1bw3jjR9kM7p2tMTGOsQchiOCtN7sIFN46ayotkLcx
         7pwY3tLFHSrS7aNH1o4Lkte7zRH/a9gMd82Vae+FVn+cqsBM9qR1O1CCA+M3+pe/prl2
         rLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQdx+5qpJa0Jc4yPDPAMMod+fNwqYgA9SSXPIWOJj0RwDjVt9MXdNYfY+6gyx2sT6xbH7hfHbgtUKm4bT5nFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC2odFFw8gg8a+QuNJwFLXwhaL0HbT4HS9g5aimqMEPYTqfNOG
	Btjs22D5cHh/5dTgCrhhwqmpm7uS53GUqyoiqriMl1jg7OtRc3krwZbvBRh8WlXsLkQhZTI8RB7
	0ZC0mb/myMhPVh03CCYGVo613SRRczW0=
X-Gm-Gg: AYBFou0xCvh+n9VwIqvBaGJMbA+rZlq7HQB7lNU67Jgk4TRXvtiZjmPed9kNFCOxLzc
	DkumnOMX2z4vSk47N/ZZYbZ0x0w46ELatNjKekSVAUr3QApQLgtnh3FGwMLINnEj+h3VGoz4Dht
	IRXY4kMJEKxcaeeCUjeveTYdFm8wis39IWP3SaeIWEWMbONNadOspKF65tobQdL+7N0e1mF/xZ1
	bs4r07aLc1W6Ww1Ixb5xIxt2axRsD9yiP5dr97w54LDdAXFEuJmHVZ5bWsjLPSkfT7jfnMQYKa+
	TuNDHDY0oz1d3mTNUQigkCmJpJ4HOezGDUlgqVDNCDDY/7h4P6oThuM9/AP4OF6ARbayUge96gv
	oBwQSyqsXYLU=
X-Received: by 2002:a05:6512:1302:b0:5b7:593c:244a with SMTP id
 2adb3069b0e04-5bcde6cb1b4mr4214429e87.44.1791886909214; Tue, 13 Oct 2026
 03:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-2-sigefriedhyy@gmail.com> <179185709784.434549.17899680533305071231@kernel.org>
In-Reply-To: <179185709784.434549.17899680533305071231@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:21:38 +0900
X-Gm-Features: AclHuK9g3jw3wKxZcfUo-DjkbmbxBzgQ-U86o5Pm5ByOHON1wyGjQ9qc2fnRD5A
Message-ID: <CA+7S2v+LjXscrjWYE6kTu0uBR8co7G4xqXaHq30Za32rbg5FDg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Should this have a Fixes: tag?

Already discussed in previous thread.
