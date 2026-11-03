Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714792;
	b=jIyHUsUsM7mMYuxy53ETETGK9Wm6SDBi5Xu69U7ccCVrINOlOsSq1NWIrFyXW7j7plOQ
	 RlnkEb+SYn5Okt5a+YlOkTO+Cd3OIMreBDkaHk/vywxXxLnNChMCUPBdki1imzE0rrIYa
	 4SNApIOCCWSBas+q1ca4XB/gNYKv7gGW2K18L4Wul/Crr2RRi1s2cphew/7SyFjWXfMx8
	 BQX15RoBiJLnrMX7kJz3ALxyeMJFwPcjg8ZlwEEruVgyhQaxWVAp8ysIsdc/OmWIdm5w+
	 KuspQT6wTFUd0o2Q+jsf5sWCXkjz+dUp+ofpTayJPa68elrnf9tATRGKHveVDfjzUOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
	b=Q12Gpgg3TALAkgPTwME4A8mtIod0oKb+/eP9P6E+N+CvlQUjpqbpcbxU8nc4Fm1A8o8G
	 2klLMXXk83bJ150diTNb4zmeh+/UkK5ep6b/BX18JHD7dWtgeAKstAmVmXk2Q0BIF/7gw
	 O0B9+F4t4Yx+ZI5lZuCu0znJRPHHmPjyUY+JBddinnc41T1ojay4tDPbIOanJBuwfEma2
	 K9Lb05zzsQJbdZteOLqWRnxqWVDHr/cV31pyA16WJd5PAW2la+1LXbVhw87e1FU8t+YeF
	 c3nKmjah+gsDilrbryMPOkLEtONV82DIpV5Y49+hhR5tPBZnRgxycFSfyORGCABQuYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnhRH4q4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AB606EE96
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30AB606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnhRH4q4
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-82109f51565so2150796a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714791; cv=none;
        d=google.com; s=arc-20260327;
        b=JrX7W7E+LeRdCPaP2pgwJ/4laZRUjq8w7hH/GqErP1ftyk22HLcvst4xbpx9KA7urr
         vDTRwA1gvY/zkASVF36pNtyGM0yagiyPgMlz1im9fdIUpXY1Z7oHGLol1jipa/c4vuzR
         /pxGfjc0Pm/rG61T/7Gc+zeOqfwzh3ZUjV/jfxuobTvz9/HL3uIrVKPRAzfxjHllncoW
         YrOqpipcMO8n7eZbc/nExQSSHN+YnCKahdOJWXSbG9To6kW8Oo2ZAxMuDejo8mIXtj2T
         h/D0KQ24JTLIxi/gOeB6PIwyrIEQORGZ4C6F2okEpJ/Fk4utBXtSteAVBKmH7qtRHe9q
         5s3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        fh=VaPUQ7rEIQN7av1zLx3grbO7Y7mNIMX9jTFNU4YX5HQ=;
        b=o0wpSAjKHKbnybWLqotVjEm9XiWKyyML5XSOFbSoJAdFPH3tfP3vEAeyASU2w74rWF
         GR7qRR1SszNDTU+Vz2rfKSIFXv1PrNtfgvQu0tVGAT2KBlYBFbCuigrj8noavuylAJQ5
         nnr6Z7qW/USYfq+QIIgF1Yu1/Ozweuij2tfnth9+RQWM2BqfchXAL8FOSnHXT8FOy1IW
         Mbv7NBWpStz3qQsAsq41AACO5dg74kuyIVgs28EqevSoMrDbgMKrdy2C9C6IU+dJuqW/
         6r+A63WhPvuvItglrKeomEIazT+hGn3XytMsrEjzQ0Gz64r3cVwpEVqBh+dy9rj/9ucY
         2TPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714791; x=1794319591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        b=MnhRH4q4kEx7MQV7Rveki/MdNDXRe1zt023+RsTRp9ZgP2RKoKBip9q3+52kK1z81+
         J+SrpZbE3mPFTr97SFKGpBZHbx2vOHLztgUKJGNuDoCwkJa7yTfqOJL/+WbeeS/kj6Lf
         pop1st7WFkcaMg7e7KhcGXiN9gl8ISnWW1X0PnpbWFA8dMnjYUZna+T2K78K7QTg0aXP
         APg9pg4MSSJPUhy0peHKAU4G0leLOdzbGiCRXqtqerLqxYGt7OKn4L+jaiKAua+u6Ydn
         tfKdonCTEocezY9or2iLYhuvlK+OaD36riqELJfDrgMaQKK93Ehu5Otc3QT1jmTtlhhY
         3Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714791; x=1794319591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        b=MjfZOUB5EhQOh+3Jzas9629zcW1qQlAGm7jt6+Y37B1QVKFB8aN+SeuFv3r2jbVa+6
         BoG9sRgcxDzJmAiiy7mDxQdbbfnxR0kQJQElF5sd+PelZi3d1yatx3/AiH25aT62kfLj
         qNYA0lxA7kwfWE4Wot4Zoi6Do2HkWo8G0bYHYWkT9fvfnPJSRscYhOQym3Gurn71SX6s
         NkqkRUIhTkBIP+qirgWMKUNYJp1d9rekvRTjQe94x13mDuYQLRc+I/NPopZyOPO8XIBH
         VmSz+183wo4A2ZqsKT1hstiG16iVlOiAmlN6oWa8kd5uDh+L0SWvGALl15o28JFgjr3N
         lgKg==
X-Forwarded-Encrypted: i=1; AKwUvBytEh1Ah99dYm0QcBFhQcuN0K7myvhYiKz9E47du2Fp36OG7iSSK2w+3x/NtpV+BM2dRG+n1wEPlT5tOKOH5J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ASiWl9b4H6Qs5EpTHadmq/+O/t9xuqGD1/pFbHMO7jSOfCI2
	luw1Yw0T18Yn3nq8iTRzRmoYJkn25SaIwPQLzeH9Aha+LanLE4n3Gfcl8kWRFMSWQrwSP4ozofH
	acxd+3I+GUck5ChaIxOqQ/g9+/eZIghI=
X-Gm-Gg: AYBFou3q5nVhsZo8X8tthKPsuRiRy5D7QfIZnde3p1DZcMNpBsBcFB0VPwg8s7FhX22
	UIn3FV5ylONCUx7GRRhcfOw4TV2PzGuD2GBb6YJTj8j/UDnGVYfc2BFcW1GRnhC++nEXCyj6SPv
	8dOSHKharth6CV3MB6P+uIjmjYxk1Vvu1KALMGG2o4BwOnOSOdD3ehRHXVk7f/iBNIehQgiO9iN
	6vix5ZbKVPVTh2YBFFjLIfbzZbR8oLgc9SeuWs1z8mr+AtBIO9H+yjbNU/vWnFxy/qx3H8DUxXj
	P/vx1tDcE+0rR1G2nI5dpCevgrKqjbiPyu+6M7qaEI2XPanHqUiFeejEHruTM9A74sh7/kUP1aA
	L/EDixxFIKJOuMqAPIBIKgPp3/EFgRA86YNhoq0NNAyfex0cuh8U4Pu9eP5RYJ5A505OCgrjksP
	JwAKy8Pt1W6Etr7LiEuoPF1i0F8URNO/NbUmS0
X-Received: by 2002:a05:6830:2647:b0:823:e626:2765 with SMTP id
 46e09a7af769-85d36641a21mr9639694a34.31.1793714790698; Tue, 03 Nov 2026
 06:06:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103130131.4069212-7-sashal@kernel.org>
In-Reply-To: <20261103130131.4069212-7-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 3 Nov 2026 08:06:18 -0600
X-Gm-Features: AclHuK9jA1t6T_L1_qeaqjfhfdt4HQoTqtOL_ZuGwvDN3vPKQfefu2TCWCSIAkA
Message-ID: <CACVXFVNhw7HP7SkR-1aokfOguBprsSdGBPtkZ-DyZssz4XaVAg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI headers
To: Sasha Levin <sashal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>, 
	Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:01=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
>
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
>
> Fixes: e371b9d3368c ("selftests: ublk: kublk: fix include path")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes since v1:
> - Rebased on v7.4-rc1. ublk_cancel_ready got its own rule next to
>   kublk in the meantime, no other changes.

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
