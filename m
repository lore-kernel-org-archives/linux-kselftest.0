Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EE212F89
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259002; cv=pass; b=IabKdJi95GoImISzN7uz8vCHNbyUE9xCNNO1DKjh9iph0vxF02M8kmCWn4rrwfWjuLYYtJtjaEjBe8MzObrPuZyd4pRAyxI12itYqmp+YJJqc6J577kIPXqx0PtgUNPQIMbyo56XbdgPMoqM3xjvQoNExaOhH1O307RGa5rFsx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259002; c=relaxed/simple;
	bh=WeifkZ8waSG1zQ5SVkzx8LC9mIMj4IJdHzkmu1At7Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYmIMLkrNmq1coqIpUDGcPX3toVhmSUu05sMa2ZOdscfSEMkEkAG2tTAjKkTzehOpQGYFLwAkBz0Xm8AhKwbucSnqG08l+ZPWe77hxJCpq17DriNXqJNqgWe0kT1wbiLS5NYeG8Jgx0h6YIN3ymwwrKSQ+/YK4Po00g6VfYEzXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPh45LYp; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPh45LYp"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b2b01478d0so29129b6e.2
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 13:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787258999; cv=none;
        d=google.com; s=arc-20260327;
        b=Cb3sm9rjvwiJhGYyvNzZJstWWAy2WYg+218w1xfvA+WRvI7GFZRtb/2sGT73NdpOzj
         O3PoIeOLjzs6HDuIgw7zPwSMFO/3bE1LcHr2MLBcYDBGbrf1P51pqAfHPrdcSsslH7ZF
         pLyoWW/gpCsT+1KhUhm3QPXp9d8oGoJarukqvzxNbNg0EAEIBt1vtKY+fDrUBLyBdrl9
         PF0RJMjj1XjHEy4b7QRPj3sT1pJ+bhdHZZx826yl/0NVQPiIQjY5D2wFH26ZZdF1S78L
         1Qg7Vo1wl+A/7Jt1rIg5YmOOCbf6CCT0BI3CWGY1/3OCmEIuUOAiGWVFSpqDd+aAf927
         0ouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        fh=5f653uVf+8FSu+AWCwcwI7sd35zbDcjkiC5ImbA4FAo=;
        b=MHwWBWT3+Kaj8H2IdXBclc64DSptaZXyL/g6DmSbNvwldLVSzyXRQE6TjcGhh34gkX
         6PuBIq1SLjLSPSwMZ5vVhfHFiUuxNPKNuQ9d8kNt9i5U/3+Cr/km9XbVFeH7LAve9t3o
         6yJd1al2U4sKVA7nM02c+TM79IfNTtRH03ME7jBZakLtxWaV5KzbSgbdVn4WTO0XnMEc
         EaOrkN4fY48RptULUo7n+x2AZIFu+zYFiz9t3ews70FE5yukVYh7BCUa7DmXiXsvFxs+
         Ezkdg8+NPCIs18T0DrRCTyT59cmTiZcJ1bo3jnAnKyxI7mRcJoHB4UcznygiwWEFMRrx
         p3VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787258999; x=1787863799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        b=lPh45LYpk3JiBJ7KUt7AuvqNy3fRfYdc3MHtxaVWMViu0M4AXPWhm2tcy7lDLKYDPT
         IZyMC02bAMNme29XHhA+58aVCdXezOCxzpzK2pZFeI8Jy0YoCpsezDFQl7LUljANDoEi
         5PYgOlaS3/KWeuO1ceeKhpYBhIaSg479oajML1XI1N/9cCsHK+2cVWq0I1rYkNWXRC+R
         DEoKkjGEuiSaacR6TbGbBiC0Hv6FqR85T9UV/mdM70XUD0QqwGJaAx4L0O+WXlXCCz18
         Qfh3e2+6WkCcGh4azTj/Su8V3047jLCevheRuAcGhU2HrnphJ6SpCLkbmMeRHugHy+f0
         L6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787258999; x=1787863799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        b=Wzw4xH0e5pjeSruNFA09xUa2Zw99jOzFdQnxFasiNjZj1OYpi1gv/2ZvQ7JUiKU6JB
         vXu5gX5p8TgCbccbvfS4y1UAvN4uRhMWUV4CecPv43FsvcUQYG9l6k6J8jKt8cghy1W9
         UAij+ylvqYHWE2PrP0+OTX92OpNA1uP+lFaDePC+OhJni1q/9+LHWDClN3vnlVuwZ4fM
         CYsqHz5Mto+9+qAIH0fIm2t5HIYE0V3NNJztdF4VMxmRBhu0aq8hJML9xneVZ120Np7d
         mqQiTd4cBAUOSgd3f+G8Xuogysgctum6TA34ETrfgPsYUmzXYwLqvCU+Lx+RBmTAYbD+
         D4Og==
X-Forwarded-Encrypted: i=1; AHgh+RqyEUs+urE9VIfAbSF66gbnu+V6+sGh2gUt0uYnKd3kxOK3g/7+/LoA/75UPswyh5wPY/h+97r++ht48AL2gs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhzDQWz0KT0a5w9Wwk0fswbwp+O1KI8hJN1KflTtIWG9/jV6X
	CVlKl3rsdGfiTFOOlNJ2IhSOayqo6+6fZ8iIHP/4DO7FOLljFFzKh0/x3qZdDpHFB8PfYn+WBw3
	D6QN9OgmS+4PUu3Wbq5BBg3qCJZeKuHw=
X-Gm-Gg: AR+sD13/euMpEvPc2k76pB7kMmyNzLI7GO0vjnksQwDw/gYBGTanUpz/0iOt699oIYr
	A01U5cI9Zvm2MsVYfkeWS9qRcB+ELzlOc3kC+dAs09zP0ABfh5Baz4OOr16nbP7eT0rk9ijB161
	3JpuKsGNCi5f/CSiom9q+VgRRBrHu3CJl9jJMyL10X35EIeK7dCcwy/oJGo2sogAoNyEuUHJh/E
	cpAUtFW9LDvl97Uns5oD/9ozAb6jo6yG6yMtFBFT8jy3exObIge+lbET2X1sJqk9LuSLm0UKb97
	tBGsyl36bqU3KPnBb3Zi3EgMIsLLNHFpZMIgHgkcBu7q94vSeME88mpKOcQ=
X-Received: by 2002:a05:6808:178e:b0:495:f643:2785 with SMTP id
 5614622812f47-4b2ef459dc7mr601810b6e.3.1787258999047; Thu, 20 Aug 2026
 13:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org> <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
In-Reply-To: <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 20 Aug 2026 21:49:47 +0100
X-Gm-Features: AcwNN1UZ8BHLW-xlVhw8Rsj5Md0elven6hi7UKRdpaKG-ODdLl-u6nPmZ3yH5Bc
Message-ID: <CAGSyskXshZTuBwiOPzp1j-d3He07Sx9OZGqRq4k6SG_kBwuKMA@mail.gmail.com>
Subject: Re: [PATCH net-next RFC 4/6] netconsole: tell the target when the
 rate limit drops messages
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, paulmck@kernel.org, 
	davej@codemonkey.org.uk, riel@surriel.com, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	samuelcrossley@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:30=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> Keep the number of messages dropped since the last report on the target
> and send it to the receiver as soon as a message gets through again:
>
>   netconsole: 45 messages dropped by rate limit
>
> netconsole formats that record itself rather than calling printk(),
> which would feed the console it is currently servicing. Nothing here has
> a printk sequence number, so the extended header carries a zero.
>
> The timestamp comes from local_clock(), the same clock printk stamps its
> records with, but it is taken when the notice goes out rather than when
> the message was logged. It can therefore read a few microseconds later
> than the message it precedes.
>
> The notice rides on the next message the bucket lets through, so a
> target that goes quiet right after a burst of drops only reports them
> once the host logs again, and a target with ratelimit_burst set to zero
> never reports at all.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netconsole.c | 53 ++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 6d60a5188bf13..0af2e5b4335c0 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -50,6 +50,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/delay.h>
>  #include <linux/ratelimit.h>
> +#include <linux/sched/clock.h>
>
>  MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
>  MODULE_DESCRIPTION("Console driver for network interfaces");
> @@ -177,6 +178,7 @@ struct netcons_userdata {
>   * @sysdata_fields:    Sysdata features enabled.
>   * @msgcounter:        Message sent counter.
>   * @ratelimit: Opaque structure to ratelimit messages
> + * @pending_drops: Messages dropped since the last notice was sent.
>   * @stats:     Packet send stats for the target. Used for debugging.
>   * @state:     State of the target.
>   *             Visible from userspace (read-write).
> @@ -221,6 +223,7 @@ struct netconsole_target {
>         u32                     sysdata_fields;
>         /* protected by target_list_lock */
>         u32                     msgcounter;
> +       u32                     pending_drops;
>         struct ratelimit_state  ratelimit;
>  #endif
>         struct netconsole_target_stats stats;
> @@ -297,7 +300,20 @@ static bool netconsole_ratelimited(struct netconsole=
_target *nt)
>         if (oops_in_progress)
>                 return false;
>
> -       return !__ratelimit(&nt->ratelimit);
> +       if (__ratelimit(&nt->ratelimit))
> +               return false;
> +
> +       nt->pending_drops++;
> +
> +       return true;
> +}
> +
> +static u32 netconsole_take_drops(struct netconsole_target *nt)
> +{
> +       u32 drops =3D nt->pending_drops;
> +
> +       nt->pending_drops =3D 0;
> +       return drops;
>  }
>
>  #else  /* !CONFIG_NETCONSOLE_DYNAMIC */
> @@ -345,6 +361,11 @@ static bool netconsole_ratelimited(struct netconsole=
_target *nt)
>         return false;
>  }
>
> +static u32 netconsole_take_drops(struct netconsole_target *nt)
> +{
> +       return 0;
> +}
> +
>  #endif /* CONFIG_NETCONSOLE_DYNAMIC */
>
>  /* Check if the target was bound by mac address. */
> @@ -2554,6 +2575,34 @@ static void send_msg_udp(struct netconsole_target =
*nt, const char *msg,
>         }
>  }
>
> +static void send_ratelimit_notice(struct netconsole_target *nt, bool ext=
ended)
> +{
> +       int len =3D 0;
> +       u64 ts_usec;
> +       u32 drops;
> +
> +       drops =3D netconsole_take_drops(nt);
> +       if (!drops)
> +               return;
> +
> +       if (extended) {
> +               /* append the extended headers */
> +               if (nt->release)
> +                       len =3D scnprintf(nt->buf, sizeof(nt->buf), "%s,"=
,
> +                                       init_utsname()->release);
> +
> +               ts_usec =3D div_u64(local_clock(), NSEC_PER_USEC);
> +               len +=3D scnprintf(nt->buf + len, sizeof(nt->buf) - len,
> +                                "%u,0,%llu,-;", LOGLEVEL_WARNING, ts_use=
c);
> +       }

This additional message with sequence number zero in the middle of a
stream looks awkward.
I don't think we need to send a notice about dropped messages to
extended console targets. Those targets can detect dropped messages by
tracking the sequence number in the message header.
