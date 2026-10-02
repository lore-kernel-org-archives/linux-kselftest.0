Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42D44065B
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973782; cv=pass; b=gEH+QmbKWoxMEHLBkWdGG3tnBmI98CewAfY4vKOwoQz2vdT5xzecuYOOubJQ7j+GN/9wdM22//2E4kk5hmr6xvXszWORQgIu+8WvUq5IJNtQz/S29jG/lswu1i8R9hFb8lReJ+uzM7Q37bdgBBd8sS7DwBwSatvHCDj1x80iV34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973782; c=relaxed/simple;
	bh=O0oErUdvCGd0lNeKXzKbX7E7eK5xVZTCX98mTa3dJ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+A/zj5OHifeQhDtkG1KlrQfEZAdjl8M9E54JfqxRJLibuUCLMYZaKzBjQRZytzNMq9oWzKKZSORDKOOY+nC3I8AwLI9akukyNTF52ZKfKtkAEaeGS8He7Ca51E6W01TTULGBShNXNMFfKZMnZYo1YhBPZgU7PtH54WH8uuNiBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2FArZdd; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2FArZdd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so1645305e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 13:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790973777; cv=none;
        d=google.com; s=arc-20260327;
        b=MHNdafkVq2CdBGlbLPOx+BO+///1IkUzWb/bxdrrC36eoFmvNd3uvco8ZFxpJXGKp8
         OVLc5xF0r/yeCd+A/UlhuwDjaSBXzMg6q+ClolVuJmzH5tMGVnQ07w2ZHRq77M2E9E71
         3Ja7FcjFnN6esDfWQX19+4TRixNDWiCE9Bk0RA2BhmyKYBJ9S287wnvFlPIvpuhFkexX
         bVYsxUfKOEPKvnUJbkwNw5/e6Jx0Wg1R/YMgKBaFK3s38OjrlN7f0GlXwROK5blvVDlv
         T+IN22akIYPqW+WKhl3zXbxIJqkRfNe4/0ZrFNxRYLULJzo8/jEbFdLm3SDftOkU57xd
         iWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        fh=NRO4g2vs0h1QYgyODu9p4/4zwK498ZG+0zGNOokHv8Q=;
        b=mv0+oM/93U6GaSKzD0AiNq5K0IaEDgjZdKdn4/+qm2YWE5+pDQqomDUq9ioSTNh4V+
         xAmPMINZiMTerb2LZQmLx9U4jHCirpR6dYxKi5yLvZ/MtCbkt8tN/8TrQpiR3sDe9pmW
         oFtHtwz1c/IgWeQhp8KRo6HCGmunAUpRGI9AArYrKMM/3aHvHjmin87T4GIVoacmJjnT
         FKeYwB/XygKXeuCRnVW6nC/OtWSoerFXchWirUMIu17NDupl0rSNzkVODbpjlczRjTNO
         /54koRnxIcNQLjUS/MKIl6sQMKML5FegN2fZYxKWtzQukysfUIkXyN4Cd/NhB5Btjy1y
         7/iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790973777; x=1791578577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=d2FArZddCvzzX4kGFZD/GcsWkEm07K7qUaqAHzs+JQ10c03/DY8JrDKmqEl2fDAm80
         z4oetGdhgfPtqX2Stf6uHwFmPns7GrbyueX6EsLB776UJA8Qe5yuzuD1tNqXjzvbN078
         QrTH0k6apZxgd7FYmnS9sZiF1Z7MN9Hfkn2KdewBCUv6VSn/8Ci4Wadvd2nhSRlGQdK3
         zuQmg8BYUdnNkeD82XjrE7tGoQqVBrted1FgefCdh+9kdZTfu3be2bWn1ajYFznwtEjy
         40teb/pvgeLJn9lxQ+wr8qKnEEX0xZeIT0oWmWUOo8oXCPPrzoD7jB1AxJt2ZSi7Zz58
         a1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973777; x=1791578577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=Ft198EmxaZexudS7xyaDbr1wHs5VkKASstONpmsCRN3InyP4+LhR0ltiRlVZiqfXw2
         5gNxPshXIoDb4XxbbG5GlPskdLXw0CeQpkifkT0st0fiFNeePCleGfqKEGKncah9hAcc
         jPDGUIgZ7tkrxC2A9xy4x1xaPHbRXAWpdqZcvv7UUwIDpGA6B+nKdRU/1ieAZW8K8zf7
         xTojRJR6INAxbgrXEze+OEReZzFxECu1gEQ8OqFdSzghp73iw474Vghmgy8uGHun0goN
         xn/UPiBEogJGIbBJhpLct16AmMrmdIc+WvsxFrOZu8f48WRxUsPYiSniwgMG4iWHpJ5z
         KdTw==
X-Forwarded-Encrypted: i=1; AKwUvBycDKFuCMo3nd63RKffGB7HFU/gwcvC2fGKcE6TLZJariaHue691NaRhSoe0bvV5R1ZQTnDZ6UBYlXOJPIuYzs=@vger.kernel.org
X-Gm-Message-State: AFuF++m/MgD43iri9WDmo+R93KFqccHb8ASqCkafCj74NOhvofXwG5Gj
	GZVPD5W4Lk3N4KOSUkZQiIQtWkzn5diqfLHIgxUPRZKjdGBmYgr2OfdZ8GVH0BWmKRKetc73u1R
	h++vVgCc8OeTzuAtDYjcUz3Xp0/OchYfhL/0r/lsLDgrxS1RU7Tpy1TYh
X-Gm-Gg: AYBFou0c7n3PMJ6h1sN2vDFWBnNw5B86uuQEKeUkTvWYwELvYmj0PANj/Hn0XTrVH2M
	kk3BhnX++TL0xK3POSTxuHtb2kfMv1VnqwEYJo5wP6DiMJ+MIVlbO/VjzJJJr++rHnPO8Yfygh+
	JgWUsep1R5CzxQmyK+8hyGmEkRKWuNK6TXWzfjhI03+ytVFfNuCKIlWBVwMDLpPDXqevi7zWwCf
	e4gXzAi6j26ucHxB4ZNeLyhe2EGrBYyB6VvdV2Xs2ZN6PixGGnIC1Bg69vXIhagNbG1oSOg6alX
	PO+DpM/ltYhwDF3aUgkcerljc0P63gX4QMf4TcbkOEWzJ2V8pO5VK32Jdn53mc8ApwKaEadRZ8s
	6LuV/HGxAxLYDmQWI+s/wRJ+3MG+1cebl81k6G52KwmkCAV8ZflueF8sFdhI9UemmSToGXw==
X-Received: by 2002:a05:600c:a011:b0:49f:ce78:356f with SMTP id
 5b1f17b1804b1-4a0276b869fmr57980835e9.32.1790973776781; Fri, 02 Oct 2026
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
In-Reply-To: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 2 Oct 2026 13:42:45 -0700
X-Gm-Features: AclHuK9GtaEMxub0C4cC2iFOReeGZtM2r5F_DDQMeKZ3U6WaUokmOoRrco02awg
Message-ID: <CAKwvOdkjLkKb1503q6HOnJG5ps3iZ3GdTxP5B6rOSPEfkJ-PBg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add stackinit KUnit test to HARDENING
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:27=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> From: Justin Stitt <justinstitt@google.com>
>
> Noticed while preparing a patch to lib/tests/stackinit_kunit.c: the file
> is not listed in MAINTAINERS, so get_maintainer.pl does not suggest Kees
> or linux-hardening for changes to it, only the catch-all list.
>
> before:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   linux-kernel@vger.kernel.org (open list)
>
> after:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   Kees Cook <kees@kernel.org> (maintainer:KERNEL HARDENING
>   "Gustavo A. R. Silva" <gustavoars@kernel.org> (reviewer:KERNEL HARDENIN=
G
>   linux-hardening@vger.kernel.org (open list:KERNEL HARDENING
>   linux-kernel@vger.kernel.org (open list)
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..019f443af051 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14164,6 +14164,7 @@ F:      include/linux/ucopysize.h
>  F:     kernel/configs/hardening.config
>  F:     kernel/kstack_erase.c
>  F:     lib/tests/randstruct_kunit.c
> +F:     lib/tests/stackinit_kunit.c
>  F:     lib/tests/usercopy_kunit.c
>  F:     mm/usercopy.c
>  F:     scripts/Makefile.kstack_erase
>
> ---
> base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
> change-id: 20261002-maintainers-stackinit-230afe234e5a
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
