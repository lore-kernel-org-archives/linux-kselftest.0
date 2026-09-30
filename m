Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A673AFD06
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768168; cv=pass; b=KNrw2lUhtym8Rps/AblMsb3+to5BH9StoexdDiIQl6EBKCtIcEWDaww3ZNfD16hz8nzZfjPoPM/xRp/quxdUF/UZ9/BZJZbOFT9wSLVzxVcoSXnDJbl4o6MtlAR8i5w4I0HEUPvpFxeMdphV0YCmWLpjyM3OoDL6+EBNLJI5X+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768168; c=relaxed/simple;
	bh=zF1aZ67Ju5HSyYBd6lp0FvqcV3RgRMD7QVkQns1YJp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXFjd8BAqWADhNhjf5oZAjhvg6SsNwhsb7iNzi2bZnApDFHUUS0QYwwSDJLI72aK3p+eUAu+85Az4OOtpVidGEb0JU4FLz7sNUuD/aPbLws+Sb9FU6rRyupDmBLxjuclTrCecc1vbWBOy5ZLaOiLZ9R+gwya+1ifqdfZ/Rpmdt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+xk2BSC; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+xk2BSC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340d23b6a9eso385846eec.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 04:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768167; cv=none;
        d=google.com; s=arc-20260327;
        b=QRsr43WBzkPrggnkWCfjEbmnriX+zqtI9zKmZB1D6eeu7cgQldaGZPFL0QjwnQT+ZW
         kBKZCw52tLP1qjxWKrNmpJ9pEP9oJSsm4IpYtb/Wbw/Ni+1aY1HV11V2L6qTBka3cx4V
         Os3VhaeZyOIxOuU8TR0O4igQ090ZkHPRpyzyxmHzTNXB2eiGJQ9dwPg0DWd7B0E2fm3K
         gNvjAYKartSPUofNNbWFeKBwJeEcqr/eM1YKYQ1gsV2sEQLIrziGCXvzJ04YyAAUGuBL
         /aD0O4RyBnavQbF994WxSOVSwg+8/Cna2CNBG2KDR4xtHvgMVslma7unc5spZrUBMUUX
         r3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        fh=W+sJEQtg35hC+bYTrmDSRkQcXvdz8Ke9Y/Ayqzbcprg=;
        b=fdKFv+529tmLl8HwKnb+9iXfd2Y6+vm7Q7fIJ7eqKtt1CQif7nntmIGdjnHKDUDu/3
         HGUhQI04dhepHTy51EDLEHPdm9gajGXhXeu3JCAXsf7HbxdkjlU8pFupcWrI2pNEWT2b
         CKkXT0gfgHoJPRPeDgmY+YXbl74KvmVqFRdaCYCrU/jCS2J+UKUokmAtOhCvI04rLpoF
         2CaLFriQyfJxvqaK34LKoyVisrLz1xYa/HA6DucpJTC0biH6KFINBXar23h5xVdKQVkY
         nu760r0RUcDPz7Vtum+0Tfr8m8Ft2p7NlygqnQUIB2c3L/569xMWVag/f+0QgzonnyQ5
         7ISQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768167; x=1791372967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=M+xk2BSCTP/CYuGTKUtIj5g6qS1PBAcEDpuQObcHU/pEFazJjA9GiV7cIq5lEssUgu
         0hQBxtL6WUoBqfm3cPm7RqoAeXuqVch1uSBvQij3ChtcNSOKb8zOnoMQPDZG4HdK0Ma/
         TV7zuRx9t7GQQaMZeqjGLGXhmryA3/KzvXwAwSc8kdELLoJ9U4k7cDzuRa5Fl4JFDYB2
         nHf/57mato+23LJZZns/xdi4FfARz8MQDTbiZMMXiH6n2OhePBjBzY1whbeA1YvluNZp
         UMrp9hYERc+dPtpWQRMB/dOKWIJlJI4Y6bFen6cgnq0g2+JkPus8ypBZDqM4tszqQm+i
         daeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768167; x=1791372967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=uwf6oyW5fdI5vXCG8XxW+mPsXbJ8WB37Vvt7xe8M/CaR/lLPcjh0vFrRKMp8AIBohY
         oo2SpPgMU29rgCNfX6RY12WiJcUcOCs9JW4mMjzrd2IqBNbMs8TRV4abyTFoVziFCghZ
         IYDIrobesP95nouRJYpAX+nDhskivrzxcqXnkLAwvdYjfNedJ2Q7Lw/iyiceU0jqYuzA
         Q/otvPVIerYywpA97yzQI0r+uIPuVYVjr6PrzJGJ7P9iD41p1QYEU5KUW7PuOrY63VpC
         6JHkbsCG+7Gn3r471TnD3o5LfSGfaq4bjRkmkddjt8RHELlpYY8oN5n9i1WYaHR9n2fj
         0LwQ==
X-Forwarded-Encrypted: i=1; AKwUvBymLEja1Cw7cxuUP/7OK9h1EyqABW6vE14jBBRNiD6Cb+y6ekVHJRPR5D8CrwFkmCscxiH0TOukppsrcqB+bhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4GvQRI0Sawu2/58WhAAVgfugS3wM7Ukq07n1u+dzYG9RU3Ls7
	8RyS8yJTuk1iYNWZ9BEXE/znRZ5WiGuHj0lYOtXVxtZi/Ne+l6WMXtNrtowJQEpWXrkc6zmFemC
	bqj2xYsiKATR8O3l52W/nRZ3FxE2g5xo=
X-Gm-Gg: AYBFou1mayOLUI07PSDxDUz/qddf+VxVJtvUyi8i3Pi7UpMyrBNQaP8uJkEgGGEP2Q4
	sS7NldC3fUFqdRvbyJlkHK0199a7+ABk2J1axxV0kC7Qw8kRfMREDFy6YO71hKdVPfnBAz63p3b
	488/2Pc98xK2YgpmH/WyiBqkuUDJu6wmVU7b9w40veVCpAg2J5Etz1WtgK94lYT4NiIIHE9705G
	f2L/79cbfsnJoFu+JbkrY5d10fTdhoK97f47C2yenzR7kPVSP5i0pQFgOqcZWYRnVRsON7YCdHP
	twWo4KCxe5ZzvB4ZKAOB3oHbir8vaBWudM/nBRPq03KtgdS2oSG5mDH7/3Yrc5IFtga6eIYgOWQ
	2iPSO7igimlYZioCstH67q2tSdcqk/hN4T1JpTx18mnS2zaMTHEXfh552l4As6xv09qWobU+B1s
	z2+eITSWPyH35I0/4gd2HvIHYZRgCWXFUYBn80X1sAx52Sc1+GsRo=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr2202125eec.0.1790768166558; Wed, 30 Sep 2026
 04:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:35:52 +0200
X-Gm-Features: AclHuK_yuuwCg9JinboBNZ8Dm3VmJy-wdX3R3QxVkeuHJ_HWhUIjFv8RJNFLV1g
Message-ID: <CANiq72kpkVJbi8ud=G-HjMmTBv0o-uUuk+qa3LTVjKgKevL7bg@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> Currently rustdoc will generate function names like

Just to clarify, this happens only for Rust < 1.95 since we use
`--remap` which already  it in newer versions -- I will add a note to
the comment, since we can remove this on the next version bump.

But please shout if I am missing something.

Cheers,
Miguel
