Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D671F5834
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524523; cv=pass; b=KcwoGr6ox6vG7wbcaNe4OhFShqajC8cMGr8PHiELH1qBn1H10bkG3t8BtOPoHPduwIc2vAOHts2YZu8syEUy2FfDikPDeOkqdxJsxIBGolxmsmAp11gnHa5pael8pRxHn7DuM9ddYDRXymCWL5k26YgPiKCHeiZF+mfkU/vDzbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524523; c=relaxed/simple;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIWbqUok76OdEh3d+RUcfxqaYxIf731uwoqACI8khm0y0InehNvsSnHFDKPGYd5JPD0ZDUhSYaA/D0FWE3q3B66rUWI/Y4U6o3jKUbDspB0dhEbvRZsRUvgdNeC6cr5T+7mil0cV4IVymBoRvJL0jAk6o2mIV8k45vw8PiMy37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGQ703As; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGQ703As"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124a7216c9cso216390c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=ivXHvSfUWPiccwXg6sp5JoDEvIEZbP4apWPxzVBP6coJ1VzN5Oa3ioiezYJPOQ0YJO
         AC5hcOhUrRnC/g0xuAbC+sqiAbgC0ddEjoLKuazM9/K6SaX9vZxG8Lsle6XRtPsL29On
         EzYwwSnP2yVAWlHC3T564aFWD3aDYHCYIksE3YjkeDU1diNgTZV3f/y3BThXy9xM/6vw
         dd0sd7/9r3k4nXulgA6OXmWm1W+8wUyqXogHpM85f0t8im95byuCQx0guuPbZ5vBUAIg
         cl+owOWai1v3ZADrWVDQ4VIxGC6MYcSCka2iOBZ3Cw49LYSjMJwiuVLA1LWeBRCWeQRH
         PGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=ZKMXrfbN+y9KIhk2y9eMh1zMdmNjB6oJWQ+T6WSpc2g=;
        b=fbr8iUTsAL+f9XWz+AAC7j71Mq0XmFtPAHG7hFVRkHZUEq5Y5QjL20i6U6bdzjESmv
         EoSzSiXy17POgsOZ6753FsDAayudB02BwcfnzGMRJQWmGILbkWdobyO7pUB/9Zl6Hy+D
         A0tsKQVmc+oKz+27ruDvn5jIoStL5FX015xvJkefJUilf/xc849Hj8dPGPpn0DkxbJ+3
         ctAZRnHVT8rCRv02BEE6CLxVjRjDSsmg8WLjhxvXWvrdxM3KNIKVHnVU+tkXTsrPazfw
         dMJbyLh22y7Ri6WIjTiY2FjlWhaF/+0siQUQDtuCWadDfsHYNUIIFutGI4kO+5h/4pDD
         0Juw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=YGQ703AsCty0gWvo5XnlPxhjc5LCMeOjJ+5VaBNrHpu+0TsSyjrNcWEWd/m0xKLvux
         Fz5M7QK2bIoG18YbdIV5pRHLUt0VRJlRNL3J2rM62DhKJfRPvZiTpFS5LoAtuErROO2A
         i5cq6rZGi0/DoY6biOvoAPYi8iZftts1ZmtoQjeEvt3xZ+dK0jCer/1bDx9ZChZ+Zp0s
         7rRkWYB/dNzrdFZyyERvo07rZGCl1n5PabJoeFVP4Vr7eDLp+plO3A1tRXMKwwL0NCB4
         seVG8RH8bxEcUVp89x1xzYmOL6jQnuRQvt7t2bQgN7B7U8eQ6d27Ci+Z9zrMJMknNpl6
         Tbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=XaGajdUQHkVddEUmKkgz8L+6wmiy6GBzUliY/PAlMbOWYzbV+CHaKFHzl9WOM6vgbO
         G2L4WnGKicRSZ4lO6InDCH6pC2n0sSL7XncqfJM3PVN0emNORGXa8jhayzpiZGWT+0ju
         dblzlDnpxLGSlEfnw9ZxNFM1nd3rpwlAR+rpBUACaZNlZ9Qxe+NT7aV6cqLAePkC2wfo
         zMy+t9cYteGRARQZuWIjkmHauqGe4v7C0HqQYJFSaED3Pj0IBaxfwmApZ6YUtxmYmPh6
         RLhZrK5GSBBXnfZNEXOQ+LF+zXIT/llUopbA7Q+z8cfD6gpYcW5jAaBwJd3k2rdvhvER
         IGBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXxfLCs/yX6JfxbcHE/VGDwxrzLlrGGbAZob4BzFs7RuMfevYyCBCyxyks0dFHPPsD2rmDtaey0W1AiH0SlVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg31zKI7nY/pmDJExj1NagmSKoWsZg3A5gLEXRiWQhohLWGdDD
	Un6eYOfxmeZIX5XLJgWXnw7ZQtTayTbG6L9W/BQYnhONu8oujLEFFzN6OumdCM+cPAgud4wXhRl
	I9caUb6JwckZAl+aAptAj/YFyngxFNDE=
X-Gm-Gg: AeBDieuF5W8VQKtDpkyM3Qv2aPec8D9uu5aiDttA8PefbUOPN/9JcesBaQmx0oV6YsE
	k08RvIk17XJDm0ZrMYfzyq2C4aUyXdCS//hOR+bdenlm7KlU0hntARl+0nRdIN8HYUdvJc/X/m9
	kBK/7pkXVEjbesIK7eVj+APe3t7uRCxDaX7mcu2PjudYr+Y7X7QrVwUr38TODdp4SrNyvD9Z88N
	hs0NeVgRhuOFdQ7VoORXlFmlNsRGdGjfCq0daza1YUprhClIkntbbuwx+q57K9Xn7b/Oa19QCn5
	faY1FKmTpRskQIo25dCHd91GeW/Yz/eMMSa2f8bzK6+EpPEEmnr9fBH4KQdMTGY1yY2THd6vN9/
	DTP+u1L59TCUuCujE2I/Fkcg=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel
