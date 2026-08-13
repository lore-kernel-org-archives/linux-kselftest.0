Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE03B9618
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613577; cv=pass; b=MxAyHxY06Y0MeK35bxdUgTdTeK69Xzdn1MwPqdgzBN9zNaDwo576+wQjDleZzxdkDRzGGk6ii5QHFfGK41Tyu9uOFVrnDnEOcWtW8qadyLhWFuI+y0JmoNg8wfR2pLxGSIzTjgmhjqP6Mw6ZZPpZ51tArV9+JX6f1lbDFseReEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613577; c=relaxed/simple;
	bh=hxPH+ehBPzRCWk6w7xeKnqdyk50jcH5XyZCkn0NKK1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omtcjjLfBdfunTrjy72wuw5ala1mevCSAISm1jmhcenmyMVgn84w8Vm20l+/d7YFH2+yAmqrTQKCm4uct816HMej3YanPrmL1fnfxnmhp0DWcYwWL77x7Zih2ugyl5a7vwhQ7XTZIJdZ2pAsZ3ryaSfQT8XBBleXB1C2GCv7U4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki0S4C8W; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki0S4C8W"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf110997efso5122005ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613575; cv=none;
        d=google.com; s=arc-20260327;
        b=IGE2WU68uCJpwd8obhc6t21XiRVK8XKo+pSd5yN1HJB94Gh81qVcEb/u+9KAZ/gCtY
         42K+0mKOcAFUr4wfzVT+X1Z6OHnCqxVXR1j/2aVV3pw+X+5CJaccGhVcZ4ciBxQYhNep
         T3AET9gAMnlE+8Ce/pXiTM9Map1bsAQWt8B9cscHp9TWLELZM9CvvkYZHA12vC+jRHet
         unTK0cQZZ863en2Xkvj1CYixaYImeGNzH7ijwaU4c08Sywu9XbZ523ApbEyzsgH9RGB9
         hvcIjqkpz/20xSt790J91zJWSH3A8p4zioN3+6NtSL12EryZ3+FwqVbpUMyxdNCbWT3v
         b3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        fh=B7VgsdSVSkW5Ya0yo9HOb03aqktcl5/PlavL4hmX54Q=;
        b=IU5TnPWZDfHSEzh/MUaEOwcW+T4tdSpjIBQy2Xf2CamU94TF4zK0u6+EJVv9t3PQbH
         C8LjrZ9W5DiQdePHaUQVpojqMf6lUB6JfdACkYw7P6kZl+ggwdGzJ5BACFaMfa8OyU/J
         CMbv8UFnmDH3ehcMtAXK1btv4B80koYOZh+dNX2Gq2xLS3FW/eD3PD4mB/pnQI4rRDQC
         pOF4VlgThu1pINwrrjxkNwEC29WzNnalAOM30wAvhcVN8T6D4t3EINvbMbcDjQdD4Oo6
         UDJOQB+S5NfNxdt3XkfF0tr9/8XDSf3McanUbgRfLQVNBotBa9GFPcozYhUBnGs1E7nM
         3U0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613575; x=1787218375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=Ki0S4C8WDWmasGaotvQ0nFof4wEoVQlo7An0ov6Gl0rUwXMSgg6XVEXZo6N2Goo3So
         O3/FgHe2UfkWJy/r6cN/eGa9shVxGjV8+Bh0wg8UFrL+p1qKMHJ28Yi8H4mkSOrl47YM
         3nAsY5Jw5yPDE6Tl6+UUx8L50Nw2GceIHZWxlSifOIY0qi81DPGXV1vCFZR4MyImM3S0
         9XraUocr2791q7nmxmZZxmE2r7aJ7qIEatOVqrjx2Orojbo0aklqiZABVkTYQ5o/JT0+
         DMg+Ns+B/w++Om6XoscYdrCTs/9WeCwcfWy+JqozQyENao+7695ruzUgy5KCSXK8V5Em
         h96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613575; x=1787218375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=A+CsD6gZj/zukUrn8vKfneK71QuMl84PBDNDsGQzl+VOie8lKAdwJfNW03eW7ZMFfu
         Im3MnBXCKkbuy519Msjvd5k/s+Fcs/OADl2Eg3y65Sic+2clcxourE8h26qFtz/9zBVr
         QO2T3v2w5wRGK+Jh1ghYfpfQ2MXMEt7gJPQyqfZ+bt8oDQ5m++VJufrAfGkmX/Vz+qPm
         qDQ6fqi8GH8MQhrXlKZ8kaDB4g8VNzyZZhRNnwwNW9P4sa/qFcH24JaclB1oNL2L4W8K
         /fmBVLmqLp1QBkCcgHexTBx4nx0f18kWVkGpYJIy5O6i43OykKj9wqFlsStJXbJK12xX
         VObQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxSdaPVysn4rVitJGjNhwYwLcWsGycDJ8+Ap9yz43IBw8OTS8oXuf5hH0jBA4koFk7ovwtoP/OvkIaiZgEssE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYRmxiT4K73VwVMAox+ZCT+S5mGDsSQ6i8QaxOvGD8Qkutcs7
	gmeQbP9VLOhtRWt+5qWt/if/x5rVaO8XoLnUlqNOIB9gvMwUpuUP3ARFDzl7iGuvATlTSZXsAhN
	O+NVIdvVN5xJqUrItZJLTtQiUasy3j9w=
X-Gm-Gg: AR+sD10Xvqz7GLNK7+2SawGIzuthpJe+VLizXNL0f9OWeE4Gs2C5qOBUEj0QxwBYabm
	bYYgb+wd/neHn9pM4Wz1k0K7apOfiC9c8M/gQ7xi1moPGtzQzasfTwb1u6CeMcI2TEBKYIOeanZ
	GwaYD+khxdN6SWl2tG/APV+2ZanMHqCNwE0MRmBFIQU/ACwrTYATn+qd9YdOD10An6PIFtTUNE0
	oEk6j8Coak2MZ5qPJ+I/j58bBR08+r0An+NCkT4zBHKNToRNMljmndCf7+nJu31BJulmsjN0qO1
	1pSAgrG1Q0AjpJgoSjynuOhOPhUJOFHMlySWTnnZ06+p2VlM6Q3wxwlu3ayzbecBmYGwtJt5p3E
	7JdQcjAZNlmmCltjb8+JkOTf86lvqf9loA3eHqauJ+C8ySFbHC60FDjhBP6N2Zg==
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr27617905ad.2.1786613574868; Thu, 13 Aug 2026
 02:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
In-Reply-To: <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:32:42 +0200
X-Gm-Features: AUfX_mwSjTSmX5g9cpyULDa32fuXt2Yd5-MIkCd-iXvVUBlQKiet4rzS7F5uPZo
Message-ID: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 1:57=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> IMO this is the correct way, also consistent with
>
> https://lore.kernel.org/rust-for-linux/20260811-fix-fops-owner-v10-3-7e71=
776f9dbe@linux.dev/
>
> It might make sense to add this to rust-next.

Yeah, it is also consistent (in the sense of adding a fallback) with
the other fix I added when applying the series for the `macros`
doctest; and the `kernel` crate is not an actual module yet.

I guess yet another solution would be to have an even more local
fallback, but that would be too local in my opinion, i.e. we will want
to use it elsewhere sooner or later.

So I could fold [2] into commit 98f256e27262, but a commit on top is
fine, I will reference that commit from the new one instead.

Ok, done -- Danilo, I took your diff and converted it into a proper
commit, please double-check you are OK with the Signed-off-by:

  ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
`#[vtable]` `impl`s")

Thanks!

Cheers,
Miguel
