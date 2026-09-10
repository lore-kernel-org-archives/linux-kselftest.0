Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CA489FAB
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050342; cv=pass; b=pq6tSA1mjqvqausTfFNKmzSeQrhDeBF0zqmF/E7CAqh9ySEBOQjK12vbdv9++7BAsqJOuVcfAUzcapIfbG6Pqc3F+TS4gIIx7YFjKNPsmD88WdhZ8JUIJVzE2PdR0Zb/FiUYwzyxQmduaG52yj0Yeag0iYsuwMZcfsp5DWUVgxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050342; c=relaxed/simple;
	bh=iexBxeT1r80QFrStcwB2/AMqN63Tsm+wJYHNQeJSdVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSpdWUcdcFllDOlVjVv1Mx+f0u218uHNBj9OSLrVIr3Wc67+dVMXpswPi+IQlQ8yxz9jjlNhcx4ryjoP8B+fBrsAMAVHlIh97gZK2Gon9kdJ8nK7Afc+MX5VTpppDaTrtX3E/pH8I5Ti3++x+XKpnXfhHL2Ye9R/4yvyIzkLWDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJp4vwvC; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJp4vwvC"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1365131fac.2
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 07:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050339; cv=none;
        d=google.com; s=arc-20260327;
        b=WmBQGlQ4Siy51VXxbhq+yPRwmgu127MahvcjRIMoD9I0NTRt6hMSAQZwA0ys9Eb7Nc
         pUJReMu8aPjihn55OBR/mzrfNuRccWqX8Y3q2sKErAV3cvSbLHwFMOIFp2xz/6CGX+10
         h+4790qG2aOeTLe+1YWKdYiJSulBd9F7ypmDCbEc2uASyTQfYu+ZzxFfm7/cl7OrkBvC
         I9C7hL/as2y2EEehH2w0FC6RnIqjWqM40fKMu91slO+ABAhENHJknfS4scjzSs2/F1vp
         UdQTV3i+FoRuMcv6hgNfw+Gs8sBouQwImaY14l4pLwbmO/TIjiVWo3Yg7TZXPodR5unZ
         UtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        fh=xuUV9UGD1/nV05OkQhWR7rBbgEO6X+/4/l7DYelUAHk=;
        b=CJ+iHjBMBWDS0cQUcjlhbt5kntBTa7VFQcrWAnCFIjPJGGnx1GXUCQz2CHrUTwZdlo
         mwmoqy3BA7K19xobfXv99V13rQJp7k5wNddOOmQZqh4Qhj7fUH+sKD17Zkg2CpC6er0y
         s4xDBi8/kZItC4TDwzWfDYzNT/oq1xPxAQ/rjA8XxmgxAgis8Ke+MqW3ZDK2VwThmq2M
         B1IuFz3L8DaH3wgFAFQDpzXLx6cPIYmQCwPGq9YGWhnEfN+caJ/9MF+BE3yLCUjdymcB
         S5X0FL/QfQqx2izPgyNc0HlYhFbhkWWdJ0+7Qmx6vGo+SbTAbwBe02abS2KZbFFK8lAR
         QGIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050339; x=1789655139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        b=FJp4vwvCiR0x6tmzF+PcmZUx009lRz8h32k3K3kUFuuTRyj6aojucLDolDzlQz7TuP
         h4Qwi8oqxvxbEx1Qbc77NKmkd9pSc02yDxBqFrTNd7d/gqAj8rPVKyyh77hFuI1OkpQT
         R/bdwydN4x/Lt/8Nlb4XlPRIZezfOYw58Jzgbztd27rvzE5uLT2zFc/odd9vmQ3ZeLYR
         VL4NY3l38El3Mc+PhHQkmBsOdRcM+BjqBIOIAOHvhp1gBWzBKKMRmWA80FOBBPZvHDTx
         i6P0EA/TnFF1lidh3h1cRigRDPMyt4aVCBSK9k9KEMXJYNaFOG51bgcV3PM46gwokp1O
         fUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050339; x=1789655139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        b=k5UV9K+Un9w0UCLzs4VHSC71O1FvGOz/X3zuNNiOmIrvSMo7XqfmoIgHiIs2OoEHko
         /iklxz5+iP0WL6RTEjVP2irykm4sM2oV2V6Nh3appp5A+QJoeYP1aV86k5eBeqHENlaw
         L78rDZIUYgZ7Y5d77sZIoV9LQRCWcwMYlNeK0xr/OOvOWMsxF1FgXMDnISpisIa6AyMR
         /+EyqHizNrZqJ82ZoOp6FqfALzilrlPepeyWTiz4Pi2pvT1KoiAdC0AhXFTQZ7euWNBC
         tAi76ZSVg9fwxI6bercGQVo4bJtA5llUd4eVJYSBLhSHEbMdxaLz1d/wfq2H0PW0qZtS
         zv4A==
X-Gm-Message-State: AFuF++mBEwst1CETbPWxM0tBDuMki+I9tphBGpx6mV5qdZHFfUev4wXa
	qse6GFFo8Sb0p11LLvr4485Cts7N5b/VUh8ToUDdw5DUTGJdL8hAVVeMfZKI+LfooRSatFn95Mt
	UutOvXipZDEBOol5LWiyHmxLWxNngZ/ADV0nnaEY=
X-Gm-Gg: AYBFou1cVgO96yaoE1MKzDiPs5zL9G5fK5z42PO4Hkr2+uhSqaPY9UyfHUhBH1tAzlp
	CWBSUJVxNVIpx7nShOqGrgzI3Mfta74LjqNhTXJ0R0bOQthcM/cETCEEGALfVVUJ+oO029H6yK0
	Lb6va3aYDy18Zd+8uKJlqLoUKBlFJwBLeA+Zcelf8rE8oRh+YMKUL4EB6YSi7r6lDTMoxQGPmPa
	cLXavs62d9MwoPSYjZi15S5heKG+DmZyHlIPj5d78nsYJjkYAK6XoJTo3krFdBCDJpVzL9YG53J
	/GGNzD2wADimQt3HctGcRWZQfS5c5v/YP6yCStGsN01cv4trIJz/RrxX8kUchUjYfc0Wty13Ciy
	gESCkp7ZGrtFt521JevDGRMqi0TseHrxN4jgsXzk4dJgC4R8rOKBYkFIRXoNhLdH7PQ==
X-Received: by 2002:a05:6808:4f0c:b0:4b2:8d91:ef6a with SMTP id
 5614622812f47-4c13fa8795emr5586961b6e.8.1789050339246; Thu, 10 Sep 2026
 07:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132602.68852-2-mngyadam@amazon.de>
In-Reply-To: <20260909132602.68852-2-mngyadam@amazon.de>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 10 Sep 2026 09:25:27 -0500
X-Gm-Features: AcwNN1Uu_GuAXXJ2Be9f6O__zza3jhEo9v5mLmL2JzR85KZC_M254gRqoHjxODg
Message-ID: <CACVXFVO7YD4ckMPgZJh7=oxLMjka2UG_vkNcfECCBpkSQ7SHPQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: install test_common.sh and trace/ scripts
To: Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:26=E2=80=AFAM Mahmoud Nagy Adam <mngyadam@amazon.d=
e> wrote:
>
> Every ublk test script sources test_common.sh from its own directory:
>
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
>
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
>
>   ./test_generic_02.sh: line 4: .../kselftest_install/ublk/test_common.sh=
: No such file or directory
>   ./test_generic_02.sh: line 8: _have_program: command not found
>
> The bpftrace tests are affected even when bpftrace is installed: the
> missing trace/*.bt makes bpftrace exit immediately, and the tests then
> report a skip rather than a failure, which hides the problem.
>
> Add both to TEST_FILES, matching how other selftests ship their sourced
> helpers (see kexec/kexec_common_lib.sh and zram/zram_lib.sh).
>
> Fixes: 6aecda00b7d1e1 ("selftests: ublk: add kernel selftests for ublk")
> Fixes: 723977cab4c0fd ("selftests: ublk: add generic_01 for verifying seq=
uential IO order")
> Cc: stable@vger.kernel.org # v6.15+
> Assisted-by: Kiro:claude-opus-5
> Signed-off-by: Mahmoud Nagy Adam <mngyadam@amazon.de>

On Wed, Sep 9, 2026 at 8:26=E2=80=AFAM Mahmoud Nagy Adam <mngyadam@amazon.d=
e> wrote:
>
> Every ublk test script sources test_common.sh from its own directory:
>
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
>
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
>
>   ./test_generic_02.sh: line 4: .../kselftest_install/ublk/test_common.sh=
: No such file or directory
>   ./test_generic_02.sh: line 8: _have_program: command not found
>
> The bpftrace tests are affected even when bpftrace is installed: the
> missing trace/*.bt makes bpftrace exit immediately, and the tests then
> report a skip rather than a failure, which hides the problem.
>
> Add both to TEST_FILES, matching how other selftests ship their sourced
> helpers (see kexec/kexec_common_lib.sh and zram/zram_lib.sh).
>
> Fixes: 6aecda00b7d1e1 ("selftests: ublk: add kernel selftests for ublk")
> Fixes: 723977cab4c0fd ("selftests: ublk: add generic_01 for verifying seq=
uential IO order")
> Cc: stable@vger.kernel.org # v6.15+
> Assisted-by: Kiro:claude-opus-5
> Signed-off-by: Mahmoud Nagy Adam <mngyadam@amazon.de>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
