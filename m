Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347531F9BD
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709763; cv=none; b=dEuPaY21/bp5KH3FFzVzBv71kaUIFXFJ2qTtNbe833JHsLtDkFlg9iRCzNye6G/8owzRQ/U0kmoYj+X5HeyrZVAyRCFeqUZ/aOvcvAY9Nxhcc4g9XiOCb0Qbzn1UUetvPTye4O5snwih9qeQNDuQL1fDRWwp2DjhG0dUopL8giI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709763; c=relaxed/simple;
	bh=KrxdAeLUhOdbTOeg6AjThXmoxH0Kuzb7+z3TySKZ5Ek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cM5EuAcrWYqCWSyj7eTK8SubxfPRVzwvR4cf2tBy26SnGE3YGK+Hmc2u9SCWW7NV8obWdCBH5c91oIS9IXXS9QUY/vuajKBNTfoOGxbkDypmh9zdRojC1ckAKDfKYf8PZIbs8oW5xot+0SU50id5tOJpW9V3RLdtSsvRUgMLxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J7Vh3h8M; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J7Vh3h8M"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso51157045e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779709760; x=1780314560; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kdsBBlxH/fBT0qTKbx/OGQlMNoMysgVbWBk3JCaqZ+U=;
        b=J7Vh3h8MKk9Al5Rnl+JKHcLYApgCPEBlwf5UG8TV/UNVm9K+ntBRlng8nJ+sGAG0TP
         oAUTN7a7EExRm6XsBmqj/go/JVYPwSE7mQ+zVeHMMSeWz0kGzCzqyYMAX62DZxKQznYt
         zCVjJAFy4uSZ2TMHorHuzRbTji5tDLIj6ubSrSyaLWQOEkQByHURRVdVrKrnpzWFJicJ
         LwN5+ByUO5zgs2YWNLla5MTTwCoHFW50FVBNiVGEwK4SZXUyI1FcCV684XIF+bxWxuRG
         ueq1UEFDzF47pLQJuLCRUNpu4+FULATdqOIThXv10jmprUQ7XfsDWYoZzjs1B9TONoi3
         u1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709760; x=1780314560;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdsBBlxH/fBT0qTKbx/OGQlMNoMysgVbWBk3JCaqZ+U=;
        b=a6dkbB2Phv4qZpfJlR9gvwL4DK63GYA0cfRFGtVJAeIQUPoJ7+UsNFPaN1Vk/d4eOa
         UtfuxgaHexWWik1cMIj9GTfEktwD/laADYoS/taMSydNxlxT2PnbX0vCcRAUnh4QWA+D
         JCGbtKirQxbKt2dyGdPrWdQWVngZfwCqjwbDDQNOtcxEYGiJM7nGezNsA2/cwgyW6gkU
         BkcYw0xwp8ZvrMEDU57tCCop4EzeLR3awVN+9ua0RGYwx3fs2uXg4GsVyVGsVRnwcZLM
         q9/UibvlpoYUISGZyPtfckzPTuzI5VYel+ShL1m58ngN8eSSPV92p7pBBaVBoxjv8hac
         dCuw==
X-Forwarded-Encrypted: i=1; AFNElJ971cgbBcasGE4pIIyDfwxTnJBVVRclOiawD0VzTBwjI7elIINzFnMV6O6UT5yTnGc2gCqzVT9VzxdzOuOAReI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBl6+Xx77sl7OQZopkpPL3JPIPu9uZnIGr6yQXIJebsAHKcmSB
	fBsd5KHygk6HygbgC6cMb7G8N9F0jWJN5t/pid+6oj3oVcLO4hnLi0Jl2OCdiI59XUA=
X-Gm-Gg: Acq92OEOMJOhduuNNsEMU0sLMX2E9rMr8B7TUPj24jlgXEJr+BVkqoUOhjEzURtby5L
	ubbolReJ/uCO4ngfB0mv+E1wFe1QQcb9RA7I3RZqynjf3c4g5PflCluziq4LbUAc7gdK+rwnv6J
	OTVbSeErUvjvj+QovEUndseFK4lPklhrAOQd4rwjNJdbobtJyb8q3klTst3K2G8y5PV9gtNseB4
	K76AupCZFbziaZL+pOVXTAFrW4Z4+dpGVx/eu/RhuWXftNAXqOaBVhqHp/d6+EIfePHaWZwTv6j
	EopvTZOEBz2wg/JwJiSHeDdExevTyga3aGgi+fVX/uefN0L9Zq2rSIQtSJvoErGH4Ja0z10JFEz
	7j8HRba2QWPp0oBPBpsf3jdNjqh/A/7Xi5OvjxrYktavRgAw+1poDy8qaeGquwqD6LSar6j43yc
	d22LSUCsRhYd90Nx+sRtx/FwRjE6b1cG5ibSLEvby85Uh0g94eMJNVyCnknIQogbhg1KE=
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr234633755e9.24.1779709759832;
        Mon, 25 May 2026 04:49:19 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49041781fc4sm120310185e9.1.2026.05.25.04.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:49:19 -0700 (PDT)
Message-ID: <d329f22e75fd01f2250490e4cba87f064a726f52.camel@suse.com>
Subject: Re: [PATCH 1/4] selftests: livepatch: Introduce _remove_mod function
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: sashiko-reviews@lists.linux.dev, Jiri Kosina <jikos@kernel.org>, Petr
 Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah
 Khan <shuah@kernel.org>,  Miroslav Benes	 <mbenes@suse.cz>, Josh Poimboeuf
 <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	live-patching@vger.kernel.org
Date: Mon, 25 May 2026 08:49:10 -0300
In-Reply-To: <20260524235906.267EF1F000E9@smtp.kernel.org>
References: <20260524-livepatch-unload-on-fail-v1-1-7465de7f741d@suse.com>
	 <20260524235906.267EF1F000E9@smtp.kernel.org>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-05-24 at 23:59 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] `_remove_mod` uses `die()` which will terminate the script
> during cleanup operations.
> --
>=20
> commit 7b1591f4e5c3b351136e7fe2821eb2e15ae59ad0
> Author: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> selftests: livepatch: Introduce _remove_mod function
>=20
> This commit introduces the _remove_mod internal function to remove a
> loaded
> module, intended to be used during cleanup when a testcase fails. It
> also
> refactors unload_mod to use this new helper function.
>=20
> > diff --git a/tools/testing/selftests/livepatch/functions.sh
> > b/tools/testing/selftests/livepatch/functions.sh
> > index 2bc50271729c6..3ec0b7962fc5c 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
>=20
> [ ... ]
>=20
> > @@ -241,9 +241,10 @@ function load_failing_mod() {
> > =C2=A0	log "$ret"
> > =C2=A0}
> > =C2=A0
> > -# unload_mod(modname) - unload a kernel module
> > +# _remove_mod(modname) - Internal function to remove a loaded
> > module.
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use u=
nload_mod() instead, which also
> > updates TEST_MODS tracking.
> > =C2=A0#	modname - module name to unload
> > -function unload_mod() {
> > +function _remove_mod() {
> > =C2=A0	local mod=3D"$1"
> > =C2=A0
> > =C2=A0	# Wait for module reference count to clear ...
> > @@ -261,6 +262,14 @@ function unload_mod() {
> > =C2=A0		die "failed to unload module $mod (/sys/module)"
>=20
> [Severity: Medium]
> The commit message notes this function will be used to remove loaded
> modules
> when a testcase fails. If used in a cleanup path (such as a bash EXIT
> trap),
> will calling die() here terminate the script prematurely?
>=20
> If a module fails to unload (for example, if its refcount doesn't
> drop),
> die() executes exit 1. Inside a trap, this aborts the rest of the
> cleanup process. This could skip unloading any remaining modules and
> prevent final cleanup operations like pop_config() from running,
> potentially
> leaving kernel tracing persistently enabled and polluting the system
> state
> for subsequent tests.

The system is already polluted when a testcase fails nowadays, since a
module is kept loaded either way, making the next tests to fail if they
also try to lead the same modules.

The current approach is trying to make it more reliable.

>=20
> > =C2=A0}
>=20
> [ ... ]
