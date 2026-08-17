Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8F456289
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986913; cv=fail; b=IfRkrjtQZq91IRwpOcs2+7W8iI7ZTh4JcYpUaDMulni9xnoHMU3c+U9mYkjOBoqF7C8NMoYECc0L/1XbrTNExOV0OmZz6g8pm2XksJqvDdTjcEaTG3HOmGDxGb59qpRx+VFLlq0vNpfv+FyGpdrhyPbxUF1ZuY+7E3fGAIvHuJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986913; c=relaxed/simple;
	bh=unEk75h4RazW61+CTbm2OkL2vcW2H4HQkbdjsMJg7J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iseyDOYXk7WOq7e3Y/TWznoxX0EKCz2pVF5mgFNlWEb3nOyxgRhsBN2QlpqAaWpebNraOOjUnOU8nThm1l0/Re7BFT6v/sGgDo2dwPBPK2tAdYwYfeDavkZn/wY0sl+dev6izItibyDAFFiHEFVImhVfTBzLbQ7NrazkoZhfN5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=dYHCFhF9; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="dYHCFhF9"
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYgKB490791
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 10:15:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=njvrH7x9GyJo7i1wnbi3Q46/eHKvNpCFfvtLC
	nuO51Y=; b=dYHCFhF9ZhRPYIkTaIZmQc0ZglDsa4tQXTidjHGegc8Gw5Cpb3CC5
	jZ4EuhP48kQfwBiMyKsfxMUgn43+xOFIUAhe62uOGQQS3MuGbjQyN9z0ujdg16Kn
	b0QQWNAnd129mksesLlQ6reh6gJUneiPcWKWY6nhA92yfZohTJZVymfiZNk+FI49
	0xb1/Cci7Kca6EYtez1nlz/oJlFCUHx/7eaxoJCLZmm0Ox+4amX8PpFd2XAn7MWX
	IKu3bfuMqtfOxX+y1dWa8ae+IvocL++PENBgLG67Al4wzPJnPnRlLpzXKlxLm7gm
	r7s8fUI/gYuAX69o4wWb0DSA3/kYuZM1w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4g39re739j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 10:15:09 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28deb7ee3so731258b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786986909; cv=none;
        d=google.com; s=arc-20260327;
        b=sIkx/PMIPy7YIv7TObwVq/qQrVgtCeziKAkb/a8fwIUa/n9z7tMhkAUgI3ojx8nuyi
         pcfKUkdMuTlZwKzfJ8Zpl0IDiCfe/datw4IiGXXPXb8eUNpLirMlc/2fQkQ9vVj8nSeS
         ixSvVZZo6GQpAXaFbIKTT8ffQISEaCxI0i2dS3935rmj7r7lc11bx3hBB1VNh9VgVXKD
         3ceN0HNiRpR+7R8Ju0KgxBYtV81APg3TRTY+Lo2kL8CQS1XuL77k4L5XVN2YHBMnPeie
         t4sy86W1bijBaxJQx0V3OAAGJE0f7RxWPZJPEByzuhKKbvVelStF6kwGOFjzcma91Q6p
         TREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=KoTFa2IJT7Dn6m6sQQ51SO0r0kVa/rVmT5mp9uvRqLo=;
        fh=CeMi5KgBevRF3DO7T+B5GxMC5x/YeutXUJLP06LHQ3M=;
        b=LbV4lNahIafG1T7+taTVoZ63nJInqYp7uB2/pB+HoBgqV3X18lmZYqkm0DYi6rbZ3S
         QOL9Lnn7A+RU/WRA2zEdRlglXxoo22JI09Icj87wyjkh4u2FnjsjBYMEF0ro+/5t+N7G
         Wyc6POkjmFLTtWwAqq0hUmQWxFPLttSDvyvFUVA/oT0S4/2RSG7qNBYzQyTyK0bqvja5
         J+gbHr6rqJndciF9w5gq3Zh1OSesNd7GV6DoM3VF4jG3yxuxYvuvif1BRLnsiQnkKz33
         4+lNI8IPCj3XSL/umXOMwnn73+aJN38AMAY/svsLx6PM/GmBzgp9BL2tvLtXfuX66fxL
         K0zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786986909; x=1787591709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoTFa2IJT7Dn6m6sQQ51SO0r0kVa/rVmT5mp9uvRqLo=;
        b=YIZlJ2V/Poz1bJw0l1ckd5J20cp1X2uNyaDNdiXLvpy91mc1nVH/g/daW++uidNEvQ
         C7QuBEeFAf3aMfsGGCV3bj/4xQjFbYT7Q3kyQ1jyI5m74Gd2MOE9S4wRMeRkUIFr3/2U
         e9tDu7Ift/yFgOJzKh07ZiT8cEqdIqkR0BmVLpquY+rKCD9VMkCjKM2ZNRpwYoo6uI/l
         OmvniNFKEkoocXJVG8ZflfgY1TfwFdccSr/ZCKtkE7vN8lwp53YM5x9wEuw9tZ483JWt
         rJUWpFLUbKTfAZ5W8SyXytXcmSxGi40r5zRKAyEeKV1jiHCWftU3UzWA2xfNHQ2LSS6V
         vM3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrf8doMu7qhyHTFkeEY1drW20pBm4YlvChbi+7DaD7x8MZ6lrD+f2aoqA1O+/oo7hfYgxF/7PjdezuEaMdrNVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz07FFUI64PmrL8/pw/JsihqdchkoYA21rk9UPFa1Owlar39Zu4
	/olLMgyVUgh0xkt3o6Ah8/Xgw5ZoQM3toLr+K8YFnakY3O3du+LhhRuOLzo2UHZFGy6OM6+BIe4
	2pMLUIAUeV8fV9ItV0F5nZqHJjdY5v3WsA+4jQ15/hOrZW6+Q4bF0AImi1ZOnvXFSw3eKvdpdCz
	gbidXWb1ascopN0ZmkiPin8OrvKm3QgZVkkxgeXnvun189nA9qnAZwew==
X-Gm-Gg: AR+sD110y92pd7ZzTWMtFD55xbujCpmBftV9Kfwvyo82+dkd9HioUukgPZa/DWPUr9o
	pOsO3NprxxHW7iE7fkgd8A9/rV+B1pF8PVMIKCu3zWnSuHIUdNLhNHIiSU1i9oBaU7Sf/XS9C4M
	vZ9YfL3kJ71SN3vR7r42DwI4ngmz4Q4CxzzJ8T71b4o5wsY62tRNOFMjvU/MtI35n910f+sV31s
	6v3bAxMHR7E2KEY
X-Received: by 2002:a05:6808:3502:b0:489:a387:1e29 with SMTP id 5614622812f47-4b297a4b8a8mr2209416b6e.20.1786986908716;
        Mon, 17 Aug 2026 10:15:08 -0700 (PDT)
X-Received: by 2002:a05:6808:3502:b0:489:a387:1e29 with SMTP id
 5614622812f47-4b297a4b8a8mr2209358b6e.20.1786986908219; Mon, 17 Aug 2026
 10:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803001807.646357-1-changwoo@igalia.com> <c9f8616b-15df-4c5a-8184-bf4d63813afb@iogearbox.net>
 <75bbbff2-5ea5-493d-b543-ce40d968f3cb@igalia.com>
In-Reply-To: <75bbbff2-5ea5-493d-b543-ce40d968f3cb@igalia.com>
From: Emil Tsalapatis <etsal@meta.com>
Date: Mon, 17 Aug 2026 10:14:57 -0700
X-Gm-Features: AcwNN1WgYsoY-VjTAIHqOFfCfsXsbtxggdrhdfKy9FCfC4rkn4z_jRHt57GCGQ8
Message-ID: <CAMe2y=Gm9K3cwsM7Sff3ZaKani3z4tVUQv9u1KzbetJF8OrW=g@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Remove duplicate copies of the arena
 spinlock qnodes
To: Changwoo Min <changwoo@igalia.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        bpf@vger.kernel.org, sched-ext@lists.linux.dev,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEzMiBTYWx0ZWRfX6OrC4bNfGMSk
 1e1A7BeIMfp0lrq47fSGasqyp7rR0IDjURiCg5PRgkswbpgg+/nq0Yym928Ni48hk47U1rmrHVI
 Ec1IUGupAcrxRbYG6YCwnb2QqTze/Rs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEzMiBTYWx0ZWRfX9JoYd0wP7mIn
 8wlbV1FQTLtRmiT7Gpg962FC5PDIHgwV1wXJDmKe45iVO0a2SgCa0YuSgHz3O16jl6nKB748KiQ
 7VMfXk2UsfIc2R5MMi7ctrkzX7q8lrUJ+soWOAg2/IJ1Dwz4ml4fnXenOSBS8iHl/JUkzhrUKwB
 iVTWHomD3TF4fO77vMerIiL9e8kYAuBOIxrCY83PJGtD/B87Ok8JZkASUo7Fu70b0vXVF6Die7B
 12wDSaxiSCYKfP2uJH5t2xL/R6dtc5tZxVNqB51seeFnBdT/B/hAHGgvUMLXx9ieP8+JpSRaMS2
 uIF7yjCRyimlq66lbwwon48ggz3ZE29fQAlJHXV1556w5o0SJSrDyjHM+6xdD8sT0sL7XrR65Bo
 FaEqoGstzCF356mYKp3gSDFIkIskPbo8fZ8yOJCDvhyEC99J19IxZVi+ZukyNAhF6tCWMWQSrdm
 zWdon97iSR+aH4v5mAg==
X-Proofpoint-ORIG-GUID: rYVDLs5UIcMuvMocc0AC9zIRN97m_cFk
X-Proofpoint-GUID: rYVDLs5UIcMuvMocc0AC9zIRN97m_cFk
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a83419d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=V2sgnzSHAAAA:8 a=CWErhr8FAAAA:8 a=4OgE2WNpP8yww339eGMA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=I-g_0vLIplkVOQ0FYkeP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01

On Mon, Aug 17, 2026 at 9:02=E2=80=AFAM Changwoo Min <changwoo@igalia.com> =
wrote:
>
> >
> Hi Daniel,
>
> On 8/17/26 6:05 PM, Daniel Borkmann wrote:
> > On 8/3/26 2:18 AM, Changwoo Min wrote:
> >> bpf_arena_spin_lock.h defines its 64KB qnodes array in the header, so
> >> every translation unit including it emits a copy. __weak makes them all
> >> resolve to one instance, but bpftool gen object merges only the symbols
> >> and concatenates each input's .addr_space.1 bytes, leaving the surplus
> >> copies unreferenced in the linked object.
> >>
> >> libarena links ten such units, so nine copies were dead weight (bytes):
> >>
> >>    object                             before       after
> >>    -----------------------------------------------------
> >>    .addr_space.1 in libarena.bpf.o    676200       86376
> >>    libarena.skel.h                   2100123      892371
> >>    libarena_asan.skel.h              2641124     1466477
> >>
> >> Declare qnodes in the header and let each program define it once:
> >> libarena in src/common.bpf.c, and the arena_spin_lock test beside the
> >> lock it guards.
> >>
> >> Tested with test_progs -t arena_spin_lock and -t libarena.
> >>
> >> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Hi Changwoo,

Sorry for the late reply, for the next version feel free to add:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> > This doesn't apply cleanly, could you respin against latest bpf-next?
>
> Sure. I will send the v2 rebased on the HEAD of the the bpf-next tree soo=
n.
>
> Regards.
> Changwoo Min
>
> >
> > Thanks,
> > Daniel
> >
>
>
