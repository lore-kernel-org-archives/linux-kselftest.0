Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891A371D1A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481690; cv=pass; b=CvcwnWfO8R2oCYpNWx2Ldd2k0Zd8UdejejBAw84lgFtLN4EQWNRf0KZ4ibrueqhuC/TJbm3j8sPDVVS/+FR1KGaIzU4s6XCDBaZZT2JUhR+Qr42LlLMNp1f4FsvwYkM6EItPzQFVHAOXCRAZpgPnyJ7Z2p28ZX+9jDdlDqFJCM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481690; c=relaxed/simple;
	bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od3Sl8y+EfuNZoKTasErAdkBA/FOiV3IxSZoya0HTYw0UtPDhFDnDOJ/KMSK5JO+qpeDC4G0zbRwLySXQIMPO4HNAJwUT1tkms9skAd8MNOZrbclNPVueDTd60sVUEm0ZefSgaGN8IM/gP55sNB/RUKKgjDdgbkngFkawaXWY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3tAGxOy; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3tAGxOy"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127337e3870so199850c88.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=bN42aYhdvUvOeZnOa/o4Z21kIJfzI5yeBsgvOjQidE8zWAB57+5I/OzVeDosWQto/s
         TAzfZ0Hyei+MICorR2kw8ydbHMXyMXHaLRYwfGWBnsaOa6gkn0yqpY93BZGPXUOlUuVs
         jlMFh6lY+DgzCHU6Jksh5YAQOlY17DmijnyXf8etMQR8XSjT6Zb2PUzwSO9/e2ydSxSi
         Y+OzMvFCb4BIWeVMXtPn2l2GtAnXRn6/IZ6Qh/7ZsG44LTeGUFk2Afdpxw4eF8jjF1ws
         TlzGeBz3J14YgKIF8eoKToGrfunLHJYApT/ZqJv2AY3v6Ch4f3N8g2BogWj9PCejqSFG
         0/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=ekQ9FHobKd+eGakHyfdfgmU0hQ6skPEC5SwtlnhvuGc=;
        b=CliIeLUXGpqE7mmC4trMQzulH2Qc3pfwS8Xo41eXwmshdL8p1Aw/MaE28O1QQrcSpw
         3C6eWfeplDKz6K1KsAuDEnvYXt+lIpstUidjl6a7/xo9YSlcEqUC4BwO7/hAlHmWQh2D
         l/vhUti+2Vf/WwESQylZkb9j7Q/Tbm12rB5cqgV69Sfq5c1p8wPB2wd2dgd7X5kwml9U
         yTyJ2YwHG1/BEF0C/eFbct+RU7Fc96nRUmHaLXWENrEG9PntTlVOzPG+8ElXN2mxT4bO
         HkN9QdKZmfZ73TtD5GckF7qu7JrELJZR4Oz0ORsI/uZ5fiVuiHtQ3SGDSl+0zrSe+XVB
         RExA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=q3tAGxOyAaMZ92oiBATu8FQ/6qRm0r9euxaNK8TPoIYKXv+sip60zW3/mf/067CojG
         I91sgXn7EWKEojoel0sfV0c2x47kc1MhplILMewUkwkZaBCCr0pwNk93ApwnYy0wO6yk
         wzk4NsK4gNw4WQ5HLxHU+akS5jt/VzZUPL7mw5Z8fzT8N/hLAXQzM5TXL+PsqtJbutvi
         8uYoJs3WHDvwOVOtXEYQeWWHvCxe1gwgZnfpVYwrKTEHNlI01LkDdq0Wvn9M2UetAjbD
         lUoBO1OKkgxrsLb7uoE6JiAt9LFTPTHQt2L5Jm/D7L6biFMlveXZMrm6ibprSlWxXpbe
         +9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=pOkDfqfqv8jOMCRjNFkwjJfxLucd0N5s9+FmApsPDV71Xm//fagO0eDYTSPNrVBGXV
         D2Wtf5xwpdA+VaD0MHWKibK1ug7nmfpCz/er2JsNaXK0TgOUOBacRbFYwyEsxphUOBQh
         dFNkZTqI8/oSKIvC4uousArLV0qTQ/0y6IqAX56G5zdkoRoWfYBWqd+a/6AtYfdE4bgl
         i3MnjnDS67JyDxtB7sBJOI3boyVRind6KAXRZzDgHjiHnToZjNirfoov3V/Tl/XcUnd3
         uZk51YMgbjmolRF6RDE4BlHQlMgy/FFw1sosh0whDlplqHBdeWAaZjTFYag3DRnuTSD3
         sSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBMMmwStEQiOIYFf4f0P9zqOMbNUD8WdbrSfS0WrLdgO7L2Pp6G5P0TqQ1GtBlYDQrGCizLcBzkpElKoV9Wes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RZCBTnfoqRDqG4mIV3E2qNP6ZL9DkVzBZ33nnWWwadOYJdBQ
	CnKM8wkDs4cZZkmZApHJGxCIC3BHwKQdNJEB4WJIBtwfOAlOJUxZZW3ezzNAxvUovNqi6SVxlyj
	xlX1hR5V6PfsyDxt356sKuqyrJixrUn8=
X-Gm-Gg: AeBDieu91juaGnEYbO8rAb6MPPRzvHoKcwJfcbFG0hvgdQeCfkYuDlTb9H+103argnF
	Nn/DKP7D91PHRKUpcXXPu1o9mDwSGOQiIiiV+SrHL6XkQ1BTlXgpIf0dX0Vl37sq7QJbmOvSgNQ
	Zf7d7kXboEITNrb7GJ2IcJUWSl5WOmuTmB+NPAAda5vSNYUZP2z0WEd4kY0a9w8eYs+TwHtNGL0
	btWPUDCFYtW7Y3XzsL+XB3ZZOgyT3cfLUh1F9CdyErBT/6Jja7s4SNFnddxIawx8uq6QHP77yN6
	PnxhXpktcccLrrWUhDiDsQkSkkbZaZMbFN9mLmPapiEBfK+6zAPSoKktoPAQ/RhCJJwu9reWB1b
	CU7kQ5sChRnZb4alXXhkWYic=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
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

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel
