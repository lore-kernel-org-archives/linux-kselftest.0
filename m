Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B3D212542
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114284; cv=pass; b=Hni/uic/IV9HHnzNVWEAPL5dXymi5JhJDxFuzxchDLsajz1bvlZOCa/wS8/OzIBqd9mqXJHjIrkOiAxeGVKCx9WQE3czCWCH71c+kt9zRxQSU6YXSgKPu8e4UWiKS1MVMOjPwO9/UTXphXBahyXsrahAl3OKMdz71u4UBXRvcQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114284; c=relaxed/simple;
	bh=8A83G6YImYKj65RHthflqBgXis4k9f4oqy3yFwoZPtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4dhPAUu/y5VWBI9ILysum+06Njp72/1u7PBagVRw5IkgMCGeSqtBmx9a57gmA4Q7F3UG05YTlWWeT9Ih9zFX+04G0pMHBrefa0Ckbh6HJPD1OlEYxSs9qPRbsTJ47UPItlLOJtK8Fns/VXvezudyaFAsOiFxb8BzvYcya26C9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jOYAh8Jo; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jOYAh8Jo"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1363e78746eso11223053c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 21:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780114282; cv=none;
        d=google.com; s=arc-20240605;
        b=dYX0ZZJ6awPCUZAqcIyLnP8uqzthKlOysqYU/e2l1gbKH528KbGb7QpdYzGm9o7JGa
         ejCojbNETH6OQcTb/YyUctkXazAW+jDVLBsrP4kugYHuGiWAzSUL1wos/hJWFsbZxwSx
         Ixa3jUJlfEsQwIzCCJQXJxzQysUksJrlgtkFJbLRKuJLqrkPLTpzz9gBh8ALDGf1G4Ze
         +Fq2MkBedDUf7XcORJuyZh7CXuwWOF8yt5SfNf8PTMg8b1HcS9Jho6WTZor/dceK/sAx
         GCEhpHfzzzjzlynUzhv9lMGyrapbQiS/rIBYUqmW/53WqszKz8MBUu9eayERZATnztuz
         x1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lhXDZe5HipJJsdvyTs8WRQPvcFgQOnMz2fCQxwZYhDE=;
        fh=NMNcicYc8fXamqHDav2qzDpgzSmf0doFJwd+eKEy9kg=;
        b=Dkxct90pYF1u58apZimInjBsuD65l2fVVHKH8OdrH/K4sgSJQOR6K/YOgfiyf71dh7
         NwA1RUsRk5+nJs2DQmkTjpD/OIKsWv01Pe2XzqIie84zKsCMz37450tClLgBe4sHc2eC
         eNHyCkpumODjXrIYwQ7c9pu6CRlBbRWYddF+RoPagjfKPJIkKQuPFi9w3Tuzrh+3EtOn
         20BBqUnpeoZbNn71gShy1CyzEczjg07eq16eQ1wmhWtfGwjAw/qTL9bC+kxGBRoC/NmF
         1MYtmUwxyHad5pxvy3PWUagPZtQYM9Ogfe30opVOPrvoq5Si5w7M987Qd+tZm98/O0WN
         ssOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780114282; x=1780719082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhXDZe5HipJJsdvyTs8WRQPvcFgQOnMz2fCQxwZYhDE=;
        b=jOYAh8JoO6YRR5HtQf4F1I+Sonc2we0bHpKpR9oBCtWjurVdpsaevj0u7Zmpf8bpum
         BmL4zOUc2JfCa1ZopiYAvFVPNIqoHprltUiAlafXPUgitknXQRPLh+nHTQvlJgN+tBFv
         1+GY4kbM7TAE8PnjNcB4JFzwirsiUDm+hdsbrC97hdkKtLLTv70I2EgwoDmQaJxbjGdM
         hWGdkza7HF/adN6J8l0+LwZDSPToOW/E72FzVHaHwv233XX9MnpK99VuIt1k9QCGbozW
         F93Ypx3kxfnamB3ChBLqu/rxYnu/YrY6oosqozcZJwV31JLfqH5JNFsGGjwXEieuTunN
         SSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780114282; x=1780719082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhXDZe5HipJJsdvyTs8WRQPvcFgQOnMz2fCQxwZYhDE=;
        b=A+VPeQlHETj+C8iBwE1yrrgh5YUHo8+frRu+4MdFF6i2Senywc+DeTtygxh4sb8hmk
         s2sfCYgob8RHWkzPwY8q55QYTAEUOH+gV9mScWra8dde8upWQu3LiP6dfdfVx79t3YIX
         UM7K5oHYHMmLkn8uoFRwXjfEd/CoEhVHX7dRF46ih2UotBMGgz7gu97NA257VgR3tZmT
         70PiBAyohRTXsENDCQ499MtzRoPaHhSEHyexpBkbt1U9eyNi6JuYGHskS9G/+uKnsCZS
         YOaG7lhmzLLb5IhELjxnvMc8gCpv3HKizK7RXWOeBvMU89l2YJuUNww7lqaTO24AUj4J
         HWwg==
X-Forwarded-Encrypted: i=1; AFNElJ8DS+5WVYtatxIco8tVbdfrC8MrCOfKTdDXfYtZ6zpVJfyXFP+9WFtdU9oakbToFnsLWDsithWvcs+FAddUK0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lmYmdYXgwP4VLOUPw7Fzi+ORIo95s1nnnynDRLE5DhYqILnP
	5rRW9o6PFOsMDxKbBcCp3BfJP3F4+eKNzbieiKKQYqtjKNDd4Yma8YoJ+EZg0mObwYSInCY/I7q
	kcVi5h9RicrzKYZoc1/qSKFkcEB4xjjmLLT3ewCzqIA62jC03vuTvM5Q+SIM=
X-Gm-Gg: Acq92OGhIHyjtWD/T/8avFfjM1tArHUXA5SGTlL8X32mg0v+MqMBuERRYOcsjKmnGuL
	tiEY/Le/R6BNf7FNAn3qMOssPcGyEh0BGDupaFOT26htGoKKZdMwh4duUxa4viLLtYqOJs2jrcj
	SJJ1Pcn+LYQ05A3GNafcZ+LNEzZT6QsRetetatnVVb61A9qv/aySzg2Xiv9AYVAVPx8kX7NqY9D
	W0XHD8VotsEytdWNiKWxqIA0yYZ1Qm6kFS7zBqOTj2ZzMJiLkJmc8r1RpQDpBMGVdWvWIY7CNjx
	h4hvKRjfQLhQoOKblw8C2Cjws5C4dWLlE6ge7wkFtQnphXhaD1f7IC64SQBBmHARY5RyVNyUic4
	1rZvFJjlw2Z0Y4q8ZT5ENGZ6rot4PuXRgfr5RVU2NntKNAx+NriSwloKyxALrB5c=
X-Received: by 2002:a05:7022:2513:b0:12d:ca31:f1b6 with SMTP id
 a92af1059eb24-137d423c4c5mr1067186c88.18.1780114281454; Fri, 29 May 2026
 21:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528081919.841-1-yanlonglong@kylinos.cn>
In-Reply-To: <20260528081919.841-1-yanlonglong@kylinos.cn>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 29 May 2026 21:11:10 -0700
X-Gm-Features: AVHnY4Iz8lG5ukGUWde2uClEPGIzNcepw9wlKp8bQtuGKSGUEJBppPYKntA_7cc
Message-ID: <CAAVpQUBBsOxHjxaisS9Qf4VdxSb6TbLT2HaAE5cgsC3HQ4qohA@mail.gmail.com>
Subject: Re: [PATCH] selftests/net: bind_bhash: fix memory leak in bind_socket
To: Bob ynn <yanlonglong@kylinos.cn>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, joannelkoong@gmail.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:22=E2=80=AFAM Bob ynn <yanlonglong@kylinos.cn> wr=
ote:
>
> From: bob ynn <yanlonglong@kylinos.cn>
>
> The getaddrinfo() call in bind_socket() dynamically allocates memory
> for the result linked list that must be freed with freeaddrinfo().
> However, none of the code paths after a successful getaddrinfo() call
> free this memory, causing a leak in every invocation of bind_socket().

Note that it's freed at exit().

>
> Fixes: c35ecb95c448 ("selftests/net: Add test for timing a bind request t=
o a port with a populated bhash entry")
> Signed-off-by: bob ynn <yanlonglong@kylinos.cn>

The change itself looks good, but see the thread below.

https://lore.kernel.org/netdev/20260525125408.2bb8783c@kernel.org/
---8<---
Your email address seems to indicate that your real name is not "lazy.."
Please repost with the From / Author and Signed-off-by lines containing
your real (some approximation of "legal") name. Unicode characters are
accepted.
---8<---



> ---
>  tools/testing/selftests/net/bind_bhash.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/net/bind_bhash.c b/tools/testing/sel=
ftests/net/bind_bhash.c
> index da04b0b19b73..2bd100777448 100644
> --- a/tools/testing/selftests/net/bind_bhash.c
> +++ b/tools/testing/selftests/net/bind_bhash.c
> @@ -52,18 +52,19 @@ static int bind_socket(int opt, const char *addr)
>                 err =3D setsockopt(sock_fd, SOL_SOCKET, opt, &reuse, size=
of(reuse));
>                 if (err) {
>                         perror("setsockopt failed");
> -                       goto cleanup;
> +                       goto err_free_info;
>                 }
>         }
>
>         err =3D bind(sock_fd, res->ai_addr, res->ai_addrlen);
>         if (err) {
>                 perror("failed to bind to port");
> -               goto cleanup;
> +               goto err_free_info;
>         }
> -
> +       freeaddrinfo(res);
>         return sock_fd;
> -
> +err_free_info:
> +       freeaddrinfo(res);
>  cleanup:
>         close(sock_fd);
>         return err;
> --
> 2.43.0
>
