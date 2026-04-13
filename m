Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CAC39449C
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111945; cv=pass; b=j7wm8f6ptaYuZuo9gBt9WTS5/Cho5+6NNq06DDmz45MhkZh9IVzMI13qK549poxg59Vw4/94nayn4+L9EbpYpzydanzoE1v1YLIDy8H93gc8iKPW5jeJkPxR5DivcXqrcdOsK1U9Djrh/daX2RQgO/jG/dSWElATtZIBI/f18rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111945; c=relaxed/simple;
	bh=mlUTy7/jkefITVL5a4erlzBgU3Ghu/KiI/y3SgqnOSI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cm3533WaNrhGMYB0XkDtScttOOok4yTUI/mLur4loUeSomMCId0ysjl9atBoTAPOXcNXtm3XBYY0JRAGSNXLzg3PRzlfAGL86w0IKqtBl3KAaWRyPXMWhSiUhpZrvDWjdgwkoj1QPqgTLquV6mM3tpWjPAY7dv+PhIBPEtBR5oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lC/LVvc9; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lC/LVvc9"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95697b46831so495774241.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 13:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776111943; cv=none;
        d=google.com; s=arc-20240605;
        b=WupCODuvcD4bgBdlaxezhgNMCNuikc+NjWac7ZWAo6cSa0kQlR2J2UWkYAkmorpdPH
         0WX5WPbx30VLec4e0KTCObwSFOE6uWe4p4sfjMYlfmntvyV5IBruajQvfCYsO+vmozc6
         OL5pczUtQVcSqrnkb8l4BsuJIXnjbWTOKbfFer9ie/ZX/knjKcwSLJy9+X8bae1ti3j4
         jYwVXNQAezp9lBZyz15/jdwBdonyLsPUG5H2Eb81Fi9uPoJzE2kcwLZ2tFO7Ygkqx82O
         yrJ0jwxTS6kP3WWyZg3S+UI1meULFfsc+GmVIyW/zKFZti14P2ZPCmoXKz/HIN+THrax
         5QWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=YS8g5QJFR8jK1LSnwP5Vk40eZgK6L5/v75MzQ3NX6RY=;
        fh=Ro3V3MPUv7oG8pnPOvRx0bGvCddE2uCw+vOmnsZGifw=;
        b=bR0Wg26DqlVsnOj8yINcHWR4+Oa+FJ3QFdqJSc6O8GYVc81PvFjkTwybq4WnH4+HEn
         N5zIkC6DIAZdapIFc+L3bmwE6X5BKTtihS2OxJia6JNIoSdXBq1P4R31CSfBMW2Cc1ry
         EGlKA1aQuDkH3zOF1FS+pa56SiKhg9L0oVvVnX4u3XAu6AgkE9Jyy3cHFeAFO+4CVLQB
         VDT745iqkbIJ6AlDXE2TPWBCfd4k4Vhj8xOhK01Ba3NK2sUfqdCnGaXodUVU2lOxF0bS
         5t/MuFXW34g6S22DKljvA2iiU+3poV9xbtgiQz8owQZkZdttwM1U6mM3ZGbyKY9XB5Y1
         txZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776111943; x=1776716743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YS8g5QJFR8jK1LSnwP5Vk40eZgK6L5/v75MzQ3NX6RY=;
        b=lC/LVvc9U9B5k/mmB8fFJMOLFwQJ79yz8zDTI5yYZ+JFUcgPhfR5+PAN3exBSDBlJA
         +URqsPFRG+SRfzuLSQm7c8LhukO92LKCBA0ekWJZ126UmT9COCn8OPkMJ48YjUX5o7gZ
         752S8WtgG8drQo6vIwcySsEq9yXVfHVH/WkOenityV1NNeLCBLkTv5+qxusN8K9b3paf
         1FLHKD+E6x0IT9ofvkv59Cc4J6JMiq6AKYOVrJb6/wNWQJzcBuJyNEXu9xPdBQNfAU+i
         5HycbctqlpBv0EoIJ8Tn97rxIOBcVfNUnyAIykydF3pJ5Rs0YMNEvadvWPKKiPqkbq+g
         0klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776111943; x=1776716743;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS8g5QJFR8jK1LSnwP5Vk40eZgK6L5/v75MzQ3NX6RY=;
        b=TEVBiz1G1mj4YmKJT441+vYSPWXTSkLwyoqeckUtV/8SqvYauRuUvyPxq6dgr3iMZY
         c81Wn+DAEyX1jTAfma2kp4zEnl18s/8ZUYG7R3k3AigZLx4vDhwIAHt+GYD3xVezxnem
         /kpSssReYto3QQze9pkDRfG3F5QMeoB9YNwj9ST81L2VaaI0Iv3iQEVRv0pfu/4hs+Jx
         C+ZYDtMZaJKLYw9WF6MZjORYZrMZLFFnc9DHg6kDtl7sRZjWUCVdGTzp0Mhe9JDZ0VcR
         EFrgk1ycUS0l1UeKxWgEoI19UD4CeSqle3UhlDtey2SJUNDNvo64E2O/ymypcaye+Wr/
         YmgA==
X-Forwarded-Encrypted: i=1; AFNElJ9abRreiGDMTyiJIdnlYpnskAKw3MGJ9r2dQ/W5xGhz1rDmruagCKZFx+WX39GBKahlEsEl8/7W/cJkURK724o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgnRnM8yezC5c7TxB65aZqDde56oZzFP3dnIwUDzaTWOVs+OS
	D/Ox72zGxZLDXIPXCNDqhF6/DuFkfBD2+Na8NLQDnvLiPAZ9akmlPmnOTHeHW5h9iX5OXpzI9eQ
	+m81ZVmbzGawmrwiik9UzvOe4rToFDOpv8hlozLiF
X-Gm-Gg: AeBDieuUXmFfc1aIWAtEDaqGreDkys+tBx6sjHhFOgBxZSNWjrzMQQ+Yu+kbAvXwZCy
	2E/0FdALbZVAgnG5kRDXiFfVu4v1ch3PGuZtIis37yoJPbqXWyJRYm1W5G4v+IB8P//lk4HOlM3
	l7aSCvMMSYDz9nCuPWXzPAJ2fvEu4rXI6xPTQrZ2JIPTV9/W7km2q8lbru10BQW/+OvWhkAA0BV
	NLljaCmXeszLgc5/ON3EKIQNaGxSf7/bggdTNHsYdaOzILwI++b3cBbQtVObzNWAFa9GXMJwkeG
	OF+hZrSJCO7MHN8rFAL8UfLyQLRJfGm0Wbdbu9JfpyDFYiGI3kAH1WTBs+csMSEqrpNuq/Q0dwo
	ZVPkl
X-Received: by 2002:a05:6102:26d2:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-60a00e44498mr7057732137.16.1776111942452; Mon, 13 Apr 2026
 13:25:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Apr 2026 13:25:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Apr 2026 13:25:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-6-718f45eb7c75@google.com>
References: <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-0-718f45eb7c75@google.com>
 <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-6-718f45eb7c75@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 13:25:41 -0700
X-Gm-Features: AQROBzDGuqFmnG3vyngPb8K0V-pWCvWE-2AOnqZC5LdtA88YUYKMK02KSxNYndw
Message-ID: <CAEvNRgGz6CHgCtR-PpyiRDy4tMioTGgYDFrzuWCmAodMcg5EWA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 6/7] KVM: selftests: Add memory failure tests in guest_memfd_test
To: Lisa Wang <wyihan@google.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, vannapurve@google.com, 
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
>  tools/testing/selftests/kvm/guest_memfd_test.c | 168 +++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>

Hey Sean, what do you think of adding even more tests to
guest_memfd_test.c? Would you prefer adding memory failure tests
somewhere else? I recall you mentioning something about there being too
many tests in guest_memfd_test.c already.

>
> [...snip...]
>
