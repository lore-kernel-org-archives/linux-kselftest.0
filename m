Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A3303CA0
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296849; cv=pass; b=BaDE/O821jZrwpB+Dhf3UlhXjtWwTCgYIrNfqviF9JKVJQ+K1coLHP09+g09B1IN6Il53aT2he5BigMH4d7OE75ihvYYWFqz5NpY98oXqisfpuO/rZsMTPZJSZX9lx8cKBLTHPtwYhtqwNvxVyp/HZ3dbxBNLFeyeIeicj4FDv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296849; c=relaxed/simple;
	bh=Po5VbDI3dsUYUexHvnvx0I8KnYPHdZR/pSpQyqf3bfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGM9RmxWChGqDd9BoXjbhqP9LVJta9h2rL23vU2ffeuiQu87l1U/tMyMo3IaC2bVlwDeJtBWLQ/auvOHmF1vNSBq1FMEwDKefUSYs9E+gAdDDFYdYKzsKU/1Tec4hcaP78kZSts42RQ+7lCmq49SkdHIRKSMrRgzJrbaLjuxWI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfFn0z5M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OrDJmEQH; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfFn0z5M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OrDJmEQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773296846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KA7MHHq5ctaVMhUhQrU15S9h10dJC9tJn/h4KcAT1oA=;
	b=FfFn0z5MVn+UMaeSOw14aBRFwvUus/xfb5DLNi/VNNMv3SWP27CzrtgdYW7JuMP+bP6mmu
	6dFRIpYJChmCTXZQg4CcUkXKsB5R/lP42bKSHDotQAPTUva2/5lYLET5nidDh/A0afxNFC
	g+jeZpqbVmp39ER/Ea6rZY+eyP7Pr/Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-IxCEdUZfN8S714o9SyHYVg-1; Thu, 12 Mar 2026 02:27:25 -0400
X-MC-Unique: IxCEdUZfN8S714o9SyHYVg-1
X-Mimecast-MFC-AGG-ID: IxCEdUZfN8S714o9SyHYVg_1773296844
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-663678f9d2fso369042a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 23:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773296844; cv=none;
        d=google.com; s=arc-20240605;
        b=IvU7ixIiJFH1/Zq75/mDrR1eLPt3a7oAO+XD8JDsVYMr4l89i0QJwMwWZPr/ssYFOi
         fCNZkbxWIQn1IxVV2gvO1TJdfZ2rw55l04MAq1FbZZW5p5MwpOtsAkwLsB2xk3F88mPp
         u98iCCP+C7zkchb+DV4GVPcSbJNpChn0cChXtjSlnvlCXUlrjAuBfqXUfsz54gpvzQ4m
         xKVrv+HZKk1p1RKBsdasX4LKBi7SiOBy1zVgUfHZei/+iowKBsA/vvWWnTWLiE6JRqLm
         0iRHp6w3vhGIRfh3n/NHiZ/jeHNTWIxT4SXztD2OYtl5BQst4lvWk+4RlVGgpGW/nJS3
         uzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA7MHHq5ctaVMhUhQrU15S9h10dJC9tJn/h4KcAT1oA=;
        fh=+msb5RskmDiJR7fHHhf+eM2bhRyzlzp8V6U3bW3mgdQ=;
        b=OXOvmENeGORHMPdZJfOkyNJ+zrIR3GfiNwzUEaDoT/WT6I2PBCk4198SInSVXX1L4J
         YApqLObsWf7yNDMRoqqG8ZX3k3PsC/BDH+bejnpbP3wrJZmRF28h5DaeHtLin4h+LYna
         lGfAmL2fOLDw+MICSnzNWT0sLi00k1daZtNmeg0dBX//lEFNsrv7NGmc9blg6xnkhN6L
         9TNI09KC/4F3q+Gfl6HqP718eQUHcFIllvM0vkDFwWB+B6kJY4Gl9Qtd6W/8BvgPi1Hn
         yGLyYrlxqqaYS5BvTnh5zWNnM+raEXeIgSu+RUppKXmTDCvPun6gq6xMDbmmn6wvR0r4
         aYzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773296844; x=1773901644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA7MHHq5ctaVMhUhQrU15S9h10dJC9tJn/h4KcAT1oA=;
        b=OrDJmEQH6O/avIOtkAVply2SyV0v5jnus/As3rVnZZX33ACFzvzYu+cpF21QYbceAb
         wRAy+HTKRFxrj9Pr4DUnna0NwpjIiFG+ofWL7hSxpbPF6SWEu/bhUAo6T7GvDJak4gJP
         lZiI9MfhGhXW0cif7d8rH2YCaKKyQvInIlSZkNz7dUxkrw55v/g+Hx36AYFlj+Okm74Q
         QUw/F6iI+Ej6kmCgmVwXgR04Ofq0S8J7QN3Sqc0gn+FkMwYYmeU9ynfmF3uRwuLH7W9K
         ZbtEsQqKaM2OKFC8/oCSfnNvxRovtvQJLQMMw8Vfdeu/Q6pg/nAX4W5KwLpRV17/dQ2k
         BdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773296844; x=1773901644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KA7MHHq5ctaVMhUhQrU15S9h10dJC9tJn/h4KcAT1oA=;
        b=F6w7JPiELjHB/8KTRAtFk10XeQV+7HukvjV9G5OWFDdxPXqueGMEVlBnXvRwBQ+uaM
         teWQzj5VRYpXKxnFlmI+UHsdeu3pkgkSBXtCgNGzl7+a6uz7lRgcgR5HXwjDf0V5GsDS
         vhl5tRfe2AKM+YxctSb0EQdzfH4URNUHKIQXJFfoMacIF8M7vROGBgu9f9fJHcydEnxO
         gHb/mU0s+051icCBUJ2obSaR6ApEd47rp9l1cHQB7EeYInWUhwGv+3R8DnVBMqKU0gdA
         QVZnayd38ejCIq0pW742KgH6guSflmtpObjAQKpIxJ17Jr04IQ3t1dJPPKhWvGWDmh8M
         bstw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyWdbd/Q185ClyB9b6LthK42cl8xteW1iQLCS/EE1Y+v6f5tT1ODVDZ+YT09CjB6t5+cwuEg4k3gY6srytKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe+7Cx7XDH/h7RDsXVSNTqgwMtwpewAnpIX3tAyb73D2JUWxP
	cdzYB9v7R6qoRKmu9DX3jGqhJeGJDsetd0J2F8uLrEZMuRnJA+VgsyqjaeyhIZt7DWuAfQtw9pf
	18H5jNyP8181qmAb3hAcWI3k0M+axOdLYOG0/+OeFsZbz+47UqYIEWtExyuxJGmX/VwE14nbqYK
	4/t8ToMhX6bsAUW5tqM8UqbB2e041NAveBLzq1aWeL2x5j
X-Gm-Gg: ATEYQzynFHFuNa5wmaQrG6B9+W9aMq72iXN3D20wWN6tLnX2BMWIpWuSlZpQ7ICeSsM
	sVFwfJ3tQjnEJABowQsHy0YbzLg0KkmFe5UQmHgKonVmJjUGMF5T47NiowdIDgddRDICpROogHd
	qnOjeV03Z4Tswuf+sfksMCHXtkWhSjjbi7+dOoyyXnGVEr6LbyHj+SPoLQ+DwBgCytroMuJBpeX
	u0UbVs=
X-Received: by 2002:a05:6402:254f:b0:661:51a1:8d18 with SMTP id 4fb4d7f45d1cf-6631a8d7acamr2574651a12.31.1773296843958;
        Wed, 11 Mar 2026 23:27:23 -0700 (PDT)
X-Received: by 2002:a05:6402:254f:b0:661:51a1:8d18 with SMTP id
 4fb4d7f45d1cf-6631a8d7acamr2574642a12.31.1773296843581; Wed, 11 Mar 2026
 23:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEnjF8FxM2CGgGC0R42R7R4=udHMtkwV9bCVcw7NDq7KTZMLkg@mail.gmail.com>
 <4238fec3-1a37-4924-b13e-a42d2454412c@redhat.com>
In-Reply-To: <4238fec3-1a37-4924-b13e-a42d2454412c@redhat.com>
From: Lucas Liu <hongzliu@redhat.com>
Date: Thu, 12 Mar 2026 14:27:12 +0800
X-Gm-Features: AaiRm51s2sbZ-V7wlsSb_KbYKHb1lBQV8FzGRHjVYoDhNs9_i_DNWXmOCFLGp2U
Message-ID: <CAEnjF8EMW1F9WQE5rSVMeU5aoYi2sJGruxiaj8SxXtVHp6m8tA@mail.gmail.com>
Subject: Re: [ISSUE] cgroup: test_percpu_basic fails on PREEMPT_RT due to lazy
 percpu stat flushing
To: Waiman Long <longman@redhat.com>
Cc: cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Li Wang <liwan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Waiman:
Thanks for responding, I have tried Li Wang's patch, The problem has been f=
ixed.

# ./test_kmem
ok 1 test_kmem_basic
ok 2 test_kmem_memcg_deletion
ok 3 test_kmem_proc_kpagecgroup
ok 4 test_kmem_kernel_stacks
ok 5 test_kmem_dead_cgroups
ok 6 test_percpu_basic
[root@localhost cgroup]# bash run.sh
run 100 times...
--------------------------------------
proccess: 100/100  status: [  OK  ]  failure: 0
--------------------------------------
done
overall: 100
ok: 100
fail: 0


For the lazy percpu stat flushing, I assume this is expected behavior
for RT kernels? So Li Wang's patch can be our final solution? Please
correct me if I am wrong.

Thanks

On Wed, Mar 11, 2026 at 10:17=E2=80=AFPM Waiman Long <longman@redhat.com> w=
rote:
>
> On 3/11/26 4:49 AM, Lucas Liu wrote:
> > Hi recently I met this issue
> >   ./test_kmem
> > ok 1 test_kmem_basic
> > ok 2 test_kmem_memcg_deletion
> > ok 3 test_kmem_proc_kpagecgroup
> > ok 4 test_kmem_kernel_stacks
> > ok 5 test_kmem_dead_cgroups
> > memory.current 24514560
> > percpu 15280000
> > not ok 6 test_percpu_basic
> >
> > In this test the memory.current 24514560, percpu 15280000, Diff ~9.2MB.
> >
> > #define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
> >
> > in this part (8cpus) MAX_VMSTAT_ERROR is 4M memory. On the RT kernel,
> > the labs(current - percpu) is 9.2M, that is the root cause for this
> > failure. I am not sure what value is suitable for this case(2M per cpu
> > maybe?)
>
> Li Wang had posted patches to address some of the problems in this test.
>
> https://lore.kernel.org/lkml/20260306071843.149147-2-liwang@redhat.com/
>
> It could be the case that lazy percpu stat flushing can also be a factor
> here. In this case, we may need to reread the stat counters again
> several time with some delay to solve this problem.
>
> Cheers,
> Longman
>

