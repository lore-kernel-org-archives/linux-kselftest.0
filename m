Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA3A71B6
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559603; cv=none; b=dKOPEXgbtdDkXONA1Ppyxt+/pKKJG3UILxzDod5IgvUWZlYTJsdjZUs5+wkrdQaAZasqPzO5NfxCVpZVz7vFaQcMDIi4HBjmrItMRzgOGr1SNgPUTHZ/fTM2wxJqNVpUsFXcIuuFC5pm4+ZQ1ThJ9eAufVPooC52oba1JRWDGgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559603; c=relaxed/simple;
	bh=Nn4ey1VBdokoZSOsfWJ+dNdynYt1RvaS6EWRf23+lSk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDrG9ecdGx2pF6l646tyLqYRGc+AEByBrmdTrGWQxIlM6kNh9wpDmyE4ezH0UwF+3rowz7gxJ9jdzWdNcC9N+oLodP+V0fxXSka+T9YUzCFJVpDb6/qVgkVujBMhmMv7guYqoWAep5ZO2a1LaHBA1uCJeGCOdM5CjvZS8cmUJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBahqw8y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBahqw8y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27106185e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787559600; x=1788164400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eU3gKA1mmJ+y07WplicT0tWKodQjt6CG6tSPc3CwXck=;
        b=JBahqw8yQcBVulf28EBO5MRBLctUKLjFjxPml3zfrIpBUIm80cu6RgkiRLyf/624X/
         rH1cB2H7BqD191rJtLh2pv3Ho2WbFQvN2HOIjAVJNjavcRIFmkLtqwypcnRcCFmo3CDk
         oiIpIw/D3bWQtlqhICXjgBEqwY6qggT5Ir8EvmwIkpcTviEHFhP93pqtzhoYk7+VuRsY
         t0JdVj7UVR3vSQtJAQmN+Rnf3bRpQeXUDE4L9h+qYqok5OdGtR5tv3rZN+7uVXOwWsSv
         HDuZNGAcVtm9R06y+LzShku9kySl++WRCAM3Qu4KcJd4Um6ssHH61sOtR43apLlKjFB1
         uAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559600; x=1788164400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eU3gKA1mmJ+y07WplicT0tWKodQjt6CG6tSPc3CwXck=;
        b=KxL2A+oba33fYE3VFhxz5CE5JDPhWI0w9vCYJgtZYvfTyrPVu05l18zYgC1k8OJhkc
         YokOosaqUfc+MyNmntrLRP97cWqB0aKniO+JKPk4Po6+YWwBIjEhKUXkh9TCDgFmEn4X
         dNZDvfJSg9AGUdoy+xKIa/8p33l94IAo8icW4nGGN8Al11rXJYhv8Xa80Zqrqm6b0O6L
         2bmIx80HgwuBh0wdWhaQwBDJPDXwB5wp67AG3jEBgV5eYFyqTDo3W4Wk+HVzLwvTVgpk
         VkCMomxvCGgRkT9cjxP8wRL1uMgkRLmHo25r7zRB6jzqUGFExTel4r3+04KgZkiK/v6L
         MoiA==
X-Forwarded-Encrypted: i=1; AHgh+RpbFZegTdSR3DECGHWrLu8xgexCsSClWvxLiuxsbXMK56D9n33d7spWyONUk+pvSelPh7cU9YDSyNRPM8b8Xhk=@vger.kernel.org
X-Gm-Message-State: AFuF++lA37UIJrCnMFmjdQT8+hYpRc0I0zLnqYlxmoNp6990KVQT0ENA
	Yg2ykUvpnRmWWKEhVr5JssUF76pIQ9ZfFH+6r1KgLfpPZxgchJgTUjSM
X-Gm-Gg: AR+sD12BVO501Pw9nU/VjV3TFFNYpuQwfLLXlSWdWaYKdH2vA17CgzyFH8/nAUv4tCT
	rczOVm/MhAaW8QGtGp8GjGCjpnuDieHhrgFBCnABn2iRBOyFJPC3rETr91fq2Av1FLGwcTF6TIJ
	8B6UgkO6PEHQSxw6MRNijhGYrnv1Lm4Vikpx5A3eQUomfcaRZwf8zOU6RdDqQvQyFQ3mh+LzZsM
	LsSolO57Us0/Rh1GQFCDj2GtJVZdUl0EwzePpMgG9LrBumpsMSUr0/MTB97QOkwlqNE1TbdvXjD
	x3y8B6ZiKTuR0qPyn1iiR9tXjwWne3Hs+Pg86pYz4uD1sKUd5vqP17TEE5ohbosu6GYGCVXsYcn
	MmGuesjkw2x1e6vi2mUw+w+DkkUV/P6rr0avze+kf81gXOQBbenkVn0qwiH40uG+BEBMW3yWzrc
	icP+oIoeRsDTLciZgJRG5W/kSGz7g/mVVmvA7qrLUKKqTBvKaSfS6Rtr09Gvjtni9WQoxMOpZ3+
	Jj8NWqeJMDBBlf6kgoDRbLXSg==
X-Received: by 2002:a05:600d:644a:10b0:499:bdf1:de07 with SMTP id 5b1f17b1804b1-499bdf1de10mr141118085e9.5.1787559599625;
        Mon, 24 Aug 2026 01:19:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3566e1dsm74302805e9.7.2026.08.24.01.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Message-ID: <20260824091958.7810094f@pumpkin>
In-Reply-To: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
References: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Aug 2026 11:32:50 +0200
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> Extend the existing parisc support to also handle 64-bit mode.
>=20
> Some peculiarities:
> * The nonstandard ftruncate64 system call requires a workaround.
> * The linker defaults to main() as entry point, which needs to be
>   switched to _start() explicitly.
> * The linker defaults to dynamic linking, which needs to be disabled
>   explicitly.
> * With the default -Os, gcc does not use 64-bit multiplication
>   instructions, requiring libgcc. Use -O2 instead.
> * There is no qemu-user available.
> * CONFIG_COMPAT needs to be disabled to avoid build errors due to a
>   missing 32-bit vDSO compiler.
...
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/=
selftests/nolibc/run-tests.sh
> index 3da806e2b302..a50a47d9df2c 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -29,7 +29,7 @@ all_archs=3D(
>  	sparc32 sparc64
>  	m68k
>  	sh4
> -	parisc32
> +	parisc32 parisc64
>  	alpha
>  	hexagon
>  )
> @@ -122,6 +122,7 @@ crosstool_arch() {
>  	sparc*) echo sparc64;;
>  	x32*) echo x86_64;;
>  	parisc32) echo hppa;;
> +	parisc64) echo hppa64;;
>  	*) echo "$1";;
>  	esac
>  }
> @@ -206,11 +207,11 @@ test_arch() {
>  			exit 1
>  	esac
>  	printf '%-15s' "$arch:"
> -	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" -o "$arch" =3D "openrisc" =
-o "$arch" =3D "parisc32" -o "$arch" =3D "alpha" ] && [ "$llvm" =3D "1" ]; =
then
> +	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" -o "$arch" =3D "openrisc" =
-o "$arch" =3D "parisc*" -o "$arch" =3D "alpha" ] && [ "$llvm" =3D "1" ]; t=
hen

Would it be better to put the llvm condition first?

>  		echo "Unsupported configuration"

"Unsupported compiler" ?

>  		return
>  	fi
> -	if [ "$arch" =3D "x32" ] && [ "$test_mode" =3D "user" ]; then
> +	if [ "$arch" =3D "x32" -o "$arch" =3D "parisc64" ] && [ "$test_mode" =
=3D "user" ]; then

Ditto.

David

>  		echo "Unsupported configuration"
>  		return
>  	fi
>=20
> ---
> base-commit: 7f4233794df172ab1d286dc0fbd70da2cc837654
> change-id: 20260407-nolibc-parisc64-3ca0547c2af9
>=20
> Best regards,
> -- =20
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>=20
>=20

