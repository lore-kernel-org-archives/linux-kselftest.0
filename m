Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F335DA43
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783975463; cv=none; b=ucbCh0YccW/b693whxttAnp9bMWxfjHnFqZHLaT0e5Lb2A9rXytREQizEKmll7L9KfhzTrMYr9l2DxAYcyc8opQeOFHMi2BOwtVW0LilKWh1Ha3LmV9BYIUOmwUq1fJgabDsPJCpYuwDJ/ck6xiLHPIy5CYshZ5xOsygpenEXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783975463; c=relaxed/simple;
	bh=Q8Lc0DQVCIbsi1docguk8WDNau+BZVJwSOlPmEFTfAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jM426I1Mo2a+41t1a0sdl/YSWPVNzKctU5RxHDpOGHtVzrKIyiauFgr8UlYpCtJXr0UWQYfwxEkEu0yPATSF018EUgygZGyHR/fIy9MiTE3hOvOCOKOl//zpCElAEgzurox8cGMABXgAlNulbOHvhiz6XhPXe+myYadu/spkUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7RniHZF; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7RniHZF"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38175907a56so251226a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783975462; x=1784580262; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NcRJzQ/iAkhbWmpqB0xxcKXTayHV0TvapnZsPmIM4yU=;
        b=j7RniHZFt416VRItGK+7Q1bNJmSU2/IQB2T2p+ldkWTwELy6N3BZkn6DHkFwfUfdDO
         oPyw2bGrGfghkCAsSH9BQKK0myfecUK1psAQLPZCrI/+OTjIdYsVbTxP3OMcChWHNPgz
         BguOdU9umXfl17zKtXvDlgwIQSzamAA4UThPDL5QW1YWzcswT6yJxbpYb+eRSmAeofw8
         kCaig2erTCNwxSJzA9k27TEw68COlXJe5sM8I+H3gn++3PGHzLd11P/blrESMiBXhgpR
         25hxN6I+NYePwpRsEJL3mAnFkNX9yx/6caa8SzVxveNaUmf3ZXvyUM50OmXF7sEsDKj5
         i5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975462; x=1784580262;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NcRJzQ/iAkhbWmpqB0xxcKXTayHV0TvapnZsPmIM4yU=;
        b=q8RtEEPw/RYMDb61rzsMQtsuZUocjUoG3IzLjkLm7kLqHkz0Hd4r8FHznnRGPslTlQ
         pMw9qHb+XaFshhbSTxP2WoiN3DH7t/MiB3njemLm3wjmatDakTFOJnoZIS24bmY7qdaI
         r8DwxHOwhI5lBFX6jTyujd3tRow1ZIyVG8gdvxDpoZlQyeMXvFbYoR5SG0FH+7M6EFl8
         Py08g8H5y0j2ztmTecaaROKTsPnPZ9j5VbSppNoX3b7Qh6irlR99AzRXQjLPF2K91iKr
         4GEmD2HSgyMV1S9S5kUWCZgdfDn9qPepbG0oLA0IBG8DykNJgt56JcHrX/VVWtuZSgKM
         Tffg==
X-Forwarded-Encrypted: i=1; AHgh+Rov5t2DzYrl4o5XdO7YY2qeInvr9ilfpEj0ML6jz7DL4mUwBWLQTmeHvvr61ExRClt9bBvjkBh2EqPy50e3eRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjR34sBiJicAWSpubeEx/fi91VZxnmeCb6LZevOxbbrVzrxMOS
	2YY/VZMa4GAW9YD5HFdy+bMd1eJiL4KNmkABMmkHGHBqFgj2jP89o+21
X-Gm-Gg: AfdE7cm4WS592S8XpBeRb+UCmj9LXh5g+9UOECwjXcxYSAzc2tp+duBAqX5j3Ly++Z5
	WNYldbDlrhWxVsOj64djNF9Wqd1h2SP+qGT7p4hb3uU67wMWv6cA4NgLYTV8yv5InQd2ECTJl5Y
	RMtpcXVcVstYyvMiPVRJUTpPtr436r8FJeHUk6hJS+K3xi2QF/DdcxBDR178W8809f4UBfLjLjD
	Mglp6HD6tO6DZi2mlIeyFbqprxFDrWiHjssiOkpUPDI+LGyQoVTFALS4wPn332zTPT4/4jdStDT
	+WFYk3tuut2TECP5OfozQ7Ba/gxEQ/G5Pm70t+72Kdu7LA+62efFsaWS+LpJIEwI6c4XPfT32Ri
	VP5fxQJUdW7C0Pu6UGi0+KXApC+5ITDuwvg6vig3dPpvf3M80Swf1sc+PJZ+xdBSM79zAvURI0k
	OZGXUlxhOS0S1qnENWrp2oTx1Z2y30hkGBjcCD8VX7
X-Received: by 2002:a17:90a:d00f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38dc8499094mr7990388a91.20.1783975461728;
        Mon, 13 Jul 2026 13:44:21 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d2csm398879a91.4.2026.07.13.13.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:44:21 -0700 (PDT)
Message-ID: <3430dc0a2a141769a596ab21d7abdd86a0a804db.camel@gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for
 buffer pointers
From: Eduard Zingerman <eddyz87@gmail.com>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>, sun jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, 	emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com,
 	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 13 Jul 2026 13:44:18 -0700
In-Reply-To: <alRtilWhKw4zzMkI@u94a>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
	 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
	 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
	 <ak8XSRiLKx5WcIQw@u94a>
	 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
	 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
	 <alCgmxFh9q-vjE0O@u94a>
	 <CABFUUZEnd9f7tV-+jT+cgL7sFVp7pL5-tjdwMvxcR9ist1s-xg@mail.gmail.com>
	 <alRtilWhKw4zzMkI@u94a>
Content-Type: multipart/mixed; boundary="=-IIJTSNM/Z9i81nFKcIdL"
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--=-IIJTSNM/Z9i81nFKcIdL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-13 at 13:05 +0800, Shung-Hsi Yu wrote:
> On Fri, Jul 10, 2026 at 06:27:41PM +0800, sun jian wrote:
> [...]
> > One detail about the attach-time check: I agree that some negative-offs=
et
> > constructions can still be rejected later if the max_tp_access accounti=
ng
> > produces a large value. But the runtime reproducer I used exercises thi=
s
> > specific access:
> >=20
> > =C2=A0=C2=A0=C2=A0 r6 =3D *(u64 *)(r1 + 0)
> > =C2=A0=C2=A0=C2=A0 r6 +=3D -8
> > =C2=A0=C2=A0=C2=A0 *(u64 *)(r6 + 0) =3D 0
> >=20
> > Here reg->var_off.value is (u64)-8, off is 0, and size is 8. With the c=
urrent
> > accounting,
> > =C2=A0=C2=A0=C2=A0 reg->var_off.value + off + size
> > wraps to 0. So max_tp_access records 0 and the attach-time writable_siz=
e check
> > does not reject it, even though the effective access starts at -8.
>=20
> Yes, that should had been rejected.
>=20
> > On the bpf base without the verifier fix, the temporary reproducer did =
load
> > and attach successfully:
> > =C2=A0=C2=A0=C2=A0 negative_bpf_load: PASS
> > =C2=A0=C2=A0=C2=A0 negative_raw_tp_open: PASS
> > =C2=A0=C2=A0=C2=A0 negative_test_run: PASS
> > and KASAN reported the stack-out-of-bounds write in ___bpf_prog_run.
> >=20
> > So for this particular range, this looks like more than a load-time pol=
icy
> > difference: the missing lower-bound check leaves the access executable =
on the
> > bpf tree.
>=20
> Actually I got this reproduced in the *bpf-next* tree now. And I think I
> know why Eduard wasn't able to reproduce the issue.
>=20
> The main problem was that CONFIG_BLK_DEV_NBD was not enabled in the
> default BPF selftests configuration, so nbd_send_request wasn't
> available, and thus the attachment always fail with -2 without
> exercising the checks that we have in bpf_probe_register().
>=20
> With CONFIG_BLK_DEV_NBD enabled, and negative_var_off_program[] updated
> to do use offset of 0 (instead of 28 + 8), I was able to reproduce the
> issue on top of commit `9a3a07d06e7d` "Merge branch
> 'bpf-fix-warning-in-bpf_trampoline_multi_detach'" with the following
> updated version of your patch.
>=20
> =C2=A0 0: R1=3Dctx() R10=3Dfp0
> =C2=A0 0: (79) r6 =3D *(u64 *)(r1 +0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ; R1=3Dctx() R6=3Dtp_buffer()
> =C2=A0 1: (07) r6 +=3D -8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ; R6=3Dtp_buffer(imm=3D-8)
> =C2=A0 2: (79) r0 =3D *(u64 *)(r6 +0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ; R0=3Dscalar() R6=3Dtp_buffer(imm=3D-8)
> =C2=A0 3: (95) exit
> =C2=A0 processed 4 insns (limit 1000000) max_states_per_insn 0 total_stat=
es 0 peak_states 0 mark_read 0
> =C2=A0 tp_fd: 8
> =C2=A0 check_nbd_attach_reject:FAIL:nbd_invalid_negative_var_off unexpect=
ed nbd_invalid_negative_var_off: actual 8 >=3D expected 0
> =C2=A0 #319=C2=A0=C2=A0=C2=A0=C2=A0 raw_tp_writable_reject_nbd_invalid:FA=
IL
>=20
> So I would say a fixes tag that points to 022ac0750883 is still needed
> after all.

Hi Shung-Hsi, Sun,

Shung-Hsi, thank you for figuring out the quirk with the config.
Indeed if I modify the test to be config independent the following
program is both accepted at load and attached:

  *r6 =3D *(u64 *)(r1 +0)
  r6 +=3D -8
  r0 =3D *(u64 *)(r6 +0)

Worse yet, the mechanism affects both PTR_TO_TP_BUFFER and PTR_TO_BUF.
The PTR_TO_BUF is reachable from helpers/kfuncs with custom 'size' assignme=
nts,
as far as I understand.

Sun, of checks added by this patch:

>	var_off =3D (s64)reg->var_off.value;
>	if (var_off >=3D BPF_MAX_VAR_OFF || var_off <=3D -BPF_MAX_VAR_OFF)

This should hold already.

>	start =3D var_off + off;
>	if (start < 0)

This one is necessary.

>	if (size < 0) {

Technically this one is bounded by 1,2,4,8 in case of instructions and
by BPF_MAX_VAR_SIZ in case of a helper/kfunc (see check_mem_size_reg()).

Let's respin v5 keeping minimal necessary checks and also update the
test case:
- use sub-tests.
- move raw_tp_writable_reject_nbd_invalid.c to use tracepoing from
  the test module instead of nbd, to avoid nbd config dependency
  (as in the attachment).
- if possible, could you please add a test that shows missing negative
  offset access check to PTR_TO_BUF?

[...]

--=-IIJTSNM/Z9i81nFKcIdL
Content-Disposition: attachment; filename="tp-test.diff"
Content-Type: text/x-patch; name="tp-test.diff"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9nX3Rlc3RzL3Jhd190
cF93cml0YWJsZV9yZWplY3RfbmJkX2ludmFsaWQuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9wcm9nX3Rlc3RzL3Jhd190cF93cml0YWJsZV9yZWplY3RfYmFkX2FjY2Vzcy5jCnNpbWls
YXJpdHkgaW5kZXggNzUlCnJlbmFtZSBmcm9tIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9w
cm9nX3Rlc3RzL3Jhd190cF93cml0YWJsZV9yZWplY3RfbmJkX2ludmFsaWQuYwpyZW5hbWUgdG8g
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvcmF3X3RwX3dyaXRhYmxlX3Jl
amVjdF9iYWRfYWNjZXNzLmMKaW5kZXggMjE2YjBkZmFjMGZlLi5lMGExY2EzYzFlNmEgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9nX3Rlc3RzL3Jhd190cF93cml0
YWJsZV9yZWplY3RfbmJkX2ludmFsaWQuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvcHJvZ190ZXN0cy9yYXdfdHBfd3JpdGFibGVfcmVqZWN0X2JhZF9hY2Nlc3MuYwpAQCAtMSwx
MCArMSwxMCBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKIAogI2luY2x1
ZGUgPHRlc3RfcHJvZ3MuaD4KLSNpbmNsdWRlIDxsaW51eC9uYmQuaD4KKyNpbmNsdWRlICJ0ZXN0
X2ttb2RzL2JwZl90ZXN0bW9kLmgiCiAjaW5jbHVkZSAiYnBmX3V0aWwuaCIKIAotdm9pZCB0ZXN0
X3Jhd190cF93cml0YWJsZV9yZWplY3RfbmJkX2ludmFsaWQodm9pZCkKK3ZvaWQgdGVzdF9yYXdf
dHBfd3JpdGFibGVfcmVqZWN0X2JhZF9hY2Nlc3Modm9pZCkKIHsKIAlfX3UzMiBkdXJhdGlvbiA9
IDA7CiAJY2hhciBlcnJvcls0MDk2XTsKQEAgLTEzLDkgKzEzLDkgQEAgdm9pZCB0ZXN0X3Jhd190
cF93cml0YWJsZV9yZWplY3RfbmJkX2ludmFsaWQodm9pZCkKIAljb25zdCBzdHJ1Y3QgYnBmX2lu
c24gcHJvZ3JhbVtdID0gewogCQkvKiByNiBpcyBvdXIgdHAgYnVmZmVyICovCiAJCUJQRl9MRFhf
TUVNKEJQRl9EVywgQlBGX1JFR182LCBCUEZfUkVHXzEsIDApLAotCQkvKiBvbmUgYnl0ZSBiZXlv
bmQgdGhlIGVuZCBvZiB0aGUgbmJkX3JlcXVlc3Qgc3RydWN0ICovCisJCS8qIG9uZSBieXRlIGJl
eW9uZCB0aGUgZW5kIG9mIHRoZSB3cml0YWJsZSBjb250ZXh0IHN0cnVjdCAqLwogCQlCUEZfTERY
X01FTShCUEZfQiwgQlBGX1JFR18wLCBCUEZfUkVHXzYsCi0JCQkgICAgc2l6ZW9mKHN0cnVjdCBu
YmRfcmVxdWVzdCkpLAorCQkJICAgIHNpemVvZihzdHJ1Y3QgYnBmX3Rlc3Rtb2RfdGVzdF93cml0
YWJsZV9jdHgpKSwKIAkJQlBGX0VYSVRfSU5TTigpLAogCX07CiAKQEAgLTMyLDcgKzMyLDcgQEAg
dm9pZCB0ZXN0X3Jhd190cF93cml0YWJsZV9yZWplY3RfbmJkX2ludmFsaWQodm9pZCkKIAkJICAi
ZmFpbGVkOiAlZCBlcnJubyAlZFxuIiwgYnBmX2ZkLCBlcnJubykpCiAJCXJldHVybjsKIAotCXRw
X2ZkID0gYnBmX3Jhd190cmFjZXBvaW50X29wZW4oIm5iZF9zZW5kX3JlcXVlc3QiLCBicGZfZmQp
OworCXRwX2ZkID0gYnBmX3Jhd190cmFjZXBvaW50X29wZW4oImJwZl90ZXN0bW9kX3Rlc3Rfd3Jp
dGFibGVfYmFyZV90cCIsIGJwZl9mZCk7CiAJaWYgKENIRUNLKHRwX2ZkID49IDAsICJicGZfcmF3
X3RyYWNlcG9pbnRfd3JpdGFibGUgb3BlbiIsCiAJCSAgImVycm9uZW91c2x5IHN1Y2NlZWRlZFxu
IikpCiAJCWdvdG8gb3V0X2JwZmZkOwo=


--=-IIJTSNM/Z9i81nFKcIdL--
