Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F938F253
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902321; cv=pass; b=jqlCc95GsB5ksGZN6AwYpDA7lGRGzr2wzSRFZ3m+VgFEuqC5EcqiQJ00zJARRe4znXqDaIuy7cytVogPS6b/6aRXWhEp9vT33WcwpF38B3K0YWpnLmiYXxN8gOByiJFoRydoqe/nS/9KYmFZdqPJ5Cu2tfDWNSQ8t8JYcBUUe1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902321; c=relaxed/simple;
	bh=J6Z2RHY/NCDFoPrX7lhs4FTKKwpaOxpIvJqta3A6z60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCCx4F8zhG36UlXirQ6n1bMDYXUp4YI5JcupistjhpkMy9BEJpibNa014OzH2rtXAkaTF3XHaEZ1BpQIewuc42cd9y0HcrPmwt8DU1Z+trSlZ2owQRLR3fjZfaekMPjpJasuwMFgBx2aDHI0wTyGPBYx2IJetzGRu2j6jQIJnoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW64x+L9; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW64x+L9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304e86ecebfso219616eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 00:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902319; cv=none;
        d=google.com; s=arc-20240605;
        b=P2Z1o5WfigBwgWuHkZedYrVCq00qBaahPW9dGK5WJES91B8XMu2pD/EmMatG7mbEk7
         FCxqfPib5lLXGYWMIocRRBZ6ZepkwdgKiQT+w5GHYuy/xMXnZyN9TZf+myEd3Cw5ZAo3
         dW3JtnDm1P0zPbDYvCsPk3r/pmYbtBswQ8VqsB9fjXnmjeym+AKW77l3tMeBOsuRTbom
         yhzzrznKS8uffEgAuOvFoNjNY3Zcl3HLirXVdxep0tSkhN+xuNEQjxeVgc/IMcCszXJ5
         TzFdMT+tblDnas8CvxxyzY5LhdqUG0S7Yzm2EWtL40mo8lAPJKlRfIDhs59263SBnJCb
         3oNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        fh=nyEZjCwaJsZauuB97AFzsPTpz4r4wJM6WYrBvQK2wCM=;
        b=VvnhFrOhiiVUgJ3tkQMd+EGxdJEYa6YErKtBusb5CJ5shjgR/0VXLVFClE4UIRaVdr
         hN1LYkLendSMug0Lzr0qYxYhbbnMdM4OXGj6uY2tFOTlE7SiyVfYK4pnkvCrUh2rEG28
         lKtLghWZHr9NMO74+poJEuux00Y60x4yYeFRvoCNsCfQ8CmA1la6EaGbYFpdBk0ux1me
         UDUEKecfvU01plRE2CVg9sNxottJICM2s+Pc8Yh++avRj5alQ8fo2FB6To4i2506yqum
         YKLCYTZpMEY2nyynLEs49VJinqlaPksnbayB04aBM58VOpNs7UBxC61mq2SSrYWjIbkS
         lM7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902319; x=1781507119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=gW64x+L92hygzkwVcHbOrih7mWyvRCP0fm9Q0guozA5Q6zxSZMmCnJYf4D7I1il/kC
         5Yf3Z4Gr9jopiuU/8IQsjlRp4Vsmn7dVGgwT5iEM1f94Zhlu6U51UWGov68DtwfXWbGi
         YcoV5pVAgDAdja4O+skFC+6g2ribkfBWF4wN9WmP98DzXzV6WC44w434DBgTOWhHJXgU
         SFpeLBErQdZSFjlqYsrQgDbXjozyVmrSqkOgkVe30hPpXrloEdxXleZMwyrs/blRNtTJ
         LfSazKDX1iDE87Fx6zm/6r9Wz/H2lyF3N7T8K292sGC/g79kPizEaVTGaYPvL1+tD5uF
         Ax5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902319; x=1781507119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=Rp2VTXBEe9eLtiiNni/DkiYAqYeDmtR05alpoIvADKnZ26iQDkg1OxBFXstnWKIcTx
         /oOOI7HHhxPaZKZ9sVaes8YL6ZvsXHyO0JDis4+Br0bUD2NFU66dF4PnAjpARyaQPRLM
         pyJNrE6nLxrIqy9kd8LZ2KlMDeNZGRU0YUdp+s31pb055OC4GAsir+KujsWZHZouhBaf
         kj9155UiUxTinAzqGJxJDB/Lv07fKtqEeAe8U+gOpka06gcj3nVhAzDSLzChDpzhqolB
         uRO9g4oAp2k95xBiWw7a5uU66nzTWR41tB0hL5kJXaJxnVG5DFkGNeLbzR11t7tzPDIr
         EHug==
X-Forwarded-Encrypted: i=1; AFNElJ9H2j/W9sePZxF4N4EVKlLaslHt1NHri5tuV4PthtIzUREBsFw12ZB0gA0WhNu8rL2XUI91v+vFwMZJU72+IC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7I+DOMgrdB9SiUtDKiW6QlXNvj02x1bFCg5Yj3WXS/HnlSrUN
	t7jEB7TRN4EcorHrMPRC9MuJszGSAFLRPmld0RUluaFuxXexKK1PDdIF/0ne1F30nlVu/apgMIt
	8nBZ0n3aA/c003JK7+DFnGJe5/nSMzjM=
X-Gm-Gg: Acq92OEvgPU/k5oZ3BDvJqbTqKPvjnE8k+jyHNaZr8UH0D7/ddcgYbNpxzRmwXJwyc0
	YVGpfv2ed7pFCV+H8HKz0U26fvAbXrDE1Z9j5c0N5QjW2XHTseiTunAvPVgNsPWb2P8HDfvmzMx
	y64nlj3sfxyWQ5ZYWgpxW2GveJ5wCa/1VctgwgSvVYLX9zUpUbla2b/xtvW0SXGG81Vx+hz4ErG
	wPjYKcb6B8iFMTmUumbD++f5yoSnmjFrcptOoseYJVsvwCyelYlX6MsbQO3uduL0is/cxzfO1M9
	z4lzmDehZxrYSBN6KGqMYwlvrZ1Y47IkmIT2MwDFhNvg985NsvZXu79l+ASkv0hR68A80D5fnIG
	6t4l+CnE7ocjUv8upnJtn/j1XVPniKNaKCw==
X-Received: by 2002:a05:7300:134a:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3077b326a5dmr3445647eec.7.1780902319255; Mon, 08 Jun 2026
 00:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:06 +0200
X-Gm-Features: AVVi8CdioJIDDz_cRAY1RuWSS0KDIb_lefz9KIF5grkUbE8JNDNatMTjZg__w7E
Message-ID: <CANiq72kAmcLa6AJy_-Z7HOQHuQeDtd3aUNZUJ9q98FWF88knVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: add Kconfig.test
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:15=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> There are 6 individual Rust KUnit tests. All the tests are compiled
> unconditionally now, which adds ~200 kB to the kernel image on my
> x86_64 buld. As Rust matures, this bloating will inevitably grow.
>
> Add Kconfig.test, which provides a RUST_KUNIT_TESTS menu, and all
> individual tests under it.

Applied to `rust-next` -- thanks everyone!

    [ Fixed capitalization. Used singular for "API" for consistency.
      Reworded to clarify these are suites and that there exists
      the doctests one (which is the biggest at the moment by
      far). - Miguel ]

    [ Fixed the paragraph by moving the new sentence above. Added gate
      in the other example as well. Applied proper formatting. Reworded
      slightly. - Miguel ]

Cheers,
Miguel
