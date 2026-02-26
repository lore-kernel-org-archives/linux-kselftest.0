Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADBF315D23
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116479; cv=none; b=NCp4enprXSjoyc2Pm3jq0SUq1YwAtTIxVFh8HDkMhVw9mXnqd6+3/gCqNTW9j12GepP57B4W1wfbsR3SuP6AR9QhnqzqE7P2HCsYUjYHT0WxfLyVnHG8mI1r3pAmwUBPYCE5GNatgg14jleEeGLhiq/5I3luEGN9uJAy+0TB4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116479; c=relaxed/simple;
	bh=gtA+H2X6ew7j0WLGn1Fvyy2afI0h2OIZDUA1JcW9sJo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqMbgvtPYDsRHYNQn+iCg5st/V9SeV1BUDKicQYYuhD2VgYtcVaJ57JsvS9vZ1ptTJSCZmXEdZQoTZRHndr3wRC/eYiRskP0knoYyxkMSaukWXAhDGSFu3HguubIWNcmI/9MPpJsn+qaU6Lrrt/cqd7VkaHoUbgXIhWcCobKw0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EC3u1Hvr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EC3u1Hvr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43990ea3fbcso646423f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 06:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772116475; x=1772721275; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iB4u+09YhtcRl39ds1n5VvgzC6lBCx1avlF+QWd52Eo=;
        b=EC3u1HvrNOvh7/iEf4qwMT/+SLnOiKQLcuECOh/B6Fr/jki7zzaNFrK9aq/XG5u/YI
         zf++IY+le5jSBJgE1t3XUASOSmlePcWur41QjqlvWoN9LULci2RaebMYrAvJ8z84yxsb
         h6ell9yRfrZn5GVXmfAJry26tDvtyAQ0QrCMTrdWWhAMD3kRyy55HVaZR9v0hJT+Sh5R
         VdzYBcpK2j0Qlvzp73DAjKqmVmnURuBzlr6AtfXt9ZU8DT5nGJwf8MotPNwgCKf7/HWK
         WUw+riR/gFpyQopdYje/s/7aR2zbsPTLkF9GFGCNuj2MNUV8Uc/Euv4XV1bIHHGbwUXv
         meSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116475; x=1772721275;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB4u+09YhtcRl39ds1n5VvgzC6lBCx1avlF+QWd52Eo=;
        b=Fclfte5ogEuaG9PyuBx0X7nU6g7NcDHi2bBbqcVhevGFoo9GD45hXgn3M33Vkl9PY5
         kuDqGfDWYZS7m0z4n6YSq9tAHV6fEEHWvXq3TMt+OqvszWuyFanmBcR7sOtW8LAfVDEl
         7iHpsq9SJMzBEUxJS9VnywrIcp9l6RkGlPy93KRdgP6UTwoi5xFW9BdzsV/rAldDCARR
         0xXnhN4/pi/xg4zTlN7vGr4iu3+JJGsYIAOkoNLArc1lWcoHjhY3CfNvSZ6fpvrNAGIS
         Xyh/FN0q8/w3TfChudB0KhtNv2aMRIgp8aOL78kwYUtSeD73IFCibcS+Z3KqYx5tydG9
         X7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUdk8ZJgmiWOBCci1Esxnj7tuO98SU/W34RktJ4PYGv/0fwEH/UHa3EXcGRFwa/5nxzwvsV22Atn24jnLolam8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79d+KyBGN0Nkszha/EoIyijVhW1fHki47zjhVzL+IOzemnsze
	XSwZZ8A1jY4ftJyQrOaINlof6HnN6xguB2cL6qwxoRSDbtH2iq7fqjaD1vW23PNDZ3A=
X-Gm-Gg: ATEYQzyRo/mFqMG9Xpdtdoiu9miD071hfM4FbJKhtseqSjzFZUhIUWBZKJ7BGvCSOwz
	fNAPql3fsZI3k9FoYyvLkePU3QGO6CEd2iF42r6NJFw24AVdnOLx+qnN2uCzc+87V8CHhYtvwuS
	/TDQuKzU2j+8bl9/85mPvenmXRj3lSiml4jwwb3DflA7n7ZEAFV6VL4oDNJwTRFpRkVJyyk+5Pa
	UydDpUMPvsaNDabdnghmRZ2mpx06Gox3tvJ+m3X+R+uhCg05KHvsbT9Dww1VU4znxiP9/8t82Bu
	+nevEKOo+wXAOBaMWD17ADVp2rpcOFMNwf7oRuCKtFXaG1l2CSlUJvydWHrylsf8lKT53bKfMUz
	xWHjZDyu1s62nrI2wBH9j5hWFndJJP6qCdWk0S7ce38Y/pO/Usx1UenuXdUEea/4KM5DmDwQ4Y4
	WwwPR4UV5ZwEVlTtSQMOfn9XNp3a1ZuQcG8T4qFr2WgWYa8dbDHovhavM94J4Ak5qKzMMzKLyI
X-Received: by 2002:a05:6000:2f84:b0:437:6c0c:346c with SMTP id ffacd0b85a97d-439972045b9mr5398962f8f.28.1772116474640;
        Thu, 26 Feb 2026 06:34:34 -0800 (PST)
Received: from ?IPv6:2804:5078:822:3100:58f2:fc97:371f:2? ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43995056115sm7530873f8f.14.2026.02.26.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:34:34 -0800 (PST)
Message-ID: <3a4a2d27c241bda76a0b5cf812f7921088d5cbd8.camel@suse.com>
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Jiri Kosina <jikos@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Shuah Khan <shuah@kernel.org>, 
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Feb 2026 11:34:28 -0300
In-Reply-To: <alpine.LSU.2.21.2602261337170.5739@pobox.suse.cz>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
	  <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
	  <aZx1ViTc7NJws-rf@redhat.com>
	 <5ca16692b304185df695e517434b16e59cb15a42.camel@suse.com>
	 <alpine.LSU.2.21.2602261337170.5739@pobox.suse.cz>
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

On Thu, 2026-02-26 at 13:40 +0100, Miroslav Benes wrote:
> Hi,
>=20
> On Mon, 23 Feb 2026, Marcos Paulo de Souza wrote:
>=20
> > On Mon, 2026-02-23 at 10:42 -0500, Joe Lawrence wrote:
> > > On Fri, Feb 20, 2026 at 11:12:34AM -0300, Marcos Paulo de Souza
> > > wrote:
> > > > When running current selftests on older distributions like
> > > > SLE12-
> > > > SP5 that
> > > > contains an older bash trips over heredoc. Convert it to plain
> > > > echo
> > > > calls, which ends up with the same result.
> > > >=20
> > >=20
> > > Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> >=20
> > Thanks for the review Joe!
> >=20
> > >=20
> > > Just curious, what's the bash/heredoc issue?=C2=A0 All I could find
> > > via
> > > google search was perhaps something to do with the temporary file
> > > implementation under the hood.
> >=20
> > # ./test-ftrace.sh=20
> > cat: -: No such file or directory
> > TEST: livepatch interaction with ftrace_enabled sysctl ... ^CQEMU:
> > Terminated
>=20
> I cannot reproduce it locally on SLE12-SP5. The patched test-
> ftrace.sh=20
> runs smoothly without 2/2.
>=20
> linux:~/linux/tools/testing/selftests/livepatch # ./test-ftrace.sh=20
> TEST: livepatch interaction with ftrace_enabled sysctl ... ok
> TEST: trace livepatched function and check that the live patch
> remains in effect ... ok
> TEST: livepatch a traced function and check that the live patch
> remains in effect ... ok
>=20
> GNU bash, version 4.3.48(1)-release (x86_64-suse-linux-gnu)
>=20
> Does "set -x" in the script give you anything interesting?

Nope:

boot_livepatch:/mnt/tools/testing/selftests/livepatch # ./test-trace.sh
+ cat    =20
cat: -: No such file or directory           =20
+ set_ftrace_enabled 1                                    =20
+ local can_fail=3D0


Same version here:
GNU bash, version 4.3.48(1)-release (x86_64-suse-linux-gnu)

I'm using virtme-ng, so I'm not sure if this is related. At the same
time it works on SLE15-SP4, using the same virtme-ng, but with a
different bash:
GNU bash, version 4.4.23(1)-release (x86_64-suse-linux-gnu)

So I was blaming bash for this issue...

>=20
> Miroslav
