Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F225B31D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635699; cv=pass; b=fxzhiiH3pkJZj1SuweuUY4bLjd0dsmLVQGyuXMF68wYICgJvaMC8xlFWJ+l+zo0O97JKfn647kyvwnzXbCwHRqJm7v41RfLEBEEyZTFGrN8ag8eqn+FnZ3ivT6TPdxU22i31XsPzIGaJaUhj5PXR9+nCcVv45au/bgZMxVnqjQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635699; c=relaxed/simple;
	bh=GXdTnovOO+tYbkacy00auW8FRS+Io2U1Z+ZPPK3A1OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIvhmvF42t5rROpDp/s7XabGqodXGq0nDADIyQP9Ui6w/jv7FxgXmi2pTIacfRUoecMMTIqiev9KsKhYRN73p6+WRWzvAq/LoTWaLF03/uqPg11jwtqSiIADvXkQNGxoW3nR8btAkQ1bJPQhT6/Cm2Hnqor9tmxcJuxG3Ie5rbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPz74ykQ; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPz74ykQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439af7d77f0so1927981f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 11:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774635694; cv=none;
        d=google.com; s=arc-20240605;
        b=dQEQCz69OK/SWRYxu5Anh6INinNyEC76dsGzQR0PW1BlsIA9h3/kUlMY2RhU7hnBmg
         ddtf8mjcWcC6qV77OPvMZ672UInOBb1AxM/k+1FoB9gFMkzZlIjVEBrriKMXs/sssNgD
         yhFJbbkS5B08702ZxbjWHuLA0ssh+wrL8DiH+DTMtoPe1BGFTgcziNpw/OSFh49u84et
         G4wjh4UQGErUndzjDDA+7RGBg18Ti8sAKTFEpIEtwtpOKkjuCMGR4Hi1Z7bP+OvRhsDe
         Y1AeVjT6GdWQu0eGjPotc82VMTlwXU7gDRlA1VED8qt92ThmMCibPIsJQj6KUE1Qs7wu
         XXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dl8EihU6p9JauLjVIGQ3FmZeCRQoUkK67Awxmso4g1k=;
        fh=FSbH9TcYyUU+emgPo2mD+jDdHf04Qac9GbZdrzvmhsQ=;
        b=f33O2ZqytLCzIwzb08MwhnfQ9k+qKLsblyWJ3fRZkW+WI+LhQJjUxa8AI6JOocQu86
         q9iuKNVe3PuoiGOttz2Z62GyonnqCo7rDCxe4EdZG9SlhdAlY/FXOzQRLxj9lPR+JrBl
         LtMnexwFcUqq1RBvaW9xejGLPg+vlZd74PMoyvsBeIuCO0SPQoWW2Z6U/VFFGVwvyp0W
         BCPnZ1CHs4ZCZCJXgIb5cpI/5+dpix9dKxwpx2kORG+kkQdkmwZPqHiimGLPeP+wjkYF
         4MiLTSYn6ocyEL9lD5oFSNzNsAHVyyB/DCyVYJcQKf4yunxB4G+Oq5IDqitLwKWfrQgf
         Nzsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774635694; x=1775240494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl8EihU6p9JauLjVIGQ3FmZeCRQoUkK67Awxmso4g1k=;
        b=BPz74ykQwdmceHHSxXy/3BWIDi2jOxDoSN71zN6US15A42mygrXMtaa2ljfxbxaocF
         g0+bg4LWO9NRAi9rYw462WGulNTbbrbjwCrR/9pU+8zNn7sBzWG2NPeZNWHs0KWZ0zrj
         1Cwigm9Rp2J7Rf08xEAYjbelHPmQUw+RRkIHiOI2BZ2XEu56xaaz5O5e/P3cixdBYQEF
         hVSgar3BRtIK6l5MhnfhXv9tZW4m1Er+W8xK07Kfvq04g5DqOZwzPOK/sA53AsBh6eDa
         gZsm06uWtdXxVLtFzYmxMfMfGe0QNPbOG3WY2J9L8SL3n58SiJUNzNmBbuYQPl3kNO8V
         C4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635694; x=1775240494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dl8EihU6p9JauLjVIGQ3FmZeCRQoUkK67Awxmso4g1k=;
        b=SOnh8vokmUtTkmPZ8C9DuKo050n+zn2uApJqB8NX6e6XXGzJlLB7Pp2xBMeQ1FJfw2
         b3ZSzONqt6HHXQR9Hkb3eRJ4GvGX9O4mvVdD5D7DqGtXR6r5F+vpOkqswIrdvRFGWsZm
         x8KtZzkhejNnReT5Zfgn48hp8F1+8oZ8DtxgCVBQik86JGyEVqbTb0WVvnBljAJbrC6O
         8grHhKTlkxyp1o/UwxOPeLJboaay3kP6XYmt2Qb+WfVZPYX50zKC+WQTefwhKepQVJrc
         BHO/x2U5kHWk3vWNfyCcx7d1A9K2D8TPXphQAwxSCBLj8dDOOGWSx1gSCT+Emv9Rvmp6
         a30w==
X-Forwarded-Encrypted: i=1; AJvYcCX79J1P51T0Lr7kIL6a1d1orJhTY8oC2kSxkGYLAeKx5N1zlBay7aUGoYj+kvhvtFxTMM7vm0jd+SazPfuSMv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7u0ej8xCHRlaz/mf4Zw3T4CXYbtizpHAQmwOLROdTqmYJdCQz
	2l/8VYftmzLY6Cmset/StJvub5t+wQcCo1ZmVWqjOQTcaFfEW5iyJdmwLo332Q7+rNcASND7yVg
	4RXF+V8ec0FGYelmMhHG2YPvJnHI8wO/GkoOk
X-Gm-Gg: ATEYQzyEGEKYXBBaLauSefjwGx5YH8CBQtY4R5zhCBfpVL3emhxzoWepb6AUjLfzvhw
	xf9u3v7cJF/DN0aRNuQJ/ueOh+fyKPOeN3OZe3MuFLpo8a046Ng2s5sLdtlRh4NAtrIpfwcD8ao
	8h3ooyRaoRxYd7a4te1u4PTZcQWGRXIDyzI3/5WqvJtXuNvhACIrS8hNH5nPPFeDoylu4fMMMkJ
	Azfxxx+aWrzhK6vFatw4PKxsr4jSTPkLXyk/pc3qa8nG2duYwojaFIqDAMKaj/37pzyx+NNuk9b
	AELTC1oeWA3fxFPYlATLGiEF+I9ZAThMiFyB1Yoe/vJt/O0ZVQ==
X-Received: by 2002:a5d:588f:0:b0:439:b8b2:fabc with SMTP id
 ffacd0b85a97d-43b9e99a4c5mr6367455f8f.21.1774635694352; Fri, 27 Mar 2026
 11:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322061038.156146-2-liwang@redhat.com>
In-Reply-To: <20260322061038.156146-2-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 27 Mar 2026 14:21:23 -0400
X-Gm-Features: AQROBzC6_QXwgzEAdnMpmbOLSkY8-818jdTVCtG_0kiFBuwZJE_Ctmrxq0GGihs
Message-ID: <CAKEwX=OFj-etKFrz+wu0QYfUkVC+Q6sMUvQwcGRgtyuyJPSm3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, yosry@kernel.org, yosryahmed@google.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com, 
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, longman@redhat.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 2:11=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> test_zswap currently only checks whether zswap is present by testing
> /sys/module/zswap. This misses the runtime global state exposed in
> /sys/module/zswap/parameters/enabled.
>
> When zswap is built/loaded but globally disabled, the zswap cgroup
> selftests run in an invalid environment and may fail spuriously.
>
> Check the runtime enabled state before running the tests:
>   - skip if zswap is not configured,
>   - fail if the enabled knob cannot be read,
>   - skip if zswap is globally disabled.
>
> Also print a hint in the skip message on how to enable zswap.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> ---
>
> Notes:
>     v4:
>          - No changes.
>
>     v3:
>          - Replace tri-state zswap_enabled() with check_zswap_enabled() f=
or clearer flow.
>          - Move skip/fail decisions into the helper instead of branching =
in main().
>          - Make read failure reporting more explicit by naming
>            `/sys/module/zswap/parameters/enabled`.
>          - Keep skip hint for enabling zswap:
>            `echo 1 > /sys/module/zswap/parameters/enabled`.
>
>      v2:
>          - remove enable/disable_zswap functions
>          - skip the test if zswap is not enabled
>          - reporting fail when zswap_enabled return -1
>
>  tools/testing/selftests/cgroup/test_zswap.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/=
selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..e69d845d3592 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -589,9 +589,21 @@ struct zswap_test {
>  };
>  #undef T
>
> -static bool zswap_configured(void)
> +static void check_zswap_enabled(void)
>  {
> -       return access("/sys/module/zswap", F_OK) =3D=3D 0;
> +       char value[2];
> +
> +       if (access("/sys/module/zswap", F_OK))
> +               ksft_exit_skip("zswap isn't configured\n");
> +
> +       if (read_text("/sys/module/zswap/parameters/enabled", value,
> +                                               sizeof(value)) <=3D 0)
> +               ksft_exit_fail_msg("Failed to read "
> +                               "/sys/module/zswap/parameters/enabled\n")=
;
> +
> +       if (value[0] =3D=3D 'N')
> +               ksft_exit_skip("zswap is disabled (hint: echo 1 > "
> +                               "/sys/module/zswap/parameters/enabled)\n"=
);
>  }
>
>  int main(int argc, char **argv)
> @@ -604,8 +616,7 @@ int main(int argc, char **argv)
>         if (cg_find_unified_root(root, sizeof(root), NULL))
>                 ksft_exit_skip("cgroup v2 isn't mounted\n");
>
> -       if (!zswap_configured())
> -               ksft_exit_skip("zswap isn't configured\n");
> +       check_zswap_enabled();
>
>         /*
>          * Check that memory controller is available:
> --
> 2.53.0
>

LGTM with Yosry's suggestion. If there's no other change you can also
submit a fixlet I guess?

With that:

Acked-by: Nhat Pham <nphamcs@gmail.com>
