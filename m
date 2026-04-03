Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E02744F
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219673; cv=pass; b=jAsTprnKvVFsnZoRy9H5DfDTglWm0ZPLrp16sjNWrYksQ3xblr+Ev99cbNqSvnZ4ALnTwAavWolJB4nEE987jOjhjXyfWzbxjfHgEtLCtxK3ykpPOAE+3gbEBVTn6RHOt9VioZk0xxCIYyD1mlT5hkNIkF2lf4RxY08EqZR6b/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219673; c=relaxed/simple;
	bh=axEo8RmBJPnqBUfyGbwqZpH8t50qcnnO5CV3JyYSkeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfCJOBM5hewaaOm9+BlqtgylW0AV2dzW+xKcz5Z4kQVgUFHQO0vmDmitttwBronCnIilx071DAnFlBc7GUTJEOTDQzNDUpmTqlJcoYLfNXwe8jNSBwD9un/HX0WfN2fR31PpDg/SYJD11UDJB+HFnJ9ctj1NDKRL0r0VtmuGx3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=M9jgonaT; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="M9jgonaT"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d9d929e27aso1687553a34.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 05:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775219670; cv=none;
        d=google.com; s=arc-20240605;
        b=e4P3JuL3/h5MdNuYDt+xd+lCUzgus/xFlagwc1qINtVizGqPC0BU8f6YJYEo6kPR75
         9aP2f8h8Img65FiZ1mWVhS3ozndPptEHNlDu8fEpHEuDjYuklO3TIuGM2mBd4ERGJ1NN
         NNx3PuuHX6noPF21ilWa0tdCwBBmgWdch3H5iD9bznBdKfUs5T7VVqxGiOMvyUOC7dLg
         Hjs9sTZD9hPTdG3uXFdFbIaQr6o0ImG29CEhLL4Ak1dnoJZbvHhjfXyCQXPsZ4GaGc5N
         f1VZzeeYxVv/uK/U52JgQH1wIRMK40pCDf3E1HbX4wC0FXnZcevkVt3B2Ck8DL0K2hxq
         YOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        fh=kxsaPwt0N70fuy36DFpfuM9JSFs8W0soT5yYUz0u+kM=;
        b=C5v5w5K7Jc/TT+1Ik65r85XSdSfBy7JPT9R6kMy5LZ1c4UO5DzeFzyyOJXUvAXptAv
         jc9fO6ueJRcf1OLZ/OCM/kXoz62JmOc4WKP7thBRSmTQ9mfGl9eycVak4hJ/LQJ4nDbs
         kCAg0c9AShMAbYQTkhtlE5OzEVxOEHM4f9F2E/zvFU2eN2+w4NJ88j595im/keS720eh
         HKURP5jVaH2uso1wPLmofuYAZoj1xfaH5yzDorQ0m0A+3FUb57a4xWEuyuLDoCfkYLFn
         InHdBOgNCC3bEcPglMrLiSYJFlnYOEicVoBVObje7VqNeHF65xi6//ziSMUQxygZXkEW
         B0OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775219670; x=1775824470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=M9jgonaTX1emrPFFOcHIiDLhUVOEz1CHRK0kwCjCGfVgJ8y2D0WG92OcLbdRWJWTwU
         MNHSMsRqdHDDVlf3WOmCSPYjX6HTAXjc7JtpWuMVwTmqBd5Ukn/Lf220kXTKJEp3GLyw
         gFMC6EPEqGzevKiszg6QFvrrOZcb5/opQOsdl1WtFxhH06bRx96kkZVh6jMGnW1zWTvo
         u9Jr67Sc68siamykyVoGWAuRqI2mlhlucXk4zRmyVa39kXKQL5DpekXxKXCvbCS2iVtj
         9eqzlE7QNRNP3IU1ySoyHIqhtHWs/aJaluvD1EL1uH6mBRMIN5nVIE9AV8XKne4KB5G5
         jIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219670; x=1775824470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=rUXflYsVBGRKIFZqJemyCS3kCr974U/El1n8sCKLciAiuZnj34UsxkFnDqiwcJnHT/
         DegdlywzombKbVV0g7MGBRebVBrjSQuvZdZefTIstkPtgvBDiQm7x7DWjGI8sIDnFU6R
         ++6BR4qQnDrxoAVoLz2L5eH8lOTx9Q5vAh5kNzcHcpP/UaO9UBOGAX90sRe84MvhNqye
         T1EpU24GHeaZCaTZ8HMZJ2Sjw/vxMHUyjxdEbFjEyBQHMN5X6oSZqQFFbaPmFvaQ2YxI
         mu9Yqy+EDIDjQUJyZA8AU6cBfKSuT7mV2aBboC+hzXTs1fd9zDrLq1TX6ygTqyHUyBVK
         15FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9/RnQ4sa/2lFcxvD8gQV8GPI5GrbVWuv8n72QX6Tdf2AtnJF48L7bYmnnMzaoJnE8ZbWswUe7qCA+8q/tJ+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHebmUEWCtRz+xBgg0pg1P7chLAtBZ/fETv7RfUutMy378btQ
	1f4H/DSBhjPcS+qVw3Pp6p79UF6WYg+t4QJBP2cWduPfbzl/6TLHiUnLsTzA+qgw3n646C2/4XR
	XMxU6bpN2mHRSbefUt046LaU9iuZNXNKneV4uIRAYCA==
X-Gm-Gg: ATEYQzyCXj3FcWH8uYcAEerHVuKffCSs3GjLOTMLqAEbKVc/Y3VloFPCEYkeZPG5ljg
	MkHhONIYPuFFUIzHRcefd7Hw7pn7fQClazrDu8jrspgp+Q3zbdKjS8qw/foy8lHjk0tGz9acK3g
	v+6U/Kchzk6hhdQEdgfUx4ZrZ2toDtPAjqI/cBH4Av+4p/8/1kmqIg2SOKVnsOlj82vBLxdb721
	QEostvVnJbM9OWNovBSwdWxdOk92LW+OtIzHZt0odCbMbYmxo/D/eByKnIS8Gqh7UgwiH72mcD0
	XWzl93POSJB+Fjicie+kdB7aVcMB/RGpPmLmTebGJrtZtuL5raPYnS4b4PfH518znnCtyJeYTmQ
	QozQ0h6bX1cf/3+Rvz0Vx7D+11w8=
X-Received: by 2002:a05:6820:8118:b0:67e:42ca:bf2 with SMTP id
 006d021491bc7-68220541d3fmr1471004eaf.58.1775219669835; Fri, 03 Apr 2026
 05:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com> <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
In-Reply-To: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 18:04:18 +0530
X-Gm-Features: AQROBzCgiw5HblgNuoDX5QU1aUCJYkWwlXJ-vtI51cG69rWO0VI_zpIeHFgZcTM
Message-ID: <CAAhSdy25k5YWBxLDhNhPkC79LVOZOdA9ZHHZ+65EgF8jewWa1w@mail.gmail.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate sources
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 7:44=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99
<radim.krcmar@oss.qualcomm.com> wrote:
>
> 2026-01-20T13:29:51+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> > The KVM ISA extension related checks are not VCPU specific and
> > should be factored out of vcpu_onereg.c into separate sources.
> >
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > ---
> > diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/kvm_host.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/cpufeature.h>
> > +#include <asm/kvm_isa.h>
>
> I guess <cpufeature.h> isn't needed anymore,

Okay, I will drop this include at the time of merging this patch.

>
> Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>

Regards,
Anup
