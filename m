Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56946370D62
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044602; cv=pass; b=QaNwRutTA1E7Z2ckXOkeowmrz5MRo4oFVftObEPQ2ht7Aw94lvuROAvToFGCG3SrUZJ+vhmlMTmwGfkgvGIHU/l4PUjysMpH84Bq9KW5P6AHBIxViwmBrTZ8Gi4VZXff0s7YyIedpq4bSwSfilNsFMTFMj9RSa+P4X3PGr9EKxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044602; c=relaxed/simple;
	bh=E6ekpZzhDIC53BvOSNzztWhrdmf4qJGm7P6hkWiSYLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBFOwhS4Z3+XQnqrjC95DwQW+eXjaICBD3e6xxFoQ3uqcVIaD/Oph6a4N+yEgkhYJfigjNYnKomSoX0wTGO46AsGs7IKX3PEN2c2lM9gWb3SK0R/TIGOlNfV3sm1ppYE5G71vjF9a8HqetNykj0qBAzeYySJRiXbX596WVFcgfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fL/YHr7X; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fL/YHr7X"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c063fc29so10643e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 04:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775044599; cv=none;
        d=google.com; s=arc-20240605;
        b=aIWhil+8WNyJQexLySum17ITy2Swxm2RsrhWZwWQlNoMkjY6zinyqdoG4UJLY68skS
         vZg4/EJeZEDUc1CX/9b0Gu9ZimhY/kpWpZwFxFBSzPq86IGgra2h1qse5JSU8vclMul6
         VDQgIjhe2VYVzy5uLN7ZQS5uw1OivOVGJ8bsXb0aiyX26eGDCPW6c3AZoVBBiYDlIp0s
         ctL+wG/LOslvr0t4H5nUHJvjh9fTt+Wunm2BSvlVNKSImSAD0PurPeqVtTiB+gl6Eya2
         8lr+JdDp9x58yu8fsQNwBmPXMuQzx1J98nkGcw1DTNNxHucXdZvutPM6JwA9BsSrC/fE
         qeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E6ekpZzhDIC53BvOSNzztWhrdmf4qJGm7P6hkWiSYLI=;
        fh=ZaOEUA/S0sP/0RC1PPpwKp+ads2VJ5hzmf9c9oYrJzo=;
        b=HoX6cOqjBFEE9JWfu/GIiHrUmW8SZPC6Wxw/0L2+QJSWsJeq3jCbYMkApT2xD6znQh
         rrEpIK4ka0upNaWxbGuRgwEKjd5hyUUxfsWXxlp2Rrd9iKqTxJfcfHVQ2DsHXEiAFKfz
         TerAkUoaMDJQjA1SEFFMVrsdUmRsVkT5Ut+oWy6TkboUZeOHA6eAS6LpdKu2ZEmiUOm2
         P/9NZjdDrYMJRxGVAMBwlpEGnmXwPZzOiVupQu1yBa/eZiC+7i5BtZi0uCmYTKvIeOvO
         6YgYVxkMEa+aMwTZt9zjE27b4vp34qUt/3uvM2vLTevyF4I0zYLY+f12SkXlKcYfuS+G
         WiDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775044599; x=1775649399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ekpZzhDIC53BvOSNzztWhrdmf4qJGm7P6hkWiSYLI=;
        b=fL/YHr7XG/F5Q+xb0iyIMjyD4pQlzjBBwE7CCjOviNalQ9HVMOY+vaR6B/zrqQZf8E
         +bitBJ8ZmLr+Omd1aOvUvt8lKn3wlWqKV0yYNIqBwYyfOUalZuNrn3yXSpU3KeZXEx47
         jIaMdoDcS7sAD77RHmM0N83L6zt+yXhSxgGxQkugS7C19oELYtXvDSFsiN7p2TAk1okB
         Te7y3k4fPO0s+4QppY/KdXTeeEomSWb0+42TLD/X1kpxPKOgd2hGFduz/PsG2wdVx1RN
         iVrCN9XN9NQcw46pYx5sEuwmJuC7MaEsIlSGObsDbQKja0E0aE2EfeDmch6v6ZVvkDsy
         tYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044599; x=1775649399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6ekpZzhDIC53BvOSNzztWhrdmf4qJGm7P6hkWiSYLI=;
        b=M5j4hdRGTs+Krzn3OsWJ2dRB4MbtPujhFkgY2X7LIJPn6V6x76gkWDUfRwIPtZNHxw
         An+o6slX6FeQrfrz6ss8V0+51jROYb04WkYcUiuyIaQ9Vjd5KhVM3xVaVn1C0oNB121v
         05OdC6xFVNGBFcqcoRhvyJcBsjiMNoYTYED1zLNENAePD/UuGMZxXU1dpoWD7pbC0iep
         IOllQx7YuAIO8gfNh8ALB1EaHf7hzvsaXyXChiz24StgoVKmExmzmJXOM9ml/xzbmc1Y
         vHAJXYx9o7qKNWat5ikpi36LlfPlYWwL/VnFGby3hhf2LNra+zcUFHQeN6893XwJfxGz
         GVPw==
X-Forwarded-Encrypted: i=1; AJvYcCXus6TYNsJpCI8AqbKdlbnhUfTpw9151LGvIZMxlSJ3apuO+bi6hhC+AzmYLgtH7gQZv366FlwHc+ikpm4Vy4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YylecwSQHVtivzFLXGuIFj019tX7RX4O1c1QXI4DN9Mbmo4bAF7
	nSVMsK3etPXIffbdeJ4hgXs1P5H3n90glJYFDIPUy5a6cj6a9WkKNRkTSVOlDFxYCkDzdx8/p1j
	KcUsmDUi6sXLNqnjqJajUNFIE+tjY91uoxEcbBHIMyttGmz3S9EzCj9I+lv8=
X-Gm-Gg: ATEYQzxMYUv8vJCg4zkkbQ6SvIV5CrwUTJ70/nPOj5ndHevstw72lHT0RmivM5H6B2H
	IKIpC0LjMkPAZlN95iivZkvq8e7tZRiDXmWrYCHGGMFgxgJNPpYDbgVk+Vul1bdtvyyVxMl2FIf
	84LtqoYAuPLn2oj68NI4M2hWqyAgW01d+nVfMpn2RxNI2RHaayTMwFxc3AEWVmoSCt5jA4favwS
	H1s657E2LIATSVDemMxsjNX+DTcJh95P1/J2Z6aN8pKcizTF4hyFlXWeQgcntipQEoiZIt1dOg7
	F0K+A8/yeTQeMYO+l4gLPO+Zu2/91qW5YA==
X-Received: by 2002:ac2:5594:0:b0:5a2:b59b:3161 with SMTP id
 2adb3069b0e04-5a2c39dc3b3mr89372e87.10.1775044599038; Wed, 01 Apr 2026
 04:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318080825.3063959-1-hmazur@google.com> <20260318080825.3063959-2-hmazur@google.com>
 <cd22b0b8-1e1c-4442-b4e4-5d7a6303ce4d@linuxfoundation.org>
In-Reply-To: <cd22b0b8-1e1c-4442-b4e4-5d7a6303ce4d@linuxfoundation.org>
From: Hubert Mazur <hmazur@google.com>
Date: Wed, 1 Apr 2026 13:56:28 +0200
X-Gm-Features: AQROBzBmsqVa0bLuslxO33uYORmv1Oc1fkKk_IO_8NILdGvBGJCqdyb31Q3Fr7g
Message-ID: <CAJ7Hp_qzT1KK5FOYjoEjCUZT2_GMmTcL5yQiisJN_fa=cWDMBw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] selftests/cpu-hotplug: Make the script complaint
 with sh shell
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 
	Slawomir Rosek <srosek@google.com>, Lukasz Majczak <lmajczak@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:52=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
>
> On 3/18/26 02:08, Hubert Mazur wrote:
> > The script uses by default the bash shell that is inaccessible in
> > the x86 embedded devices. This leads to the syntax errors. To mitigate
>
> some x86 embedded devices - which ones?
Actually - this isn't particularly accurate since it applies to any devices
which rely on busybox or other small environments.

> > this, change the interpreter to /bin/sh and properly assign the
> > FUNCNAME variable for each of the functions as 'sh' doesn't set this
> > env. Change the conditional check for being a root from not
> > existent UID and replace with command execution "id -u".
>
> Please include errors in the change log
The first error comes from the "$UID" environment variable,
and the error is:
./cpu-on-off-test.sh[193]: [: 0: unexpected operator/operand

Regarding the changes to "$FUNCNAME" - there's no error printed
but also the function name is missing in print:
"echo $FUNCNAME $cpu: unexpected success >&2"

The v1 already addresses the most urgent issues with $UID and $FUNCNAME
which I faced but in the meantime I took a look at the sashiko.dev review t=
ool:
https://sashiko.dev/#/patchset/20260318080825.3063959-2-hmazur%40google.com

and uploaded v2 patch which addresses other issues reported by the tool:
https://lore.kernel.org/all/20260331115111.1522473-1-hmazur@google.com/

Please let me know if I should revert to v1 and update the changelog
and commit message or we can continue with v2.

Regards
Hubert
