Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223842;
	b=Od0QLKnBg9Ze1+TYM8z3X+ew2NSHKfwlDHEw2B0DHV/UkQ5JpSc6zpLAU44k84mqfo7o
	 AaHkrtjrM9deTKoxajvI5NunPA8ZzrCX6AdfZ2EltWwis5pf+UNpN4nSaDnAraFxrl2AD
	 oS1OAze8nKtnJPcpJy0ixb1d1CqeGTaHrpLChjRq1ei82cUR3YuZacLIh4hHimxhCcmp3
	 ejvEvE99pbjurBsj5zkywQ7++qc+shDYXfdKIfWzFWpOkAfFsG2RmHCTOxGTPB3qKs0Ky
	 FPUQeThjvlr4h+QYcc6HWQlXXaw4SOYwYEmYAhonWBKM81DOJYN0m5tW8ePTP8quFHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223842;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=75mp9zfOiQdzPd/pZTfE9rnp4feuOSyWnL8j0FSv1Hk=;
	b=iwTo6JTTOFH0JIaGV3OIfIOQqAvzpT3amYDDL0M7yd4Ye47zRl89Rz0w3SDBQMeHNp92
	 NZ4D07u59ss9bnY9szVfaluK3z2RaHtc+R5IydET/HKPIQGKgDCL8NKmyCevAX2uJQ1aO
	 opU8e3TO2BzwxF4WGXfj5OBgYFwWaZ11c1WNrx/7ciERtrdUZpienoKzpQ3KpVHxuTz0+
	 30QdE1BIig4CiR22QQ0m9BVxtaPmAUJufPSDsRkwDGR6hmdStPNt2CWaM9aLTY2YQPNJp
	 /pZkv2voY9dNOz5TvCKXueUQ+XKxghszx1CmKJhc5YlBTLL+f/oNINMJslPcPEkQ93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7L28ldM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E969606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7L28ldM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3610E1F031E2
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793223842;
	bh=75mp9zfOiQdzPd/pZTfE9rnp4feuOSyWnL8j0FSv1Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m7L28ldMVJG0SOofXWBXl1mYdhTrpZFD+XCin/EAjQDKodlrDw4gqa1ZXKJ6aWkoK
	 hyQaGvqChEtQgCcFB3tsf7ZKgcV1r5uBx2fDT8P2O9uA0qLyIZK8u71o3VmSOeVuBJ
	 dNGVudG5dm4SO4+AMAjEQA34c/cV1N6OqYafN5un+qVozZ753Z/4KB3VLr4lHH2vL2
	 3hRlt7+lZD2pezqZpKNigqB5jtzQaSAZO8lePQrSB9ox3zbv/tA4hHoMQdhfoNk0ee
	 /U0CcIcdNDylHFU5Y4PAP2ehoXZTnH+7Dd6GCFg7La9BumE4CZR8FPYF+7DHu13anP
	 9u1oNcj6YMqkw==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e7ad9f78dso160091685a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 14:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxr5ebnDd3air4htX+tM297BD8H6V/XK/00hiUpu1Y1adqyL3/IZfMlTaDO7aq/WjOFKUfwoDaxD2jfcCEd2N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH8Zy5rA+f5U+blHJDPnZuMwHo17CCjkL3yodYFbTD3INRxdTj
	1o/XB9Z+2kIyCNXEDROLzIjv2yhnvkaIaUhSSSkOlB6ruF6EWs7z0FQoTlaRibMYJnEJA2hP6cO
	2YvByoeCZPhfuYzJ6q/36DB7RKKufHVM=
X-Received: by 2002:a05:620a:459f:b0:93e:5060:f929 with SMTP id
 af79cd13be357-94408cf36e2mr560100685a.19.1793223841403; Wed, 28 Oct 2026
 14:44:01 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017002441.716615-1-song@kernel.org> <20261017002441.716615-2-song@kernel.org>
 <at_1V3XcGM_D1bY1@jpoimboe>
In-Reply-To: <at_1V3XcGM_D1bY1@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Wed, 28 Oct 2026 14:43:50 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7EqPazLJmRDoB4RUyA6FgB2Ki_oZDzW1KXdMhm+114Rw@mail.gmail.com>
X-Gm-Features: AclHuK-GjaP7ao4nI71C2Y8yIDK34mvBUk0VSFTRP4lxAJhnYpv80j_vMXIPBKQ
Message-ID: <CAPhsuW7EqPazLJmRDoB4RUyA6FgB2Ki_oZDzW1KXdMhm+114Rw@mail.gmail.com>
Subject: Re: [PATCH 01/11] klp-build: Fix dependent patches in a series
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

Thanks for the thorough review!

All these comments make sense. I will send v2 soon.

Song

On Mon, Oct 26, 2026 at 6:43=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Fri, Oct 16, 2026 at 05:24:31PM -0700, Song Liu wrote:
> > fix_patches() refreshes each patch on its own against the original
> > source: it applies the patch, copies the patched files, and reverts it.
