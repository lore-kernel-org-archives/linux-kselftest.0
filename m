Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFC22B594
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137892; cv=pass; b=P7qcn5hJO9f1pHqEST++eWitJzHwZPb5xiJ3ekjS74TwqQnNqVrtyMYkrfMnkjHpSghRV44k/skg1FU6yI6Icoy9xp8mVcbBbaQRoAEywx9+OtiARrEMm6risMtTpAtxw+hK7FAvKysuv5hWZP3PSFH1tPB+9kw2cdfUFGIPR0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137892; c=relaxed/simple;
	bh=6aOPr1Gc1H4oT1zOVBunDujm0QTDV4oUFkGeaWrjJms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwGLPh2daX9WmU+7qVv8ixn4xUS8jlmn/KMfCYNtbo8C+6kF0a6Xr5pnKxdqLAzmfezMWeIk4VaRuSpO+bmz25TsruDgnD83/n5zNqWB3R9SK+fHzaT3nor3Qyf7huDM7EBpXpnhkiHvkjQdrvQmt4X/BwWRZdrddCs1+9KAsg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sUVCcy3u; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sUVCcy3u"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385cfc572f1so62399701fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 08:58:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770137889; cv=none;
        d=google.com; s=arc-20240605;
        b=Ab0toxSJj2Gt1V+WiYQQdzpLuWO05/UZJ6VmuuviIdtjRNtkoWvaNLLRQckGGBmjwF
         E1B8Q5aTNnVz+efsTmvz0z6SyHZpfKKICJBP+XYWD2Imp4rO09Kc9MPMNxfDfLFKvZ1v
         N6JyPLeqNPxZ0OB6Qedzea66MOPxYlEpce9BHKbySjOf01V3KLAuJ9R9vXjRc9fFd+8e
         A1s3smUGwaXZH8sI4MX8XZbq6GH5DMhy4uo3wyrK2qmhDjCkOc8DkWeCkX/tkfQVCETE
         9fIIXkryF5rYP5SQxktmP0KGp/074zkQnMrleT3+qy4h/rkmuj8wXpQEGtx1MfD8xw/E
         rJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6aOPr1Gc1H4oT1zOVBunDujm0QTDV4oUFkGeaWrjJms=;
        fh=Jf71LsSrFUXr2ywCalOC4DbAUEtUuG4PUVFaWaoyflc=;
        b=EaqufO7KeX86O/GzbFm/GevMfeOoSN1koTtm8wu+VftwEnD0++x02UdCwo3/t4r114
         9Tcj1Edi6nyoeDLlyBXd9WpNMSKgByNXPQ9+MjAtlS64f+JhyOyBsSNyeiAGmWKHUo+k
         WEoRSjPyaYH+2pZl94SWYRbK1lO2XfBgaSwwo70z4YyNWpPsPl+v6BAmU8+rWKwpKjqz
         vR/XrzAjNXzfxRAHddRD3dkUwSLiBYSNu/lHTVOT0goB7brhoY/UxSTfoCyA6riqk/S5
         EZJppnv3QOvs1SVcFUZ0gN0nb5chZQb800/jwGQruDD0S0y85BfUf7Gm3dVcSLHw5iQG
         LCqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770137889; x=1770742689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aOPr1Gc1H4oT1zOVBunDujm0QTDV4oUFkGeaWrjJms=;
        b=sUVCcy3uz240cvqC4QFKtbqQeC3pfki1eroBjcgs+9VcawV0BfgTO//VCFHXUNgh6q
         CvDHGU+dISLiPBa9XUSRhvKG5Sbpco+RmqxwrNj1PhkYvwyo6iR+4Hmnf9f8ZnN0SyWA
         j5Dq3/37NDsnlPrkNewCKy0LP9Rg3FuAGspSYmxgIfhTkqKeoc9MevfYViexhyk8cfTG
         xw37YymM9W96qYuFje6OlZ9i9L6W0tdfP0uV8dCeIXZfnmXjg6gadcOz5x9PTGA8NXW0
         U/aIEWTnnl/zL6seD3YjfkEeqAVvXBb56EAI76gjlwDBMIEo5Vu4djr9eOvrQkVT5+rw
         fMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137889; x=1770742689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6aOPr1Gc1H4oT1zOVBunDujm0QTDV4oUFkGeaWrjJms=;
        b=u5ZVBbXu13WgihGapIxqk+yPvIRlMNW2kq5ZtVgLBoGmj6k4pDSJYliXR/hRtZtlvO
         tbT9465QpWilpfbuDxeQz6LG0f7jKzp5+xF6l5Nyg1Hvclz/64mhFiU96v1sAQpQPVRz
         ndNdAtF35tMYD1lW8qOYiMXgsWZoVELSAhrBytyBvogWYy1/yVxIXTCvxvuctSaM3w+9
         UhtD9Wctuhm0BGbCt3n+Dox4cCokfqIlb64ZDSZiX6akfUPTpH6E7YnR+szLltzpmF+M
         8SwjSyrZwz6Cln+WB4gLVesYMxHiPkqZqLzPGQPS9DhKfb3EOpGN4fwYDRrWNbyzyXA8
         TGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVcH642mhd3mYNWaAFsNEtDckTh88Bo3i9k40Pv74VVLWbJzlvVCbTHy0yXry1Zzi1hrusejb/Zf/0Jd5yRKIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9v4KTacs5KgHQ0cK1skem7N1H1TLSdc2vMlau+CPZOEOrq8Re
	dCKidO1dvq/yeuCxnegLrOxX/p4XEL6wKkRTqbhO2UM9qKIQO3oTVTKZ8AApohWnlpnCt3un5/D
	D/QI1jhtNZ0SpPEeKuxnrrTeTzrryb6jsUEpY8lUt
X-Gm-Gg: AZuq6aI4ct4ohORg9BuCP9i+7elv7JjnM0aoDVV38S7qJ0xtJ+Zf6VfE+FCTWqi9ZHU
	FVDduD+N2+P57nRIcrdcFvPj48J9asgTl8sEYuMa72qsCh3tiyM7AXwYf3343AG+GsyV1hMWdit
	nxeiV8dXt/KquRYaWrTqtNUo73VDjMbfDVNyiwR+t+KQz87hbLoW8esDlh5bTDx09qghiO+D74M
	4VIYIbHAQH16CVY0vMv+VTVzKlPJqyr/VLSRJOfCNZ2N9cGI4BArjlhU50CA+t7FUgsxD22ljTK
	JmE9Ng==
X-Received: by 2002:a05:651c:515:b0:383:5ea4:20b4 with SMTP id
 38308e7fff4ca-38691cb2cd2mr1264161fa.13.1770137888803; Tue, 03 Feb 2026
 08:58:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201123901.325975-1-always.starving0@gmail.com>
In-Reply-To: <20260201123901.325975-1-always.starving0@gmail.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 3 Feb 2026 08:57:57 -0800
X-Gm-Features: AZwV_Qg9rqqwGs3ztSlcPdbq8Jdvs7T-Tj5b_VVzW6YzYiXWGW0jCzjSD3Z4aXI
Message-ID: <CAGS_qxqXAQeKu3f9nLGCx1Rn_XQgexzKYQgau-YBxJDVVyyLiA@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: fix duplicated .com in run_checks.py author email
To: Jinseok Kim <always.starving0@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 4:39=E2=80=AFAM Jinseok Kim <always.starving0@gmail.=
com> wrote:
>
> The author email in the copyright line has a typo with
> "google.com.com" instead of "google.com".
>
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Oops.
And thanks David for bringing this patch to my attention.
