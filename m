Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0337C912
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131476; cv=pass; b=FO1w6TqVFiWRSbW/R4a+RQflI1zuB0YL9D7koQtnUkvb1LbTk5YKYxm0+YLzQWWde1Qf4nrsm3HZvZBCwW4o1I8nJ0AAkVjupfo/RaniO6ey1Sezt2PwY2Ad401L7+XmlVTUZFzeGrlcVO+Y8a0598ElTdW7uc4sg1s2fLvjy94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131476; c=relaxed/simple;
	bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvCwLA6zmru6wTSLfbXo73Lwt266Y9cESHF5lGVApVjqFbFzIGxDHU8odtx72V+gdl3VxkuOG+hI3ZHQsUDALmsFVC6O17w3dw9kbE3kH+X69c5K6jvg8SPb//eUxBPM3pltsUeLU8GWpFK8TmQs0vyNDfESMkUbElWsxfyyYeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXYUFk+C; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXYUFk+C"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79885f4a8ffso6361707b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 05:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775131474; cv=none;
        d=google.com; s=arc-20240605;
        b=Vmjp5iEr3o7cUa4njjltI89Prqp5Oayhfmu1tZY2oOvOdzEPfecGhamV/Q4WM8WWrf
         uUFy6IcfN1wl7oF64ygFcazNGSjST1uiMIi01R+/XZTPDPr+R0s/SwGXMP7l8o/T9B6g
         rtmjaitRV/vNKab4hdV96Dun/nREjWkdKWUEzzmcq9fDo/5iB1fYIRsOsLYYMPRoEKzt
         Wg0qT4b2Eli4DDeAHwhfCdw1NBRDGmW2KFqEAE4hmMj2alqu9a02XkuCEfp41XhsbQ/Q
         m/ZT2P7kER2HJvqibSQ63zP4KvdZpZq1I/YNLuOcpSpHxGkVkEXDg74OueAQVh9ETMyG
         B9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        fh=Cg+P3R5llrfsipVCkBFjKm2lrWb6Jn87gCrkEOeAXHo=;
        b=kzTL7GA7Ihtf8I16cUK5Accoz1c1k1aVF+fayttopf/YNDK60WqSpRBYtGyf/YIw5t
         kUgUYtw0pIVUsOv3t69PzVrAbU/KqIno6M0I7ayLLmrjzTI/hjcud0I6ajVrjOFnPL2t
         7Ju4IoTmNKUmsmUVnSbWfwxrsUA97AwTFJyeQRg+DU5Yqwq2MDEZ/nkCXQ/ZFTH7LXNg
         QGYiHUozGAWkod/hCW/JaYf7FElM9Od6MpX3YY/W1vpwOd1VJVIWK5VvATI2Fz/ijStJ
         Bf27BMqPgebpUG4JdXQ5AyUzrRQydvF7xtXkVLbNmRmvvK3ulBntMxYPFIuHYsN1c67L
         2AYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131474; x=1775736274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        b=VXYUFk+CoDu8M8EaV3fM67tURl8pgvESG6Ln4kfzswHkFKtmFf2y9WIaLYryLL6rT6
         frQDoznSMtQy/JVUQr4Mterw+FbRoNPv0VaTkcxppimirTEbThZfjME1/DG3KBfnpsY9
         OZvshLk4OLJn589ecHkqFLSFic4YDbapAe8iMLCzhfU1qfR3y9ILZgOEEhoRXgWAmnNJ
         DCywUDKILlkXZZLGZ3Hi6t97Ye1GKZJLTkHY7ijgxcUfJToq9xwFzRsGRuaqfJfakMtq
         VNFEDW0OS9KYfWYQE/o5svSRvxh4z0S7etR2mnQkIM2h15jUtHaFJMwmt8s9MuxAMZof
         Duew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131474; x=1775736274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        b=jmiilTjQ37rdnOL1Qd1ZOBVj5E3psrVpBcbBFzJV1NEWZmYjyL7IJtTjU/jt3eNj9H
         XO1BuDHbQnU/EP6YywpYJXMF6IdijXNjmTaX6wCyNL5trryCXnWzlOz8m7ISShNhbNEP
         unyMFYO9dDXEJWiG5sWge1EBMofGAqQV5W+T93Pb0Gc6T4SlcoSIxPlcF4T9Sgw3nusp
         TKpccFeopfvhlUlkEU8hLXjJKh6Sn1An4amM4BooIixWhKhYcwd/x4QkoFfoONWPXGTm
         T+ytKrEV67rbCZXfmeEKEZZly4fw5jtW3ZkWVOwhM3fjDhss4VM3isOz5tdG40bhdAXl
         UUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmRqT5hqKUacGXzaFCR5n/Rs9gCc6f3HsBfR/Xaqu4nDf9pv2rCaDSESUvJ3s+olNYlWwZGg741hs7E0X3zQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL+iXGy7dp+EfQpjwfV6FQltoF0S1c/p1jpyBJxM8XV1s4TycO
	h/8qLDJV4iTswufZ977mrgm9zLcJjP6AflEjDe1VKovmmjFiuLRKJ6j/lifZIog6LGQTnaNZLkw
	y3ZDiKIWnFJbAcMBXFX/RYg/64IPCmGw=
X-Gm-Gg: AeBDievAmgUIYhxqeNh1JdUJ6p1sIAiYO1pjp451t44FxH9M3gS2YCoxj5jl5LVBOkU
	0rnMRkldp3cfB6Fa4Do47J1oqAQTnUocldLylGvXIvnu1pgExTdDa+wd1SHFVtNtxdTrOScS5AS
	Y/JoMdWMXliQGZB4PwJtDRuorOPJeQwH/jYARGyzA90kXgK9wNVgBUetkFUDzSXTmeFRleLIcf+
	mrTmV2+tUrcbXcWckLbM5hzjvnsuWZjgnrxioQD1e+617yHKsdtu2PBqrPm2fT7EEZKKFnIEfPv
	3AgeJx3h07dmgnQ8FWalu4monHoQGRoxMJe9
X-Received: by 2002:a05:690c:4b0f:b0:799:182:17d1 with SMTP id
 00721157ae682-7a212d172a8mr79902757b3.45.1775131474012; Thu, 02 Apr 2026
 05:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org> <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com> <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
 <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
In-Reply-To: <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 20:04:23 +0800
X-Gm-Features: AQROBzBt3iwuFhkn47HugLmDXoXDBifovZc4o_ihC5WPjxUjy9gSLkKhZ_qqgHg
Message-ID: <CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 7:17=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 4/2/26 12:13 PM, Qingfang Deng wrote:
>
> > What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
> > a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
> > package is required for the distro you use, or I may work around that
> > by manually creating the symlink.
>
> It's fedora 43 with ppp and pppoe installed.
>
> ppp provides pppoe.so, and AFAICS nothink provides rp-pppoe.so, and the
> pppoe-server is looking for a non existing /etc/ppp/plugins/rp-pppoe.so
> plugin.
>
> Before I mess with the nipa testbed, could you please double check that
>
> ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so
>
> should solve?

Hard links will also work.
Alternatively, if your rp-pppoe version is 4.0, you can use the new
option `-g` to specify the full path of the pppoe.so plugin.

Regards,
Qingfang
