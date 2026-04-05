Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8B2E762C
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417497; cv=pass; b=ATp8OAFMDj8EZqyIKlN35uqihb0TMV4TJBwqNf+2+Yd5roFsMdCN+yIfe68+bt8xhN2TVRHtlaIuGqRVvqiYfN4ukPdZ+uXXQGqmXAoeKgtRolrxv3YvO6kCPjcoVO/OYdmQOtBIV1jPP34H8Xl6Kpk77u165FQxxetUcIgBiFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417497; c=relaxed/simple;
	bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9ZpVL5bEKAGebfy+MRJYPkLlk9TeEkvavFXQXKdDY8QYRXi7w6VvlHSGUPHXBNFtjtprCzUxPBdOc09V93/2KkaQAe0CjECTvOYFMVsHCpIA7DAdq5SBd8Rhtp5juoubFp7eReEjP6tN7mLypoX2OlLOEP4Gh0SAGKTznF0O8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVCEwxRe; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVCEwxRe"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c6f5574d07so156302eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=khAW9k6mdNx/SHxD0RHgO4u11iVBBxKTEXOUfgDiW66azcrbK4FBxGQ52ZWYRdI81r
         yTL9qv2api0WD7vCT1pbl4m0aUm1zu9eoefTutXD03rPRlGK+sjjszx4i/dc0F+/gt7w
         DI+hEm684SG2PNfauGa1e77jTDl9OHkiNqOc6NzL1uKvSoEr1Zzhv3UuKFqiHs/fq/xQ
         y6foMV6h39DEECmLqRsjUD6neFJtlxr2nwd7n279M9ngET/cTV+P3rUn1mowv/iOV0wW
         rdt0opZrpPi9kCW9+UQBkPG0qDjacbXbkHNtStcYRm2XmAfJK+B1hlC25P8VAl1wMDWi
         nu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=h8eZgTHOQqTtFXkLyyt98VYEON4j70tH4CRaqWYqgCo=;
        b=LgUeX1jPY1IejZNnxnOdZUqxXdvk71GvqMXyH/ujWDuWVAWwg/Jt0GEIFly3s0MmnF
         frlgKUxAP0L/52K1n2IzeLgI1qUVi5kx/al5nnQdFYNvaurIY6Ongt9FXAfnIrVoIAN5
         cCD19Gmfwd1yN+emTCa7Lotmzcz4bUhw315O5p+6K4WXdSZBXkS0nZJeTx1skpXTzoQA
         dj2S7z/l0pIZi+1i0FujpqNeZryiWr/PdRIo4ikm/52AL2H8ASsIKmSDYFpCLPS3luJi
         zukPBQgBRh07wjTmjjElvPrU+d13qoCuWhWd/bqHA03hNqAw58hNxb2Png6NbO/ejGfY
         jdhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=lVCEwxReXi9mN7cmASayUr5PgOSdAvJhNeYBKcnYoLBzpIgT0TuwJ/Jk3k0JnGksn9
         LPLA3K3hqKAwZ1+Gu0W8fbUQE7/Wf/eIofzPngWRiYCxfRQ15HFeQRREpXcs19Fk93cS
         AtImrKZrFpPYme34oYo9XVkw75r/UkbvOYlYg1wBNtM3FO5qvq/+NCimsomC8oVNMQhG
         HJ4hnag0EWFRXm2UKFVOIWvh0vo0JDsJ36HGzINS6PP6/p0hnFvfoxrEyp/yKoUdQ2S1
         2aCnEvsZed/qapAswjf3R0CCMMgGqiQy+yh4skj1F+RIiBGvxzcCT1hKH5CAfAiCX/cX
         XvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=qwwJGJfE3eIt/YSj/76PSfGEC/7sZaYFEGmzPho0RgfPxXG9EeyCI7x8U98J9NUUEP
         Sj/H1YwylZbjPnxuJoxBYtWRfloaP0uqS5xYzCQ7VcpegJdNt7sLX+TA0XsYRMDcI4Sp
         x1QQNX9VUX/iG1D0tDZEfrr8VBzLr7szVu1HHI26fLvQa+E4qdweEFAVYuZifZCNZkiy
         st+4wOsroDxtI4veinT5Guj0kVNSuPDRmBZgURrjBn4tNw9QwLtsv1p5BHfHutrtGlsp
         pk0iuWrEyQQ9FTMsd7sZM9Z2KjiJ9mMf9Vg2BMTeiNmy9SUWNPUGjcjUX9/SPj52OGZW
         Aynw==
X-Forwarded-Encrypted: i=1; AJvYcCWP8l6E1gpMTtrOB7O3ieG2202P8AWcNN7Nt58edODjZRegtxWCwan8tC5CJs9lB/+M01cFiQI6PuaVyjHjrwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNd8tatDyEzThhWLOTH/a+2d4lXKVKLGI9PEwOWuOX9cEQ8lAj
	eHFtXCFgxvM8PqiRkJD9Yw5jxfg17kplJkaJ8iJ5OZd6Xi3GEAV2mEW6XaHRe/NvRrhlVhSG2/2
	UqjqHE8WDWg57aZX0Z9C2zg38VXJ6ZkE=
X-Gm-Gg: AeBDieuZ4sqZSDH6yR/B0TOZ5cRWicrzTjT1rBtZytzGP9b558mD2AyldBkK7R5+Yfv
	C82eb6ZKC+y8sf69/50XtokVCFTaG4ouMEqkTinMCBbIBqGaj9WueVSCAW7NX0Z+X0ooeuzD2tR
	CcatMcjDTNNKzdSvuCtRCA6mENrFyR0ErJBca7fqOihmTILXMjhhpBWn4+NXzy7C0EybNxnkjbV
	7ddIcOFyixz8pOvB/rmhWD41dmb4kc7/jRj9h/ZqB1kFVFI3dLgIn3TiMlUO8eGhuFbfdw3xLeN
	Sflhy0DA+KmbamQEkeSfejnXaJzHbzJgyStqaAakBxu9XDRN0/RZ7K+ma2bnK0h+Tft8L8q9Kl/
	rsqmu8IeifoGh93/XFQ37DcI=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel
