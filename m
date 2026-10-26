Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041931;
	b=Vmy7VokI45Hu6kwW6ct2OMYxbaTFui53LffOBBknd6byo3mL21V7jUmnyTyCb8Ti1L/9
	 /Y9tWrL7bQZQzEMI92sifCc00dAqPmUjBfrWC46z8vAFc5nTimGlBbJMfVXzHAxPWJSzz
	 na8eC/2ztVE8vmTYavy0idbV8mlilm+eRsBVuyf4MClxVz2ft1BbNXlXS9kDkJXQQ3gAq
	 tP44tCMxDE5QEFp+TkapmPiF4sttg0+mOEZrg2+q6YivJeTgKTlgHw95rvj/QO+30og49
	 hVWvvhikRTjtXNWgheNjw9y2L8mbZoFQ9/DL83FpglyXjvwpHNE0Rt7QEkVpejVPmOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041931;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ESeb32clViSSBCfxyL4C/fFgJaSiqIpJxyga8RHrWCU=;
	b=m4BbLOtLgjoK+dr+4noRLy2aErMnFZD7hQZhIteUlwlERoG8IzunzIUwxUoHJLVTxY6x
	 oQczjSSTp74/2ZhKlbJJBjA7l4P3u2mpTcYMAqQU4COcTX2LL0Awq3QjSkdhgAw41tIAY
	 hl3LS6vSAjTUnYQj9wkJIGqy47RqT/GsUNrYTKD+FTO6QjP6hOUcXyoyUMspqw9fPQ8+V
	 peomYSBMc8FSS2SJpSbPa2zGX/s454oPnnULlYL7DMMbcq/OHBXPFZ+IAFCLgg8DenBKu
	 uf0h9WO0/bW0/Q6zlP6nUmlfvKzl5Sdh4sP7u/hCxpNzDBKv27f32M0W2NMQrdbA8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lB5VmfAS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E40606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lB5VmfAS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E11F01825
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041931;
	bh=ESeb32clViSSBCfxyL4C/fFgJaSiqIpJxyga8RHrWCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lB5VmfASl7uMKDqj0SBUorNNC2e4XfuV4f4czrhdh2lGpVX47PQc9tPNuaZ/o5LmL
	 zbJlavEAiJv2mqAyWmnxP0/zlByoP1muBPUD+iCjpBbQj0Zr/ebWlt/ytK8EiGSv1D
	 /83qu0Ezp2M/cA+fphU8aAnRT47XOrudn8TGC1PbFC8QywVnvqDKeZkDH5JwJrOG2T
	 TDxolm0E/iUvyncLqj81YBrO6Z0Hamg9s4+y3Ttb2TdYsnFfh3OyitFgrruopTT2Fo
	 j83jx5pGsYWyBnet4UXqn5tv/DPD081NmfKCMNVgL2WVxpE3xp8J1q+7cAd61ctZ5w
	 JYJsOiOdwVHHA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1610162e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 12:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4meYWwsgORwKBxBHPmUNzSvec53cjCQCUhgbuOEv8Ij5MYsakn8oz+bYynibsHvH4QMuhKSdnVG0is1Cn6nM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGUcVsj8gCjHCCZoerNokFhCHa2E+i9K15Kioa2eMDxtilxCQx
	UP5wEsK19dX9PS2d4kipS+eCaHD0R2ECJ74EqksUjM8iU5FRu/LX1fjMdwEE6veDSG101jCTndg
	e/InnDb1inxRBcM6sV12m3OmVGKlIt7c=
X-Received: by 2002:a05:6512:239f:b0:5bc:b23c:f7dc with SMTP id
 2adb3069b0e04-5bfb716dce8mr2548379e87.9.1793041929627; Mon, 26 Oct 2026
 12:12:09 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>
In-Reply-To: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 26 Oct 2026 20:11:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iO00WGo=Op6YCz2t2f5WQUK0OPae8R7jD_ZzLFYoqrWQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZxMmLsw196GQVo3yjC5ZsB3uG1TZ7Et-SYP0Lg46qun1CpNhsaanIZEw
Message-ID: <CAJZ5v0iO00WGo=Op6YCz2t2f5WQUK0OPae8R7jD_ZzLFYoqrWQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: cpufreq: stop CPU hotplug loop after cpufreq
 update test
To: xiong yining <xiongyining1480@phytium.com.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenbaozi@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:02=E2=80=AFPM xiong yining
<xiongyining1480@phytium.com.cn> wrote:
>
> Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> for verifying cpufreq synchronization between CPU hotplug and sysfs
> writes.
>
> Two issues exist:
> 1. Background hotplug task keeps running after test completes, causing
> redundant CPU on/offline operations.
> 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> before frequency updates finish, which breaks test purpose.
>
> Introduce a file-based stop flag to control the infinite hotplug loop.
> After all cpufreq updates complete, create the stop flag file and
> wait for the hotplug task to exit.
>
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
>
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
> ---
>  tools/testing/selftests/cpufreq/special-tests.sh | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/tes=
ting/selftests/cpufreq/special-tests.sh
> index e87ed7c8e5e5..14530c1b8d25 100755
> --- a/tools/testing/selftests/cpufreq/special-tests.sh
> +++ b/tools/testing/selftests/cpufreq/special-tests.sh
> @@ -97,14 +97,20 @@ governor_race()
>  hotplug_with_updates_cpu()
>  {
>         local filepath=3D"$CPUROOT/$1/cpufreq"
> +       local stop_flag=3D"/tmp/stop_hotplug_$1"
> +       rm -f "$stop_flag"
>
>         # switch to ondemand
>         __switch_governor_for_cpu $1 "ondemand"
>
> -       for i in `seq 1 5000`
> +       while true
>         do
> +               if [ -f "$stop_flag" ]; then
> +                       break
> +               fi
>                 reboot_cpu $1
>         done &
> +       local hotplug_pid=3D$!
>
>         local freqs=3D$(cat $filepath/scaling_available_frequencies)
>         local oldfreq=3D$(cat $filepath/scaling_min_freq)
> @@ -117,6 +123,10 @@ hotplug_with_updates_cpu()
>                 done
>         done
>
> +       touch "$stop_flag"
> +       wait $hotplug_pid
> +       rm -f "$stop_flag"
> +
>         # restore old freq
>         echo $oldfreq > $filepath/scaling_min_freq
>  }
>
> base-commit: 28924df2a08f440c73991b83028032c901de2ae4
> --

Please see Sashiko's feedback on this patch:

https://sashiko.dev/#/patchset/20261010100148.297720-1-xiongyining1480%40ph=
ytium.com.cn

and tell me what you think about it.

Thanks!
