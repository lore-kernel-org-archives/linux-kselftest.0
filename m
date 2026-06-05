Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A13F0779
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676219; cv=pass; b=rC20GVzc6T7lNNjnJgf9HHDNTJ4iN0VyxXXqyQ89dvmRwXvh3ZmivRf205TttTB5H33Blwxa5Wwuhd0j9u5Bb2n8o92Vs6UCP1UwNVOZyS8QqvXLhIua3uQ9xvcB41PPXBzcQKqE6Y8HouNnMeJIW8K9+mCE0NF4gDOkr1yoYnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676219; c=relaxed/simple;
	bh=KrEWzX5V+5sJCkuOqVh531ZQ8vZFkc8QDe+WK/l8uok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+DLWUK+hC7GFG+TdPrll0dxFoVqRmgId+5GZl4t9n73r1OmcKnBCQ/PlOErFPRty27n0UrrrJI5ti3T8vFJHFd5ThXoLwjWFDFC3+RwJr80hdtxeJ8TdAhUG1d+eXrLf64jH0GQa4yqnts3Tn/+q0COQow6dKsryFeEDTOP8BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=UddL5jAj; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="UddL5jAj"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d8091533bso926690eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 09:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676217; cv=none;
        d=google.com; s=arc-20240605;
        b=YEGDQQS4YsRoj8msom+XlzcW/xsiwxGVKQkyfaPS+BP2rnYVj6qX5+9g+HS6ihlXN2
         9ndMNZK/iGP7aGjQfc7jTI1dyzsJB568oJ+4RrSPTXTXr9yoSMxtT3PaJDQdgRL0A5tH
         iqDmmdwNIF9KE4OoaCU4dUEQvdIgy5YeCMraImznJl+rR8uuwGYArvZuD5zHRaQrkjCp
         Q7B+evCEKNfV6sQ4kIUCena3H8VjIZoC+Qc+ICAw5oYhm1zamic+Aqxritq+PaHg6Jpl
         QIUb8z7q+076g6qmEZISAFeD4nJHb3BAW8qBp1E1UAKUTc04D8zi05qF34C2WBktGMfh
         DvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        fh=lV++NjDIHd4lYNvbRlJB1/bWrQ9pxQtQ5rF1U9bRIbs=;
        b=U/I6AmIeBHr9A7MRAsbumY/BU0/WpePVWq8nsWPcwoza3Y9Pfm8hGlcKNHTN+k/ddZ
         d0ac/Ev9wg09OPzfuqbsLXBCH0h1vFBd0EhX98PozUoesGNbFf7/LcwUbWliKJEA01sw
         YRubc/ucMFo3P7KIbTlzELVGZiqWVZpmUgedGIrJ+0TPMlvwlhTQcRU9lB/8QNJ28I2h
         kVv8lDVbgf8DPQn9pOKKiZXeHD03zyAuEblBEctgf/0OZt/Z5XOJNtjTD5cQRoBARRGS
         RIUnu0IClocCbmoMKBIjvZ0DEKhIeTc5+lGsGDVs3bMJFwGrIEK+NmkhPpargCI22OAD
         zPjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780676217; x=1781281017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        b=UddL5jAjNMAygQ65TPaYSjXk4hD4sj/pTIpdnouDlBhkQSMZ3VURwTKJHzo349B9oA
         CyDYz/6VlLPlhlPa+sPTfPtsQT7xL3CwoDG+3qWsaBNhkQ/SdOytaQpIRn4Ei27pt0Fu
         CbLo1lLUw2v3Ln7P66T0XeE5APyFnd4rhllAPdqXaj0jUNmeL1MbLDE/rgnfAirEUzoN
         WkC5nYiVM3MJJc3YKbNjfamh2ntLnKOuY0beJIqjg77rmRywg0Oq5tizLV8U47SZPG5a
         7/qWFnXIFMfhJOPoobNy2ngaF2X5X2S/QLxlUmfRckG/rSd/1U+txpvcPOdPSYW7kSS4
         ZuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676217; x=1781281017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        b=Gunhn+FmTDH8mxmmC7whY1e3s9nZYCnZpnYb0lcGVd8li7VPkBI+uVNlZv9RC1lTzJ
         BJYRwXUYHfKshfYVOM3p+aAxO+d1z/BgxrPn01NodHuj9jkA69a8lHTt8w3FPY0pE2PN
         O0yTw4/MCpRQSsIW6b0ys7SB8NNpeGYkHfSAuzbWVZhtbV3QHyke6qk2IjA7FtC3zyYC
         hcCOLZkxHM03CkDdSiSmyxcBXvy1y4uyicFMa8GR9iDSD5KNTYLg30ihKWJ/Qdgs5p1+
         Vh7NLK/1jxnenzNmId2qfLhT1FA8vnEKvZcePjTWjNAH9EJtpHayxFTKe5JA/URQ9M/q
         8N2w==
X-Forwarded-Encrypted: i=1; AFNElJ8FK7uhRlQrDLbNqhT0sCYDy+oi+94644CaaYvhHNlu99A6bm1lCq+TPXWvuO1vG1gNKozva9b1L37yb/iiDNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtjlq0YWMC/pUsIIA3Qvjh6OBG0AbNhtvNqlyuUSmRQPEOamP
	w2SqPBeIk5Bhv1ocKMMW3LrYzxOvJlx0dCxVnl2hztIX2NqldPx9nHfDSpRgs2Gr2Ngz/SIPxh7
	va4FKllTfkRoEakJSluAGNZcttOZe4KV2F/1B3fz9LehEAgVn/daapVE=
X-Gm-Gg: Acq92OGOFF8dYrvbWzifMclbp9xynb05rOIwJih7RlVx1aFexIebpi98jlNoVcGCdEk
	yvEJond31hv5S2XsJesnLDj+vx4U8dD9pSQgf9QobjuhmfwoGb0HvfI+EX8UYZnjEXMYPccg1Gf
	QhJ7yWNHZC0RPM+aQ0MvWzmiNtmagiP0nklpsIe6IgPcilAAWmJfLDeKuVq9W7TBU2l56k5pvsz
	PeYCdDYMMGTIwO9Dvc8zLAOq+uXnZqHBmXsGmEk1LrbBmbrl2RYe1G3+Fk3XAxxZOzrQQJY5ICU
	h/bY2ARb6jQ0iwP6oGUbVV57wSrufDXfOIIPIOvgZBmsiMVx4gPAQpteBIVHC3BRUY5dMgWZLbW
	Tl4UCfvjbqNQxr4/ZYbnBwu5dSwg/TzJ87MB7
X-Received: by 2002:a05:6820:621:b0:69d:ee54:babb with SMTP id
 006d021491bc7-69e68c7f707mr2648730eaf.46.1780676216681; Fri, 05 Jun 2026
 09:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:46:45 +0530
X-Gm-Features: AVVi8CfqxZG-V8UYX903THbico9wP-cudNBEPgakg_WBZYUItP5SdwW-rpbB-E4
Message-ID: <CAAhSdy1bMSadxaoKvSy6fdfb9pLufg=39-sHOHnr7Vj0Y-4Z2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] KVM: riscv: Fix stale FWFT feature exposure and
 enhance selftests
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:56=E2=80=AFPM Yong-Xuan Wang <yongxuan.wang@sifive=
.com> wrote:
>
> This series fixes three bugs in the SBI FWFT (Firmware Features) extensio=
n
> and improves the related selftest infrastructure.
> The bugs are:
> 1. Missing CSR dirty marking: When userspace sets FWFT feature values via
>    KVM_SET_ONE_REG, modified CSRs (e.g., henvcfg.PMM for pointer masking)
>    are not marked dirty, leading to stale state after vCPU scheduling or
>    migration.
> 2. Hardware probing side effects: The try_to_set_pmm() function modifies
>    HENVCFG.PMM during hardware capability detection but fails to restore
>    the original value, leaving the CSR in an altered state that affects
>    subsequent operations.
> 3. Stale feature exposure: FWFT feature support is cached at vCPU
>    initialization time. When userspace subsequently disables ISA extensio=
ns
>    via KVM_SET_ONE_REG, the cached support status is not updated, allowin=
g
>    guests to access features that depend on disabled extensions.
> Patches 1-3 fix these bugs separately.
>
> The selftest improvements (patches 4-5) enhance the get-reg-list test by
> refactoring the extension sublist infrastructure and splitting FWFT
> feature testing into separate, properly-gated sublists.
>
> ---
> Changes in v5:
> - Add CSR dirty marking fix (new patch 1/5) (sashiko-bot)
> - Split original FWFT bug fix into two focused patches
>   - Add init() callback with try_to_set_pmm() restoration fix (new patch
>     2/5) (sashiko-bot)
>   - Keep runtime supported() checks as separate patch (patch 3/5)
> - Link to v4: https://patch.msgid.link/20260601-kvm-get_reg_list-v2-v4-0-=
c88abc81ebda@sifive.com
>
> Changes in v4:
> - Rename the title of cover letter
> - Disable preemption when running try_to_set_pmm() (sashiko-bot)
> - Remove check_supported_reg() (sashiko-bot)
> - Link to v3: https://patch.msgid.link/20260528-kvm-get_reg_list-v2-v3-0-=
170969a8599f@sifive.com
>
> Changes in v3:
> - Restore 'supported' field with init() callback for initialization probi=
ng
>   (sashiko-bot)
> - Add NULL checks before calling feature->supported() in all functions
> - Fix isa_ext_enabled tracking logic and restore isa_ext_cant_disable arr=
ay
> - Add sbi_ext_enabled tracking and enhance dependency checking (sashiko-b=
ot)
> - Refine code organization and variable naming consistency (sashiko-bot)
> - Link to v2: https://patch.msgid.link/20260526-kvm-get_reg_list-v2-v2-0-=
7940a401454a@sifive.com
>
> Changes in v2:
> - Fix FWFT stale feature exposure by removing static 'supported' field
> - Refactor get-reg-list test to use unified extension sublist macros
> - Split FWFT testing into per-feature sublists with runtime checks
>   (Andrew)
>
> To: Anup Patel <anup@brainfault.org>
> To: Atish Patra <atish.patra@linux.dev>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> To: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> To: Andrew Jones <ajones@ventanamicro.com>
> To: Paolo Bonzini <pbonzini@redhat.com>
> To: Shuah Khan <shuah@kernel.org>
> Cc: greentime.hu@sifive.com
> Cc: vincent.chen@sifive.com
> Cc: zong.li@sifive.com
> Cc: kvm@vger.kernel.org
> Cc: kvm-riscv@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
>
> ---
> Yong-Xuan Wang (5):
>       KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after setting feature v=
alue
>       KVM: RISC-V: SBI FWFT: Add optional init() callback for hardware pr=
obing
>       KVM: RISC-V: SBI FWFT: Fix stale feature exposure after runtime ext=
ension changes
>       KVM: riscv: selftests: Refactor ISA and SBI extension sublist macro=
s
>       KVM: riscv: selftests: Split SBI FWFT into separate feature-specifi=
c sublists

Queued this series for Linux-7.2

Regards,
Anup
