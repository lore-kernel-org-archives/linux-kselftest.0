Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D84355F36
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 11:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201214; cv=pass; b=RieNWVAZrQrSo/sgonpDF82R+9Rmkej7p0skkQYRct6Aiennh1cUjIyPkXlPQ50hdNlMVN55xEMiyIWwAq3x36MMlv+WZduf5AaMaMOVDSrDJVN8u9BbnbUIgVby/n6sLaQUbBH3F9ZA3OmWA4n7paRgBiD3RefsGs+gpw5EXJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201214; c=relaxed/simple;
	bh=Py2Gmr1ZMZHxlIxxuiTASzT6HalctrDZf2HMocIBGc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9BtuvVK6byZdJAD60yu8UukjRXvykNnsTF/S35vtMidYD0ALZLjDSoEDWAK8riLZXJvgdIkNRG/3qtLJn2dWf9RqwsL6iTjZzh9KrwuMXlKGx9+p+6L2AnMgINHYRNY7ilfQPtWfiW/EG9TaEsreeO++G/ZdnlyUIRgDh8s4lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20251104.gappssmtp.com header.i=@mojatatu-com.20251104.gappssmtp.com header.b=VzNxAK4z; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20251104.gappssmtp.com header.i=@mojatatu-com.20251104.gappssmtp.com header.b="VzNxAK4z"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3657148b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 04:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777201212; cv=none;
        d=google.com; s=arc-20240605;
        b=lGRKsbV1reo/1DhR7t/mgjwHNljmUgjYbRn3Znww4IycqzEcMr1CuYRcPqHsKQfT5j
         HGLYcPCSpXtwSWKDGA3x6eR/borhBjtMN2t5h2Fj+3Ml35HuvzyYOCKjs66RMYoZmS+j
         m/QURHoCgWVpNMGNQZUUwIo98jptYwViqw+Kw7AZ+JtnVE11k4S9r9ZNaejztKQfi2oL
         dVOFaQkhvVcj5FvHjh11eP1Yuxn4UlgELyXjpETAYsr/BG8kxwHGxJFvgqGYEODHi4RL
         BEXFIc1LqacYUuF3hO8pa5tu334O9VbPCXpLnRAzF4S/G7yPVWpSaV90WNVAvLd2TElu
         sG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8A7gFcKvdyWa++j9tbO0q1d1HYO3JFhanggdfF7mY0=;
        fh=D9AiUdzAmMwmg2KKRr8hEkW2l7T0LH+4VWGFfADXoIs=;
        b=AAkTHUfRCTFxrrPJQc7uPYvTsZ7d12Ervh6n/lPDGqNUY4GyS7MSSJWZQjpLUjgGo2
         LyI+BNOXMHyMcTLCr2HnxYuNWIJtEIN70Xk0QpMhLtA6izPwL3XKbciNnaZOUPE9mZGx
         TffkfQPGXkCesFaRI3Rg4N0egdAeK9UkQRGybdvYTrXXtT17Tmp0rdcmj+ZwKbUyByNw
         kzMlHV7eAYZ4X+LY+6Cc63E91fUJpmVW+9n2K48l7VoeK1s69BpZ3teJ4OoxS9CWBl5p
         mmIC/+dwp86fuytrObl13x2+y6m/tkh9SIF88zGhxUXFllZJjFVERo/qdu7cwNHQTrR6
         209Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20251104.gappssmtp.com; s=20251104; t=1777201212; x=1777806012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8A7gFcKvdyWa++j9tbO0q1d1HYO3JFhanggdfF7mY0=;
        b=VzNxAK4zXAptbAJCMyrUSbNd/muLmMFeCoL/F4HV3tdjVCi2Hhave+KBhhd9wyfeY3
         VBPCM+nPpDgfpAcAXtjiDr2buD+SoOEa9LZC8PARVaEalIASipIbw25HbJynOxaBlcJE
         jpNE8NzXhAvWRp9DT04qJGdUnmsyj4DT4dpPlASfsj9E+r/irAHMM1WrdVr5fUjbg2Q8
         AofZCpLDR42ndYSkc7BAxtWrLn+85soY4qkE35LahyopAJJeNVMm5DvU81QgLn0uJqFJ
         1w2dBMlZzslLOTYEKTR6mpPZUInIa9ZlEv/l1yOKIUKlea7Oen9AAElrHTfrvm4Oadsc
         hREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201212; x=1777806012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8A7gFcKvdyWa++j9tbO0q1d1HYO3JFhanggdfF7mY0=;
        b=SrWp+cV4xqNz62aehRGiDwBttJIplWJtFl0mBJHnILBVRzRCiitaTLJKHT8xQbxg3e
         Xgsjb7hdGPp1zUyYo1QwkitDGwC77EUKNub9FGeQBl7EFT4BhlQlmE2SxAtHKlGf3o7Q
         cuOB5c4XaJlTw5oQIWD77s7/rfkUCUweKx3fpzTFCk9vIwZbQ6KX+lNMXeU4Zlnj6gP7
         3K0ezo42Iy6xT3MfGqnHbmOtZcP13ngStzw/WeZRg6lUXIqGJYftyG72y6gjuxVmNQ6t
         FsVJAhaX2pSkHZKr37G/4e0aTE5gxTQ1VYjHi5gQ9Mm9a3Q3FX5rEedLUKrerekqBwar
         Nm4g==
X-Forwarded-Encrypted: i=1; AFNElJ+iB9cvC+cb0Rp+askCroRhJsan1D4YQxBM9FF1cgUSRqPLwPulOtv83KdTSKd7Pds/guvohExWrZnnlllBIN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsmyMA2k2AiXoyjKnIMh6Slyiy1zpt10Y2Nvl1GIcegzamJHJ
	keMNeA9XkoUwkr15DK7PNztxXVlVkVvRwG358LiChPH68ySZ3psRyB6nR4Vg5meQaVHu6yu+fx6
	/wYslh24BF2g/j7p0pXFmKJOhKKPDFOhxm75gdpiB
X-Gm-Gg: AeBDievy2R8ZVOnskvqsCwTu12lis97B8qgSjhOgBLQXbPbcWW2zUMZNUHvvU6VQAeG
	1x87r1pv6tIXIE3NX5d9hJjINyl5HCqu4eA2gcBcRtg1ArjTCBcUAYhg51MynQtEvD1JwPY9Imn
	PbA4dwYi3W6u9xMnLAt0RnoyxP9Ug7u/RgNElcYRIynd7HFOLp+t6l2eV5MDPwQkrYzXdxBBZ7x
	MJvzgiRKrBz0g2yBGZ2OSB+RW3D64lniIV67tSjeWxZdcZr8h57BBUuLUDvr4FWTPA5mZqbcLsc
	Q3c3JQZxJ2oto1cIJ3RGBzuJLApvTQ==
X-Received: by 2002:a05:6a00:27ab:b0:82c:21af:a7bf with SMTP id
 d2e1a72fcca58-82f8c8a0442mr37056102b3a.13.1777201212002; Sun, 26 Apr 2026
 04:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422161958.2517539-2-bestswngs@gmail.com> <20260422161958.2517539-4-bestswngs@gmail.com>
In-Reply-To: <20260422161958.2517539-4-bestswngs@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 26 Apr 2026 07:00:00 -0400
X-Gm-Features: AQROBzAgSdaBXJcboV9nvHChxz5j4Mz83IiN2mpkjN3RKMZV28Q-ZgpRwnfLPEs
Message-ID: <CAM0EoM=aaPvbDz8SCd_xcUCAmQ9m-aK=ZaQPAN8zUURhs5jmBg@mail.gmail.com>
Subject: Re: [PATCH net v5 2/2] selftests/tc-testing: add taprio test for
 class dump after child delete
To: Weiming Shi <bestswngs@gmail.com>
Cc: vinicius.gomes@intel.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladimir.oltean@nxp.com, shuah@kernel.org, xmei5@asu.edu, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:20=E2=80=AFPM Weiming Shi <bestswngs@gmail.com> =
wrote:
>
> Add a regression test for the NULL pointer dereference fixed in the
> previous commit. Before the fix, taprio_graft() stored NULL into
> q->qdiscs[cl - 1] when an explicitly grafted child qdisc was deleted
> via RTM_DELQDISC; the next RTM_GETTCLASS dump then crashed the kernel
> in taprio_dump_class() while reading child->handle.
>
> The test installs a taprio root qdisc on a multi-queue netdevsim
> device, grafts a pfifo child onto class 8001:1, deletes that child,
> and then performs a class dump. On a fixed kernel the dump succeeds
> and all eight taprio classes are listed; on an unpatched kernel the
> class dump crashes, which surfaces as a test failure.
>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-6

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> ---
>  .../tc-testing/tc-tests/qdiscs/taprio.json    | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.js=
on b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> index 557fb074acf0c..cd19d05925e40 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> @@ -302,5 +302,31 @@
>              "$TC qdisc del dev $ETH root",
>              "echo \"1\" > /sys/bus/netdevsim/del_device"
>          ]
> +    },
> +    {
> +        "id": "c7e1",
> +        "name": "Class dump after graft and delete of explicit child qdi=
sc",
> +        "category": [
> +            "qdisc",
> +            "taprio"
> +        ],
> +        "plugins": {
> +            "requires": "nsPlugin"
> +        },
> +        "setup": [
> +            "echo \"1 1 8\" > /sys/bus/netdevsim/new_device",
> +            "$TC qdisc replace dev $ETH handle 8001: parent root taprio =
num_tc 8 map 0 1 2 3 4 5 6 7 queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 base-ti=
me 0 sched-entry S ff 20000000 clockid CLOCK_TAI",
> +            "$TC qdisc add dev $ETH parent 8001:1 handle 8002: pfifo",
> +            "$TC qdisc del dev $ETH parent 8001:1 handle 8002:"
> +        ],
> +        "cmdUnderTest": "$TC class show dev $ETH",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC class show dev $ETH",
> +        "matchPattern": "class taprio 8001:[0-9]+ root",
> +        "matchCount": "8",
> +        "teardown": [
> +            "$TC qdisc del dev $ETH root",
> +            "echo \"1\" > /sys/bus/netdevsim/del_device"
> +        ]
>      }
>  ]
> --
> 2.43.0
>
