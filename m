Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58D71EA84
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670568; cv=none; b=vFJzhGywoBoKuSx88QZaYH6YrK2Bck4jMuYETb19torkbbEnBU/7Oo85bKxvfidkFaECMVg+JNGHepwfuxSTSyTft1kgNVT4VkZfHtS3f7vVjnjhh7WkpMFINHPBA1O5Kj5iC9yLOkpghZKYS887NdgWUmTgFJLCCB1L7QZyzVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670568; c=relaxed/simple;
	bh=QJkROlYAAMtA2AGK13Zr9Dg6PXgZQvDDOmnAOX7+8uM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OeEHdEYTfBUQOV1/YyHP9P2o8l4uO259j3mhDnkDpnkcVwG88HO0sJsdkeVsvjRluy/dXlIIkm+ksw8uNW3ZiTEd4bDbwqN3CB9Pa3WXbxVspNVeTqEwX61l2a7U2ox9Ezbscu0tOZzFZqU/E8injHlXfZOpw9uebPEae4xbX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=yBUJs0Th; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="yBUJs0Th"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so2568555241.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1773670565; x=1774275365; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+pZogzXY0yFkLhI9otlHstzKzlH6EsSqZlTH+u5uWI=;
        b=yBUJs0ThfOMd/s94gMUZpyhuGcJ9LQJdi9D+Jz7mkWH4Fow5FBdeWXzKuuNXHRTaL6
         ckxTwd5lluNe1doeUx6QfQ9bHyNEMDTOm/cecSPqdg0IVj5Qwa4XYE22sD2yWRBH2xIH
         59KDIadZCZPxTbP3Lz25iBATZF2GqefI1Hc8faEu7sTAMWF4AZT38H64zsj1/nW90O3g
         jGqPz8DdFUe/RB4uw7XjBGc8utnW+yIGRQzTAfu8rkOWxYXNyT0Wv1BTKQ9SQFzwLu7w
         XHxfTzxaqdDC0Au7DVsM3cyx2HLL/zcugOMeEV63Sj+j9TE9qmJo96pVO13Clo+795Rd
         8QtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670565; x=1774275365;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+pZogzXY0yFkLhI9otlHstzKzlH6EsSqZlTH+u5uWI=;
        b=bA4tXkPoU94uea6mm7lYETVbdzJMLQ5NyW0xs3E5TM6YOP384XM7ITnsgRZ2oWS3Z7
         fZOygYdgt9MQc/T9QWaMO0/XYRDo10Hh2xRXSwv4j6kwZmGXimEhhg2+VdQzWk3ElLe7
         jlNcM8HncPuApQ7HluKpE1oTSsmRSMXnn64v012DIYrvNpjAuo/26cYjB+vDuUvC49ZG
         /YITO19m4Jm++JG9ZmXqVaM2w7JL3xVD0KsGqEcSSXufhw77Ffh9p9v4LOwl3DUXfpyA
         /d9D/v2gINa+Dnni1FOPK4GQnmZcFpyzvhnVU04R0Q7PKe1S3p1ZvXOFoX8Wco5mW4bz
         0cQA==
X-Forwarded-Encrypted: i=1; AJvYcCXV2iAQ8aJhZ8NBMSncHq9sXPIjnqZNt7BsclSWAswADoQBppCoyop8NbKAj9EeV6sOpw/cAU480RK7e0BI37g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvTEe/rDJZfYtWF+1Rja/jp9ctqSMNN74BP4HL0rZyD7txyyo
	UPP9Qjd+MhcvURoiSQP2PqP0TNtMFL7ZnexlGLgvy+w8QKZ7jqmoLAdoqQ78O4/Nq60=
X-Gm-Gg: ATEYQzx5uOJgk2H/yRfcoxOBisO8KpDZOSR+o/6cYrq85UAuIl/0lHgb4pOKLwS/pxc
	JVKY7iaiKuIBb5Yle3IhZL3wRyy3mbhyyhqkuBVFOtgsb6tKXFvoO+JbIMn8pyZhIY4sz0r32lF
	rXTuKRGP5Wk+FjR3CVuO0hbwqG3HeEbQX7A9O2Uw7PX5eG+xU+kp8EcALj1oxOv4/vZbkaK0F/c
	WIRuqsjcPZEkcor8gFWyXZEJra+6GycLudHkCE17qR+oyUJ//l8Rr/1/dJYB3YeVjc1lNU+l2FY
	ATX9TumqanlyzGOqQQG6QCH1hW3UHx42if3kRAhHgVbLMRjmrBSsk2GMOj66Ah+KrXgutja9SQ4
	iMc2Dk1+Ys4YzhfIG/f2wI62KfPNqkjRos5+TI0jHM3erDIYu2hIqg/IkL61wQZYlRI6t73LMrl
	BkAZWjDeQp4s7jjOlnclZLbJY=
X-Received: by 2002:a05:6102:2911:b0:5ff:d434:b507 with SMTP id ada2fe7eead31-6020e2cbe78mr5485366137.17.1773670565121;
        Mon, 16 Mar 2026 07:16:05 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2152a41sm1223428785a.43.2026.03.16.07.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 10:16:03 -0400
Message-Id: <DH49QO1Y58GG.2LRJUAR3P1HJT@etsalapatis.com>
Cc: <andrii@kernel.org>, <eddyz87@gmail.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>
Subject: Re: [PATCH] selftests/bpf: restrict ns_current_pid_tgid updates to
 target task
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Sun Jian" <sun.jian.kdev@gmail.com>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260316073409.4040-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260316073409.4040-1-sun.jian.kdev@gmail.com>

On Mon Mar 16, 2026 at 3:34 AM EDT, Sun Jian wrote:
> ns_current_pid_tgid uses a shared syscall tracepoint for
> current_pid_tgid tracepoint subtests. When selftests run in parallel,
> unrelated tasks can trigger the same hook and overwrite BSS results,
> causing false failures.
>
> Store the expected pid/tgid in BSS and update user_pid/user_tgid only
> when bpf_get_ns_current_pid_tgid() returns values matching the target
> task.
>
> This prevents unrelated tasks from interfering with the test, allows
> dropping the serial-only restriction, and removes the obsolete TODO
> comment.
>
> Tested:
>   ./test_progs -t current_pid_tgid
>   ./test_progs -j$(nproc) -t current_pid_tgid
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  .../testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c | 5 +++--
>  .../testing/selftests/bpf/progs/test_ns_current_pid_tgid.c | 7 +++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c=
 b/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
> index 99c953f2be21..e3938bb48151 100644
> --- a/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
> +++ b/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
> @@ -34,6 +34,8 @@ static int get_pid_tgid(pid_t *pid, pid_t *tgid,
>  	bss->ino =3D st.st_ino;
>  	bss->user_pid =3D 0;
>  	bss->user_tgid =3D 0;
> +	bss->expected_pid =3D *pid;
> +	bss->expected_tgid =3D *tgid;
>  	return 0;
>  }
> =20
> @@ -200,8 +202,7 @@ static void test_ns_current_pid_tgid_new_ns(int (*fn)=
(void *), void *arg)
>  		return;
>  }
> =20
> -/* TODO: use a different tracepoint */
> -void serial_test_current_pid_tgid(void)
> +void test_current_pid_tgid(void)
>  {
>  	if (test__start_subtest("root_ns_tp"))
>  		test_current_pid_tgid_tp(NULL);
> diff --git a/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c=
 b/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
> index 386315afad65..d02c182a7100 100644
> --- a/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
> +++ b/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
> @@ -14,6 +14,8 @@ struct {
> =20
>  __u64 user_pid =3D 0;
>  __u64 user_tgid =3D 0;
> +__u64 expected_pid =3D 0;
> +__u64 expected_tgid =3D 0;
>  __u64 dev =3D 0;
>  __u64 ino =3D 0;
> =20
> @@ -24,6 +26,11 @@ static void get_pid_tgid(void)
>  	if (bpf_get_ns_current_pid_tgid(dev, ino, &nsdata, sizeof(struct bpf_pi=
dns_info)))
>  		return;
> =20
> +	if (expected_pid && nsdata.pid !=3D expected_pid)
> +		return;
> +	if (expected_tgid && nsdata.tgid !=3D expected_tgid)
> +		return;
> +
>  	user_pid =3D nsdata.pid;
>  	user_tgid =3D nsdata.tgid;
>  }
>
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c

