Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC93806AB
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029662; cv=pass; b=IzLkn00DOpGZhnieCjtHTo+mUvxnEujH7ujgsN00nya2KMVZgKjo61v8WbsyQSOE8S6caiKV5eDE535XDyuwelO5FAAhYFn4nf7vwO77zrB+ktfi6aoL9nIYgqAXtYGGN8AEECcvN6W1+kOfNtJkPnJEzzUClGj+GBTRBBOpiVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029662; c=relaxed/simple;
	bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYlVEqmg/ASrSXr3s0GHvyxvZBuK/498xDsoS9XU8Mq9/EOjbmiOW37enP7ge2WIkkd9kZuZSOdpSVYm15FGB2df5RYfWCXjdgff1KSROB3R7dDmqHG73wtDK2TkzEAD0L0dB8Dp7HdSmhsmjS4WqVlnBQFDeS9ex8mqvb93AQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnlbLPYK; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnlbLPYK"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so415989a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029659; cv=none;
        d=google.com; s=arc-20240605;
        b=YmHVS4iWI/mkfjy/vPxCAQ1sVuNGnUBafSFrzygLwxRpgVUHObtjTeMyPTjJhvdCTK
         IstjcPvhNibxXRQaD1CRW9QhLbFyj/e2j34OxgQlHDkT0vJYFkk1JufEBqKL1kvdu4HS
         4U3XaIjd08pv0BJmL1yCfEJNym5PfzYY9Yz1wmMnPtSLhtWKf2IzVGf2AcXSEayyINir
         cSkCPhPoV25mTWQZN/3Lg3YdScEPEv/RtVcT+bVvziJ/3VKb+wLdhM0GJHSvFf/tkHv8
         WrhdW0Rf71MvXhIKCt5R3KJ4wm7pEpFD2IusgugxHSMLn7DAOnhCcTw7J3Dv53iIoKBQ
         5FLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        fh=v01lL/4+rFeikqwntwdllMjzEl8RsIYytljE5HX8J7w=;
        b=gHRUHrNykKdTyUh82OcDzLvdd5QFk7WFGlj5KILQ9M08wSpb1L7D1dfh5JbiX6QCcy
         vptG2dqvpkoF0jWluJAqUxCSErkyfPzQwZk0ocUbESk5bKSK7Vbo12zozTLGrAGLLaLO
         gGjdg3uv2WlmE8B27Wjgf5BjrqW96y3kEquFS/X2f1mybpAIhNPxLgYHo/e282IBdwjt
         FK2sCmhC/JDpCadSPYNHqZq9z5cvPYqld2/L1r5oJLePCbiCU5mMfroa1EYOnsgr/5Mq
         VR5f0hAVoJiCwvqPZsMddmjBhr3J/Gavb6P7tTVD9O6EJDyCT3zE4UEGK4O1rM/iKJHT
         71gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769029659; x=1769634459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        b=KnlbLPYK4JbbPIIur+X/UNX6PXFLowAziLpVjJzdhDHAHWQHQLo3BwKLnUTUZGt+qi
         GTiNt+QPNiOfECKoq8fa2+XRt67VprXizFqQXQTVNX+9wWwUV/2dNAq6gqgAbZLpJ4Gs
         wYJyVR+VwPdHiC0xd48iZ2tJcdIO6OMcrlrvl9udNGhN0zMkya2LQwBud/ea1p8yZiMX
         wJPd+ZzyFJ2b+6b+j9X3pbOotky4YjmeuXDuFj3cKg1bss4bOKP1w88CceDzF+E8wZM7
         uBmBGcRZkIOsMzAox5gr1q/q5MS1bxFnqV7t/B/6HTaFhzG0GRuWFeS2hdiqGY9rPdpz
         v9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029659; x=1769634459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        b=JKsukYDa0eq/Th8HJ1orO6mrze8Hju+RD4qf0YuFbZ8xRwodd2Pi+tEtutCLdrmMjr
         N3fSVusem3/vpDZ5BU47jdCtMUcvm7upvgtBtg/k1GPO9aYzS+KYHHIOWtv5bMXryd84
         p0y1+tYJ77aKWyorMYmwupTVnJ7fmlUK1uy6UEE1M5rqPNjBZL3jOEKho7sQLX+qSHOJ
         Zzbjhy9Xv1TIU4dUVGzgU0RGNMeeAXqITxMQOL6rMVF+qSXKSH5DpOJ6qBNUj+Ov+7bE
         2ybOlAQDAP6heLsvLiF7Irw0MJRUa+DoVmHzCBtiNDRhcpdB/SocgM8/KLIYsTDXT6wC
         o8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVI+ylJiAERKePW4MBLYwMSQ+ay/pVQUYC1kCHDq7NmeY6uh94lCqKkCe+2pUoKFPBAE04y4HiWw1VCQhQnWvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWxe6mOCnavoQrx28+Cxrloi4G6/larb7sUbqcZeMxO7thif8
	4//bECfNP3s9oeiRZ5EMVtUVykWTKH26pCzwy4Ks0Eq3+G1pihzhE16C+N+xIILb10ikz+O78l0
	+6x67Gz1n1RLzlaHH8VXcFhRoNDnNdp8d0WLo3CY=
X-Gm-Gg: AZuq6aJlkvnPHkXfRjGsoyORgGTEfiSg5DQZUYVkMmOWRQjPzLMfCs7/Pd+Iz7J3azG
	uomllJ+pThEOjYa5OGv3QFUyhwGfggijNS9/FoIUr4cVixZz9gp8tVg/9exF3yK1LX0lCSYz0aC
	HhzQs1qpkk3yl3GMxoKZhz6qKerno0QM+z2nMXup9Xt8/z+Nw+vWed+75N+CscFKb1M9VtXFBE4
	hjXgDrjEp61DsmUX1pDC4jrZFXzdyAsN9Ufnnl7i5i/RqGFV5agtRKBRl9pIpYLi7x9
X-Received: by 2002:a17:907:2d9e:b0:b87:908:9aca with SMTP id
 a640c23a62f3a-b87968a9870mr1543554466b.9.1769029658501; Wed, 21 Jan 2026
 13:07:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-5-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-5-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:07:27 -0600
X-Gm-Features: AZwV_QjEhdRwi-DYL2mP1KM1r2r9z9nIROyn3jKd9PjJQxqbTAQQ7vnSVaOq26I
Message-ID: <CAFTtA3PPY-=bPJw1-iv56AQQ94saXZorC3rMM2Z4DwZJg4ruZg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] riscv: ptrace: validate input vector csr registers
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sun, Dec 14, 2025 at 10:35=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> Add strict validation for vector csr registers when setting them via
> ptrace:
> - reject attempts to set reserved bits or invalid field combinations
> - enforce strict VL checks against calculated VLMAX values
>
> Vector specs 0.7.1 and 1.0 allow normal applications to set candidate
> VL values and read back the hardware-adjusted results, see section 6
> for details. Disallow such flexibility in vector ptrace operations
> and strictly enforce valid VL input.
>
> The traced process may not update its saved vector context if no vector
> instructions execute between breakpoints. So the purpose of the strict
> ptrace approach is to make sure that debuggers maintain an accurate view
> of the tracee's vector context across multiple halt/resume debug cycles.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

Thanks,
Andy
