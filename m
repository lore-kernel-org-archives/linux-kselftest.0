Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E74A13AB
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781128; cv=pass; b=HVfZWVB9YIpyJU/EzoPMuIsjNSKX6ElVZ9RdLk+bx3a0Mkh1dxNDYJ9X+ddYBIdlZN4DDduVqFl3MOSnElJcw9xXoGfYMBZoUqUnkxUIWBye52qIuR22AZngFDnIIQEm9TSUZEZofs3DHFJFqcFAEyUG4UJSGpmckh7Gr5hl3jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781128; c=relaxed/simple;
	bh=VVL02GMYWb/u6hDJI/5bikv4BicjcyQC43KoC26CTf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDdw5CUiDajNEawX+rYuSCoEwVNp/7pyu4H3rHtmclbyqHaYYNhm74Kvkortfym4l7MZBFVNaloPa9WpPSpROZrfZImu+maR0+BJ5PSRLjt+ytsWFVofcD/USTJcC5Nelej1TzfH3dIoYIOXzlaDK40tjR5KUJFrujbxfO5xvBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLKnNSEV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLKnNSEV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2544ff970dso459210666b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 04:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781124; cv=none;
        d=google.com; s=arc-20260327;
        b=k9l1KHyI5SYKrC4o/DAC/uywTs7p6cx248yY937TvYhutDFM/m67y+hv5bIMEb69WW
         BJsqyr1asaZzUdugpOC8pEByBEOdbjHajUBSiItqqugaECAVBBJMb+EAUqq/wLXDodYE
         Uk83oKkVXagZCIwMCfzmtAXHvTHsCA/z1p19Y+Cv+HR/36dyp9hHSK5RJBGMMpJlgEzn
         BjA/+Fb6fIdC2JcPFxStWNnaQC8MITSahZIhEbWc6RIMbcvnG5bhnnopJtIwPumxvnbl
         LtU64B+gl0sncmY0gGfK4EVAKEGm53eFWgwg75FmsApADw77NxNySE8et2oLImUrEiEF
         KHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        fh=GCTYxqTXyPpJnLdN5zUHKWx0mwbGy82jz2Jf85xx7L4=;
        b=jFq+7IELYX6V4nFqdkZGf78NK/JCiOC5tb0BhtjRkDfcaFiB1J2G7aey2ixnvPvGzU
         CrDKctLg+W2nz6JERnlf248uOqEZyNJK2pE7JciOsAxxHtgn9BbykEMtacnYO+GSyh1b
         ekriGtvQPs6Ckf+8AztVttP/b6NPDMX1Sgz+m9/YauYjZOz9Ox8FoAH4VgxMmuNB7tFd
         1oW9jHw2GI7QGH9SKkmvpbGl2jAbtJLxeZF8Fy5STANhfYpDTz1x7qEkD1rtXCL2dz5v
         UjDot5w6IU5fU2rb3BkUMeaI5uzSJ2mFKbr+HRePg2Y/lejIqMeMnQxqVIMzixd5JGJl
         Nviw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781124; x=1789385924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=jLKnNSEVETgXbG4tt89OsJpvO9IS+oa1tI7Q/JJCP36p5HbDUTMD5Pnv+wG4Qupz78
         8xIKXq4P5fkwDLKrTv7HV8NntXrIxFDmCP6MotXHn/7KznBpLZy5Cxkkt6c0Vc+JmPzF
         LDDQZ1uWKKOynMpLEbeZiLse7yaSmISd4WxkxjoG3pE8yt8izUGWaNI1ZWCBSN/1RrNj
         m+hngsCMhx4dvKQwksggAh/ZB/Ayn4Tmd0wN4tZ8v3DFyIpuSKN7LzQ8E1AxDfylVTrn
         2L5q86POweCVN8QD3ULIKid6aeYxO6FCHx2D1+FVUJt5dkVKjTOM7OIw6Nf1soMcZZ4U
         qL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781124; x=1789385924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=LyBPzrngPMPweIhfcYOMlZdpBTbRI3UwSki3g+B456kFLsbHjrrYrlYA4PCYEFlmN1
         RbxKO2Wg6Zg1o9lDXVG/nIPXIMU7r0ee+ZQWjJKhUBDk9PtZP4eMQYkLGTijK7U8xb0Z
         rAs5Sh6oQtVSSF2Bst6P+uwHd8QreLyO6lK1KqFzvVQSd5v4M9H9XEM8vla9Owtxy44E
         y7BPJujY3f1l/Oo1Ib5kO8/crBNiQxy8r8/HUPfvF6Sv8QVCS4dLe+39dGmBP4q2ZW4M
         begfYPI4zOBrn7/H/JBM4S49OYCGEwvLmJdsOhK22byBC7NRL5w+XPfCTrV+gu9OTFnX
         y3bA==
X-Forwarded-Encrypted: i=1; AKwUvBwDo9q3mQ1ZTu8pdn2yVWRKxEuqNcwWLR7vUUIALpmVfvK+2Ll/mKV0/2smOvPwrDgw084tW6zhUJuW8nBrESI=@vger.kernel.org
X-Gm-Message-State: AFuF++l5yUj15V/WTQ04WnkSooFli2eiUh+wrySO8Tw64xeJPdLQ4bRZ
	eJP2H65NX61kJLu7LHNkmfWsKZsnRCE+ASmvWumMRpLK2wX8GPyaAqhWUnTtqc9IDMgJ1okIgFB
	v0eJ8+udFah5QnlLh6Era4kzw2CkzPt0=
X-Gm-Gg: AYBFou1g/UDVR0+iUZy59n2MlgHinuXGDX4kXyj6a2TcYtj9VRv9nu9Am38CtL9tclm
	mgfuDLBhQwuwwPLXS89v47J3x14+mtC1CZmBj0juW1NTVVD8CgIn4PAemocUxRv7EmOM73NRYMB
	0vTLnFiNUDiQsWuC/VX/BEkIe5jV1UK3Q7PewdDVXs/OUcPSeS179wk0z9ck8DLH1iDCWo/KB0N
	k3PTXW7grQfquVWiIGTQ+imwgLs13z2uVgBK7GsfOjCcHJKAmmvgd5hhQApE5eXiRtKu0+VxlDD
	vLu/o2t4vhqNIlGN5LCeUktXTv1E3iP1wvU6EJF4O2rqswrnAB6E+YZP
X-Received: by 2002:a17:907:6092:b0:c26:3478:fbb0 with SMTP id
 a640c23a62f3a-c263478fce6mr388269066b.11.1788781123926; Mon, 07 Sep 2026
 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-5-luis@igalia.com>
 <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com> <87pkypfihg.fsf@wotan.olymp>
In-Reply-To: <87pkypfihg.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 7 Sep 2026 13:38:31 +0200
X-Gm-Features: AcwNN1VBg_-Nh0xqgh5QGpERcqSlw7P_XDXd6wO9zSOlVqLVhQ7X3lt_FZWaIoE
Message-ID: <CAOQ4uxjtuwyXrckor8pu+ShvOJWO8rG1=o-DfbWhwQ+vbHTnTg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:44=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Sat, Sep 05 2026, Amir Goldstein wrote:
>
> > On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> In order to reduce new tests setup/teardown code duplication, factor-o=
ut
> >> these functions from the existing acl_cache test into a new fuse_commo=
n.c
> >> file that can be reused in other tests.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
> >>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++---------------=
-
> >>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
> >>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
> >>  4 files changed, 100 insertions(+), 55 deletions(-)
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.c
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.h
> >>
> >> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools=
/testing/selftests/filesystems/fuse/Makefile
> >> index a3ee9b3a2f5d..7744f796eb06 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> >> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> >> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
> >>  VAR_LDLIBS :=3D -lfuse3 -pthread
> >>  endif
> >>
> >> +CFLAGS +=3D $(VAR_CFLAGS)
> >> +LDLIBS +=3D $(VAR_LDLIBS)
> >> +
> >>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> >>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> >>
> >> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
> >> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
> >> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> >> +
> >> +EXTRA_CLEAN :=3D fuse_common.o
> >> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_t=
est.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> index 2411a6e285f1..12cbf9753d03 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> @@ -33,23 +33,15 @@
> >>   */
> >>
> >>  #define _GNU_SOURCE
> >> -#include <errno.h>
> >>  #include <fcntl.h>
> >>  #include <linux/limits.h>
> >> -#include <pthread.h>
> >>  #include <stdint.h>
> >> -#include <stdio.h>
> >> -#include <stdlib.h>
> >> -#include <string.h>
> >> -#include <sys/stat.h>
> >>  #include <sys/xattr.h>
> >> -#include <unistd.h>
> >> -
> >> -#define FUSE_USE_VERSION 31
> >> -#include <fuse_lowlevel.h>
> >>
> >>  #include "kselftest_harness.h"
> >>
> >> +#include "fuse_common.h"
> >> +
> >>  /* ---- ACL binary encoding -----------------------------------------=
------- */
> >>  /*
> >>   * POSIX ACL v2 xattr format (little-endian):
> >> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D=
 {
> >>         .getxattr =3D fs_getxattr,
> >>  };
> >>
> >> -/* ---- Daemon thread -----------------------------------------------=
-------- */
> >> -
> >> -static void *run_daemon(void *arg)
> >> -{
> >> -       fuse_session_loop((struct fuse_session *)arg);
> >> -       return NULL;
> >> -}
> >> -
> >>  /* ---- kselftest harness -------------------------------------------=
-------- */
> >>
> >>  FIXTURE(acl_cache) {
> >>         struct fuse_session *se;
> >> -       char                 mountpoint[PATH_MAX];
> >> +       char                 mountpoint[MOUNTPOINT_SZ];
> >>         char                 file_path[PATH_MAX];
> >>         pthread_t            thread;
> >>  };
> >
> > Nice!
> > I think it would be even nicer to have struct fuse_common_ctx
> > with the common members embedded in the per test state,
> > but I'll let you decide if you want to do that or not.
>
> Thanks for the suggestion.  It may make sense indeed to have that common
> struct, although it would probably only include the spinlock and a bool
> for enabling/disabling the cache.  I'll have a closer look and see if it
> makes sense.

I meant that it should include:
         struct fuse_session *se;
         char                 mountpoint[PATH_MAX];
         pthread_t            thread;

instead of passing them by reference individually to fs_setup/teardown()
not a big deal, just a bit nicer IMO.

Thanks,
Amir.
