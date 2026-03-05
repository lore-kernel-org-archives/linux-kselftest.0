Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB33D5247
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731648; cv=pass; b=BeVt/a40sT3+k9mEaPDxbFJ1Z9Fj5Pbk0oH62FqJe92GuIbw5gp5jUuLGUuM8kLZQ3JNvsTzQu6giMUdlRB9S3TjkJPW3tMK1KnwXX07jeXtTdCFis5sY5BrY3jS/HmOiFurh8oLkbMxOTDrLc5ikREDcKZTuw0aHYCWIex7710=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731648; c=relaxed/simple;
	bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po7dnPOYQUDl24TJsKT+Te8DGJjbfhjDIlO5d++PGCs/b8uvd+omkMd8eGrPQnd50dO0Y6LqzTaNZh7nmj3EexG9WO+tYY3pbD5VqNgMna3F0YpWsFgGkPIvwBWEbYa4FFEFe175idjs0BVqkPLSWC8Lx3ggICspKYoK/XXitFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKDmLEyS; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKDmLEyS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389ff6e5885so72090621fa.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 09:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731646; cv=none;
        d=google.com; s=arc-20240605;
        b=Yv6LfJ65IlFAG0kOVc2+rYzG+JzukM2AILfR9W1qA1pp1Yxfd5f1iEIo1QLnGNHPpW
         tVcaynipxnVzNHSHKBfUJKzNv1+z1khg67DZX1Vg61EMRBE/elAeaNrcgLWsUgFmvYh0
         is8gN28Ci4JdGQ1eG9sCvDy0+I19gyIxeLCQAsJxrr+UIabu/Luj8Cx3M//7xaCHFh44
         8Zujx9n3+/Lb/QTdHEBLGzAcmm9xchtYN34S4znNdhbvdKv/1YuhAkp1GqzQ+ZSza/Nh
         T0rbu0JgEiAYFBU5CNEIHEiNLoPd9JIZ7WJHtAQ8M7aqsPLVGZ9vd9kjzdK5szvLd3yL
         Qjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        fh=cALFQvhpxyBzYjYkBunv4MWBWFOA3EA76H5bArkY3lE=;
        b=JU6cYz3YTAmmBG2IhA1F4kug0yp4A6fw20aEori+QTGSJ4bPeNTNWTeitIlOJeUkNg
         m0dVkYiClqddjBCBN9CPm8WhUN8yqCpWdpggdpLMFYH8U+kDYKARrnGC3bHva9jHBY1x
         QS4WuGQ/LMK479fBLS75mNa3JdKXyVj76tYBxoiTiUO4hEDsjKHTRNgNl7xYwnvDKOR9
         pwkE10KKcnOxrCIpcEdTYqb95qKKW07iFe6b4nUEA8xfQmFrrJFZHOfgxtXDpG/Zbsdx
         kWPmADdsV6ArOE2KuQsNu61cWz4J1EOEXUmwyKGRf5t+1Rtgb6BgWdk9H4yNQeLODtru
         fQFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731646; x=1773336446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=PKDmLEySTcjzS9x42yIYEc2CgT2T70PgTgz4Rg6gf/cQNjMt+VSfzVAE2opMTtaf3s
         cjulBhL29EHJWlyAtEyveUbA9evHgdqPBdEkb8QXL0JrT6Ses0zEHl6CrsAUiO+Agyr5
         WKoVD495z5C0R1y983aOJYOrNLrB/UmCMwqfdaU1tSzMd+hPSSq30qdiAUrnz7G0GPqX
         xixg8qnVz3BpbpPj1GyCbAFGZw+M94J9XTGmKXmj6JyWYGXuR18TLiCt+q6lMH/BTTW5
         Z6WBMX0km8ghHLXI+PrlXNye4sgpfNoslNIrk4fkx/i8WCvlZK8UzaApXo/CkoAXlZ2Z
         UYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731646; x=1773336446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=VHaMVrRYeQ0iSiocHI6EWMOdX0/GqMT+g5/nvvPuv3/FcvywgWfbDkOcTooGj2UwpZ
         RNMMxPd6Gglh0veYZHDjyJ1rK/OBDFYUZc2Dv0/kfoQwkzvAe4jATNlmfroL67pJHSWQ
         dA2WZbH6IxLWggrN8ZzslMNdK57p2TpH9lIevLC3s3ZtDhDcZcl07awqWi6PZaf7j9Q7
         XQH/ER3sCIKQAl2CGWTqJJGqD6O9exkyivlda58mEsAvDYLHflKaAPMuHyyb615ZIVNt
         9LwpFOpamchA36JVbeYXeRX/NB5fULxKj6TMM0WVUBzjHONychMRSmc+Nutfd5nBpdmB
         QBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtaCYGnRpuRmhVmfjHHrEHTLd0b9uEtZGI7IHnn0SxwkVWrdf2Hizjeu0gjEZVpyBijF7HEXe6s2yC5oBEuas=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8r/6+ruaGebvIl7VXSgjsMV7yAPxh6gLbi6h6u0Cbnbd9tnz
	lyMDpPVjojGcNtD4Acf6K3ebygE/Ok8E28y8zriudyv3ArKIFAWcPbgx8Onf1CebrsSNLurrErY
	C4hONM+bf3O2fsMIvM4EOB7VnRDxJjZE7AkXLjvHf
X-Gm-Gg: ATEYQzzWOjNsbHHzGCowR3CYvJ0KHlDwvd/BSOS6oKh3A18oyOl7VcRfIE9g1ZmUiHm
	myWljS3rYSLdoFzwlmGWW0dZjiFWP2B6N/nHndeeoQ/c/FTdkugs6pD25aihVO/hBD6kxq7Ri/4
	rZPpLCLw9xSvBqqk4DfYv/U0yrjyOWlHuFxfDyDP9/H82ALIcS2ZX1pugVZLT2KinTiij3wwQtw
	bPISXJ8qfBtHBbFgcY9hMrnMHE5ME7bCgbIRdkfYb418ArOhE90p6YWqrzspRUa+W6HTKXremyC
	RvyZGbHg
X-Received: by 2002:a2e:9797:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a35158513mr8005261fa.8.1772731645158; Thu, 05 Mar 2026
 09:27:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
 <aam7JsCyQ5Oacvl5@google.com>
In-Reply-To: <aam7JsCyQ5Oacvl5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:57 -0800
X-Gm-Features: AaiRm51o6Q3ZTz6ECMDT5TdlqFdcggDf0j5vT0TJnm45bgTm8VbA0ynEnVZFATE
Message-ID: <CALzav=fV4NX=pxKfX7hH+tO3FBNcSF1KstXsKqprpCj64Ndx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 9:19=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > -static uint64_t pread_uint64(int fd, const char *filename, uint64_t in=
dex)
> > +static u64 pread_uint64(int fd, const char *filename, u64 index)
>
> I think it's also worth converting the function to pread_u64().

Good eye :). Yes agreed.
