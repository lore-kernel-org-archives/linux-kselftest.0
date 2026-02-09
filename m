Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3F29D27D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604417; cv=pass; b=qYyXeeMwnWAgDHvwwaV30OgEGlBWt/wnsOZh2jsoxLXHM7bVa6/2mY2ZKemfHa9X9HYxkZWtpFjrXgOjHH684QqfZgZM8l8TawR4NFdKFudIYJwKeBG9tUJ82dO0vn9KECWeRGRvspEvLSbu4jIHO9FgZFyD5s1bfX5nglyEBqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604417; c=relaxed/simple;
	bh=+nJwlWL3T5+WZK0Upt88zOTwUi1XKFApICjKsW/fSPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEq1LLSYo6crzSouIzisdIBa4Jf8lELCIWqF5YuUtkfe43DFqH/0hW42yqdBqoWKTeuPKfFBmbraFkCm4w/7VGAVqbGwgmNCFRv01FcFSzDy5AhkCsuu6kFUJj2A5kQrgfXe/CrgrP3KJS+xTTB0JUXP1EpRGxDXx/V87Ggh/tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QXqvQ2Dm; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QXqvQ2Dm"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56376c3e866so3141159e0c.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770604416; cv=none;
        d=google.com; s=arc-20240605;
        b=juLCLQrjgfk3itO89CiTSfsBrshHBmiOwPDmBWRBcjLKpcZwsE4LGihewFIhiOy5uc
         gZda69fCORHOEegTz0/xGizD2YQ7yF+30D3/dJUZdLyjXM5RvrSk0G6PANf5uWdEFdej
         QM77uVH90f/Y3dco4qOjMvF/GsDmjLDVVB2iv6DyRWoaC1yUAIc78lqJCtFFqwtNPS86
         SoRVumohxEIYcKkdqws9lx/RvRG2GQxQ0cA0/MvRKI1ySoMtyGjHTr/NOqzx7y0g8wS4
         nFZcqKLiqAQQqNFfUMUadDoUCsnFzazQBCKW0WehVvm7bcQnAsf9YDLf4ztwZNBZUsHX
         XfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yWHE+3o8B3+32kmDZGOkxDd0DPtBJuDzqwNllPbwc+U=;
        fh=47lcoQjGhTo7yurJygrMOc2XZtNLArjJnCaDDGMEFsY=;
        b=YhJ65hWBU77bzDKGpfvCUf51gHHs6gezi2IghHsh3pDHTzF+i27jxxsSXbyNHcqWN8
         JdMjbIsYmmySS++ZZZSZ4XzJ5FaZ2ZXiEy04L3y/S5v3ZMKS1OQTnth0nRUbHti8BI5D
         akF1Pwgx7UOOc86P5sVm0Dmew2fTr8ux4kkTwdHHK+XDXP/7jBpq/0bQxpuAgkcGjzLQ
         rXBDgSAbMOedqp3LI142+z7Xz0TQZezj3e6JMwHj3WFYMujiqbtx/5ZnqopjN873391f
         zcu+DDB4zJtbs5nOd+GoS9R/Rs1oyO2VdWeQgCQr9nNLVveAVNzSEL9VqTXclVORqfDp
         LsQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770604416; x=1771209216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWHE+3o8B3+32kmDZGOkxDd0DPtBJuDzqwNllPbwc+U=;
        b=QXqvQ2DmKkq8zqP5AFZFJN8NwzL6NNCdqi3ZCu3eP/RLUdzXQ/ZCyiKZDSg0OP1J0B
         fuUaMW4NWknJ9BuQY7/dz3pLc578sJ1oH1wQCTFAB92Lnlmm05rJJkcu0WTki4qru6Jf
         f6oSFGE6SxDx3Ev9kaltsg00e4ZoCNW8SzCJRNCZVwNU6IgFWUYKyi8eQiOy8twbKp28
         fBgSFMOAdKdfStuengjdcpZwqUONTi2p1QqRVcpAlteroaLFHE7UiwroB6lliNyI8737
         77eyjdSGTGic+nUYCcwhJ/KF1tk5EO7rOxSdQf48qPSSjtfDAq7UiECmFnCl81eKHVOf
         mITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604416; x=1771209216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWHE+3o8B3+32kmDZGOkxDd0DPtBJuDzqwNllPbwc+U=;
        b=JefP9IdTal7Rziv06dtRgojuFwey8lTzZFdBzZ8qDqZ6nJJ+dWdN+QxagT71IGVeYO
         0m9K5HcQwczgSAN2AAI1wVKo19gzfXT0W9JsKyH8GgyZLc6DHumM3RW2cZ7jJT9BPD14
         MBs1Ulkt2erm0t6ujll4MPiyW5cAl1ORkKZhdqANwgA3XJgWGu2n17HOMmRMs5BgZNvF
         ILIFiJQbUapCBE2Ijv4LxsCcOkIV1sLe7qLoioiBFguirkaEhBFBGHCdg7A7lrc4Z2hi
         D1vf57KZx2ShTLz+pLCx0eRD3znMXZx3iG2R1NGvIefqwlnDeVReOzgKkcoeHJ+nAm/B
         2jiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx2TatdhAg/rR+WY2GK0W9qolaWpA+Fth1Fg8RMtjKqqR25TLXWGQ9Cu+0CpWQ3BgNqw9vFLZMajq/JMLXFt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7UuSmyNIoDu8GwJZ0FhKV0xyVuVBx69XRE7g7wdcszONPC6e
	6dgSXgap7IWGpbyr7cThg4ITpXdT0rNgYsSUCc0mM47oIn9qeSlfMyOGIcyWYaJT//yp+L1oMY/
	sLOAuH5nOBrBpN51+V/U8znJDhNDFzmJ02eSEBAQmsg==
X-Gm-Gg: AZuq6aLLoD/DI1YZhg+rIvY5leMx59a4NRpb9rHlOj7Yzl/ey422UnjdtQEmSAncTiw
	UrcNILWSCgZKuEJWLQUJiRltKzFmffJrMw1cTPYZ1Xdlvr2Vud1Yl7K3Cmw8TvPpHJlcEzlJi3i
	CMUnDe2J2xIlCuYLfp4ohqw7UZMVB9rHzpLXoc/I4L041j+zLsYAVx9JDcNmA+atgvudBQgXIw2
	ahDxzdV7ZkCjOV5+jtD1DqCB/xeA4ZmD7RmKojZV5FEq3t5ajCjZMKkCkUc3jvtVVd8xBz0/A==
X-Received: by 2002:a05:6102:d8b:b0:5f5:2e08:bbad with SMTP id
 ada2fe7eead31-5fae8cba509mr2622189137.42.1770604416476; Sun, 08 Feb 2026
 18:33:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-b4-futex-test-v1-1-ce73742068ad@sifive.com> <877bst33zr.ffs@tglx>
In-Reply-To: <877bst33zr.ffs@tglx>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 9 Feb 2026 10:33:25 +0800
X-Gm-Features: AZwV_QhhKPiy4Jr3nZKT7NeQnBeBEOMffQvPbe9EpzNcovzLWXCTA8N760FKhdo
Message-ID: <CAHh=Yk_5iWUe_5j8TG8aAa0oK+3Rwq5xOKDdsMXCpwjpE-c5YQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/futex: skip futex_numa_mpol without libnuma
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thomas Gleixner <tglx@kernel.org> =E6=96=BC 2026=E5=B9=B42=E6=9C=884=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jan 28 2026 at 22:32, Nylon Chen wrote:
>
> > Use pkg-config --exists numa to derive HAVE_LIBNUMA.
> > Only keep futex_numa_mpol in TEST_GEN_PROGS when libnuma is present.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > ---
> >  tools/testing/selftests/futex/functional/Makefile | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/=
testing/selftests/futex/functional/Makefile
> > index af7ec309ea78..ec3c39a51182 100644
> > --- a/tools/testing/selftests/futex/functional/Makefile
> > +++ b/tools/testing/selftests/futex/functional/Makefile
> > @@ -1,10 +1,10 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  PKG_CONFIG ?=3D pkg-config
> > +HAVE_LIBNUMA :=3D $(shell sh -c "$(PKG_CONFIG) --exists numa > /dev/nu=
ll 2>&1 && echo y")
> >  LIBNUMA_TEST =3D $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2=
.0.16 > /dev/null 2>&1 && echo SUFFICIENT || echo NO")
>
> Why another test? LIBNUMA_TEST fails when it does not exist or when the
> version number is not enough.
You're right, LIBNUMA_TEST already covers the existence check. I'll
remove the redundant HAVE_LIBNUMA variable.
>
> >  INCLUDES :=3D -I../include -I../../ $(KHDR_INCLUDES)
> >  CFLAGS :=3D $(CFLAGS) -g -O2 -Wall -pthread -D_FILE_OFFSET_BITS=3D64 -=
D_TIME_BITS=3D64 $(INCLUDES) $(KHDR_INCLUDES) -DLIBNUMA_VER_$(LIBNUMA_TEST)=
=3D1
> > -LDLIBS :=3D -lpthread -lrt -lnuma
> >
> >  LOCAL_HDRS :=3D \
> >       ../include/futextest.h \
> > @@ -27,6 +27,13 @@ TEST_GEN_PROGS :=3D \
> >
> >  TEST_PROGS :=3D run.sh
> >
> > +ifeq ($(HAVE_LIBNUMA),y)
> > +LDLIBS :=3D -lpthread -lrt -lnuma
> > +else
> > +LDLIBS :=3D -lpthread -lrt
> > +TEST_GEN_PROGS :=3D $(filter-out futex_numa_mpol,$(TEST_GEN_PROGS))
>
> Why? The test contains more than just the libnuma dependend stuff. There
> are two issues here:
>
> One is -lnuma, which is trivial to solve:
>
> LDLIBS :=3D -lpthread -lrt
> ifeq ($(LIBNUMA_TEST),SUFFICIENT)
> LDLIBS +=3D -lnuma
> endif
>
> The other is the include <numa*.h> in the source. I assume you can
> figure out how to prevent those headers from being included, right?
>
Thank you for the feedback. I'll update the patch to:
1. Use LIBNUMA_TEST instead of adding a new HAVE_LIBNUMA variable
2. Keep futex_numa_mpol in TEST_GEN_PROGS
3. Conditionally add -lnuma based on LIBNUMA_TEST
4. Use #ifdef LIBNUMA_VER_SUFFICIENT to guard the numa header includes
and related code in the source file

I'll send a v2 shortly.
Thanks,
Nylon
> Thanks,
>
>         tglx
