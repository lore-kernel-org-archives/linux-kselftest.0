Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0C37C90F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Mar 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609819; cv=pass; b=XvKoZPAf/7T1F/xps6w4rKM1f7jCKBwrvxIUMsOZE3aXiMkXazbH/abKrwidMapV2J0JjbMVDdbn6RrjTUe3RG53+Fb6KHsSb+Xo0u2Eq5e/CWWNQ7K653MbygMd7EOcrLNTimRCSOuT496BVC0EooT00XS6sXfT0JB07jdrEjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609819; c=relaxed/simple;
	bh=PP2J4eDkV4dT2Pk3acy4PoFiAE07CbC3k3o5xlkGmyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUuDtXK5strh8grhSJXpi/YbzSPzc2ACh7POGwYfzp/mNg77lTtKUnZbOlC4sQ17cFO5WQGzCb84+LFs5Uf4E4XhhnYnA4iPyS6F1YvqVJxU/+X5Qxkh/69QZ/LVZhqztYzd5MgINMdOq4/ijjG0FFlheLkZH2WszjCL+xFWhxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT8hY7ud; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT8hY7ud"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be9ffbcf9aso152870eec.3
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Mar 2026 14:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773609816; cv=none;
        d=google.com; s=arc-20240605;
        b=RdlSdCi855s/b7J7iXZvPWO1txjfQnf8Kcu8debkfmiwyUJJVrrrkqXCS5vI8SmrJK
         UR7cHGk0Ts84AqHX0lmgFCqZZDRx3kSPDXfLryQOtlYawpEgZK1shcbejV1SaMfW2Lts
         AlYI91OociFxiL87ZKIUMXXYLtvziWYq8zoj9MuFgHMDeauXRRbsnXpy59dTJDCusfWG
         xOVgm8cZIFigcJKmYphLw42kawarR7ZMvimr/SBgABUa23MceL98HqpQNXcCbPYwHSer
         +e3VwKnJYJuRV6LrBHNbNVE9YeyIvZ72zuQ+ZEzg8sWInrQvfvtIvGiEj8r3ruM8+ciA
         L98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        fh=XLNJUOKbMGhbFLtC3u7cBy2u6B3Qa4dl6c9Ken5OEK0=;
        b=k3ZTBBGGy1X/16E3eHmXhWln4GwNwp/KMPg71dW19iZzx+ByKVGaxDKxckutsZDMdy
         dM684g2rBKCVV81AWojg6FLBtUZPcKk2WtiWRLp7YKc67yhRgOkx4D9zr6fWLuvDz4p4
         5KSTZDkpfOij2Jxb3sk0YC7TQ/bEBFPtfI5+Xa/Dzhr2/cxfYcL+hq6I3yrs3100pUFr
         apmG6uVINhxTA87x5QigtLTbujswKZS0pYRDh9Xj6pN0BQVAaxOKIQllEKQOvLs7lbir
         QVfFMZTjc0bYEO1Q8/YSHQnSLjGw4AOu7L1b+Vt5xW3Oty9AYyQewHvZEgRjLj6n7Fao
         AADg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773609816; x=1774214616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        b=HT8hY7udMPkogRrUh/oYbrvszNT3VMQ+d24BceY9urykM4mH73VhC9wEEtgPslgtLK
         PDtlW5/oGt7kJJzfMDn7enddERZfE9dtjqUHe3JRiLgelkK3kZY7SsWMdXjKkfoYvFTL
         mE5x7cfad8vifw54TAGmzS5iEbvAwtQ2rF6mNSeCGm33x66DMIRUbOW0SJgdfIZvNxAT
         lnj92w7pU3ZqxZU5s7F67ggFrmA4UIogf/cG8lhwNHkjum//GzC1tHbjmY1RhLleMeHi
         RccTbVnioBTZMQ8uomWRVwIE+4iTpZuv7uzv7F1zSkEE/JaIMhXNP7hu3mCbQwh9y8wB
         n0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773609816; x=1774214616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        b=jNEpqLPKsRaG4t69VkI5OulasYSUwksXUCTLOI4AMCZpZZb9aaPxbcIO+dXaQd/aiu
         3Lc9jCiEHLi8vubX3JzzxHIcDFCxL0ITfveN1Q97B+Kt7fHf30udYXSVPQfg/vq8zMJP
         GV2sIrhaCyr1jVdBwkYviZ2D89YdQzP6mR+Nx6/dPoJEPf+D9+Qhz/KbEEahtJwnajOD
         x/sma0VZRdK90DXbb6gzCulP1Vhc3958AgUejmKOdkMKiNS5fzrsHA8p1TT5W4NtsddR
         1KhH4c5EdnBjo9pCYmf0Bv+tAeMB9W3LGtGLe17l62lgzNA/iU+ApzA3pLD108kzCLX4
         QMhw==
X-Forwarded-Encrypted: i=1; AJvYcCXfjHgf1NiSCkTuwrcRsJpVxiRhht4JDGdt01ZfPPgExz9tCNxVIgyV5HYc9K01lJi7HMmhHQ6uwGv1q6dD6j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKDVStslbtvaQbJA0rqbs9nl3SYjEQdDYgnekmJYiac/b1C6n
	Zn6iYZzmznZCkv76PGJ+HppUAHBzAcKp2oHrc+E8xA1i7qaMmt0gKFl2o8l5Ox2inm6WQpCFiET
	eTReLLp9hrWQumk7ZW7fKUB12UsXm0RU=
X-Gm-Gg: ATEYQzxS1/Y99mTm61tZWcYF6AgegKMdu/4JNDyWiRhDclg6NQzTgRk+UjxCXjM7LBO
	WNpiq5vch+wG8lbO4W59QwcU9euJC7KkBgThJdKtfJmZ+x8EQzxpEyoOt81wpdccfu8Hr/i3hSk
	i70CXY1EbvCF+5sQ3SHHKr9fMIKozSEA4sQjjJJ9QEWXwW5+nOjQDw2xL6wAg1hy5Y/sK5DE/DX
	XR1JK9IJXUYna7oprUdsp0LXBDa1b91rF3OQvWTDy7V/cNF2OyUdtSlDn7lYT7YpTPla0pQV6dh
	AaQaekkH9/QF4Ad19BJbxAtuTE1PZ4bunIzKooSPv+sWtzOVGCRrPANxPEfnJpy8H8e4PYOna1B
	XDpiMp4+YZDbFfu8PBSA1fNI=
X-Received: by 2002:a05:7300:8ca9:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2bea56065damr2711462eec.7.1773609815900; Sun, 15 Mar 2026
 14:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
In-Reply-To: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 22:23:22 +0100
X-Gm-Features: AaiRm53Z5esmB8NqhpEo3Ukkf4yvUe-1ALiBGT0hKmtMX4C3iH5_QYhJU6S78z0
Message-ID: <CANiq72=1koL5z-5WzyPfFX4otxgSL_oKGVt8ju7iShki0LwJhg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: update `kernel::c_str!` documentation
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 6:02=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Now that all literals are C-Strings, update the documentation to explain
> that use of this macro should be limited to non-literal strings.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Apply sentence case to comment. Reword title. - Miguel ]

Cheers,
Miguel
