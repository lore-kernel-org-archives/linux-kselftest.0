Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634687;
	b=mzofA5MoNMDE7tVTiamOVKRbZ/jg4acB4zSauNHwRrPoppPx0eUhEfUiLLHI67oSS2ri
	 G8CJoO2nuCnEWgZi4pyPopxL2RDVTJYgmT4U0izk2vK2toA0cl8wgtF5n+8UckXMtNpLV
	 6HGEgmBgCBK6Jg/+wvbwjMEkZ/aw5wiIMw6NUdbqaJAyb+s9/cFOBjh0O4q45VAKYojEh
	 TR78VRD7LJv6+2A2zhoYdn2ZaR9xsOPF323MFI0zp64X/Z6h83PjXDAO7J9MMEfE8q2Wb
	 M4uLm/ByoX113dEeXuWek615okRBdsJ1RLUyvhXt/bt9+iCOgzB/RTMEIxLAAIGdObQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
	b=vstFtAbSYDKTR+/90nqWUzeUR3WkZIkaApuUxeQoZ92uxLVcyfH1R5TYtiqd03GP+FYY
	 IXUgv1iVciaFBp2kX5HGCPzgV/DHY3ahSbgFC8cJod3WySMbbFj22QX1VtbxSwfxHjciE
	 hlVKG/iZxfbKqbjT447H22doqJ5+rTaZZp9B1Fpxivy3jlaHl++GowvEMPT6fLILtokIA
	 446FSUigmShFqXvszdZkTFzpoH2IlaUKFz/eybEySepOOqPmk8XEMxA8SCo4/ZX8EKm6J
	 Wez3ibzQVvC7x8wl8vToiSTVaPW0ugU+b0Dl2TOvRnYw4FTy1PBJUFd2vm6h4zq7fcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0196079928
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0196079928
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a1865cfdcso312485eec.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634682; cv=none;
        d=google.com; s=arc-20260327;
        b=QKl1tvYUYkH25GuVkW3s0DGProOx/Px0k+vV0YhesUssF5+ppYHWB6agtXZH3CGk5W
         QCMF5d93TScRCj7p+DAmZGu3M02r5Cb9n+RlQOYh8zRgUQP1+S/R79d6o2AQgjUx6DMe
         UQ67lN0zp3HSXDnCo2xZNbxfz472fXFoaVPpgrJ5EeHLDoOrZWXtWLrD6QLBpfBntz0Q
         vGoijdsLGbRN32hiPc5+QMReIvjmCYMZRBlAEAzqZqq1oSjmCkDFYTqt9z2brBbSL9ih
         3UTxSgyzxrxVx0LPdqOWgEM3aubrInMPcA+bA1QGV18XMicIxU9iy2E4NFGnG3YMCatL
         Fc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        fh=BoxsjDn9eQeD5TneY3egWmk9+iuW2DJpBOG2lVhM8MA=;
        b=NoMHIadwVyzEP868K+u4cA5xOl4s+LwGyYA2ow0mApE6TsaKEnp/KbWTyMNNgHjYog
         KJ09mWUczZOjxFljDduNcvY/3GYDiBY5rFBul/IgpFtkRFMlK6TKgjtHtnGrtYxpc0rp
         jYZSmD0GOYPk9a/tnYX+BPtNFzQty3ZBj/gS7+z+V2f3IR0Y3ECB8MdBW1TURm2llMin
         nbCrFKpUUSQecjNApVZvxaOqaHRdwwUZsRF9oBIG/drGlPid6+zfm8Cm6AWz33Ecjq9d
         Sri7McI7eF2nU1oj0N8mrEU+E+KFRQJ0AgQCQ79KSaPa07r7RvEvo/54Evzz8UIpH8dk
         PpVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634682; x=1794239482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=Jx5hjpdjjlBsO+DGmDLrmel8TNZ68ZGcN+mrdu/XdnLZ3su7Qt+mo5I3Wn4KkNM0RG
         pEpZJirbWbDM2osWmn7EKh5faQSGmGgExI5B1X/4680rFZmaCbJKKxBmzl/T4N/69kYG
         iqs5LLBESRVpZObsQgILvEGVNjPjK35NtXFnUy60hwgDQTNUfkbqspJbsxeXWz9IvNC9
         OHix8ncaHVl/1Xk5w2THLiQ8UoC9ybR8pBsJynLjfB58/ROOImgsNoyOgaPa9aW1Jrar
         3UHkyfTuhfGgcLQDz/LQvCMeJT/xtikdtIUB2DvhmztgXDZ/Mbi1p8cvrIUuQGTutLX5
         ZztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634682; x=1794239482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=ZZlTZ68Agl98hhIBjCj42tNm+q1bnip7L2fgxvS2Tb+QsWLXLDtliIbEHC+qLI5yz1
         D7sFVj1zG8JL9Q1kuVfqlfMcarDu57/ZIWll2fwcTLa8JL0JCaCOK6DEP6DV03Q9fVlN
         DnAn3hdwvBsmkwzpHfQPNuD93fSLJyhcOhK35uX3qp6vYIMDngIJMU3CNuN7UbPVqmHq
         aTTFyjYCLfyMMgyse9BkOyAe8fpdeaakp6l8v/QvQEYy4mAexKK8s5NGtRWjQ4NOqZjn
         8jtD1D++JTYggb7R2IHCrcCYi5S2NIVP4VgcnoaYPrDBD9wAD3fHukbGH2z3DiwneRhy
         Yvgw==
X-Forwarded-Encrypted: i=1; AKwUvBxZGdYsmUjmZYPI3iNwIx1rpXU2qlJrBtVbX5+jIU2sKP8zwyX3u3CVS9GZMhSA55LpnEPnm8Ahp8kSS7Y6JTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zy0O42uvuT7YLe001giBrqsp0NHMmOCKAvxH/tcJTyV//4xru
	hx3e51XsosCQZxyxNua2hu3eE460Uq6UeV+IOBt7FcDQ2kVeDGWNcIW6bdkpJCq2ci/X//06AHx
	MuOQKHbYMZH6Q0F8Bt0ahkL4/kxI+pic=
X-Gm-Gg: AYBFou0BbPaJ9VwSFvxkDnWDpCBgOeULZ0xhTM6ChW37H3+sfe1x3z6PDXazlOhPxly
	dIUDdpAZl89v3SYuyb0G3HeQwwQb/fNUheR3rbN75QAA9UaSvI/b/l4rRZ1b9fJ4t0VpWC8WMmU
	DgnsUWZ+zR/uUm1THTs8KrVAbNp/HpTCa39wykc5W12tZO776GvhD9YyZ+GpGBgq01CNeJshkjH
	rydqwy+BnxJj43+OKSZ7KCTH7/SXs85LbtmsIctqbZcHi/7Epo+JFbtjCjAYAbVTRwQs9M3RIyW
	QkV061QjmD1ihhOID31nB6cm37vBYg3XjZ65EES1pUD8Cy9gDi48ony1BKUtehW0uNgjVIDACqp
	r8w0bnQMNrmoxv2FaOCZWqxKrl8iYArCO1TgEG3e+Ba8vntxiAXCyypCp0ZcWA0p59vmAt30aYB
	ispCFGM+HvGuIAi0Ra6PQstUZU8xs6QgBqykTNnCJERYyojEcdjm/zi4KSARvrXEjNjFMcXi5QG
	R5BOEd6VuLR77X0ln4k4iAFy0zKbIi6wqH9+LBSbBHjzyIgquRI5CY+GA==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-36a4220aab3mr23175401eec.1.1793634681766; Mon, 02 Nov 2026
 07:51:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
In-Reply-To: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 16:51:07 +0100
X-Gm-Features: AclHuK-Fy3prM0NkytCqnZerg0IISmU7H9eN5VZP0wCcLTYRYHd1nA0RhfMUSSk
Message-ID: <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:58=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
> the test won't run and won't show up in the summary.

I was wondering if we needed the flexibility, i.e. if we could just
simply disable them when the conditions are not satisfied, but I guess
given `CONFIG_KUNIT_FAULT_TEST`'s existing description, it may make
sense to have a new Kconfig symbol -- do the ones added here look
similar in the kernel log to those fault ones?

(And I was wondering because, in general, adding Kconfig symbols has a
price: users may get confused etc.).

Cheers,
Miguel
