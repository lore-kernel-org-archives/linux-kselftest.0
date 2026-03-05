Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED43E3DB5
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731614; cv=pass; b=rlBxx3upN5kikhGvE7MqKzBKcYWnwNO1XOdgwGjE3n0cBmR4o8inI6HRn0MpxjUxhrVsRUKN8nGxZvBquQNQXMaBtSqIf+E2pKtO+OKAwgbsJHo/aJvyhUFmW7CrWDtcdChSe+puthow9VbS5SKJMBXah7ckXRZ/eXL9Q9L7Os0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731614; c=relaxed/simple;
	bh=XOVsdktOF6nyNimRfFhPjPXph4/eizuY/zAJWFeEW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTIizKZK0WeRGTtCOkkfMvYcbpvDxx4hVpv1uIPNOxfqZKXAJFoum2DxhLBhRmYRrT163SWXVVo/Af7qKghUK85bDC3Z/U0dH1oMsUY7L3Rq+SaQx92HyzHTH7S7+0ukSCPK+xZjXhGf8zNf/HlJRU5BAy8mCcDxcZkA5WUPSa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tng4PLFQ; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tng4PLFQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1049865e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731611; cv=none;
        d=google.com; s=arc-20240605;
        b=E/FQZhYm4MWioLIh9zUvJaEAlHAWixsoOuBxqNA9YLzp1gjvZ2k2kRmYk6zpuYxh0p
         cORPZLLS/U1/HrhBE9JrpjmHuLbyVYGoxgUJC1dnJnRnio+HVkbf3mZDAyoQAygEmi3X
         hgWzhcG6v+3HbXRS50xJHPk1VKg/aJEpQq+Hb+170NxDs7NRI5z/8tPW6U65u7xzzO+4
         VPUzUul6BfVBEGVOCYgl350SboqHzvEeIE/v4lV6pJiC/uC96FOe/PZj8SOmqEbsy4Me
         PKF4aLKQGwJo2hFwkxvKU3qvvOXNUk4WlbdWrDrKmlMrBz3XxkMSuwRmo3ImtzVc8cQm
         0JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        fh=D5iB/VO/Bh7YNKjzRdLpkKQ4h3F+8QBkGbgMOs7rPWc=;
        b=fdl6v7/dhTp8W8HuFy4e0OCZCcuHfbxUeBFmkfOmn5g1Rn4xShjMD4afiDVn2mao6Y
         3g6sGnJWgvU7W/K8mecWF/1ImyAdGJLm4MOrPMONGEWZTR86wm1BCTCoFTUgkhkpQ6Fi
         o8NsiFfe2XxeGEiEIgLLOdOsmj8nPQhet0mircdSxRW33l9x/ckjt3zz2uhvyTcaxl7c
         jlWVpbwAYrcyw/nsvxYQmGmfpGNFnbdzr5Xhzb6F0zsuG59i/gTlRJaAfRExaSxsoFPg
         DhA47C8cXgNi8JV+Kk1MbIejsumj770Zwtt6h6nPfVIt7cnP+S5WXW0u0TsAfjRSjRzQ
         0iwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731611; x=1773336411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=tng4PLFQL4r2avxoGdjpbwbXviJtyJCnkv8XkH4errimTGz921LhizCAKmfFEv5sQs
         WbAPtPme1rUhPGB0BRQMazNWLDNR+e8DYrJlAI44W8QFd4kkZeNaGZtKss8RkoGa3VKi
         Th87OwM1OMGjxJsID277JEjfxbZqnYkVkwj2aYp8O6jbpQt9/ysmleqGnBPJ6NwfKSI4
         cvAb0d8rcBPEcb9DsvjtVB8wLERucFSIx1xuyrqTAk149d0BHaNCj077MHgo9/9TUTlY
         vEK46Rlz6nmQ7L18z3MmHKV0UDKKCQPum+gYyL78qMkdAplwmg2qpcMNfWNpO2HpcJLS
         EttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731611; x=1773336411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=BOBqGsc1ln2mMnuo5L/e2PjBUthfOou1DbBZECVBabpLs5Xod0v3C+1DQSdpr8iQLm
         2jryy7OwTW5YaeshlMOIk+jnn5cXlIFqNEniJTcoP8Ea7r/FmE5syHm4g182DS9hynh+
         npS42VPF+pv7yux1AokiCRrqWZsBHfHELhC3xMjjf8PWBbxNcLFm112lDOcuh6W+3dYN
         rN8uiMPnSzlHy0e+5iunlExJ2g9MYYraxcXccIxl9yjY6oYPpzh8YNIH2xhLoj6PBhkt
         FLfBzyuUc8mVOcXwIW6GihGin0BpYRQUibf/0R2sLf0UNAw47gaiUWM6O4Zv93LI01wD
         9+uw==
X-Forwarded-Encrypted: i=1; AJvYcCWpEe7/qmymRSwzyX8uD6PDOtq49lPrIaqCn5PwA2cfwQwGt2ATKXwQ+MpxUWYxCVI2sJwItTHYSZaYvtWtMWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzC7x99MV52PJLnhTZ6bi28JoEmT9+fWXDk51yXKYAuC2xaA+
	q6n9xGAbbsOqL4wq8I7Glde5azs3NgkTLy8hnNOdYjGpdlikLFd4rbW0szVuguwaabq+Hq/wkrA
	fuEWBGkT8/grE+BIaB+la/IbeAndpbn/sS0F2qIxq
X-Gm-Gg: ATEYQzyOJGoUkOktW3QsoI2nXwtAhFk/jh0UCp+3TB9/NpubBZ9cDDkhuJ9XUvRgwE9
	A9Kqb0BKW0urhms4DA19hYa9VdX6fP64L1RGdX3gEQ6jfPbEqBTPzl1jje6B7+A9j+zkHEdeUH2
	KQVrZsexmEHboN9wdGTYILcAYIPGcPE7MRWmyEg11mvi0txjx1iESSel/JOMT9Z6umlg3oac4lN
	aEKOcY/4y1HGc77iMpgf+nj8jB8tYnb56gjAWWDAyW72wn6k62S2e4JwGNL4N9GxKsRHyaAhPc0
	/V5BQijL
X-Received: by 2002:a05:6512:696:b0:5a1:2f18:5e19 with SMTP id
 2adb3069b0e04-5a12f185e8bmr1324271e87.22.1772731610293; Thu, 05 Mar 2026
 09:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <aam77t8fe5RKSr2Q@google.com>
In-Reply-To: <aam77t8fe5RKSr2Q@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:22 -0800
X-Gm-Features: AaiRm52LsX1aPJ2JM5xqUBPHr_QH0uBSIJaRMA7nyUfm3apWkfHV7m2i8095U3w
Message-ID: <CALzav=etzo9A7FNQrbLCmj=pNLN5fO-a5isP1k6MuTDkJw1bqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
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

On Thu, Mar 5, 2026 at 9:22=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > This series renames types across all KVM selftests to more align with
> > types used in the kernel:
> >
> >   vm_vaddr_t -> gva_t
> >   vm_paddr_t -> gpa_t
> >
> >   uint64_t -> u64
> >   uint32_t -> u32
> >   uint16_t -> u16
> >   uint8_t  -> u8
> >
> >   int64_t -> s64
> >   int32_t -> s32
> >   int16_t -> s16
> >   int8_t  -> s8
> >
> > The goal of this series is to make the KVM selftests code more concise
> > (the new type names are shorter) and more similar to the kernel, since
> > selftests are developed by kernel developers.
> >
> > v2:
> >  - Reapply the series on top of kvm/queue
> >
> > v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@googl=
e.com
>
> Sorry, I was too slow and missed the window to get this into kvm/next wit=
hout
> causing a disaster of merge conflicts.
>
> I don't think you need to send a v3 though.  I'll prep a v3, a branch, an=
d send
> Paolo a pull request during the next merge window.

Sounds good, thanks Sean.
