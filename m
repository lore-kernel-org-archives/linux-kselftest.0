Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A9047DF81
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847312; cv=none; b=KiCkRnJoMp9HapT7FinCMEI6HYovHmHRYMCMt02NGZWyrBbDGNPU1dTmaGI+F98Om9G7Y7Wkuwz0iTLK8hbASs6aSG5/blc0BobMdDkxHU0XGxkaQNCfl+iDqFYfa9On0gw96Tlt7WgV6p6lzeLkgG4kP8rGEHTPj9TkF1MMbV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847312; c=relaxed/simple;
	bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mXbjje3/SuiXqq+i07KxGmvEXSkZsRxowsHza/yoix8JeHUx9pKtZ2qiYi43XYZRuRNvkLJhr9Qna/uctX49jHdm85A5NVEOLM+7DAs/gdTUvrRfnk7CzJjYTWC7Xs4HbulJVcPFNPVWIVKD0guVkBgG/1lP9gkps59c1zXMadc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JB200RN6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JB200RN6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso79323005e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778847307; x=1779452107; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
        b=JB200RN6ME0pPcc6NnDTS9ZcXpFHbgD3XFVJkEDxSUvqD3ZFeZJcFmkCM/BXvwssz8
         D0H1q+/MkEZLvWbKRgvaSXEAJFOc7Yu44GyPsTStTlEmwfvMKEfV+LceHGMAhbz9+fub
         JRK6z40eU8OzQWctUCZVGcw1tHpovyu1oQV9avHxuTsaiTChS1AwpH+dl8NoMniMJh4D
         MFKOj6Jz8J9luahTQP7BW46oNmcNNf75gHMIGX98RrFmiuA+dAMYUDf96AhR17hiMx5p
         53VprpC+KdBktCDm809kWkvMYA4s4Lct9AMmF7aT3GTEXOqy14/IgekPMM29tz6evvlL
         e4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847307; x=1779452107;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
        b=WUlROeFtKsWu9U3SnyriHyyuA5rLq820kOxl+EUjmxpFIu7++RKr7xaigeTczWXp4d
         Ma13/KTyHImvrRCAyHRZcIsjKAbiAv5wtISHEPAZdoQj48uiESfnTSrvFR38msxE5KdG
         NytjCVoQ9orq3AMAU9esafGs/vlrtUWHP9lUtl2DJ02pr9suuojn7htHRSKEKo9j+acg
         X/0Q+wMkCcW1erXovEnL+ciQLM1gFqkNZwpq7UoxLh4vkPttkoqyXyKMiMLunbBY6Ovd
         f0ABQKco7+5llOX/842c6dRlfhOqaPfkQQrtxddNo2+UCH8fZSuKt6EvQQmqINXREpv2
         BzSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2UGk3adiT+hw6bA31SYSiUdKrkNn+KyV5FtE3vaFMbTwoMwgGwJ2MY9xhm/5hHitlwL52LQkOn/jp99awIFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gwddPbs0H3pu9HweLfqQgrudPS4peO8sNQyuA+eRK0RsEnLA
	0nU6rYJzNxHi6sRlqNje1AxmhNDjsaAsimmj6zUJbqvFf0TOPorzDo76dtePB0Gq/wFfQJ6VMks
	2/e9N/Y0=
X-Gm-Gg: Acq92OFNKFFFVvzp0nGhyoObJUVlpObyXNJWCSQHSbH3DwRyBRoWAo7tWYHYM39rFPi
	ibDftcnAPVUdvbJXtpzo9AOTF5JgDLTiFQ0HV0uQh//QBkkbYBB0NjEu/vhm83YGhM4Jj1S9ECT
	oyk4HMRB8bkoVRcbzChueOh1z/guwFNoIl73MWMM5gPMJA3bhltjLeGiR5L3LK7oyvXIx6ZuPuQ
	vjULKvzg5me0hIT6PPpCyUSM8wzt/wtQr5zZEErrbwlqx8dkMC85FPQhzsCwWi1D0tusGTvZEer
	4lW7I8x+Ufu83b5e5QPXLqXxqEhRBHXCDwW6SppJyMT56KIYkHh2+hnCTKN9kqs33aXyXSP0Cnz
	H1a0LbZM9p+5iAphmqJgu1A7UTYmis4iK5fmmxpliw+F50CErkTwMdww8A/43xjNG2rQErDNR8H
	wCcY6CkOma5Xz8rciFwxIqhUsPjELsN7TG
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr56127295e9.20.1778847307241;
        Fri, 15 May 2026 05:15:07 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1285:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351d9sm9796573c88.9.2026.05.15.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 09:15:03 -0300
Message-Id: <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
To: "Alexei Starovoitov" <ast@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 00/11] selftests/bpf: Tolerate partial
 builds across kernel configs
X-Mailer: aerc 0.21.0-146-g87073a0460e3
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>

Hi Alexei,

Just a gentle ping, please let me know if there's anything else that could
be done in order to move this one forward. I believe everything has been
addressed.

Thanks!
