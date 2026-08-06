Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2EB3FA5EC
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049240; cv=none; b=YmdT/8oy1hnp2RtJtx8GSrFxnLWJs4wSPUeYRZuCc2cYNPJM126ZpHbJZ8BfznqdQ6+VYnf5x670o2/EC15jElXkPL4vKVlXM10d3f4tG7jwSqv3eMSpvnYleUM+J4JPK1Zl3doilzwPdo8nWmB9MFS2iWvhr9QiHhnWCdrCvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049240; c=relaxed/simple;
	bh=Cjkslf90jfgMgF524KgiFFz6eIBvaPOd0BnpR59P/Y0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZQ+7sf8pZSYgSFhs0DqNNypLnc7y3J1jFzCddu5c17nsZP60FbjXDn0xuyWXstjGC4ox32ZRWgWWO5xhUUJcGU5BpPDOXYxdtHxSaR7+SPUFqI7QOuwhpLH+u6k3BVzcj3QCFLfy0pAQTsBlmTRn0hmjTBA9j4kfGRrHKGTTivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=QvJJPjAT; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="QvJJPjAT"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-48a0ca07c38so1697989b6e.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 13:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786049235; x=1786654035;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cjkslf90jfgMgF524KgiFFz6eIBvaPOd0BnpR59P/Y0=;
        b=I669pRG11LsjCcNyIRZ4Zfz+ClfipLbp1gHzx5q7wwS6zu1Akv7Ie4iAoyAA8uQDcr
         9GlukJ4A3tgimOkdN7+FnKZ8teFl83Hu8qh+Pc5KcuBzeoNhuYQ8k0f4eQf4Wcrjma2W
         8MpWoOMz+cAtOIhDIixS8PQKUi3INFYkzHDhSHLTniMMs5xyR1ZEGpDGgF8q+IalKlwC
         F8vHF45OHgjaXGJAXZfEd2FTUWQeXdBLlFYMucoS3TEy21RuZM8meeGR2GQT3Nj3N+SZ
         DsuY0YmXLPF6d2IEoiOeGBmtjc3xidfQwuCmdffnIgs1bmaJbpBu0zjqVrflDxBvkNah
         f2VQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSMbcw8F7ebSizwc44JfDfhPeVfYXu8jC6qx3YPuF+ke+sBQQT+nQbnh7+DHbECNnRD894LQU2kbpAshS+hk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VkXaUbRIaT692MSHDKAN58twQlGzYdnYK4Q/VXJioATMeJb5
	BWojXP31JCVm2TUqjrX+uhkyjpQLN6TAYYLHKqnNORqS2rMLXlKsoyke
X-Gm-Gg: AR+sD120L+kKFTI9f5NbMpkQ65L3McWGmqQu+17UfkN9szy+pa3EDtOEAn6+gkvPfVP
	7wprNzjE6KXdxiOkOFR3Gomc9LKGAAPzRUF4uVk6Pbg7yVtGoWP529Wpn5DmGhMq0oxzX5spvV7
	L7AGF4ZPyEL2blwb/7XXCoQDadaHlXLWOuUwUTGe8qNYPDk2RrYcqVJTuLIqa/kWsSGwsEDbljL
	UtHvCbzxq+TwLwQGIIdPiA7JwXQabH6dL74ZfICKuQWf7YlPF/Ol5lFAhiFRbR3xztlQC4Kr1zo
	jV8nqUeYFUCfw7kaFyBw/PsOQTrYlpyzdFzC9JJs4ZdxZkrgs1rZkjADG8gF2qSTAF593RIjRFb
	nOoKT5AKxXAIZ6dpOQe5SJOTNFgA/a3nFM9b3FUIJwDfgGkO7y+2zJFXdBsap0mNCgrqObqyzZQ
	JIn9DXwfS8F/YzO5cOmo9uYn+w0x3Z5ZegWlG91Tlv5NfxsNsCEEOVFu3E1NKlPWjrL9/WmXpgl
	gRgofbUPowLl9p86reNUBUfLRdrYa2xx5tO6CPppo727N1GYH20JJKP4Bac0UqXlg==
X-Received: by 2002:a05:6808:3509:b0:489:352c:5153 with SMTP id 5614622812f47-4afae040762mr9548161b6e.21.1786049234833;
        Thu, 06 Aug 2026 13:47:14 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae45b618sm5381846b6e.3.2026.08.06.13.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 13:47:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B5F26087E;
	Thu,  6 Aug 2026 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786049232;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cjkslf90jfgMgF524KgiFFz6eIBvaPOd0BnpR59P/Y0=;
	b=QvJJPjATNhMCKAWLFqknnja5takUTGv7VDxU5qtAj+L18nMu4qjBr0GDlpHvdIIrkV/rUp
	9bqPwXRWBcSsGI4r1bnn2Z1osrvTugejz3976xAavg6UIQg2LkhoXPojQ2x5rBPCYdDv2h
	+V47XRFFaNfIAMZslraQvB877j3Ri5ren+pSzO8QI7F7kvMCqtwYpIthoQTr55sQ6bcOgT
	EbQKMf3wauJ8ZlE2h9g498Ce0cgGUxm4JjVyVRuqowRNZcp+MpamqBlhIuVNIgZHc146BZ
	KSzAnUdEb1I4I7lDn/suTtdpBofJ9HJDT3fjhftnLjcwIBtTVRWgT2QXQUW/GA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 17:47:05 -0300
Message-Id: <DKI5LZ9RZLVW.3MHN3B9KDTDT9@marliere.net>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <ricardo@marliere.net>
X-Mailer: aerc 0.21.0-146-g87073a0460e3-dirty
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <455a0c97-9507-4035-ba12-82afc30ae51a@linux.dev>
In-Reply-To: <455a0c97-9507-4035-ba12-82afc30ae51a@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Aug 6, 2026 at 5:29 PM -03, Ihor Solodrai wrote:
> On 7/28/26 5:06 PM, Ricardo B. Marli=C3=83=C2=A8re (SUSE) wrote:
>> Hello,
>>=20
>> When doing a simple out-of-tree build, e.g.:
>>=20
>> $ git clean -fdx
>> $ mkdir ../build
>> $ make defconfig O=3D../build
>> $ scripts/kconfig/merge_config.sh -O ../build ../build/.config tools/tes=
ting/selftests/bpf/{config,config.x86_64}
>> $ make O=3D../build
>> $ make -C tools/testing/selftests install O=3D$PWD/../build SKIP_TARGETS=
=3D TARGETS=3Dbpf
>>=20
>> Will leave behind several build artifacts:
>>=20
>> [...]
>>=20
>> This series fixes this.
>
> Hi Ricardo,
>
> I think we should wait for the selftests makefile refactoring series [1]
> to land first, and then address the issues you've found.

Makes sense.

>
> When you do the respin, please test both build and clean with an
> in-tree kernel build and with O=3D
>
> Sending a few comments in a bit.

Ack, thanks for the reviews!

>
> [1] https://lore.kernel.org/bpf/20260804170156.1709916-1-nickolay.lysenko=
@gmail.com/
>
>
>>=20
>> [...]
>>=20


