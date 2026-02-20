Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C5365A17
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609445; cv=pass; b=Svj4ZdKAuOTh8SZIGrlrW2KbtL8l/Vgh3pyuWzvBubV7UDLUe4wB1k3cbHiDONWN50Vxq9oASALA7zcEpJQtO2H80r/zuGLSMV4geL9xxKStcbIm7XODpfS8l0tsxXqD6UaVORO9XgEtSEeQcag1T8v+ABgrv1a7O2dpsfdHh/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609445; c=relaxed/simple;
	bh=B4Z1qVLBCGWcijfUcZ0E5ZLSN2ZLUxfaTWpanT2cb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU8SPsGFvEtUgXF6kMEuurhOBbct2TqeRcNw2cIVNp3qBf0SmrqPfEqSAUeCDPVjxzCYp+o4XrcAHitQxIMekWkARVZMKesJ7JOSgqOQYJpRXo7gmpqpGcjbYdorVdohkvtQ/j1Isz7thP0oGMDYt4wH8vAbDqvS1RBlTISi+o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8fDZ5ig; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8fDZ5ig"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9080841899so22473266b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609442; cv=none;
        d=google.com; s=arc-20240605;
        b=bmcjZJvs8uxWyJOWq21sTvTqSBDkh9BDrq7EW0ce9o4GZ6IFjoHWHFtEX1bgMspV5V
         Sgu61HNQD0X447bmMvAIg8yNpGi+t8pnD7sxJfSyfSofffj1F9KEJRkKMfPA8CAm8Tfo
         dqy9FvvP4YR2MglVz2QRGtB4PaHIMKG9lufgKg0WezsYRRIHGBjRz+rMS9wJaxIYxsH4
         zEE1kkg1c4SnsaCN4uDuGCJUrl6MMfl1DJiBbp0shw4RAn4fLBHL2DhvY5wGpQdY2Q25
         d5xnOO6sZkuEGKAKAYsRKZeO1YLfhCBON8BrJRWNj9yk4BXAQfAg7ZOHcF50Lia7qD1o
         3+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        fh=CJU5+klA3Ck6Kfei+HJDNpjFLQyV3EUNnKd2n99lqAM=;
        b=ULdTiSCnStK4H6uMzlno4wo3hcPXyk8RgdmBgDSJPjkK3MI6C+Zgl052734VIg0pl5
         PL1JJhLf6hJkdBMAuuK9EexEr5IywGQ5aEWbf71exFUQvZJcA0upiSniU4pLT7Pu5syW
         RraeXJwmDaEmts4xACHNqPID3ORmnnTwmnuktPqaMz4+Mwbe031l1m6guwlgvPRVQrsd
         1OxrLHKTXK1xxQObBqoigAmFB/+JgNs/SisivzkHDCCTSjT/xKbFFCqqaBMIGo83DrLc
         51Q2iWF6+ZjLlmLZr2QkfUg6Q1V40EY36sdYcXR6horTUnMUChknpXAffG68eM+MzM14
         SUhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771609442; x=1772214242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        b=c8fDZ5igMeq1VUHwqJ58N5sonmzT3RIi9MFJ+sq+dD/OfYF4liIvkNK1q+DHN7apIT
         tK+thPoXY+FTcXvn7RFiZM1CxlIR4D3PAn2TceNc9G4pFNcnZTmXd+AbYBt1Wj9gO8lh
         JgDCQSRRh3MCr2/PKjiAjufAZ1O4JOeptJVOgADkv4OJGNQ9MHQzofbz058qkNHWmt+T
         Sp4OfR4IZapwEOduVev15bHZjjOMAZIRkyYvM/PCZxHHys5P3FO5OvJQnPPkxDPVHq6F
         RvZX+WC6GmmPzfy8dhz0tuRGH9I8Lwm0apKboYREKCyUlhItu0Co56yRAaDCiIFQgt4L
         Cn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609442; x=1772214242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        b=ipUuJcKLsxnz0u4n8M0g6wj1WbDYEVL2ZeZHAISHSD6UlAyIHvj+UkTXNIeaQ3KLsz
         SMnm8XvD2FzqjReWj1FaJ+Eh8hXzmSaCL+/Z/wMS2PF4i2Os95HisZZkvpSNwgCn19N/
         ghcbGeyfw3xtlAwA1aPHm2g/fyp3kqO90R24TvXubNZwKcy3jGv0F/TVuiDpwpwHKBiG
         5eCmvnfm4zbn4bjgyN3i5CZuXekPpz6onOxMujWxVjgQjNf9BCMBcyxrLgdILexbrpyO
         XG9NKInriefeH3pFa0FzElimDL997ri9+cfpglZIq+buPcowAuISHV9GmLYCQLdrfPur
         r1kg==
X-Forwarded-Encrypted: i=1; AJvYcCVrAn7+w6OxHYGUCohi3D6KinI/4/R0uT6qRCxtDjkejK1IDlRIJDcQwL996xuFK/ymi5LMT2eKUhlGHXTDFyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVFMVHBM2TdNWH7URPZYvpZuHhx2llxmqjVFi0WO/7WMyNO2Z
	NzejfutvcPkJdt/BQ2WhwzA7zYUe7rYmgzfZONEwFQ0mKCNSdAA8mKX66XrzO68yqDjDyV8fLRT
	EwJLbPY2E8ec3P6hmfZvFWJyJMeoQtXA=
X-Gm-Gg: AZuq6aLiNDIPrcWItAwAC4bQj+a8dVifLgMRQLPCWHd0oOrl5WuvTF30LDQwoinsTt7
	jXVWTBO4eMJgKqNmc/FTIjXCOy+C99e5GoLEX5wy1EyRlE1Hy0vfKIcPrr1c0UCI3tfVj9klXne
	GpJGW/WMKu0HJQ9IkKcpViH2LnLdzymU3bK3mWBoGrwTd6/Dl9cpSxKldihFuvNhzB29iDkaKAt
	8zn62GKThn4kIqbV6Flp6QxTQ5Ssb5gyxG4aPJB1DeW9naYnv/cNMkYtan/RMM51kh4LRqR4aFZ
	iEk9AG4KBUhfjuQD3tc2+3K8kHUrJBYakwX74IF9fg==
X-Received: by 2002:a17:907:7fa4:b0:b88:448c:be08 with SMTP id
 a640c23a62f3a-b908196ba0bmr21965166b.5.1771609441753; Fri, 20 Feb 2026
 09:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
In-Reply-To: <20260220055449.3073-4-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 19:43:50 +0200
X-Gm-Features: AaiRm53Yd2hoByeyKZRhB94VwnmInZ2nkUk-ViEeYttOzbObERE3K1f4CUtv2ZM
Message-ID: <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Add two new tests that verify inotify events are sent when memcg files
> or directories are removed with rmdir.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> Acked-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 4e1647568c5b..57726bc82757 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -10,6 +10,7 @@
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> +#include <sys/inotify.h>
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <arpa/inet.h>
> @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(cons=
t char *root)
>         return ret;
>  }
>
> +static int read_event(int inotify_fd, int expected_event, int expected_w=
d)
> +{
> +       struct inotify_event event;
> +       ssize_t len =3D 0;
> +
> +       len =3D read(inotify_fd, &event, sizeof(event));
> +       if (len < (ssize_t)sizeof(event))
> +               return -1;
> +
> +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd) =
{
> +               fprintf(stderr,
> +                       "event does not match expected values: mask %d (e=
xpected %d) wd %d (expected %d)\n",
> +                       event.mask, expected_event, event.wd, expected_wd=
);
> +               return -1;
> +       }
> +
> +       return 0;
> +}
> +
> +static int test_memcg_inotify_delete_file(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events"), =
IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       if (cg_destroy(memcg))
> +               goto cleanup;
> +       free(memcg);
> +       memcg =3D NULL;
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;
> +
> +       if (read_event(fd, IN_IGNORED, wd))
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (memcg)
> +               cg_destroy(memcg);
> +       free(memcg);
> +
> +       return ret;
> +}
> +
> +static int test_memcg_inotify_delete_dir(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       if (cg_destroy(memcg))
> +               goto cleanup;
> +       free(memcg);
> +       memcg =3D NULL;
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;


Does this test pass? I expect that listener would get event mask
IN_DELETE_SELF | IN_ISDIR?

Thanks,
Amir.
