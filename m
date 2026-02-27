Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13FF2C158D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202525; cv=none; b=MModVKuiZZkOoUmEbH0Pdv1peOHiZWMMWb2cndhNnaJysuCoocsX6AUfTaOIxQqLb5n4SqJBuXOdDRWMrV0GPYfx7FxYuZxpILqfePbok2hZyX4LQ0T8WWQddbWmAnHv4wAX930vYsW0SuQ7oKeOIpkH+0HZ03byo6EWy2HW4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202525; c=relaxed/simple;
	bh=i6cBFMHUsx0EJf2CjWn4sCmkc35R9btH0euWmqlbYsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hf38sHwD+QBlRenePJZb1Zs2cn6+FGpNjnT/rvuIx9lHDwweKAZAHx57IzcfqApTNBCowXWU4Rab515D40gTDSQYC6liQNGzcA+GVVciijiei6XWpCf2dTdovCDNMZtEUT4bI56vSu/z4mLFUk+JqJtI7/ZZJmNZcCxM8WxvcCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gJk1XxQ/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gJk1XxQ/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4807068eacbso17428005e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772202522; x=1772807322; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i6cBFMHUsx0EJf2CjWn4sCmkc35R9btH0euWmqlbYsk=;
        b=gJk1XxQ/D3JcPOla8s1C33DQ/wDdlxRIWCZoj/ews5RSQwIIk6UlLtGFiGUFLSeouH
         XdJUve0YN591X3z/dH49gM+Qh9KzN5ftOpXJZRZskelZ3XQhLIlHMEwXUkXELbjPDlq7
         jU+MdpSlfo3+OuasNsYzHSsrNMx4gXh8qiX078Ard4OL/bWqhARyvO+hD2V+rxtA44yt
         eStZBw58j2y0FdrzM7wOEYCt65E+EZftUGPQ66La6t2/430Dr6skxdAw282EIq/OkQf8
         YpafWujcuLm6oWQ7EmXx7AooynmRme4+iiEGJvr25r/i4kYS04CmwP34GUHbp8ik21O1
         nF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772202522; x=1772807322;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6cBFMHUsx0EJf2CjWn4sCmkc35R9btH0euWmqlbYsk=;
        b=E5Ti4JqpHpuhXZDlbrbWV/KmvpjCJBRrUn78uwwl75sniFMRsUQDlkc8JUf7qiyYf8
         sG/jRO9hUQLLGMI0aAQ3Zt2AM/wqi3IFc7n4+juYuswn3S6A63fxb3blGwCnCLulH9Gs
         tvH8ZhzC2u2p9EsCodDguKdU0u3qR1hNpA/ra9ZpfpJelwAehmZAnIRg3g68cDN2jc1L
         X9XMHDfPcD5M1Ophqga0XhxMC/U2n9w3pFGKrV0Ycg/ukfCQakOxw6uySEuClTFy/lbV
         cfEclTjD65UexG/BlzXSV3owVAyuTgx1JPoApOkiubdkWuEWxnYmH9IfOn/2Kuy9ZIz5
         hV1A==
X-Forwarded-Encrypted: i=1; AJvYcCWz0MNE42PmtLozmOkgbGv3O7U8D615O2+8QudHlAeRV742DkrEV2P5ql1ze7BbBBPsBIY35YBrmsYMOVWIPII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4KkxjeqFlLYmELsF+6MHQ+o5WYXJwPo3INWiu6Zb+RAP6sZjE
	kzlBH+vJUNAsmESSYvXxjg500+CsJOrezeXL+XDefwBkNIXiuhfOkWoE/mOwGlZECAM=
X-Gm-Gg: ATEYQzzmAycs/VZQ1Ks6wwpKb8KdRNy3yg+grZ1RN9aWElG1C1FNAfMy1QtVe2CnZ+F
	t94Bs4Zn20YU2mulEl0eqqiQjylR64KDYFR6ijk+hDEm0OZz4gp7HzyXOPRhNednDHoKdrAAzuT
	5WFmzmE7ZyWK8gF2zbIux3o29Y2aQyDo9DcmODn8t6g90zFa8AcC+T+m1lOi7zFT3eqh94jtcAe
	5iF36UhiXu40yeEZ9gDUmK6OGIo2T4lQyM3jvkrtNyg9vLVXGSXm0S33Erds3UP6dqjLTlRMmDo
	CJcmR3I9yZephXSPtiuaVWiDQE1WihgkbcYLw45c9SgQOSKOQQoe5Ef+hXphCOe2+RP4K8zgb68
	IDij87vOoNb0TX0Kp6o0EzH8oyTE4D/doFXZ9i40yZtoLnW9L+UMGtIu6ciZeUQeLRPVY9gcghp
	b8a//StfYUbpWN3tcRKt5y2WDiDLWECb0JV+eflOeL5TEkrOlA2vQGGCXXlP5D0GcUOnzB3Iit
X-Received: by 2002:a05:600c:470a:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483c9ba68eemr42134715e9.6.1772202522131;
        Fri, 27 Feb 2026 06:28:42 -0800 (PST)
Received: from ?IPv6:2804:5078:81a:8e00:58f2:fc97:371f:3? ([2804:5078:81a:8e00:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9215ac92sm6872333e0c.14.2026.02.27.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:28:41 -0800 (PST)
Message-ID: <42ab207746352197bc11fc9c2eafcb8663cd1362.camel@suse.com>
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Jiri Kosina <jikos@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Shuah Khan <shuah@kernel.org>, 
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 11:28:37 -0300
In-Reply-To: <3a4a2d27c241bda76a0b5cf812f7921088d5cbd8.camel@suse.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
		  <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
		  <aZx1ViTc7NJws-rf@redhat.com>
		 <5ca16692b304185df695e517434b16e59cb15a42.camel@suse.com>
		 <alpine.LSU.2.21.2602261337170.5739@pobox.suse.cz>
	 <3a4a2d27c241bda76a0b5cf812f7921088d5cbd8.camel@suse.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-02-26 at 11:34 -0300, Marcos Paulo de Souza wrote:
> On Thu, 2026-02-26 at 13:40 +0100, Miroslav Benes wrote:
> > Hi,
> >=20
> > On Mon, 23 Feb 2026, Marcos Paulo de Souza wrote:
> >=20
> > > On Mon, 2026-02-23 at 10:42 -0500, Joe Lawrence wrote:
> > > > On Fri, Feb 20, 2026 at 11:12:34AM -0300, Marcos Paulo de Souza
> > > > wrote:
> > > > > When running current selftests on older distributions like
> > > > > SLE12-
> > > > > SP5 that
> > > > > contains an older bash trips over heredoc. Convert it to
> > > > > plain
> > > > > echo
> > > > > calls, which ends up with the same result.
> > > > >=20
> > > >=20
> > > > Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> > >=20
> > > Thanks for the review Joe!
> > >=20
> > > >=20
> > > > Just curious, what's the bash/heredoc issue?=C2=A0 All I could find
> > > > via
> > > > google search was perhaps something to do with the temporary
> > > > file
> > > > implementation under the hood.
> > >=20
> > > # ./test-ftrace.sh=20
> > > cat: -: No such file or directory
> > > TEST: livepatch interaction with ftrace_enabled sysctl ...
> > > ^CQEMU:
> > > Terminated
> >=20
> > I cannot reproduce it locally on SLE12-SP5. The patched test-
> > ftrace.sh=20
> > runs smoothly without 2/2.
> >=20
> > linux:~/linux/tools/testing/selftests/livepatch # ./test-ftrace.sh=20
> > TEST: livepatch interaction with ftrace_enabled sysctl ... ok
> > TEST: trace livepatched function and check that the live patch
> > remains in effect ... ok
> > TEST: livepatch a traced function and check that the live patch
> > remains in effect ... ok
> >=20
> > GNU bash, version 4.3.48(1)-release (x86_64-suse-linux-gnu)
> >=20
> > Does "set -x" in the script give you anything interesting?
>=20
> Nope:
>=20
> boot_livepatch:/mnt/tools/testing/selftests/livepatch # ./test-
> trace.sh
> + cat=C2=A0=C2=A0=C2=A0=C2=A0=20
> cat: -: No such file or directory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> + set_ftrace_enabled 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=20
> + local can_fail=3D0
>=20
>=20
> Same version here:
> GNU bash, version 4.3.48(1)-release (x86_64-suse-linux-gnu)
>=20
> I'm using virtme-ng, so I'm not sure if this is related. At the same
> time it works on SLE15-SP4, using the same virtme-ng, but with a
> different bash:
> GNU bash, version 4.4.23(1)-release (x86_64-suse-linux-gnu)
>=20
> So I was blaming bash for this issue...

This patch can be skipped. For the record, I discovered that it only
happens when vng is called using --rw, making it to fail on older bash
since it doesn't create overlays for /tmp. If the overlay is added the
issue is gone.

So, this patch can be skipped. Thanks Miroslav for testing!

>=20
> >=20
> > Miroslav
