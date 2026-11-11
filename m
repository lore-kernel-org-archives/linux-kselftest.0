Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794357781;
	b=5Rkhb1X/p77pZRfpvBLMqe1r7b//lwzRZwHSblRuG5K2fWnIHMV6PGUATNl53n1ablUJ
	 0OU06XjomD5na2eL3ScFZtDgMA2YMszWf+/K6P4o3hc2kBnNX1wnApdOx3JoJXa1s3p8T
	 4NY/G19qFM2ldsUEEruMIbcbIcWF5wkQw5pwxQh7lrMbj+ybO8UAipoINh3Kk1ceeD7V4
	 w/z4x8PR8Nh1Nfih/BqNiUK/apfIhRAjEOFzOOTtJGNvhGfxA95ncAXfs6uE00J2X4B7/
	 cOY+6cJMo8Tr9IHXHmC9nw3zSQnuVz47w/x3zDlFCTuYJo8hPA0IfBppkbdOSLyFSeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
	b=ZMiZcqU+kBrBeg21e4tYJrdl9sm55mxhVDauBdF6DTK2tF27ze1++Uba5a05Pb+nWzdh
	 RfnmTHUy6W1jqdyVQYXrD5/QJYrnhYMNKUpUO2MYQYbeI9NlbSUfBzCcpsMsnqcd13oKz
	 YnytX+qXVu1K5EFOuz0hp3c6wzIGL5LzVkArT5KH45TcBd1bmenmo5TIG71Zw//5qGptr
	 DUkr3/Gb91iC3uqJ0UYD8EZEIFP/trpqeUPC01WFHgEbJRW73pV15PeCzcEuj3G6DiWq2
	 6L7MPMcI7OW0R2ti8L+VMlkFK7HQInWd0rUkjOa2gENnv7cuJkJc4o33Kk2myXLHvuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gavT6zB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6B606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A6B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gavT6zB7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b33de9d2b1so21856497b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794357780; cv=none;
        d=google.com; s=arc-20260327;
        b=NEaq13RUJCryX3/Fn7ObK9xHEEVX32aREvGtb4In/EnA4VW+UYKVi1ohVT1PYBc89t
         5HhJZXeWskStg276c95vxvuNUFQEfSD37ndUW3CRTup/+uZp00g43LUwOTM6qs6X8e0R
         rC259UaTds6H4wcMwuNPYgOBK8xZMBsRJMZ1ESK3lysnWZXr1hc2MjpNoAGKu52nDBYB
         zavtf4dLz4f+PAUG7xk+P2M3PhjK6YA2ngBxDJX/QLs2V0Zt4k0ynpRKG/JcUUb00R/+
         huevABir/3ux1a9Fccce3nbm5GIHjmoKvDn8H2wjFg0IgoKA2GUPOeTYN3px9jmoU73C
         wn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        fh=Ew8Dz53vCpJxJ09e2gvlvCi9rL/zYB5LqBsF67I28bY=;
        b=VU5gxWPAZV3VF3uFTIoVHeLEEipv4eIcjTRccpMlvmZus02OVVw49s21xUlph4Nsya
         93gzuVN3nf6/Dc2r6J/e/b3ATNz2AmQUjgEvI9hcMoI3/kxa//ovFwLRFMs3qVRWksra
         mBvJ7aKbcEAzN5RF5ur+t1EPmz8dPQU0xYDFZDY3dyBTMUdxgjL58x9Q7YRW+DfPmMB1
         vFp7uq/ZCTYnpRxXks3p249/AJQTnGyXX4aMcRJ0zlZzvNEK/Hywp5EbphDyvkkrSsTg
         K0I36AweoyUViTZd1LmfvJ4FfV+x3ojj+sMZrd00gtot4MVRCWSHwlquKk9Rjgx5fxyk
         PfOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794357780; x=1794962580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        b=gavT6zB7Ced+m1M9YKMM/kNgjiLYaPq+uP27b5UroESrfV4Xa5ZkNdowfNFEk2ENi1
         PzceXHOdyNXssAZSSblGmM+NpWL+pg3xAcvmrqVSYLWsR+ikPLvx8zZMZaKJdU4iutoN
         J3QwfRGBCtkqnfJIw9x2uATO8CXDc2JU0XLtdtYF2vVL0w7aoURQbeuEpixh5khgAt/z
         5dWtQc/KZTRtRB2hIYV9x0ntylJTqXM/w7CWGXpWN3bVfrp/DbPuOAwiXj5C/ulE37l2
         b6K9V4Mk5lQLPiBkp6/cU5cf8gAYrcT+FYDkM99pCv30n6WU5/c19JcFr7SmB9ErNX/r
         99lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357780; x=1794962580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        b=Fnvq+WPI1MVyxMloRnqnZ9Fy19uv5wDvoynjrB/kKedZAYaNaPGmM3OvhcV4xiWi5F
         vtiR889ivDf9QwGQXSS0cjQrbI52hQ6jGEvCHFimfFvgEdOVsf1zLmFLtVj4CwKsYR0v
         ZRCaneUenfVcELz0XsYN+FKXAhpiDhRhDQSmYEn5p3tHr4m94sOCnLuh2b8ukExBhUcI
         5XQCzo7sutIPPsCm7AQMzNIX1uROUbE+WUIQzlPqmbcAf/XWEMqaUxJJQHMvi+35TNY4
         CK0Ithq+4z+XadGbVjRLq5UCv65ceaB0SqNTE4QNRmrdDWTwZOwQWh3Wu3Y5BFE4nwp+
         0lvg==
X-Forwarded-Encrypted: i=1; AL+hErFbzLPjPnHmiITjJ68/dM7PbYTPrykmUgrPaCSGVhT6WcDmUpd9lUkvANOPpIJjTzzaYilyza7CsLL1oV9kieA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZCpg/ua12FUzlBOGbPxS7EIX0mZLjtedQg1WZEbk/iJYqxdkW
	5b5BpxByezEqmZv0QV8p3aOprWK3Q96YOc4SglauBqbtqxM7M+5e6wYJIpmWvSwjXZOjnnPwEVj
	EUgo/eSMs7z3/l1lhJu9RpEJzWGw39tV5JXxcOY75
X-Gm-Gg: AYBFou0QTLVAOoWU2F02ezScRnzXxLodzTUdco3D3q/VhkKjbXF5IUXQ9zv8YDdQpBf
	aQdqHVXtMmWKaKjzzZMMQC23aZXHelQcwYIENQ8BxHiD9hcc9B1VY27IJFOLFuXosq7qc2XJdW3
	oxPkgI36zni1UmK+eWAqFaYX6Ffc36ZvEE7HAqUcfpBlbLF9sTX4OYaK8WXGNzjW/8sQmOP5K/f
	GtNIPZVmvsXrvj1fAcSwdmgaeHq4fnp2lDFW3cORCdbrvZiULA39Cm9+5xPU2SvegFy337KWhEJ
	KsRxFJkYAV3dImisHVAjRzV+6HQjZl4NMDRcOlkCGWbqaKFA4HfJ3SDay4bo3DnmhpX9hX4Wa4U
	/YN1vn2r4CZG7HQQh3ao9m5pn1weSjj9ZTycsI11FSogCNYBd7wJRQ8iXhPhc5fM1MzESy37Q7G
	SkrhINyVkY2TE+
X-Received: by 2002:a05:690c:3181:b0:8b0:d468:e9ee with SMTP id
 00721157ae682-8b3a816adf0mr6153587b3.72.1794357779171; Tue, 10 Nov 2026
 16:42:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028214534.1919398-1-song@kernel.org>
In-Reply-To: <20261028214534.1919398-1-song@kernel.org>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 10 Nov 2026 16:42:47 -0800
X-Gm-Features: AclHuK-0KLQUOFaipVD5nVJPEq1dS14yAA31ZsSQdOg065mPf1YgIqvWrXbDoNo
Message-ID: <CADBMgpzvSnbu+ZzPYd5_d5Hx+1d1zAyU6sk27EZ0tnH7_JGMdg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] klp-build: Fix dependent patches, add selftests
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:45=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> klp-build fails when a later patch in the series depends on an earlier
> one, because it fixes each patch against the original source on its
> own.  Patch 1 fixes this by combining the patches into a single patch
> before adding the #line directives.

I'm curious, what is the advantage of using separate .patch files?
Since patches can require changes/conflict resolutions for older
kernels, we commit all patches into per-target-kernel branches and
generate the .patch file on the fly at build time.

>
> Patch 2 does this while validating the patches, before the original
> kernel build, so problems with the patches show up without waiting for
> a build.
>
> Patch 3 moves the patch processing into a new script,
> klp-prepare-patch, which klp-build runs.  It doesn't need a kernel
> build, so it can be tested on its own.
>
> Patches 4-12 add a kselftest target, livepatch/test_klp_build.  Each
> test builds a small source tree, runs klp-prepare-patch on some
> patches, and checks the patch it prints.  The tests compile nothing,
> need no root, and take about a second.  To run them:
>
>   make -C tools/testing/selftests/livepatch/test_klp_build tests

Ran these tests and they work on my end (applied on v7.4-rc1).

Tested-by: Dylan Hatch <dylanbhatch@google.com>

>
> Changes in v2:
> - Patch 1: describe combine_patches() without "refresh", rename
>   fix_patches() to process_patches(), keep the combined patch in
>   $COMBINED_PATCH rather than $PATCHES, change the status message to
>   "Processing patch(es)", fold get_patch_{input,output}_files() into
>   get_patch_files(), and keep tmp.patch in klp-tmp (Josh)
> - New patch 2: process the patches while validating them, before the
>   original kernel build (Josh)
> - Replace the --patch-only option with a klp-prepare-patch script,
>   which the selftests run directly (Josh).  The intermediate patch
>   without #line directives now lives in klp-prepare-patch's own
>   temporary directory, which is removed on exit.
> - Make the dependent patches test a case of test-basic.sh (Sashiko)
> - Name the selftest helpers and subjects after klp-prepare-patch
>
> v1: https://lore.kernel.org/all/20261017002441.716615-1-song@kernel.org/
>
> Song Liu (12):
>   klp-build: Fix dependent patches in a series
>   klp-build: Process the patches before building the original kernel
>   klp-build: Move patch processing to klp-prepare-patch
>   selftests/livepatch: Add tests for klp-prepare-patch
>   selftests/livepatch: Test klp-prepare-patch with dependent patches
>   selftests/livepatch: Test klp-prepare-patch with independent patches
>   selftests/livepatch: Test klp-prepare-patch with patches which cancel
>     out
>   selftests/livepatch: Test klp-prepare-patch with created and deleted
>     files
>   selftests/livepatch: Test where klp-prepare-patch adds #line
>     directives
>   selftests/livepatch: Test klp-prepare-patch with unsupported files
>   selftests/livepatch: Test klp-prepare-patch with patches which don't
>     apply
>   selftests/livepatch: Test klp-prepare-patch with offset and fuzz
>
>  scripts/livepatch/Makefile                    |   3 +-
>  scripts/livepatch/klp-build                   | 137 +--------
>  scripts/livepatch/klp-prepare-patch           | 277 ++++++++++++++++++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/livepatch/README      |  16 +
>  .../livepatch/test_klp_build/Makefile         |  26 ++
>  .../livepatch/test_klp_build/functions.sh     | 149 ++++++++++
>  .../livepatch/test_klp_build/run-tests.sh     |  68 +++++
>  .../livepatch/test_klp_build/test-basic.sh    |  93 ++++++
>  .../test_klp_build/test-cancelling-patches.sh | 102 +++++++
>  .../test-independent-patches.sh               | 124 ++++++++
>  .../test_klp_build/test-line-directives.sh    | 175 +++++++++++
>  .../test-new-and-deleted-files.sh             |  94 ++++++
>  .../test_klp_build/test-offset-and-fuzz.sh    | 120 ++++++++
>  .../test_klp_build/test-patch-not-applying.sh |  73 +++++
>  .../test_klp_build/test-unsupported-files.sh  |  30 ++
>  16 files changed, 1366 insertions(+), 122 deletions(-)
>  create mode 100755 scripts/livepatch/klp-prepare-patch
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/Make=
file
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/func=
tions.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/run-=
tests.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-basic.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-cancelling-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-independent-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-line-directives.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-new-and-deleted-files.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-offset-and-fuzz.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-patch-not-applying.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-unsupported-files.sh
>
> --
> 2.53.0-Meta
>
>
