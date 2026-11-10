Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319294;
	b=1Tp8NomYI6lkM2Sn6c+pYmfWfWOwCS3UjRDUU7wV4QTkxhx7ixDyHsu+3xKHrqk+wxjC
	 h02tN/osHnTr+IifpUR7xt3aQ7VuDIWE2sOrdmSPMF/XjXT0FT37i8K1wBsIpzbxAtsLJ
	 JKLjIvMJrvWaVwHUmKaQ2KO9eM7R3O4+KFLGTyQxw81icxl0G+OlzICVrFZC77svWWYm7
	 6sFbnbHMlk1mL/9Ev+i//T3ghc0MHI3/Pko3vSC/x5sN8tYbDNAPyLViTJ20NROW1oCdu
	 40vsqIQMkzrWSN4GkYTL0e5q8K4IE4XHGbjTItGazJvBF1rwEGT49rrAca8QJ1lHFRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
	b=2lZU4u5yb2pjEVHpp03Zj+eH09xDmN5TKg4BTmqvKCsgSc7IyKmkZ5PDpb1k7beFDIYh
	 hM7GWoGtUgeBdRXZo3kmPnddgv1gvfApAJcYFeL8bW6WMmXtS8EWQeMk+c7McgHxy9um0
	 EPUi6eMTyzYdgOSRpXmqnIRz0f4W684A5u/Dkim8y4n/GEgzXknQX7Eh+FbfknGtuIOSn
	 t5RRoRsa36wC4o6baK0T1qkNhCUYmcvWRNqk2TcTUPWf0dLhAdymjGKdVPpICZvRgtioJ
	 hg5nFbZdkzTIlxofaTs9/UyphrMrkZ7+UFfM+xeZWmeyqAeYJVYA1Q+hJxGRsi00cWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF069606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF069606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so203693e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319292; cv=none;
        d=google.com; s=arc-20260327;
        b=I23Syud/vhihYxd751cq4GeKi5JJlvKyvePh3KJ0cFM3MSqGMrsZQoTW+oHF5KDNY8
         u5o5q/LIe77ad1JMuWrGA1Aeq0OeosNm/A+y6FlHOHA+0b4VmF/HowHD5CFpG9uPZe6/
         2zeYebCsObPyRlupirmfoVCn9ircsr2K7Q9SRC8N2mVqktJDktxdyeocMwnMn/Ji45ff
         HsQ6r159Yy4bCNe4sAoBWjrbGOt7f0bhK+66I8D7HhUCnTTHsRrKFviVmFClHohWoJwr
         FAFpn5P/Vn6m/su9ZdsEh6bC+1hnrUZX4A8x3MALiCdOTigec2ZBNgtRfGDvpVzQYo4V
         58MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        fh=Bmdt7VLaDt1m9iUqP7KDEao+MBup2taivZoz3J+b5q0=;
        b=DIBrElULxcWEldpgbx9D2ZkRujxgq4tstrGSUGqB8j3Xd3FXp1Gv+LRm0IN6JQwE9j
         qk437zHo8zsTk9hAIbIUQl28Q6Rrjb86/4fLwOt+XsL6qeNJ91ogsOsu5e6LX+BgaCGl
         fNIM2mk5Ku2U02EaozACcdQ2n2a/HclhN98aIHWemMyDafT6iVWG379DT1o86mEtJFWM
         ZBEl4AiSLGRIxGPqE//eELqNp26MfcZYUawEF5CHoPC0NVJGVTvShpTtNgdfuxO2ueoJ
         MnpwlCFyu5rh2ZRZwITIiOBpg/F9mdcJQPCBr9QyhWKB+4URPAUZcGHX8NzLV+wqC/P5
         vaqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319292; x=1794924092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=vHQJdOmE7N99ngc9GoHAnY4XLWpwuSZ3cwrSpmt3XwmdlNzQ8CClhnSQh9zqWG3jcL
         xgJHBB5aq2uFX76Xwmk96UBQ4Y+NplELrVa4n5Bg7U0AdHFWC5CHBoLvv30ucyjs5X+F
         FhF/WYR5H/qiu97lauKnvnWkN8YYGTpEHdR4y0Ur+5RC9dRUG4yT6SUdOjj1u92/8M9L
         aDpD3LHIap323RzSXqWy3uJ+56pURPRZAx6NkY2Rem0bPOqhgpW1d7cTHbmpT1GluNvy
         7k9bwHjSyZpAUWyQ6sZRsNmV4b6iqlXR7+N3LOk2OJWXrXYViUWXzT4Phdj//LTK1iws
         1CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319292; x=1794924092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=XkSpf+o496hLNaWkcabMwTUF4dXueupXkWb0YpLmmMq5nngxUngmgDzw4NGtHiLW4p
         PUCNiLpgvuC78K2GvZxBpRq8FhV8YdpJ2X/pis69GS5UPohoHCpoh7HssU6HC1/cihUH
         /YiEua6lZqyHxY3SPP60pyQAuRv0f/AO52lz9dx54yNON+2e49OnJhAnx6spBufAcSnk
         TNcO6wpydW9vv9BniFkerl+LRLEXP6woTZ43X3YtZXfEqGXlEpSR/VnEdJgik41bsZk6
         ehTcPr7WgTPB4Id1UXRcntDw3t6Ml04WRjiOjYVqmSzojsUq6YXcaJ1hd3BhYdWL5PRB
         HFQg==
X-Forwarded-Encrypted: i=1; AL+hErFBoZOb+qdJnsgKtngqCM96jnVN4ScagY5g5S9/ErXIIhEe7Cryp8R5PtFvwGpSmLj2PcyuIPpVTkyutZQCqng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XK1LkJpZsFoK1b+KfFQ+KW5khJuniVZ6eKCMQKPMgm4CE2k0q
	mJTdlBOeTX6HB7MBKK1FhH38+BgWweKE7k0JhL+lTRhdQP9NrI77GKzYXgYcIVEwQ3driNOCBhq
	dUNvkcNyH6UfNJc0JCjNM7PsbGc+VXJo=
X-Gm-Gg: AYBFou2giHhckZ5wsqREhXXLUptFBixZDPH8fufL5nYUKIMZcNMDhzhImUiB/ObAmZk
	o6bl0cvmF0rs6k+W7+uumRGLq3tQ0MtohmP2dWOqF3vFQL7XqUzdGUs4ch4ywE5t0HBDnIjIvFD
	Tf17Ep2CtqU4TESi8hffBF4OT1znz/9TUP2X0qZyYpJ+1LfQYBNtwgXAXZgvq4CzYCUPJkImNC4
	jyar5VJYbO6HUTSjnFKWVuI5c1Na/wmPztv4N6FUYXAHCZKcOCMHyWOnA4gl0vUSJm2krKeBEE2
	6UCiNw2vTERdl8VnArmWtL7zm9/arZu57nISqXIWjYb2SL5B4yy2F8RHGf+MUrV/JgA3LFD3xnL
	Mk6gzrAYeo2nJfbffPrB61e4hIFI7ks8GP6uTDIjclgGG/2RZZprUs5m6KCXpBwsV6025bYG7cD
	u9etVswqEsOlIS9mR8o4ulXbcQCbex31y7bt8xv+0KRIMKxYY5/rCOKrrU1GiTMO0AWUT34dTLp
	Y7NUrkt+ofs9AnqYXs3vk6xRKXQ7J6bg5o=
X-Received: by 2002:a05:6512:8348:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c1570347a1mr743203e87.6.1794319291749; Tue, 10 Nov 2026
 06:01:31 -0800 (PST)
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
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com> <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
In-Reply-To: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 15:01:16 +0100
X-Gm-Features: AclHuK-FOwKiNXD6KSO1bPkfXxfGEuimosgCwy8tkCUl0DXr5tJYqmZdtl8uISc
Message-ID: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
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

On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> Yes! it was to match the other one. Since there are more tests the other
> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
> have also the #[test] attributes on top where a #[cfg(..)] is present).

Yeah, then let's use the existing convention -- that other change can
be done in a separate patch if someone wants to do it.

> It was on purpose, I thought it looked tidier separating it (but it is
> just personal taste :P, gonna revert this in the v3)

So we generally try to avoid those unrelated changes, though sometimes
it is just easier to do in the same patch.

However, I was asking because that removed the line (and you say here
"separating") while later you instead keep it in
`owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
change.

Either way, yeah, it is best to not include unrelated changes to avoid
confusion.

Thanks!

Cheers,
Miguel
