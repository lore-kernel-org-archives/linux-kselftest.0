Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646D3B1ED0
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507534; cv=pass; b=CpiHrutm5GMfBlxwRVGiQ1n+S7pD4nfZVFpfhcYyKkCYBKCVzMVsUsSqzzW5zZ8Y1JM2lsuSpLfuPqlj6hhwaTKAETKXOyL01k4UiRAHNPD3wWNG264B+YIKDFULhoQt/3uLkXy5OD3VVCSXKOblRKtmrCbN7F9lhPR8rpvAzbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507534; c=relaxed/simple;
	bh=6xbLFFtqBJ01FSBulKyjDCamVJlD6Oqp5iYuAsl9x2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8OIdmkJS6MtXLnJOK11/f0IG+eLqTS9qkAe4arOCDbLg0asgzxofiZAwbb1zCBfL9IdAntvMeMarM14px0RwyfV9aUNqwkcECYSkSCq7fk4JKGeyHU1XNgBytY+Wmgvahgpya9fg0v6uOx3KEtZqXmXwfqQXmcDJcH28/kwgiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=toCfuY8t; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="toCfuY8t"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1384ebe7a10so1950363c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782507532; cv=none;
        d=google.com; s=arc-20260327;
        b=BXDSf6BSq/x56PtXHkbJAZhqHHMh/IZJW53iY3Y9Ho0W18YT0j6jABzyMJnHzCW1Fb
         Ym5Oqt9uvDepVQ7+DqTuWkHYASFy/BvTc9BEBhiDTr5w+ldmkX3FQZXEwO5Yh2K7pPF/
         CqyLnDLckGnWGIQdUElXeioYJyWVtvysLyXTFuFxW7zld/xm2lKOy+Pq66HgZIW6BE0w
         BZ1lsBh9p/rzsIwWyJe+KXQpZo8e3fRMLxmSpV8pXakGQ41lwoqV5ZOHENgk/FUTKw1L
         4msO4Silnsel0IsU+PVCZ/cG3XxdzjiULTx5Purfke9HoU+e7O8k655sfbnmA6HzaIYB
         hHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F8WYF+0x5GNVnLrxh0pZVzPZyopUV+zJjv6tx8gPPi0=;
        fh=KDhSHSgOTWL76sM+ythNEXyEb1s7VPJNV9XbhPDXmW0=;
        b=j+syWtreLmx4BaFpC+A/Fhzwr/LX2ujN+O39l7dQybuBz5k44EbS/sQxgzidieNH1y
         jFJMez0EWcWkOM9mBb0051GUfr3y7nJYi9HoXnU92JCYnL4y98+2xJxrwLVjJ67GTiNF
         VQoJkQTieoEN4DjdG6KOVITkO6pxfLvJWyCLaGAoAVa6qumy9TzXuiWo8xFh2+cMAilp
         K2GpW0KworCoJy+zNUdEq+gtaKByxknT/lNT6OI3RTrcaVoR9dijzOZ5xxU7shpJk0Tv
         VfV+6KV3HwMW4MB8X87vtTzc9EQh7dxhB+X9Gqhodw54CLn0L/DUd7pN7XUP9ePCUR0P
         sUWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782507532; x=1783112332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8WYF+0x5GNVnLrxh0pZVzPZyopUV+zJjv6tx8gPPi0=;
        b=toCfuY8tnZglDXvHih+sU5z8TlaYroWWJlbxW4++Z4MzkWbG+wTTygYubM1KAnQa2D
         oGylxxSh9C/i/m1/dvgb1LlrViqqH4m+5VRV2Ac1jND+AYIUJWMTFlN5AjnaAm3bVPCF
         3DbQbQTlPxiOXx6MqGsRrvQM+RHAI4WRovF+fs/xtBYQOc+13EkHlx6c5CVeT7WkBMRy
         E37qErtYCVS+doAw+QJWCD4i82Bmh8C394EO6grp6J5jr8UmitsdYnyqS1q9fIQbVAuK
         ep9+WIwKZ+MmlxzQXGef5WYTLI9alqZL06BA5aRJCH9epgn8sS4DoqXgdKVjkISZD6q5
         E0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507532; x=1783112332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8WYF+0x5GNVnLrxh0pZVzPZyopUV+zJjv6tx8gPPi0=;
        b=RrFYdw8xA9kXwu28mb52Wannkm9Y7DaAT0Thw+AEM24lBYLqaCKxQhDs87EaSvDr56
         9hHASh1sOFrWtVGMojdhSlpPBu9pGZY9kBsh2PokkLHNMKSZYcew/6XIgMzQAeddEf6B
         Il3rLemrALsvhlvkT5r2YYjgu/UhEJzRSppt6ZUonk+NfWNaED6hv+n3sbmhchUz+Le9
         jl5PR4mHD1p0skAawOsJ1z7zc0KVU+zELYc21po+alQugl31KclSSCLReruvVLvCJqvY
         /xpIBgV96HsJhjQh7dfHEHz3pSKMIM77Ntc4zB70wOsCOIpJEA6rNXAYEAS6lyLO2ZBx
         Y4IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TZXS+xUDzijEjS17Qq4QsLpqzk7D5R+4CjlSkO8vfjhQHTCAZte/R7y3NeaxswSSaNjT7EXugM9Y+h8e+IFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK2ZEfxdyGuc/HrZhJ9ae7M2EnvwZOCpFjQzLQXzhtEIA9Qd7
	JT5yig/FgF8JgI8FoerWdchawCq2iwL8pKMe4ockfj9GHd1ptYsGhDZ5bNssfBynb1Yorf0Lrba
	K3yx0UTthjgHSac8/JObWpjpyD81IjT+z6j60xIgT
X-Gm-Gg: AfdE7cktAFxGvXw7VZFcNdqgT+ZpQ3WEYMX6WbAFIsFy/9UMMkWuxvzhDN0A5UkRVoA
	u4bY77vNB9Wnx7seWq2HXXNM4AY1Bjg2V2jecG1ueQGdTPKIgcatAfO0XMuEiKAmoAx20e4Ngr4
	f2WZHjCcanbUyobdU7r2jvDzMhkvMV94vzw7H/8b6ghDOArxTM7IXYAEPDlA4PHwGGwAFkmOL8K
	chqXCuoTsbltP5y4YIeQ+SieT2eq/+6eVtOuLJo3nSB9p8CTXMdOAmABw3ZoqopZItgNZfccYMe
	AoLtd9gVBThKs29AyHITqdIJFug/MmAsyoV9EJodehZaFpXqbEs8X0trPqJTMZcumZEiio15RXv
	ZyKB18wGSvog3o9z9w5HwyvueSzbZJfeYkpjUhao=
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id
 a92af1059eb24-139dbb8bdb6mr5708446c88.33.1782507530580; Fri, 26 Jun 2026
 13:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co> <20260626-sockmap-lookup-udp-leak-v2-3-7e7e201c951a@rbox.co>
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-3-7e7e201c951a@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 26 Jun 2026 13:58:38 -0700
X-Gm-Features: AVVi8CeP2eiu_fzuvOztLhngiE1Tsu5qut2zHfev-g_7GKVOiJ1ehpzU4Kk_fcY
Message-ID: <CAAVpQUDULzZh58oKkRaYqgM9bRToGb7wHrzT+cZNpRmAtM12Ow@mail.gmail.com>
Subject: Re: [PATCH bpf v2 3/4] selftests/bpf: Adapt sockmap update error handling
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:37=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> Update sockmap_listen to accommodate the recent change in sockmap that
> rejects unbound UDP sockets.
>
> TCP: Reject unbound and bound (unless established or listening).
> UDP: Accept only bound sockets.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
>  tools/testing/selftests/bpf/prog_tests/sockmap_listen.c | 17 +++++++++--=
------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c b/to=
ols/testing/selftests/bpf/prog_tests/sockmap_listen.c
> index cc0c68bab907..6ee1bc6b3b23 100644
> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
> @@ -63,11 +63,8 @@ static void test_insert_opened(struct test_sockmap_lis=
ten *skel __always_unused,
>         errno =3D 0;
>         value =3D s;
>         err =3D bpf_map_update_elem(mapfd, &key, &value, BPF_NOEXIST);
> -       if (sotype =3D=3D SOCK_STREAM) {
> -               if (!err || errno !=3D EOPNOTSUPP)
> -                       FAIL_ERRNO("map_update: expected EOPNOTSUPP");
> -       } else if (err)
> -               FAIL_ERRNO("map_update: expected success");

Initially I thought AF_UNIX still exercised this path but it was removed
in f3de1cf621f7.  The leftover in family_str() was a bit confusing, so plea=
se
follow up on bpf-next.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
