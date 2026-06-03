Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED23FF1D9
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472790; cv=pass; b=P8qUMA00Bjj3AjSXV6r48AVlVqOFoKezPb37rOlcbUZsK8gYqTr2daSOHrzrZlSTQejOr1H+Liagv9+cJB2tTGtEBEVuFC/S67kG9p/66Ze8y3vZnZs8eNXOu7jHI39mn4Fvzx7i1jlkYB32kIsa1heu2WVNQJfQ8pnW89J7ouk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472790; c=relaxed/simple;
	bh=vUNiv8dGJzLhWKIn3GCL7icdX8+PvKlJdyBEHffTZlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNjN6s1LkH1s25uAbCwG/WANknndPET9CT3zVAFehARYdkCsmTDxXyRgutkxdXKYiRkBI/x7R7sXuc0aOhVM7/1XSJqwFYZX2S+tr9tkeuyhJTqD1NsTzgtREbcr2QPfQoCh3KcpiZryOZv5nxp/dx9JKb+XztwZV64U+QY3z48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=vLZjlhcV; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="vLZjlhcV"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d7aa0ac18so7819353eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 00:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472787; cv=none;
        d=google.com; s=arc-20240605;
        b=KKvXKI+uVVZFOAVhuY00t0MFknFYabJGvnvyx3RbFsckVbTaEAfdetBtYUrhPjNbnP
         SP5+pE9KQoQaW6UOQPzfDDhHR2b3AOPHWMg99N48rhc50n3wS7MdwFnjzCmOnmlyrY6J
         s5QU25u8xr9wvNEAedPf1ZxORUBoC+IRpYhcxJGKfR2aNKoUlu6F7Ew0BQlS8Oh+Wu3d
         YNJUjZfNLg/cm9/MVXN/ZgULtL+WGJizeXPPhC3pCBbsxiA+UPXgjtfrtAshbMwoHvsc
         56dRoI40y3uz+82V+gFTto9mDspxMtS46sJFzDHf7rcDiJGADfvV50WAMzHbxuXAoh0A
         oYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        fh=syzFKJseCV5WmJ0Kl1B6v8F/ZeRe/TZog0Mb7lkrluQ=;
        b=eMmxsX3+F58Ain9SIH4Jlk4s5lpbpzSHGf9v4vofef6LdjSjlFtlSNFSwRSh/6ele2
         0NqQXr4Lon8rZOtvkdycPlLCetH1xqMcOQWSZohyG53VMn/7Se5ngbkBWvdK0iibYv8q
         UKIvyv2G6pDoD9+qC51LYFqM5pkifo+RbHUFUwsBdGnkh9FDvJlas13ud4OaqvAj2Qoi
         lV9eoOqimIMWbD7E+PTNur4mfK9/fcRQc2LPG7PVbvRCkpBqDBNCSuC0D0P39vEHTgon
         gM/ksKbQ3L1YYKxDwHKMyQ2L42WTwTmdtax1sjx1WLCVSMaDJLgBx30n1X6tN286UKeQ
         0Y5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472787; x=1781077587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=vLZjlhcV8yjVOVwMgYsyxQ6BwgsRgv71LxgjTYckXEpwfYS1qSVGi02i/smI5QHfEb
         y+V9ICaeqBYKUAHgGdso8/ugMMPQA3zf94cqt6v0ayn4SyTihJpUn3U2BPLjrgrhX/ZO
         jj62f78gwuGqic0Ikdv8onlGc2qaX6L8WdNdggXygYJbl4xzklKSueAA2TdAH7IqzT77
         8Pax0rCZgNR8MzDYsXphO5srZu/9UoE/VkzTlFRl650efldY6zycEnr/GAQhCFIJMoBg
         B+iQTrbcdMbtBbAX7LGwqFonMj+YVM5e0n8Fca3ZnIa7shsFGTVwNTlSO/8fzczs9i9Z
         cfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472787; x=1781077587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=YsepQHTisP3ygukrj51AbQ3dwTTUA+BdR8wNoVn2h3x5H8MShoTSbUqPBfta/+Rhyk
         7PDKQxy0Ve7HSdrVVxlWWQovJa1LW2N7DcbqymwQAzLZrOCE30egXYYNHkI3rifcY/6r
         kEQv3Ql3QEgE4BpOQL+NI1bFUzSI3tUuwZHYHMjrPjtt4d/S8xUM+SiN0OC8d39LQBB+
         ncaTG2YZ0tqDSHYM+CWFmS44h/OxeQ3ogHfyN7rqrw0ioGH3tJf8CCdb13KJAqu6vN5p
         M41WM8oztsa0jcUTFc2NBAq09G8p5cPb9EbCg8xkdnJ3kFb7uhwTfRc8ZsBYEWAZNgr4
         RYAg==
X-Forwarded-Encrypted: i=1; AFNElJ/O/NG1srdTEt7A0Z6ZNKNrNzc7wPai4cBQ7HKhGs2V8XrHEmK/S8JpTOLmCexYbUspnMZCH3V+ZVSTviJShmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30m+9l0iPWPYp25JIFp9vC5d+gQP+U7R6wmUKxa0lWv38fZNw
	/L42kUhZKy9H/WmTYUfVKUMfqptw4J/x6cQHTrbJMb90QM4xinCa21F2OGfmnwQoTZNibxJ0a/V
	Npn7Ic9nZLqQ6IsXAvDJ9H/0TG9tYhyuP/gds4kPIfQ==
X-Gm-Gg: Acq92OHI64bUjYpHKry0wPJmGLJVwMHw9BmuqznRDhEGIl3eETUF862AHZETX60DB1o
	AGF0NbhvDLmHGH2Ob6Yxz06zYjTIu/7OBbXdFOJppa71YMQ72UWkKyiAL1wzyfk3FmMq8Jo4w+D
	1SIhBnGMxmwI1iEyH47mheaHzV7T++dAVK5XhsPqdJhWuSzwT3KtxcDfDY94GhGdhdR69+lZzxF
	/34Ss1BE34OCAi5ml9arBhYU9rB24K3A7Z6VdALjbhEiclnAcLg2QFXbAk1N8aVpg9ixI684aku
	veh+5mny/Xa62Ob3vXjyyM1a9E6+6gnPkopVO3DDo4ZINVbUJa38yy4+EEdvLDIOMWRsIT9i6QB
	UTz6RpH6R4FcfOKnGiXHDZTbC1Q9E3JrXF3ZAUA==
X-Received: by 2002:a05:6820:a113:b0:67e:eb4:238f with SMTP id
 006d021491bc7-69e47ebb7c2mr1148163eaf.18.1780472787482; Wed, 03 Jun 2026
 00:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601084336.2601675-1-inochiama@gmail.com> <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
In-Reply-To: <ah1pgb4S-UoSWhC_@inochi.infowork>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:16:14 +0530
X-Gm-Features: AVHnY4IXk6Xj-7gKzaesDTTCYZDI9ERPTRAVFn1Ta5l01WccpSIZ_xwI2pHLbD0
Message-ID: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Sergey Matyukevich <geomatsi@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 4:46=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com> =
wrote:
>
> On Mon, Jun 01, 2026 at 04:43:32PM +0800, Inochi Amaoto wrote:
> > Extend the KVM ISA extension array to allow KVM userspace to
> > detect and enable Zicfiss/Zicfilp extensions for Guest/VM.
> >
> > Assisted-by: YuanSheng:claude-4.7-opus
> > Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h | 2 ++
> >  arch/riscv/kvm/isa.c              | 2 ++
> >  2 files changed, 4 insertions(+)
> >
>
> I have forgot to add CSR_SSP to the context, will add in the next
> version. But I have a small question for it: could I reuse the
> generic subtype or use a new CSR subtype?
>

Add another CSR subtype for Zicfiss.

Regards,
Anup
