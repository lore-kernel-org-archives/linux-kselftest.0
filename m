Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88D3ED12F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617399; cv=none; b=XwwXuqLom2PJX0ZM0kZbuTB9gfeLLfzm/r6UmCUmTwNfV3NoBpl8o56w9temjwTrFifMhpTQQ7hJkIBwchynXDARaQDCrHAd6SGi0S8Yx5IizlN11DqZBzL+OMyMAlR0R3/g/F+A/OFT6TbCd5mG21b1ZiCIDE5wI5hADb5tDjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617399; c=relaxed/simple;
	bh=fOSwO/08J9ekwjCj2b/zkOD/4BJnhPM8z+0Ya75IJ40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JYPueqBZ03k9gxcZP4Wei1kDOFxC1ZHWl4qUtDnF6auBhCCxLg9PDPE0H/DpS4S+7jb9pv3FR5SLSfXJNFf21OlFO95d4SumOoi+Y6TysrMH0BpJj/5R0euKbYMbh/0gcO+UvtG3bim8GJhKNh3zzhoMzqvv9ryBZTxYyazjaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d0n8Adjt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d0n8Adjt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486ff201041so19147905e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774617396; x=1775222196; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOSwO/08J9ekwjCj2b/zkOD/4BJnhPM8z+0Ya75IJ40=;
        b=d0n8Adjt5FDHJKxjwUQ9vfamlseAmza9SkHVfyDVcSYJfKYV9Z7F+BXBLQw4BytVwQ
         vHwykwFzZHdTT4WDehiZbGDkjZ7OstuOsY1/kpDdficzeyFQfXiuUrSeEGvFIlMPv+Py
         X6anu1zv9VGhOyex0LKpkmom7qYzOqC1OHU5fyWsB+6YYdqOqRfoPGeNg9KghYwcI1GC
         rR+As8d/LH4t5E3N5T1U44o7OzSa3LkRXNjxFHHK7E6BL8dPDt3wanIgexmei47NW1q1
         v7x+7NUiLT4y50g1bEt33iLXJD+ii3qNjZADp7zY9jXKz+1LJZZbOrecE5t1l02lg5jh
         Sp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617396; x=1775222196;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOSwO/08J9ekwjCj2b/zkOD/4BJnhPM8z+0Ya75IJ40=;
        b=YJVzonLb1OzQXfAaxYaY6GvqtZsEEWRvnwlz89LTqbrD1J8qGIAC4/ZI5GcaxYq2j3
         VshLJQRIjQoeZqiOXE5Mt/JgVAx19lMchwwK4SIrvbf1cgfF8HWo85pP1SzcPhB9mKk2
         2UAktOyEK0QM2tgBsFmK1QyQ+7Mp1/3Lq+ty3OntiiPTRZFvn0NjrG8jKNOa9F6MFeIu
         Y0qmskEA1wQcLND89RYLHgtLQJ/BfYDZ4f4z1+YHfLAZtzKEZporEipQY9dnbu/46gde
         2D8ImF2dIp/zt9kKSa0Xu7TrMjwf//uBo/HPgIl1xEMbSlOomDioQSlT+grU5ythmfUH
         sLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCfx5ys+MIwm9Jje3L7lbvhz4LtWvLRYhOgQukCSOFLCN3SNFT3viuYkb8u6MDRGSUPQ4iESUVrvqWYeAd02A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHpEGxNfYSbLjIUeZYkdHHmmbXXUB74LBVErJ0ZOB8DWi72DX
	CLhA2IZ8Ct2YEWi9Ed3TuCkBaqrqBqrv1ideorxDR6SbMf+tMjUy1IfjGXsn7/j+xXE=
X-Gm-Gg: ATEYQzxtLp3wOwKYNNUCQ8Kf8xRNNIO5JwWu4al9LhpZRC3FYnjnXUSUh4o+yij5HLu
	409Q9flWHFwbKfsgM+u9nQ0Q1okzUVaVA+HmVM1FL95zYHZo2aTiVb9gwqkKhf+ffv2SWZW0W6F
	wfd6C7CBDkI6w3pYL1lh5tA73VswPsqmz/savZslv2r/WdkvthMmsKsMefVlEAfJyLYg21paqtx
	se27D3DqRmS9oCNWsv/nCw3z6/aK0zdlQKFnOJlDdcz2+neUnDVZ1gM5dRZOLotd3vImHOf1UEX
	I39Ed5Skw9BWMLMSLeZQ8ofMMEjatEAzF/gjMH9HUR9Wy4kInocgzyNWbdqbzsFDoXqyU7cjXtS
	DcPDDX32We+fmRJn/vy+gSa4E/+H/l2h7jHXe99FuPFDiWB8Lx+pRRBLO4KPuNVbsdP9XKyzmGb
	qLjyTwCNgcxadpe2X+dgf+HrnydrANdAZYsG/CKIZtCAHVur8zk6S9W3WsUz1WDAOsBSyywA==
X-Received: by 2002:a5d:5887:0:b0:437:6d8c:c08a with SMTP id ffacd0b85a97d-43b9ea66f5bmr3852764f8f.45.1774617395872;
        Fri, 27 Mar 2026 06:16:35 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:c8ca:fb24:208a:b63f? ([2804:1bc4:224:7800:c8ca:fb24:208a:b63f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm14930162f8f.37.2026.03.27.06.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:16:35 -0700 (PDT)
Message-ID: <533b0452cdedcf065c73898e4d574fe339bfb347.camel@suse.com>
Subject: Re: [PATCH 1/8] selftests: livepatch: test-syscall: Check for
 ARCH_HAS_SYSCALL_WRAPPER
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes	 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Shuah
 Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 27 Mar 2026 10:16:29 -0300
In-Reply-To: <abhjYtyveer4niGM@redhat.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	 <20260313-lp-tests-old-fixes-v1-1-71ac6dfb3253@suse.com>
	 <abhjYtyveer4niGM@redhat.com>
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

On Mon, 2026-03-16 at 16:12 -0400, Joe Lawrence wrote:
> On Fri, Mar 13, 2026 at 05:58:32PM -0300, Marcos Paulo de Souza
> wrote:
> > Instead of checking if the architecture running the test was
> > powerpc,
> > check if CONF_ARCH_HAS_SYSCALL_WRAPPER is defined or not.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > | 7 +++----
> > =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git
> > a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > index dd802783ea849..c01a586866304 100644
> > ---
> > a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > +++
> > b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > @@ -12,15 +12,14 @@
> > =C2=A0#include <linux/slab.h>
> > =C2=A0#include <linux/livepatch.h>
> > =C2=A0
> > -#if defined(__x86_64__)
> > +#if !defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER)
> > +#define FN_PREFIX
> > +#elif defined(__x86_64__)
> > =C2=A0#define FN_PREFIX __x64_
> > =C2=A0#elif defined(__s390x__)
> > =C2=A0#define FN_PREFIX __s390x_
> > =C2=A0#elif defined(__aarch64__)
> > =C2=A0#define FN_PREFIX __arm64_
> > -#else
> > -/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
> > -#define FN_PREFIX
>=20
> The patch does maintain the previous behavior, but I'm wondering if
> the
> original assertion about ARCH_HAS_SYSCALL_WRAPPER on Power was
> correct:
>=20
> =C2=A0 $ grep ARCH_HAS_SYSCALL_WRAPPER arch/powerpc/Kconfig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select ARCH_HAS_SY=
SCALL_WRAPPER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if !SPU_BASE =
&&
> !COMPAT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PPC64 &=
& ARCH_HAS_SYSCALL_WRAPPER
>=20
> Perhaps I just forgot what that additional piece of information that
> explains the comment (highly probable these days), and if so, might
> be
> nice to add to this commit since I don't see it in 6a71770442b5
> ("selftests: livepatch: Test livepatching a heavily called syscall").

Sorry for the late reply...

Well, so far the test always run fine for us, so I never looked why ppc
didn't have ARCH_HAS_SYSCALL_WRAPPER TBH... I can add some information
about it, sure. =20

>=20
> Thanks,
> --
> Joe
