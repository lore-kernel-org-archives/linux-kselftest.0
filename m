Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E94ADD9B
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046313; cv=pass; b=ucQIMN+0oQf+3x3bAZC86Tjas8jyDqT8FVsrlWcz9zGT8yH6/e/gzUXGgNtA0DYBcofhE3iBKyR9h2zCuYYGbqqlzXCCMMHObv77zm8Lp6OrN7smJXC86/IqZ1CNEGEZufZlERDOoK4ETnwqQvKKoSxpdDuQ/HvBYTWpajXSONs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046313; c=relaxed/simple;
	bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/fx8cHjHJLdFit/8QfuN2oum6MsGvCFuBB5ucD7u2Th4c8TSlmLYMaup/SRO6Jm0JTYsztoed0mFZC74ZeuX/PURGuj+qWofyccw0JwEiGe59aM52kqWr4tpJBHOZt+bRo2ygHPZoU05LbAxET5q/kIstCWxL2dqWiqPbD4Nm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilpOmSFt; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilpOmSFt"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7fd45465so37621351fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784046310; cv=none;
        d=google.com; s=arc-20260327;
        b=DXLg84dLOn+SyvNwFvsWTI4peuFkkBONWjBiMdrMUnuR/mkKfoElCxxvLcrUNwwZkj
         ewU9LcczReu6QdE4MmvXUpXljs+l8mwbKSX1Tp4FRliUuXNGB66yZVwQU6n4KjX3/jDD
         Jlx/+qqmMz8d3VECEyJn4tdr7FlM64UuQxSRMijQ7vmsPXcC8gtlK4leiucKLL32fVwu
         +pDlQfIt5H88J++wZ9rqZfjqLQp5vgsBAGC1J13msOXr8ebUO5swuzrhyY1MlAqcx/RH
         TSRVFSdzS5gZMBZWfEuiz4HsBE9Je7b6TOko28S7i6w8A89nxtv2R1fLMbufp8pPjlV2
         2vVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        fh=xN96qrksRb5osl5kEsE/BSjjyqHGLnH2EzbIwXOfikY=;
        b=OumSoeO3MdEkjzvS33hWkyClPQ/cS/iKCDKm6jEDKpQ9d0K/fTPHUoBLt0a1o54vh/
         0ONSebEcW3HVid5jAhMQMjHNoY7D8tmbaRDV5EkcBMM4PHCMqWT+SbR1tj9LzodN+k8f
         U0JjF58oCEjDCS8gT9et31UB3H522LzDoM6jlK6iys442aUPXQp0e+DO89xcmyX9ob4T
         WQQ0oAux/Iu8Zgzbt7mBTnMut1FnhlZzSwXmeHQyXag1pf5e4ppEKXs/KqDM9HxRhT33
         gxiOPyM4APU4Gk8sFGH+Q4O/tQ3kqCRokz+Lpb4c1zxQus4kMGvTffftivWoJpmv6674
         ZW2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784046310; x=1784651110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        b=ilpOmSFtVz6pnYF2fBUaI3DBWMXRQUBUA0Id2BLotVKMrFhBhtSs1ACOpWvgCKeMVS
         Dn6CyoZN2lzHFpqJLiyUQjsulgpoyJFq/q5qcTTyz7hqykNuVkkk4DiIPkty+r+el0EY
         t8a6MlufhsYze/T6YmIJpSNJIsyG0yu1ZatiXt5msOchRL0VFZS7nAoCED+DtI9LX53W
         istdJzHFsxtQ25/VPWLeGICc23i15zTrAIu0KQnC4BNE9xj6bKtHYcTKv/NVUcCezv7s
         oziSUtEb4thGQSyqBjwNop3oz0YG1wAO6ZpO8rOlAkfhJZEF7qq0tjiZX7+MqNfkBzSS
         qMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046310; x=1784651110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        b=FIYR9lOL9kXp7/QVC7nS3yKsBmuCV8HIQ2VbCTJ7DWfeSCZ1q+cL5Ow7R/1eP4fryH
         3ZN/W9IS+/KnFBnf1KUzuvCxLeAnBNQML8ifOFbq7/TCLHvPJmmr3CUNjUK/+oWdnWe8
         9u3Qsw4prRHAKk2AjD7lL/NTJxqrS/WYQHPNUpZ/wmshLKcsginmdkbDYjtcSJKoZZke
         fncc5BvXXP4RFY97QBhHQ5yJ0XM24+Zx5WHqU91l98HLs0U7pqtZvBEHm/DLtB7+AfGf
         yHeletLZFFMFmLwopv9HTFEVNVehJM09JVoV4Ro05jUJAKEc0DCCTcCRcYp7SbKsT3Ms
         e5hA==
X-Forwarded-Encrypted: i=1; AHgh+RoBWcBMUDLz0p/pRtoRwnBzIMQrpbpDDNqxX6DhYhfBq/dHX2JwKLnNbHckFOdJ5/K4X283X8diflt1iIOou7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWZyj+7LB8h1MUSqaXb147b/ky2o3PnIvgifxdJLjG0rs6Pod
	v4t+Jjokpl1SNF7sJyzP/haWzT63bkmzbyYQtx16BsT9xwS6k4SX1Km5lhTiXMurjgpChKJMA8n
	Ie8pbjJ2QQtoq0fh1hfWdIgkTzuHN7tat53SoOYceHeIS/7fBVDspAatjOZA=
X-Gm-Gg: AfdE7cmEJtpPxHSL2e4vMRmC/Kv0a69ruHqf+GvDZN5j9A9HK8kdwFngVUxUZa6EcFO
	2bIN9kMfrFpV6mtveNoQLE6Xl7ZTqblXwFPDdkhjt2MyKZdeKpjPbSDku7GoeYCfudjeVRR9/Xx
	dsZ5s9z9SRCxmOdAo9FUBuUXQDogrXlVAGra8CiC7B4CyiMGv2V1UQUv+2gW2JiPzY8uMcmAulH
	FAkswJhMOTPjxe6WY6VG8UEEszsLfvjcziC/tSvuO4UkaMBMYwYnt2O5oN9wNobJjK2oQzG
X-Received: by 2002:a05:651c:891:b0:39c:7922:b43d with SMTP id
 38308e7fff4ca-39dadc1fddamr5555901fa.13.1784046309897; Tue, 14 Jul 2026
 09:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706183154.2660394-1-dmatlack@google.com>
In-Reply-To: <20260706183154.2660394-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 14 Jul 2026 09:24:36 -0700
X-Gm-Features: AUfX_mzLDP_4rVW7KuKXw9WbvqtNEnT_4J6faTgqP-IEY19v7FHPuva_xUWrsYU
Message-ID: <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects __maybe_unused
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 11:32=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark _##fixture_name##_##test_name##_object __maybe_unused since it may
> not ever be read. This pointer is only read in XFAIL_ADD(), which tests
> are not required to use.
>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
>
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
>
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked p=
rocesses")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Reviewed-by: Alex Williamson <alex@shazbot.org>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
("vfio: selftests: Add -Wall and -Werror to the Makefile").

[1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@shazbot=
.org/
