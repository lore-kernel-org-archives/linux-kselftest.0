Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B072C0F78
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692279; cv=pass; b=UDgS/Xd+vP99J5c42R1nSmXgMHVA4QQRaZ7SS8SV/xHDHlLsNMqCCV4kUL7rDbDDUJ9nLmNLqAHpIT0J/MzTzc6bJa2ZD+V8KAWXuCDQSXgzt92eb/eP1j74PHCWPDrg2gLJoTehYz806lLV/Wayekv9gdjsUlsxp1U+Xsmxwik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692279; c=relaxed/simple;
	bh=zflpxtRBylCX5rFH1aSVW9cpbT8IuiGQT38tsF8ylXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiPNg/XHnkc21768jGQ3Hx5IXkWcD4cqGwhtsXQDLEsmhCuVZwr/L8WAd3/W+SdesY0p+4r+gFPklPhnC4Yhl6GQ9BShtQsnw5jXE7AFofgld58GgRXwOE9wpPnLBgdav9n5P9TBonqQj3bspgOCHFuwWuT+5CMVQHTxtl5O5qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8ri1ixT; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8ri1ixT"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffc6a96602so997425137.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 13:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692277; cv=none;
        d=google.com; s=arc-20240605;
        b=Xr+igfGwwkS6GHrI7VbKHm2onFgk3F/oVe+eeyF/lD7sFc0POdqwoOEWvgEMYWsi8M
         UZOjqr67m6SgA4ozY+laOoNFQDHsGJJ3VAX/qA91JsYTPC2wNMUPR6vCv4p95Z/jYvxK
         HAn+OtSOApaNRWOlxQbqnHPx4EBJeY7y+eHjsdAdvvmiyiEO6G2BzTcfXduWCc/cCoiO
         LPuxLxv2IE9XfAb0unY+ISCD5aVFxduP2w6sl8nz5l0T4mOWAS9uI0pGYhIakHaXuuAs
         gxORAVcni8FP8OVzU5119Kan+/D2U4ixxlzBE7QykFy//l5Gra3O7hiys7fWyZS/baWp
         g6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9Q6fH9c6L1HLnK289rjhbhnEGeVoiRSnOJS5fAspJg=;
        fh=PnGL01tpOb0muqV7ZFMOq93guZCg8jIVR4YK3pV3sZQ=;
        b=dJ75+GScnYDVcrVFbsJP7488soQzcOSyZBRBn89RmaGJ59reAG3QF3SfbhphgXe2Jb
         hrTuKhg9ft0G/fnu5s6CoeR/Q8xD87b5oRfc4DNYEeGet0fz0qM8yHbzFmZOr5/Phm+G
         Duehndk3h5FJLCrj4zBnn3RqLNWVlbA341Wb8im9Ijx+LoOQYcm2xCBH26UF2fwQTsIq
         qodZ01JvXGg41CfRLmBTd6/gBdMfm5dOPwIiMItUqswM7rD2umXrjhunoYo23KIf8Dm7
         XcrR1wj7V2ixcfzXE0f+++//ICx9Ws5r9U1XFAhYYPe2iqqBciJ/PD7Yqe6hIOfBqtbI
         kq5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773692277; x=1774297077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Q6fH9c6L1HLnK289rjhbhnEGeVoiRSnOJS5fAspJg=;
        b=u8ri1ixTDzIQxdC3TGqvVvkrleLPHqqfAiTWEMbkICgOCrTocy+FVEorLtqAypQIic
         5boB45tp0hc6jK/YeBee8DIFKK4YxE1N0ZXalfQgebLxDTMyg8Eczngrtz2N5RXIzF4R
         4T3UxnW6isTBqY/HVwtx7jYJax8o5dROVjGecgTlveQyodatP99tEM36/6B/nTmgyE5X
         u/TsJTNAG/vdazyTnRFyKJZT6pt1AsJz6CWn49k/smcHUze4VxuHLMrvc0vTTQQs4j9W
         rqtqLNe2Ev8ubOK6VuZRtPNHxuOy0wlLlwBi3WFOBrq045FYCjrRT2KXvdv6y3dNI+zb
         gWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692277; x=1774297077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9Q6fH9c6L1HLnK289rjhbhnEGeVoiRSnOJS5fAspJg=;
        b=mu+x1fsDhurxIV1urOPJLDrKqSujF4Qh7lHC32dmDu+UAFYR0G/cJOxBb+S7WEiv+T
         I870CNdo1ZMFPbFsd/OmJxItU9HccftwQafjueIcUR3P8/ODGeN+MpYbYh0GDQCpBiqq
         Vugf+SB7dnBRtEfmN+JC1w/LRst5P794PyfQav+01woKaFYtdlMoK0umCO+n0Y4kO6P7
         4Ci89wD9WxYnVwOCqp8lBVazd+6VPay052ft0pE1zRWOztJaFKmX+X+yswpEiWVFZbkG
         YLSmEmGb8iMKTy8FOSCtBnypP7n+EjX+M9S1Do7eFYKtnkuQsV93mXl18Obn4y/2VeJq
         //eg==
X-Forwarded-Encrypted: i=1; AJvYcCUP+RkjP38oxQFtybO9TziCO7bSitigg+G0qvxDL45pwxGb9/U4ftLUSCrTOCcdcf3ulZd84cGjUXLD6UloCxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzui7DnnSGjIHBUC8XNMWD01UPtMpWPSHHAusXTbF3jjYkUFdMf
	AxbRVQ91yQRIYlt11uPoxLgrcKV1OaF1x6IIAhXSDvUg3H0REdQHCvWiqmdeecPUmVCA2vN2Vnn
	+IqAaKjQIx9N5RQoZxljlnaMhF8Mjdu4Qaq3jp2d1
X-Gm-Gg: ATEYQzxBnMrTAdgh3VJcKyna3wnJcnSbQjVB5T25KSYX+dcnQTSNBTk4fz7CUQhHbe0
	0I4Tj+zHXXtql97ZrZFFfrAVwXdjo+herU+OTYm0lhNZtRqhOXUUAw327D73d10jE/V7GhfElMj
	hu5pvKZXmY5OkTgw9x82NLurGvuJSLn0XpC+59MjpKBIQluUgakfE0XpxIKyJjJT9yr0oGuS1pR
	A19HYQkmJBw3lpX+/ZGuwxc59NYpkkJfPRoUAlUFVmZRNEIYOP4cfcKd3dxsjR1N3qufQxVVpw8
	/zG6A/bw
X-Received: by 2002:a05:6102:2914:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-6020e545dd6mr4815388137.29.1773692276401; Mon, 16 Mar 2026
 13:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316182025.3383443-1-mhonap@nvidia.com>
In-Reply-To: <20260316182025.3383443-1-mhonap@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 13:17:27 -0700
X-Gm-Features: AaiRm500IMKzdT9Uk7XlTKlfOo9LWN5p_UCslJHzbBodrkrMtGSMmsrWtG5rUj8
Message-ID: <CALzav=dkiHkA6f9xv3HAozsoOz39ruLVB8yCMLB6nw-+hX1cHA@mail.gmail.com>
Subject: Re: [PATCH] selftests/vfio: Fix VLA initialisation in vfio_pci_irq_set()
To: mhonap@nvidia.com
Cc: alwilliamson@nvidia.com, dave.jiang@intel.com, ankita@nvidia.com, 
	kjaju@nvidia.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 11:21=E2=80=AFAM <mhonap@nvidia.com> wrote:
>
> From: Manish Honap <mhonap@nvidia.com>

Please use "vfio: selftests: " instead of "selftests/vfio:" to match
all the other changes to tools/testing/selftests/vfio.

  $ git log --oneline tools/testing/selftests/vfio

> C does not permit an initialiser expression on a variable-length array
> (C99 Section 6.7.9 constraint: "The type of the entity to be initialized
> shall not be a variable length array type").
>
> vfio_pci_irq_set() declared:
>
>       u8 buf[sizeof(struct vfio_irq_set) + sizeof(int) * count] =3D {};
>
> where `count` is a runtime function parameter, making `buf` a VLA.
>
> GCC rejects this with (tried with GCC-9.4.0):
>
>       error: variable-sized object may not be initialized
>
> Fix by removing the `=3D {}` initialiser and inserting an explicit
> memset() immediately after the declaration.  memset() on a VLA is
> perfectly legal and achieves the same zero-initialisation on all
> conforming C implementations.
>
> This fix is self-contained: it touches only the existing vfio selftest
> helper library and carries no dependency on any other patch.  It was
> originally included as PATCH 20/20 in the CXL Type-2 VFIO passthrough
> RFC series [1] but belongs on the vfio list independently, as noted by
> Dave Jiang.

This should go after the "---" below. It does not need to be in the
commit message.

> [1] https://lore.kernel.org/all/20260311203440.752648-1-mhonap@nvidia.com=
/

I see you also included a new selftest in this series. I'm glad to see
more usage of VFIO selftests!

Can you please Cc me on any future changes that touch
tools/testing/selftests/vfio? Or better yet run
scripts/get_maintainer.pl and it should add me automatically. Thanks.

> Fixes: 19faf6fd969c ("vfio: selftests: Add a helper library for VFIO self=
tests")
> Cc: stable@vger.kernel.org
> Suggested-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Manish Honap <mhonap@nvidia.com>

Aside from the commit message nits above:

  Reviewed-by: David Matlack <dmatlack@google.com>
