Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5793A5440
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983275; cv=none; b=oaXcXQm5UbT+TtvQVLsBNpboeU/yjQIvIbQ9UeOllk2ZqUlV2LN21WmTZrzt9HDU4A5p/GLRiIuuR4JpbQ4P9jmj3T6VXoLnoJtAusfuFW0VDNA7r0Ux2NS+Wj68NNhhmqfkQs7HcJRepBHwxBevgkOJ5LzXpMMwJ96+0cYvtfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983275; c=relaxed/simple;
	bh=C8cbePc9rCnWFEp1scCgZP+x5olpD01MB2YflmlISyQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sM7jls8U3KdHZLKIrk4S9IaJZbbbtzRBtEq30xGr04z8KSipiI45jRkFIa2AoD5TPdmODHZ7RxUel12wUCqjV0dA8sxkwJbi/iu4/Dl1Yf0MBwSqocUAxE2Xuu5MSec0Pb5oJ/U3MCRCBMz5dpKNg8bui4qMEatSoseCfelBsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SSuGq70K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SSuGq70K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887d4c6234so12083955e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774983272; x=1775588072; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C8cbePc9rCnWFEp1scCgZP+x5olpD01MB2YflmlISyQ=;
        b=SSuGq70KZnGHFbWU3l2vAxU3MexztERT14KXnStsFXFEfosZXNhctQSiuD0Bg+EFhI
         zH7y21a/+Kq42pFrnt+0RDxjCpHVZscUuuG5dCBi6QP6a1fjs1WhzmsLCbS/0MQSmIYu
         OXiaHj8AwoBtTlNrkjyHXIXhyq18UO8nv2agNQRGcv4oxIVK9hpcDN/aYojnNVU61ChY
         4k+YLA+DrsAcRJ0GQpa6mjy3My53xMuZD6MgUjBSULa2vr2LG2U18ZIoOx8MazQD4vZL
         2vyN9p8jnPooea+YMBEpBzLmoeRCm7q7OAbgBFi3drz5aLK/9kIl0Cfc7L+HCVObpA4z
         mnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983272; x=1775588072;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8cbePc9rCnWFEp1scCgZP+x5olpD01MB2YflmlISyQ=;
        b=inHi212wTdYb/5/6gGgulyLBc4pf57F4QaL7k7NaU90pHSX31/+vbFEAaldFhHDQ5O
         M0I4icWkoEOS1xdiuFm6nGerjNvdBYOBxLnnJwQYBVsk1Yynnq89GQEusdckhp0U6a4p
         vzQqudT9Y9YefHuAtzm9nSYIJqaBeNpPVsTRTFYey8lynXJxZf6MV2GofQhJdzCFQo54
         j4PeZtOqgBvJiBLpWWsnqCXfez+NYHjXcPwT2wb4NGYqB6NaZTKIVDKoS7dL+XyG4IQE
         rOygTadNlXMXtJ68NxTUyivYHVeEMVkfoY6NuOlQTU7zKiyKC+SFpy4WEurfgT5Y4SPu
         j3GA==
X-Forwarded-Encrypted: i=1; AJvYcCXpklnYPMMj4P+jBInO0yK88i5edkppGf/YMey9tykcDRMSknxX+K0sZEUwHtDp7+ipt/5i2jROMc8G6GMVbaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3saXn374NQrj79fqixEHv8ba4C5pYAwHETnvZJgHwyAWBf3zo
	y2Zj50hvGH0zeyAE9JUa+DrqLjF4AbofGuljjmUMUh55SgnL7nnFfuO29WJTp1lZdgc=
X-Gm-Gg: ATEYQzxAOetEbgEPzf+O0Jq/rdZCbK2Ht7uPzbLB+VEuzRD855go0MFA0mkxJ9+f1Gb
	EXfxFpHn+low3DLyjaqINWenOZlkFcCKyWn6QJLuRJvx68itEmpp4mMsCsdiyQCEM7oJQ8mZKQV
	CrwCumjxwjIm4sNWaekUZuWI4QEcxuoRkl84PM9C2kp0aO4dTlsbv9GD4jS/ZwdwRf7DN91t5mu
	vrneSGfYsBN0Ktc9PT+6T7DCtIr4F3mvj0vScl64hja05mLYMulGg5UCHyc02C0P4p0ezhkXnl1
	D/vPCbtbrnZR0WeT4axVyCVy1WAE9NV1UFkb1L2Kr0+lrGI7Kp0plAM7rRyuussxeYnKZCsZKx6
	EkbKg6LA9RurrH9AV3PfQZHb299YSuf8h/Gq1y01idK78YwyD5clda5/peIYNyhfF8zhtlv5eCB
	eXf2HuMZqzA/xdp8dvbJG98PztD8DqEHqIfTFr0h7H5lF+5PUUYzE3NoZuA3eJNI8VqTc=
X-Received: by 2002:a05:600c:45d0:b0:488:80b6:872e with SMTP id 5b1f17b1804b1-4888355ec8emr8407915e9.2.1774983271652;
        Tue, 31 Mar 2026 11:54:31 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80148csm59006435e9.5.2026.03.31.11.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:54:31 -0700 (PDT)
Message-ID: <a23f00ad4a454cbb3379cdf512e8c61ce7499194.camel@suse.com>
Subject: Re: [PATCH 1/8] selftests: livepatch: test-syscall: Check for
 ARCH_HAS_SYSCALL_WRAPPER
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes	 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Shuah
 Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 31 Mar 2026 15:54:25 -0300
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
User-Agent: Evolution 3.60.0 (by Flathub.org) 
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

Looking again at the code and at the symbols for SLE for ppc64le, I can
say that, even with ARCH_HAS_SYSCALL_WRAPPER being set, the syscall
names are not changed for ppc64le. Looking at
arch/powerpc/kernel/systbl.c:

#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
#define __SYSCALL(nr, entry) [nr] =3D entry,
#else
/*
 * Coerce syscall handlers with arbitrary parameters to common type
 * requires cast to void* to avoid -Wcast-function-type.
 */
#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
#endif


Differently from x86 and other already covered archs, the syscall name
remains the same on ppc. I will add a comment about it in the next
version, adding a case for ppc and an #else clause with an error, so
future architectures that support livepatching can add a patch here to
fix it for them.

>=20
> Thanks,
> --
> Joe
