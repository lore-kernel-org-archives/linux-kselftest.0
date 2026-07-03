Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E12BCF46
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047708; cv=pass; b=GsnqrAKMt9qE2G6LwgYnc7IU2JgKe1S8HSRXBbmJ1JmMvFanOzs5KZ9jm8D5JGpaCUcpZ6D7eoni1QKXXganMyhkBqC4/+iLrlCTetkiCQDEB2pF1bxtt3riSybBqNFioCCU6QY+ZpPQHv0lZ9Kbi5d6rBfedkbknrefLpwIluc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047708; c=relaxed/simple;
	bh=hivGL9AEjo2oQ+VmtRa/AUjK5mSGrBhvAddhpm5pdn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYHkjIFVgvxrwXnXJAsPAbb4ixcebnPQ36+tue4JFVJ6aBsl4lq5DdhwHLxXkd+9N8vtGWTsm9VHbCq0zyqC29d4a6vw6yDUmT+hMhe3QoYrP7lkXvydSiKbgyyGCFEeSfNP+q0PiFeldWZQkNFIClbL+pfV0PhZi+XFHuG/xPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrihwNDt; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrihwNDt"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664c1cf7445so149347d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 20:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783047705; cv=none;
        d=google.com; s=arc-20260327;
        b=inUWrALiDsCHPuKy63g9xDzii6+92Mq+VLj15TW52PlRQZX4g7m/7hSMlWZs/pEW8u
         BTeMAySdJMwaGivphxgXeA9PDGDzEqvAZhk/px0PoDgtHYSMDIbShhxxlYLoitK0RI+n
         WAUcGsRv9ge+qanyRnRDcZKxWExkxk2jBnR5QQaOrT8tdutZ9M8KAmM7MpXnDv6BVDb1
         YafuANKUh8VwTFg5ciNmLU/VrxTEJrQO3HM9k7rBd6Vo5rLaUWgNbqRoyhkhE4+9JIRg
         yL1GCBQWohOzbx7Zbk9SzGoRypfi0aDDp57byXB4zMwj4H4KDVKAn+LyDPgeb08gUah/
         v52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pNTMkXqJHQWS/3hJYtcFCJwiq85VgF/d51n42Tox34=;
        fh=CafCMrPoglWtEosE1IsUlyruGyIWuRwTvm4LO1WVbok=;
        b=c7TlajRJ7AbgiKq88DyqWE/Vtx4O5BEAarJT1pz5G9ecgbYRYWTnofdX2a9fX7WrhD
         pqtHl5cwgsa56z4sAnArfFyG9NwnSag8Xa55HJlIFUGwRSSpWQeFrNrwrTZXok0YhPGL
         onjcsCy/aDdWIq3HopUOfKuJYDVAtO8E6bIJXK15NG+FxXrRLwmSePJFey7f8HtwD7WM
         gttABV5ErmjDf7zM2CBRp4wbBdxyNaVGEMnF3EPrG9+8mYwyYxbsbhBCvfRLJ+16NK8j
         gF6/nZMy0thsbqkUzZ6bYeo1zSNQSIA2U7dG5QVVPu9YcKLTV2K96tE0jOqHs5X0msmb
         jq6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783047705; x=1783652505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pNTMkXqJHQWS/3hJYtcFCJwiq85VgF/d51n42Tox34=;
        b=JrihwNDtIxP+qKXqOKWiB5eVCobUpVroB+skxXYMg3byWxfvuTA6pflgRHHxWkzvAf
         iDDA6GXAP5zNQjZdJ2CMCOy8I3Mg/EVloZNo/5OPkMMqmLjPrw/XNVTWvLc1/KNpTRQg
         wz0YtVPPlWGFiHIqeUPewUbreTGXUFinBoBvI9JgmFt/zttQ4wWO4CNiWuMG81aKGfpU
         jE6oH18gJAa2yz0j8TCwAFbM2UCHzPVVgVkLSm66Th9n2EcLuiEDZw+B8AR2uOkkQpwZ
         6khgyrr2NF63lrMVZ03Pjctpru2oORGE1BfVX9ThP9qD9U3E50XEeEJVjr0ZdHcMvKNb
         BSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047705; x=1783652505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pNTMkXqJHQWS/3hJYtcFCJwiq85VgF/d51n42Tox34=;
        b=BJoyyVbdyQyzI75sn/HRtrh0vS48swLJ/x5+y+nG/g0Zse0Izj3yLO3IXxquXoLKpS
         DyDcAp7b8QTOwfns3vDdYMyAuv5HXVgNTMimI9MMsEgb8JShAr6GC5vmBDtZiqJ33oYk
         2qXMise8cNsXS8syQJKk8HAJwdGnBTkAD5oxtzVd7KUtcf7YQXqh8jywUyyHEMAJXTcD
         vwIsYnwARxdH7EPwMn5S8VuztpPYGq2xmUejKBZU4EG5dTXG5w/iMkbiGZCMXG+ZJX1J
         cI61ynNLSLAeT253Qr7pzfylYcnjnjIt/RpX1YjMiYlKlfFHIya1E31ZmspqlQFxj2VV
         pd8g==
X-Forwarded-Encrypted: i=1; AHgh+RrL5GvKoKPy6u2ncxeJks0dXOUoNJbtI7JKNTt67yZiFEzXqiBiAPTHzo2qTefmbZhfna0cgDZAThSoJMmG5Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwOpZAdIzbt6hw3ZNPWAa5TBrbCnpfmCzZEuCRixq93RuZlmbr
	5K63hPp7TTW/OdfPk9NiY40JH6Bv/TeTCVcIyelVOwXSEhA0v7GHv4lqca+adq2yco8kk8VWLyV
	1iMXuygERh0YwV7uE4M/jhnqM7ChLr7y+0vch/xw=
X-Gm-Gg: AfdE7cmzvRfYTOynhF7+33UtqbYmAbye4Ua45buGZ61Ea22HZHrGWjqWlRriN2K/3SL
	JZUWwNAFqvm/Zs8dWSI4AvIVFqk8rJ4ptqgK9TbRWy8r2LwsHdG2dhNNmI8vqMguu8efZY9Z9jz
	85bEHYxptMIRWSx0Dq67QLr/pu80i06crGDMWnFHihnJI08La/goybuhRJq7xnlxZxCLbRQ2gFb
	mHN3uvn1dCaequsUJNqr3b+UjHsI1GxxALGACkOXV4MsNDiI8rr5fu3ZsiopK/3g6AWRIY=
X-Received: by 2002:a05:690e:4501:10b0:660:e9ea:17dd with SMTP id
 956f58d0204a3-66521a0f41fmr6219019d50.28.1783047705519; Thu, 02 Jul 2026
 20:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703025247.940055-1-wangyan01@kylinos.cn>
In-Reply-To: <20260703025247.940055-1-wangyan01@kylinos.cn>
From: William Roberts <bill.c.roberts@gmail.com>
Date: Thu, 2 Jul 2026 22:01:34 -0500
X-Gm-Features: AVVi8CdJqLnqBKgtM-g-1LvQckP-amZ89lu1eWViecYCLlzrwaKA6-ak9naLr9c
Message-ID: <CAFftDdrDgoHCopx9byaupea8GB6P=qSAY==6QQoXSJcJgn_04w@mail.gmail.com>
Subject: Re: [PATCH] selftests/lsm: Fix memory leak in attr_lsm_count
To: Wang Yan <wangyan01@kylinos.cn>
Cc: linux-security-module@vger.kernel.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, shuah@kernel.org, casey@schaufler-ca.com, 
	mic@digikod.net, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 9:53=E2=80=AFPM Wang Yan <wangyan01@kylinos.cn> wrot=
e:
>
> The calloc-allocated buffer in attr_lsm_count() is never released on
> any exit path, including both the normal return path and the early
> return when read_sysfs_lsms fails, resulting in a heap memory leak.
>
> Add free() for the buffer on all return branches to fix the leak.
>
> Fixes: d3d929a8b0cd ("LSM: selftests for Linux Security Module syscalls")
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  tools/testing/selftests/lsm/common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/lsm/common.c b/tools/testing/selftes=
ts/lsm/common.c
> index 9ad258912646..4fa8310750a0 100644
> --- a/tools/testing/selftests/lsm/common.c
> +++ b/tools/testing/selftests/lsm/common.c
> @@ -76,6 +76,7 @@ int attr_lsm_count(void)
>                 return 0;
>
>         if (read_sysfs_lsms(names, sysconf(_SC_PAGESIZE)))
> +               free(names);
>                 return 0;

Did you test this, let alone even compile it? All the C code after
this return is dead code.
Please ensure that you test and compile your patches checking for
warnings. Sending
untested patches is "spammy".

>
>         if (strstr(names, "selinux"))
> @@ -85,5 +86,6 @@ int attr_lsm_count(void)
>         if (strstr(names, "apparmor"))
>                 count++;
>
> +       free(names);

Do this instead:

         if (read_sysfs_lsms(names, sysconf(_SC_PAGESIZE)))
             goto out;
         <existing code>
out:
           free(names);
>         return count;
>  }
> --
> 2.25.1
>
>
