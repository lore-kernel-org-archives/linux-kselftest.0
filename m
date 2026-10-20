Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515536;
	b=Tl+kg57T+CY9oFcOBngpN7/J8Rj6bxaTXnJyckeMZLciI6ZrdlZbKGw2NFGPbrFtidM6
	 2qM0eCMY6XKIfhrmcE+PK0PHUmhC31znxEmrmzB+Y0+eNhX5KytighCCeqow+kFBwxB+W
	 heF/GYbEMzdyGued/DwvQKYpj33lIYFruu+PXXqSoAjkLi1TPyL6B3bueEdLDrSfvJpWH
	 IhPq2BZ0wYfYWZFv3pS10qKxVWfEq9JreiYRrd3jcaKk5tN1KNPzzu8aoMPt0ad/c2cbz
	 uwK+S0h7yvyHejmzwst3T6qZvUEfelkjgH0FIeCItxI229cl00j82rNxe5s6k7YA8dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
	b=WNpBESPeVxgWyrc2MQoSFnphU+/YHTrf4vlIbCH4L5txhevetanKtDodLA5jruwxymMP
	 82sTPVNIxlW59cyOLXOy4TZAAVVDYV4SKNFrmXJ1HcOXebFnXLFggJ5mlfz+c4+vOz53U
	 63tK7SiS4v2eJgwDANbF3jGlkshfFMXos3wDSdCtP8q9XcwiFtuy0RFzdC6QuGT8AQwKr
	 96RPIYUuAkBFZtFaDXY+iQgZj5sFFOTViWtbxYdfA872a/oG6KeS71fNoRZDBmYHJ9tjA
	 OiAAAfwl1plWoUCwCfTQ5b0Wi3HSpp4QHiksle8+YtT11WVhTYZ+SMKhqiKAe4m2GUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJA16jB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BF606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJA16jB7
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6795df33283so500125d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 09:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515535; cv=none;
        d=google.com; s=arc-20260327;
        b=lb4neH7UlNe3e+nes4JTSaQukpztltaSmk/c6ngDHqdaMkIzZ8LHOhi1li0w2sgOuG
         5YjK2r3t48QDMKNg5OAzuczDz8LWsJFtzWts1Oy2giFcqW58hwW2eurkgiOqP8MEXrZr
         4BRHMQdWx85TZgnybyqGYIZBcv/tM/SR9JGdglVMGUIJrvUFGCdFvb15xZxTZ08vFd+o
         vFp+hNUsG7XrJ0uh8I2QwuzMZvfFOzLioX5YLGiBjaey5uRQlQM/6fjnXb1DMciaoCsy
         fN8JwQ2SfoXLAg6ewO9+7t5sZUfI5vxRu5TWSU2q+Uh71nNSDuthc3If42T/GQtVe6En
         ju3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        fh=jiBt0ak7K6xQmFRZXWxJuCbRfLDgKGi5sVo+bedzIAs=;
        b=eAqz1yLjQbAUuu7ZMGenQGFe4DsPe3MyXJeGOyHhgDZSPAdVmxinlvyFNVGGdk/aaf
         u02q6E/+0ru7f+Wh3e/qP/1nvBy3l4VgrOVi23ReAkN6QTLYWhTzHFqVboDxYMc7CD2+
         SLGSNJwJH4a4Vq7+4HQz4YqpOJlSlnlEg4lEOSTEY4GexI8iJSnKrgFdYAn8E2xwBGph
         0AtJUkB8sxn56URmpRUTj9Khfcx7cZVWMiHNwja/WJvY63PCxAeh/vbtleFIicu8utbT
         TcD9VV9tl90/a/F8xWIxeCpp/FSZRYhPucBwbEyrUvUmdXfoUSQRYNBuFYJXHYL7urpS
         9SpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515535; x=1793120335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=CJA16jB7gWCpEr8AZzawOzxdJb4z/YFbC4DXOKSP80dkmRfx9QH9UfwmDDMEnx6xrY
         ytWQXNUpYR16zu6JxHLJT920ExBMXHtB22zguBiRyWPN5R/seJsI2ALDFelxA3RynBnk
         k6SaPDm2PQdU8eyNp2gGkRKCMQyWXvj5KMKc+T/kzKmDhI71TQ91IFPyIi48S1AlBFtP
         pUjYL29NSRsLrDoc6mMsS3vPR0p537pzITgbBc7WHOZrxaeMGGfzpqx+5A0fwKsXo4l6
         vGu4aZ/5UhxApp19j+gWVxlx/pBPcFlASON9y7t2DhHQt4/qBBperU87oPXQvmT53Rfr
         nKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515535; x=1793120335;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=UkKZ/rpNKm2OT1dT57OXBSXXiYmzVTZsKWayLmmHzOPr5dA+zqcR2kiRxx3222949Y
         79ktXojrQgklzZc3YWAcEcWrcG8A1/A1ES/ZoK3eTSdyUoQ90L1XJZCtPWoqZ6ZGHBzg
         iz2QjMRhnUPCCLxQHoUdvP2a09g7lmyw3dwAwv1gAMoysoKQw94GbjQmyzJqg0jH2rYf
         Msj1+pZVcqpa0wKxKQArbn4EMqjStEUIB1I8jCmWYfwBQynFINCh4KUQiQxby6xMK0cY
         k5kXIN7DMqyFKU2U0pPerqE3msR+ISGW2jXqfHSt3jPhx6icyKkM4dFuSo/3CRyBaofs
         Mtng==
X-Forwarded-Encrypted: i=1; AKwUvByiePx5EAZRG1GaRrExOYs/U4UL2UDAFKXTiTMV+imZ9q/XoCDZz2FQs4DnOJSpIDZDV8ZfT+bq/4r4gdBCv4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrByGfQbXbVMfedbfZYccmkFQtrXs8dojpuXq4drukGfmaXwTI
	nZEKuQQB0BtFJm4w+wrROY6J2OzXaBWn2EIT2SgDdPYlCvzYohXZT/sIt8WKFTro+lEztZkCqW0
	QrHfFPFLQbI9GtwtSBwEkeQZ/bb27KP0=
X-Gm-Gg: AYBFou3/WBFFgX9OpfIIg93S5keFEs6IFrMeNqqNKL5LRdAGfyFw5/HzwXjWyiJ98RT
	PdNS8HEo3HCsUpJoPtRZD745DUO9GX4BzDFwuR9OLsZO2xx8qiwACeV074Uk1MH+s4VdcyJAgoz
	XRWZlkQ+2oSzDVx4y9+aWxFDuDTcWwIcXZj/PJ8QJgnYi/IpeFSrufg6Q/XIcfGdnuzMIoGRWUT
	N5iF45qIkXlySHtJ+JaAxJntoPlQX54EBEgV36KG7GB0aR92nCy0gjSfL6mcu51HHQOAIeittHH
	0/3EQkgn1+t4bSSrAibIHlWI1H84mrOPk5E1ixytn3pdc44QSM6LPQ==
X-Received: by 2002:a05:690e:138a:b0:679:b8df:29c with SMTP id
 956f58d0204a3-679ca54432bmr6769731d50.2.1792515534972; Tue, 20 Oct 2026
 09:58:54 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 12:58:54 -0400
X-Gm-Features: AclHuK_J27k-o8Ui6g8e3q8L_DReW_3vhUszXOZ3Ua6MjDZ1MkwzX1wkuw839aA
Message-ID: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

>
> diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
> index 5023f98d8293d..f672aad2e30e6 100644
> --- a/arch/arm/include/asm/word-at-a-time.h
> +++ b/arch/arm/include/asm/word-at-a-time.h
> @@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
>  #include <asm-generic/word-at-a-time.h>
>  #endif
>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
>
>  /*
> @@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret, tmp;
>
> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */

Why it's open-coded ?

> +	kasan_check_read(addr, 1);
> +	kcsan_check_read(addr, 1);
> +
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, [%2]\n"
