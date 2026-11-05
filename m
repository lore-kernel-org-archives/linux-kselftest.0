Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901199;
	b=Qp1WEsrRAPnI/VLiCzl51Kf02Y7PBr7CWFnUWVcxpsIDv+1WYG2Wrjstfn6CHdvlC7Dq
	 Rgtg0tLGsWaA8T1oCYc95J5lZWJehS65XbUjuKGczHMkcveucLeY/pJxFIMUrUF3ar/Bg
	 AEnOKSFuculWrpDXMcGUHFOpEYlJJuzA0IcmcbYvIPbelBR+JSKd0Jgzn8ZQAz4fVA+bV
	 OLagPoXeYVCnOxpcVBc5Bo42Yniz7bumzxPyNk52a3wPdJuFC+fRv9GmKfBaKC5PofSVh
	 9x0/w2lTUJATnoB7B3lCRoLZV3iLmZ6lEbBb7v1/rib6TJSc4DZyw34h8YMmGNszA3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
	b=h0RvvymNT21++plGitwqDh/FfXKx9YFvC9UkOeMfDeRE4ZtLLYw4X2y9TQlTuv3uwrWG
	 gezTSNSHJ3jERFMsnQ275LtXomCC00FzaqRnkZkdVTmLJcLIJPjFyWKJ+HvKvOAb2k/14
	 eIfc60HPYsganB7jDOskP8pKMSxpq7mVroq8Z0TpRxtUpmM5+i+KrbD68UoQ7CvO8Q6B1
	 zQCKJCzMr4gCmJx2EjtVPOOt4M7NuHE/McQfUEvTWnKIB7y7ORGrLCADyt5quQQcP4+nz
	 FImnSlNo/G0KSl3GMagK5AvtJIAvTmvtjgSjswseGoWxYaZGYe0p7xFDlLmLEBd8vsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0ewaDC0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE41606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 17:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0ewaDC0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so20162635e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 09:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901197; x=1794505997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
        b=L0ewaDC0DdnIVizcuLN/6bUZotvexkC4yS4uKLIfK+dEjVuKgDOa6MjMssv6x8deKS
         //ogv9UNKq2j92xv7SynG5IuLzA6xrSpHTtiOtzlfQR9zV+oalxFVMoqyd1iIAIT5QDV
         8gWPwt8WdHfXCz7hznMz2j7vLVmh4KITMBo3KFJ8XRx83PcJv6mk2mr0qtlnPP7uz8rr
         mBCiZDl0z33uHoQ80VTUQMwl5zStIolPNbnAvGrC6nsCgi7Be2SoiC6L+wpTgVkndBJT
         83zvZGpAVXD/Qw9alacNL4DAvOwQNTZhrwLkzgrk6UpdOUkP7rt7FfbOurYx3wJJGuS7
         0Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901197; x=1794505997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
        b=rPsaSl2mQj/XRw6XAj9tdbDjacvxGlxudPWF11wVF906/BM2KNrHcK1pEG8wxl59hU
         hn9EaIOsQ5h99U8xW30Sb4CcIhNWKPH7O1Ntt/Fj98sfhB5q2lKPFeyBeLiGUDxizrNI
         OBgOb2n2aPLGO39VEmf4zJCd7ftBb+sdNpI7pBD4qNHPylH7oyPGtwnywdYIPJAJxVMO
         Jx5wJlb8e9ivcyUcplelUFIhST1EMgCUJaJATrrbouOPtLNgSjJCgdY+8zbm2nOW1owi
         ptb8pu+DNcOQ7ZlWPk79NXDl2EPIuYttrejsDrWYvlx4Qd2Qm/HPqh9utqIIAZpO7P8b
         PJtQ==
X-Forwarded-Encrypted: i=1; AKwUvByhUP16GWXN0WEbYRchYrHn5MX9sD2bNWaUBK/bAzxc8HkkhCwNVazNLz+hcYBYKEFKW+MMXT+XlmgQLe9LrZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yYzup6Gz/DR+8l7ZUx3eu+o3vHx4pY/dzsXZuc0IrnqdO3yl1
	HXHAdFDoaqDloVaPj2CTMo1QO+u3zB5eQzgDZQ8nifdKrKAmvcUonCcP
X-Gm-Gg: AYBFou2iU7LHpNywKifTRkepxRQExeqZteidPMFSeRGzho8GyN/X3672pS3KsGBiFWX
	MzOT+l5yje9UrWz571n+AUQg2XxKVfoIdnxMY4oQjl3+AdELKC/vhEjv0moONkes4cEVbqcqP2o
	gIPB1J5TrkXCeDmMbOLm6p9jBZnff1iQr7GrbLJUVWsCfK9/N9fGtZf56dmWre3vd0eJr5SpqNG
	2RzP/uS/J6tSSSihRbDPncQNKMGlQaGmUKgQkIcz9jX+PjaappSUT4dQtcX9Qb5qJ+zMf3VzubM
	Aim4FlzTzlzrt/CUhtzh3RULbfa09mmEJ+e9lEGty0UfgMz7H4R4BOIe2gXiV/b7gu9ef5yuA0+
	JJ5CGuKxsKcf+Ie78UrRukYjIdBGWyOTkow09bChHRk/Vh8ag98hej7SBDfwfZmyRjq8MsHO2Q/
	tV0AdAdfr/LSrpO9sxG9opQ+yAHerVE6Fge9qegMU/N+sLBEJ+H5NxqqfHzFVRC1EObJ4RZwMIC
	5JMhmdRICh8Pa1tYCSED82lvf0Lmv2qMz2AiLQP2xX/lgF97QOzEC8g5Iz4F3sp8NWmgs1RdylM
	srYs5sidNQp/o2CCSZ27O+v3QxU4HWmfET2yicYhkdhdEIITzX9YDChlHDkjsiD2LOWycpIWZpF
	k8j+ix5Q=
X-Received: by 2002:a05:600c:354c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4ac17d16b1fmr442399235e9.7.1793901197485;
        Thu, 05 Nov 2026 09:53:17 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200647785e9.3.2026.11.05.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:53:17 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 18:53:08 +0100
Message-ID: <20261105175309.2995-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auy_NtEpqMU-g913@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza> <20261105153735.5368-1-parri.andrea@gmail.com> <auysN9YTg8Ih8QLZ@tycho.pizza> <20261105173530.39081-1-parri.andrea@gmail.com> <auy_NtEpqMU-g913@tycho.pizza>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 10:42:07AM -0700, Tycho Andersen wrote:
> But what would it reply with other than EMFILE as you note or SIGKILL,
> both of which it would do inline with the ioctl?

Right, those actions can be handled inline with the ioctl.  That is why
I'm dropping the wakeup changes and helper from v2.

Thanks,
  Andrea
