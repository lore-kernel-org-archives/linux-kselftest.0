Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5F4D9F99
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608209; cv=pass; b=hSomJ35x1iJShzSn5sI7oR2woT/p/aPNuyAFs18MH0wIVylXtpd0z4HmFXwALp6KYDRa9/DYbTVr2iRxjss1rxFS3+/YtLsswLLToZj8gPRAlyAqYKtMTT/Zhg3tjBhFDR+rUh1pAclxL8csGCzR12GQ9cYj+olTAALNOCqfXc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608209; c=relaxed/simple;
	bh=4FCRUAOy4qGBOqPeEKjQNXGdyxQDtJohZrPEliiduGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+ZuURh0D7bONs2FRl+5MmTVH8c9T2M7vOhCxihn2iE0+71T36cjh/G1OX0G5aIu9LkI3/1fju0jt1hiyooIR2p8UXzbPEFdP/Gpsm05tRwobSgW7aLAWRn2a5K8RnCNqUYrLMjgSpww/nyP3KRMNK3Ev79ZN+An5+ep75vEO7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vcD01ljV; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vcD01ljV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso98315e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 08:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608204; cv=none;
        d=google.com; s=arc-20260327;
        b=TjUhb9usipz6cpuxTFEFULRwxjEhu57XY2dWF2ciYsJF6L6arezwMwMRJCeT/j8e5v
         Lqq2ufGfqDGnjVyAQ5UE11CrRWGNlnISe6ktzvOX4iWMo5fyKmO64cd/UTq0j0AqIVo3
         /TVR/4Yrlu0awIp7YDcgSyGPAwPzOW/ttbKT/zmYGPz1TPywZk9PFSolusbXCPAjWa5R
         LA5W1GhwmMRegA/5SWmmyQrS2Rvh8WAL0oqU2480sdewkMyBHPkNlM2wzWMRzDhRVccV
         fT1BgD+Z/ml0xwcv6noZDAgmMWcgsB6w3AXJXmJsk3t9FkfN+COjoTRngoXta/1nreHS
         ZwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        fh=9F3a9DMfG/PbQZXloitGh9Ab8Qwbd+4TqeYImsAedZ4=;
        b=dqb2GmsJ32RP//dHn2sfbpq+f3SNzackIs5cC1I6tpnoin7h0I341jgR45Tcpfpuwk
         Fli3bEDB3nupmqcDYhfmuBGVor4c3tKV59wwTfYoblOhxncTGGHIme0BAUXNxHN1c0Uh
         Ajp2h/BFJcm0SkPmAn0g4X4r9gdXYujyzO80aLx7xoV+MYIeuBfZQFDFKPUjAuBuYgu6
         2euTjhY0Gw/MpgC0TzWuT322bK7/QSy6Wj54UpRViIYdkbpo6wPhXjHSj5CWXmsjcytb
         9yRfshU4Be/oR3pIa1dzYirDiySVLc8Q3/aOUYuGjP+7OEr7i66lDLqAKxwdy4k4UgKi
         dPow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790608204; x=1791213004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        b=vcD01ljVTnzDGl70Y8e0CSiQ9y0wIOrAootNzIkwEEMcYlvk+3+R4y+g1KLvafXUt2
         vTllTS31s3X/OvCoVmTGKUCiRBonRh2dnjj192BacWrPq+L+FMbGfO7vCgDvix7PSb6G
         jdu2A5QvD9cUiUSVeT254vnw/dRXJdoUKU/5sMBchmwP6bzf/Inn6DtKak3Qc7pG2Faf
         yZkt3jpNdn6w4eGnTdaCnRx8bmjPTjDr9ZhLQRBm4h2e4q2+YTxj638cvrnAH8xs6VSo
         aHNeR0k21IHr78aLDbXe0V/jI0YzCdYqs6anfe1Mmat0M3HP9HEYNRzYPvQapltj+Umm
         gs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608204; x=1791213004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        b=t9K/RbWaADDdU7ed66kykVQjS3t48XX5nfFBLhJF9OXN8p0e9xVD0ER2/ar5Q7a+Cy
         xPP3PcuyEUEahwM3nrOhas3LkhTfvpmwWLCGfdZbUyza2ILCv6TSoYDcR7rdaErQULXd
         38T9wo5VvPmRFJz19ahJKbUkeMhD7hGPVGsvXmljfQl/xhb9YEtgWxrhr8YfIUCJRHhQ
         /PpKf8WAkiqfq9KhWVManxyPCYicfNe+OvTwyEBI6ZWeXkmrqA252YmsmIWg25KYh7B9
         3gsnQI2622cIQXLVOpwGZZEFU/sq4dmvKsacFDR0Sw8zY+8lFpm5p7pAFupnxIzFT27R
         nSQA==
X-Forwarded-Encrypted: i=1; AKwUvBwlfBVkzZWMQYbkHRFxhlE55SdMWAY4VoPaJGKZpskNvRV5BWzbDiA+myIC3ykpu86ihRhNvh43h7plXPia28I=@vger.kernel.org
X-Gm-Message-State: AFuF++lwIAaIE24+t5BySo3E8PTIL1qdVKM9PFmBvlrwY3Fj46wzqW1k
	NNdbgqLCG6bP4wdnqiVFuQXQcZiFCgfdf0D3GnA5qFEeDfPFA7QP9S2Q8opeeNUjU1SNgprpVHn
	w8dKwPVWDx3fZZYTF1FL4u2B78ZcpzinlsP2tHiRB
X-Gm-Gg: AYBFou2oz09Nu/McMiScCePx9kyakOukwL2JbcMbnHRI2yFGzddl0dT8w0+lCAKhnni
	yvAzkPMSplwxbQfDCB85ihwlx7X9wbenEPBHdNrp09zh3z/S/wuvvE8PedzLOpCA2Iw1kKBu5qf
	GofFFvb9JMTmAQVndRwRuUF/jXE/0Pp4URpFb7vEBXWqvb0amNBbOWKFPaxtZPsnw07ry/SFXJt
	V6Jx42fQLR1P1slYNg6x+ujmAnKGAYNetb/rhBNWrd7G0dfTnoahGiwzn9FtzVnuk6FormmYSZY
	Cn3RTdbSuTphE1LDz2neZ7Wh/MotDy3qXuwoYpBB3j+zPGUTo0gIOzofX13xdzOT5C/uOXH9Dwl
	pv9FVtd584WPUWdk7RZSL4Jk3RoyJaglkeZ6ykN7DDGkv4g==
X-Received: by 2002:a7b:c049:0:b0:49d:21ee:1d7c with SMTP id
 5b1f17b1804b1-49ff9060be0mr2197165e9.14.1790608204011; Mon, 28 Sep 2026
 08:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926054205.28933-1-sebastian.chlad@suse.com>
In-Reply-To: <20260926054205.28933-1-sebastian.chlad@suse.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 28 Sep 2026 17:09:51 +0200
X-Gm-Features: AclHuK-UI-y0iD6O63glrzneLIs_6v53JO-jYanPzVVSviUMa6FZaP0zTiAkdhs
Message-ID: <CABdmKX27xqreLSwf0u7F=abmVNEKhMFj95WjJVQP=+QZsWH5WA@mail.gmail.com>
Subject: Re: [PATCH] selftests: memcg: Don't hang in the inotify tests without IN_DELETE_SELF
To: Sebastian Chlad <sebastianchlad@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Sebastian Chlad <sebastian.chlad@suse.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 7:42=E2=80=AFAM Sebastian Chlad
<sebastianchlad@gmail.com> wrote:

Hi,

> test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
> wait for IN_DELETE_SELF with a blocking read() on the inotify fd. On a
> kernel that does not send IN_DELETE_SELF for kernfs files and
> directories, the read() never returns and test_memcontrol hangs until
> it is killed by the kselftest timeout. The remaining tests do not run
> and no result is reported for the inotify tests.
>
> Wait for the first event with poll() and a timeout. If IN_DELETE_SELF
> does not arrive in time, report it and fail the test instead of
> blocking, so that test_memcontrol completes and the remaining results
> are reported.

But this polls for every read() through read_event(), not just IN_DELETE_SE=
LF.

> Assisted-by: claude-opus-5-5
> Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 0ed82347044e..c00420acc9a1 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -11,6 +11,7 @@
>  #include <sys/types.h>
>  #include <unistd.h>
>  #include <sys/inotify.h>
> +#include <poll.h>
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <arpa/inet.h>
> @@ -1655,10 +1656,20 @@ static int test_memcg_oom_group_score_events(cons=
t char *root)
>         return ret;
>  }
>
> +#define INOTIFY_TIMEOUT_MS 5000
> +
>  static int read_event(int inotify_fd, int expected_event, int expected_w=
d)
>  {
> +       struct pollfd pfd =3D { .fd =3D inotify_fd, .events =3D POLLIN };
>         struct inotify_event event;
>         ssize_t len =3D 0;
> +       int ret;
> +
> +       ret =3D poll(&pfd, 1, INOTIFY_TIMEOUT_MS);
> +       if (ret =3D=3D 0)
> +               return -ETIMEDOUT;

This mixes -1 with -ETIMEDOUT. The lack of consistency for error
handling is kinda weird.

> +       if (ret < 0)
> +               return -1;
>
>         len =3D read(inotify_fd, &event, sizeof(event));
>         if (len < (ssize_t)sizeof(event))
> @@ -1678,7 +1689,7 @@ static int test_memcg_inotify_delete_file(const cha=
r *root)
>  {
>         int ret =3D KSFT_FAIL;
>         char *memcg =3D NULL;
> -       int fd, wd;
> +       int fd, wd, err;
>
>         memcg =3D cg_name(root, "memcg_test_0");
>
> @@ -1701,7 +1712,11 @@ static int test_memcg_inotify_delete_file(const ch=
ar *root)
>         free(memcg);
>         memcg =3D NULL;
>
> -       if (read_event(fd, IN_DELETE_SELF, wd))
> +       err =3D read_event(fd, IN_DELETE_SELF, wd);
> +       if (err =3D=3D -ETIMEDOUT)
> +               fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
> +                       INOTIFY_TIMEOUT_MS);
> +       if (err)
>                 goto cleanup;
>
>         if (read_event(fd, IN_IGNORED, wd))
> @@ -1723,7 +1738,7 @@ static int test_memcg_inotify_delete_dir(const char=
 *root)
>  {
>         int ret =3D KSFT_FAIL;
>         char *memcg =3D NULL;
> -       int fd, wd;
> +       int fd, wd, err;
>
>         memcg =3D cg_name(root, "memcg_test_0");
>
> @@ -1746,7 +1761,11 @@ static int test_memcg_inotify_delete_dir(const cha=
r *root)
>         free(memcg);
>         memcg =3D NULL;
>
> -       if (read_event(fd, IN_DELETE_SELF, wd))
> +       err =3D read_event(fd, IN_DELETE_SELF, wd);
> +       if (err =3D=3D -ETIMEDOUT)
> +               fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
> +                       INOTIFY_TIMEOUT_MS);
> +       if (err)
>                 goto cleanup;
>
>         if (read_event(fd, IN_IGNORED, wd))

This IN_IGNORED case now fails silently while IN_DELETE_SELF prints a
timeout error message. What about moving the error message up into
read_event? That would address the comment about inconsistent return
values too.
