Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D33D3319
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930925; cv=none; b=sUEY0Y0XF+fz/Ee+mD1+e/7eF/uq5drqWSnY9uRXjAyrMRzbO1cYP3jc/mLGuitb/HPCRcEMeLYS4Eg0kKZi3R3+d8nAJy7j8hAG578cmb5yI5KE30Y2B4XGcRsKsy6Q9OTCYMyCUJXwSX83mg2B4o9T5sDffJ8+fJLWqZmH7HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930925; c=relaxed/simple;
	bh=CEiyHq+wD7IzBDMxALaJ/RG7y4rCzmoFwCWzY3aB3TQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tatZIClPgPzcocnaLWG/S4uhYknmuawUI62vm3EKv3QHhMwSO4ZAgHz5BD1dS2LkgT4sUaUZbs/C6owr8UAIxGYvjIHREcQgnnXOAAT/lBb1FNbZyaNIiux42WMLKxWi2IQr9dXLeK7c3jt2umdeujsgAcRWypUqKdaRfI3EmLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aKvI+tRg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aKvI+tRg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso759195f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773930922; x=1774535722; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/DrTMOvze8KTXSSgz5UPDX72qtiln6sKsINYHw8cpk=;
        b=aKvI+tRgDvmQ3gppGehJO+A8YGG7Iz+ohiBszwZEoKxCZnemUtRSRmEv07HGpjN6YH
         TvpVXcXvijrSoTYMMz21Qc+GRf+0Xy/7v/X8quYCf0v0CaQSVz1vgOky+PGch2MXChBR
         j88QfOKQwiMSkuGOlpHN0IkCv7vQ4vU6z8Xg4vgwIRUfbSKNys/m2ZfydicPMTP9HLat
         B5tyv/DsPbrnnHmbAmz8vkUU/GkJhR3IJnVnYkQQ5dMbJA9JSIoDYVpB9bWbPYPjIJvV
         WkTxulspsyRfEaxmEkYja5AlxNLiIZHlYlytA9FCaVpPj79M0Erk+ZQYUmGgI14IQnKG
         MFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930922; x=1774535722;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/DrTMOvze8KTXSSgz5UPDX72qtiln6sKsINYHw8cpk=;
        b=VDWQbw8PcFqsnIDBAf+ON+9H5vZQWnsJ6wgI7UGbaGnA+fihZFSR2We/apOLlUoV0Z
         EXYlB7R5W7u1aaM9WQZR3Dp9I2jXF3wvZdmc1w0bEoU2Qb6XK7hFri/8Wy5i9zXYcouy
         YeDJTe8kzLXmRL087yP6eSgL8IdHlxvH2gbsJGVwLsDupmYBSs/O0FwrkB21CRt/Z5Qd
         cAgkdohgxCyQ0i/jC+/tGACiszSsnOvcb1nEQ9eonx6zWtP8M03dj1UBrbfitnEDYCst
         TO/O6SCV+xlozoGnYW/zK3Kpe/gj7Icn5LGTN3oPfUApM9X9UHKjrUZipM5NFw7C5xGX
         0Gxg==
X-Forwarded-Encrypted: i=1; AJvYcCWGkCuvMzkXpakayuoES9p+Jv+kcu8rDQ3Xl3iEQkxcC2t3NwuMJZepAUAlDrusaVh8ReXNDtRh4fOCcjBuhI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+TuUujgiHCyWu6msQ7/GhfVVarV/m9elQw9FBxskgssKkQ0C
	6NQSrPo+C3gsl0v49PzUZwgRLKWlWw4ckQ+ohHC5wg10Yawy21dDvAVzqG5eXSzPu/EH6HV3pTC
	NjnKTxEU=
X-Gm-Gg: ATEYQzzQA7SFk9taCRjtL7cU++eElXIoU9VBe3mYEDun+BT5Ifz301tdv24zQekIY7b
	pQs+Iu2nEMPA9v9j6XFAmdxcmA4GdS5KESGLHm5X3+ATk0KfrKWLu+vvVG8xuH5OuIaRpC6D3mN
	nPErQigYJz6Rg5IPdcqAWBV32b77WOKXuwgP3jXGxLZdT7qJBYDiDUrZWLReWM9ayUlDmdDJWJI
	iyLY6SHXhUzzv9zhtYEHqqDD5gP/Qradt/vZ/gLi2QCdYusos9uoc12NkaI++goxwVTItedVt0q
	zCqU9j34/QGM1DnDGFBQ6o/KYlFm0c2umZ7U8i+um5YdZRSBT5XsnIikZrNpLF6fGYYHm57bTCk
	+jEKPozFcHc0w5zhX+1z3OOI3NxgXtiVvrLyXifkMd3ztxFdRnWqSjMF3cusm2v7433wXuwQeqk
	pBQqXKRnfMsmN96PXLx51ujXdXWQwj34zV6szQ+sJiGEEQRyI5iiDI5JeuFqmn6A==
X-Received: by 2002:a05:6000:2386:b0:43b:436d:782c with SMTP id ffacd0b85a97d-43b527a09a6mr13529016f8f.4.1773930921552;
        Thu, 19 Mar 2026 07:35:21 -0700 (PDT)
Received: from ?IPv6:2804:5078:834:1300:58f2:fc97:371f:3? ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892234sm15806000f8f.24.2026.03.19.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:35:21 -0700 (PDT)
Message-ID: <c4249fb8b36aba8649e4dcdac022f2d646413756.camel@suse.com>
Subject: Re: [PATCH 3/8] selftests: livepatch: test-kprobe: Check if kprobes
 can work with livepatches
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes	 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Shuah
 Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 19 Mar 2026 11:35:16 -0300
In-Reply-To: <abhqRTBtF1hLDmPq@redhat.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	 <20260313-lp-tests-old-fixes-v1-3-71ac6dfb3253@suse.com>
	 <abhqRTBtF1hLDmPq@redhat.com>
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

On Mon, 2026-03-16 at 16:38 -0400, Joe Lawrence wrote:
> On Fri, Mar 13, 2026 at 05:58:34PM -0300, Marcos Paulo de Souza
> wrote:
> > Running the upstream selftests on older kernels can presente some
> > issues
> > regarding features being not present. One of such issues if the
> > missing
> > capability of having both kprobes and livepatches on the same
> > function.
> >=20
>=20
> nit picking, but slightly reworded for clarity and spelling:
>=20
> Running upstream selftests on older kernels can be problematic when
> features or fixes from newer versions are not present. For example,
> older kernels may lack the capability to support kprobes and
> livepatches
> on the same function simultaneously.

Much better, I'll pick your description for v2.

>=20
> > The support was introduced in commit 0bc11ed5ab60c
> > ("kprobes: Allow kprobes coexist with livepatch"), which means that
> > older
> > kernels may lack this change.
> >=20
> > The lack of this feature can be checked when a kprobe without a
> > post_handler is loaded and checking that the enabled_function's
> > file
> > shows the flag "I". A kernel with the proper support for kprobes
> > and
> > livepatches would presente the flag only when a post_handler is
>=20
> nit: s/presente/present

Ok.

>=20
> > registered.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0tools/testing/selftests/livepatch/test-kprobe.sh | 52
> > ++++++++++++++----------
> > =C2=A01 file changed, 31 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/tools/testing/selftests/livepatch/test-kprobe.sh
> > b/tools/testing/selftests/livepatch/test-kprobe.sh
> > index cdf31d0e51955..44cd16156dbd4 100755
> > --- a/tools/testing/selftests/livepatch/test-kprobe.sh
> > +++ b/tools/testing/selftests/livepatch/test-kprobe.sh
> > @@ -16,30 +16,19 @@ setup_config
> > =C2=A0# when it uses a post_handler since only one IPMODIFY maybe be
> > registered
> > =C2=A0# to any given function at a time.
> > =C2=A0
> > -start_test "livepatch interaction with kprobed function with
> > post_handler"
> > -
> > -echo 1 > "$SYSFS_KPROBES_DIR/enabled"
> > -
> > -load_mod $MOD_KPROBE has_post_handler=3D1
> > -load_failing_mod $MOD_LIVEPATCH
> > -unload_mod $MOD_KPROBE
> > -
> > -check_result "% insmod test_modules/test_klp_kprobe.ko
> > has_post_handler=3D1
> > -% insmod test_modules/$MOD_LIVEPATCH.ko
> > -livepatch: enabling patch '$MOD_LIVEPATCH'
> > -livepatch: '$MOD_LIVEPATCH': initializing patching transition
> > -livepatch: failed to register ftrace handler for function
> > 'cmdline_proc_show' (-16)
> > -livepatch: failed to patch object 'vmlinux'
> > -livepatch: failed to enable patch '$MOD_LIVEPATCH'
> > -livepatch: '$MOD_LIVEPATCH': canceling patching transition, going
> > to unpatch
> > -livepatch: '$MOD_LIVEPATCH': completing unpatching transition
> > -livepatch: '$MOD_LIVEPATCH': unpatching complete
> > -insmod: ERROR: could not insert module
> > test_modules/$MOD_LIVEPATCH.ko: Device or resource busy
> > -% rmmod test_klp_kprobe"
> > -
> > =C2=A0start_test "livepatch interaction with kprobed function without
> > post_handler"
> > =C2=A0
> > =C2=A0load_mod $MOD_KPROBE has_post_handler=3D0
> > +
> > +# Check if commit 0bc11ed5ab60c ("kprobes: Allow kprobes coexist
> > with livepatch")
> > +# is missing, meaning that livepatches and kprobes can't be used
> > together.
> > +# When the commit is missing, kprobes always set IPMODIFY (the I
> > flag), even
> > +# when the post handler is missing.
> > +if grep --quiet ") R I"
> > "$SYSFS_DEBUG_DIR/tracing/enabled_functions"; then
>=20
> Will flags R I always be in this order?

		seq_printf(m, " (%ld)%s%s%s%s%s",
			   ftrace_rec_count(rec),
			   rec->flags & FTRACE_FL_REGS ? " R" : "  ",
			   rec->flags & FTRACE_FL_IPMODIFY ? " I" : "=20
",

So this is safe. I'll add a comment in the patch to explain why this is
safe too. Thanks for the comment!

>=20
> --
> Joe
