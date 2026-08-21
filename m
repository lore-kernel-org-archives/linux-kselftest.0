Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAE845C719
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303060; cv=pass; b=iU8dNHZijF9rwAsAnjCvi5V4Iixaseh3mXBfV8W7Ct3Xi1X5z9pNMLj3ukBmUKpa595WeKi7o9Dp/rT+XqVF+AHvgqSni4NL0wf4nubuMRdjJrd+lBGQ2jOFbLoWKpAuRcQV3Hz8MbksuMWQ4p0LLVD2NXXE0q5TMhj+sgMVWJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303060; c=relaxed/simple;
	bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oecSLERwI/KchXYo/UfAMZUP8LUkNlv21je5s6AqVWGV0oK1ThB9OUGIVq0MwIDZXoy+w+hCRs+SZ39DcIZxSNK+J1AXoR1XH+c9QajHFrYwP92etZJpO+9zstijPAJBhBxyfNMLYhKQWcO9aQ46z3tfL+vEo35fok8Yhf2SNVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEpjkFBb; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEpjkFBb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d01548ac96so1251015ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 02:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787303047; cv=none;
        d=google.com; s=arc-20260327;
        b=lQjR+cKtBoLJ3CptSYw3xhvRKOcqbEb6pmKdtbBRAhxRzjMemVL7y8uqQd7vyX8c/J
         vR9UlJMVMUIbk0tE0soClJm6a1vAIVQYs/+zdynxnbNlMUAxwelLdy5dlMEt7rbqjK25
         a+nevYnW5J/IR4jPhgh5ui2VhREk/fedVJUpjBlRhIY9JDlasJO1ORjHPayJBHciHu1X
         uREFt5ubj4T9+/C4tHlFXjKLXk2sAkiiOsGszoVtfK5d1nHx3xbpbmwJXlfIJ2RsMMjZ
         D4ps76Oa5SyH5jsCSq9jvawlPU+FeLuh5Wv6BVwYvgjwUSr4r1xdiUxN6vJtxfR0/MHe
         i8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        fh=IrjXGwklMWElvzB/82th1kJFLMYXQHxVpTJv1G4oFRw=;
        b=Utk4dBoiGK261xiLghJQsZURF57wfQ3Kwg14SyzWIFOdGc69CA/CHtngVIhfobAT66
         pC5w5idioE6GzQk15jNDrK7XHOTJ3q5xkSQH756SbK5aMQI8xi8aKwKe6+WM8X28towG
         nnaneaz4ujbmvD8bOaAUmeQs0tDMltTgUiqFosrOeQ2120OY3QaWYWLs0TpYb8yIXqWQ
         SbgRQfQ1bleMQN/HYBXRnfYKeWX6X0NTdjaoAkFoSPnMLCwp5QssSoMM4YjghhsThqHJ
         MZFPrmMDmFo1WvaR80Ov4JGR+vcSaR9s4oK0dBcrHVXJIj89NUtiTxS/yWHlVdjbrFTa
         tjWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787303047; x=1787907847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        b=hEpjkFBbFwiz1VLQFJHGJq3Pd2gbI7qY+KyHgUKtXXcifF3P86pXN0jOc+uftAP0tp
         wUaJHkgYC7KN5R9kZD7jVYyUhcO1HLr4mzhBfrpksBg9eh8T7ct6vPy2X2j1FdfrqHBB
         vkYrFTCDPCSaUb+1U0F4iVXMgtXfncdV1c/7SS2Z+Iun4UvQRCkcHIey4iL2Lz9PkIah
         1h5FpL9u6qZf435mxJwLPXKn03MNoU4VVlQhqdqj5zwQNzUc68AXoJhXflVSyCb9P08i
         dRG+UROBArOOhhucFaLNxNfj0NL5DXLRuP0JzH/6PwQqDvgO+DHdXlcFx8crcEkw0tiZ
         huqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303047; x=1787907847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        b=a9LKbhXMZamFGHOf/4vLyuZbtRGlIu22NWnEhjDdoZyvqWnPyEqyhwC9eggF8J86kx
         PtK/K93Q3xOMi+a2N+N8Oby8sWzxfJiiu1SSYzmzueT6wJrGsMyDzNr+vCFVyzcbtBo3
         8s3x0Oz5QbJTg0n9BgZNfkmwyXrGxl+GPRjgdXKOeDo2F6Q6X9z9i8zaDI82b6rgRfy+
         pf5kN2VajQTab/JzAGMD04mysX7zw3L0hBS4Lw9ADlAtdgS1QMYUFo1TJUb/h/u4HFlV
         FlKuL4Iadbj4dFXWVwt4u1tuLPA5BAYrGpMCdWXna/Y9FekBDASnd2CvuWGpf+g2e6Zo
         cRjA==
X-Forwarded-Encrypted: i=1; AHgh+Rons7U1+OLiU3jDht+UQJsxCvTl3sbA2nBSUqsWPS+F33UveqVCLKjHng8/6L5WmpX/XMbbne2EHPfITrnhKh4=@vger.kernel.org
X-Gm-Message-State: AFuF++l98LoXpZJmZ0J/bO+muJ9B8mCurfcNDrqn984dCIFPmUtI9PUQ
	ma0qzr3+KtIA+rm7wD2tVvyVtcxgoZAMh+XoJtfCbiSb5tte6E1o4ZMvUEIBKnpd8M1p5rXeZC0
	Sbfx77dXKvEQSVBQJE1vr0GP2QimV5Yc=
X-Gm-Gg: AR+sD11WZLRK4Qm+li1gULL4k9sCCPOKI7xXW7iiXn35FvlDqnwm2nNyaTysqb7akjG
	mplcyB2ekXH1aiMwBzcuKg5HU5YW6E70SaKhpmZ3mCGWF41pNLtJIOKIJNMyURbFHc1fhy5aoDi
	G156qx3ee1B02+4Ux3Tv262Eu5W1VcTKCeqCNLC7w8iRfN6BDFdyCTKUsXDnd6TzAcqiyn42feR
	fkOWxu45T1QduoFygyjSS5+ZoWRpvv2QxqvqCKCn9TlVr184AID3bEkXdd2BbzHT1Pjz28xbEWd
	9OXIOG0d8lp56gIs66wZTxsu3buhysk1XqOhcyt+h1nS1S+g/3wH2sQz6FIGmiZg8tCJddQQluh
	ODeHJGVJXvay1jZnKtpdHcfs8W3BEXxuLFd7k1wANOB/cxw1ZWHwje8gqsQ3N
X-Received: by 2002:a17:902:fc4e:b0:2d3:aecd:51f7 with SMTP id
 d9443c01a7336-2d64ae3a7c7mr46437205ad.1.1787303047375; Fri, 21 Aug 2026
 02:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com> <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net>
In-Reply-To: <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 11:03:54 +0200
X-Gm-Features: AcwNN1UF5lPYb4KttGv9cNqT5y8KhQwyrbryO6q90CkquGDi1vnrY2BN0Tnc6-M
Message-ID: <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
To: David Gow <david@davidgow.net>
Cc: Malte Wechter <maltewechter@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 11:01=E2=80=AFAM David Gow <david@davidgow.net> wro=
te:
>
> My preference, however, would be to have these features added to the
> core KUnit implementation (in C), rather than specifically to the Rust
> bindings. This way, tests written in both languages will be able to
> benefit from them, rather than just tests written in Rust.

Agreed, I was about to reply with that, i.e. if this is a feature that
is worth having, then it sounded to me like it should be in core
KUnit.

Cheers,
Miguel
