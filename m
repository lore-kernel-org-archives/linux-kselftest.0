Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E572F5313
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417404; cv=pass; b=icLh4j/cWkeiiFNFrJQFX5J84iRUDXws9DlrVYaqUv4tvv35WwiD9GUKkUi2MCZSDNP9nlUrrGHGYRXwUtVGaJyc1PGRrnxFApjLHH+MOoal9hD/KnxZ0w5PLynKA/TBoD2Kz3PFnf5ThTYsGvnmMXw6jwl35sgMUB+rsF3AHj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417404; c=relaxed/simple;
	bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhmit1T/aaL5kz11yc5so2wbN2kTuaCuFqEt37QzQSvP85z+RzX6C5NhTMl91m2kCTH5mElDTH/aDraFfE+1aj1gVbkVu3Y75S4mceMtFu6z8iMbtfRfFp/IBSKO2LA7vxMqser3XwVmI67yWQafLLmWzhR27DWEHJqfj/C5gcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRfJiYT/; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRfJiYT/"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd801b4078so360184eec.2
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=Pj4Jj0TfbAM1DsW+8j6IPb3B+EV4ndog/at41VdOIybaAHbHjhMwE1r6tW8JcNe1q/
         O5t4ClLXWjfOYBMQhfEs0XRZA3IROPriHrDY4T1VRIGvK0aXrjjd0fXlDnKhz7alUnCj
         tBYkHN8ZZ0+KfEHVa8P76FL0op0+B1iybTZM5wcrjTO2U0cG4LHCSgGlPNILVO4VuQ7o
         H25z7L17ujPfhNJT/hY2y7Ngb8RXq4BNdrdsjyT8mixerdOQlw85XwKhZ4idhcQbOazL
         2rKv6erH1OGK+RAXJq7kww0X9iEiaKUvcFXM4SGDEe1KIuCzCumklkcxFZ0i8BQFh2HD
         fd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=PCh3t3jeRCvP3Qz4gLukm+ICZf9gOupDKzSkKIe3VFk=;
        b=fX8ym+QQ6XMwYUnSkZoHxFwCwJhjESOrO38vxow6+kOycfU8urDCRxizneNAPxVDfS
         cq5YsGdvzEHe1qXU3V/PiQqryHkikg9fqQ/3s7s4hsQs34VUUL/gkYbil+nC3T8B+gmi
         gk1UWglKGJfrS+3CnN1IDwwhXEvf8OfDjDbZZL/N56fxNeGBzS2WfOFCyJAzArt4+IE8
         3BKQgI8QheR8egx9kOzLJ0uBjv063gvj9coOGdIn/OR+/KqSXULFz9C7dHXQ1KtAPcto
         VSptEpu3UPxCJPjA5B0ZhMqIGRq2FL9HEU7SeD53fkzp7gdZnkQeUsix4jugIKplT0E5
         YaRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=mRfJiYT/+olK1iMcCR1Eq5zd6EtYOTPK4JjL5RlYfH0hC+yPxbhFtfGeBKeOVVNDpP
         cAbjCbe9gDZQEEaEAYDH6wJGt2ogaBEK4SrH21K02nQOtwKHt5OloY88rxjSzHcEL2qj
         HA5oy1Q118CPqkIy7UOTuJzcKoulpGte/Msdgpp4i99bjOviHP+vaPuGXMxoYxCsvQIp
         rG1c/qF0ENmYdCWW5xxLhxtuCMsHH1A83FMtBtZIA+v6cJ18kxJ1G6f10aKzVCZ5AWnO
         etgmpMTc25U9ObytySL+cEJgB3u6MoPbEdD3KxUPbP4zHyviw7hMzRRL4HhsBuljW+PZ
         G/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=nO0Vqd2gr1kC/1HAnxZQTFADKK+lfhikc4y2cRIM8VV5R83fIkSpKpT7/rYDwn0FwD
         n+DOcH8TTDzNpJNXqtzsmzQI4Gd7jiFXEG2QOgsJ11Gghb/acx2WHk+GGvnlgsW+OqwY
         hJl1jZbyp4W2QkoIkSwzbDgZ2qR0r7kvzeDwq7Ug6I9fpU+a1z/U0710CiOZYRYS3sDN
         1+xId1Tzj517ZOmm1vdqYCA/5i/w+YIiiRJNtiE4DGpc4grhmkyiH4/k+XRgdUUj9s7z
         v4uL4LTw64QAccC28lPunqLxL7pdg/8KI0+DLOdtjow7HV9M0cod+fz9MVyl0bKtJv4H
         7XAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmQqgX3fclCq2EUBJZv9AjL/1nQsLwFgMO9oTlOqdLVCTqNCmzoD/ACRYpXBMgy3rLiEEBHSMdy2NO3Um/eFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW70KN5f9VVJZgft8EIIyY+taHhVnW0ETaa7F3C80IVcHWvaTw
	JIU3uViN4scUu6a6CvUglLHdh8SrwtcmlWo5rQQ5TfNr6MdfG7qLrz+nfz5XOir9esO22y8V12M
	thiwS/OaK1bMHDyk4cOIpDE0SB1wsTNw=
X-Gm-Gg: AeBDieuzIbncqfv+5H5ZVU+S0ZCtgLMnoz67Pgcv+N2T4IMOGMsttmPkM4aXewAwDKp
	rd3GDkaDIGkUh3pPwXXBUaJN1u/Pmkqf1+V2ziuL0puzhBFGEdtCH2LHok8SkxXh4+p5zAf/5Yl
	jyILlfaV52mbKEOiQegswDFkcKx5SU7i1eEhujAc4yJ5UpHgwQPsvSETHnz3Nzw0MVsE20H4vP4
	OOQXLc1PhXLvZvlMee5HPqprAP4y1TT6Nvxa+13Bl3RzeXsVvq1/s6K+cpqu44lSluXg+QJCwfE
	MiIK1R+ymi+1BZUMXsAGz/NQotNFb4l0DkEzPzH5fLvxogHcsLCJ43/C9dylmDsrXMEzUhp78aq
	9QpRazhuQtHuE0uyC7BxiNzE=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
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
> "beyond" is probably not the right word here?

I think you are right -- reworded.

Thanks!

Cheers,
Miguel
