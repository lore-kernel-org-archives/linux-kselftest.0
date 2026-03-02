Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDE082899
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473580; cv=none; b=HIHidkmyt+1D6PY78GiWDdZHS22ZqcIjXNBFPKGoP+G6Cfev7KFsaFO05mBMfPltms5tyQVfjC8TcNtNgHMYitoB2w1Eqo2gPcgZ98wH+1K8yb4QkYlP8UbmPpO9zMFPWpzFOkjguSWl0p+cyu6JflGLVJzxSALH7E7wSfoKxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473580; c=relaxed/simple;
	bh=xk2Sa0/F/o3zcA5SrVAb8kwCrGSRJ8F137GOIajTJ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHdmlbxoiYiB8/6wfQ/JHhKLBYL3aP3Ri4UsPlu01/mZ7AwzSV0WfGKgzx0p767Yu8NV/s1RXHTrWPVe1BTq+gvZLfWvyxQQ/ECc9LJox9cT6FAeaVxiT0tQ6wKfnhjGCsg/RQwJNOXxXoWaJcsZ/JYNVdrGubL4cPqHO/gjBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4rz4NkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4rz4NkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B8BC19425
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772473580;
	bh=xk2Sa0/F/o3zcA5SrVAb8kwCrGSRJ8F137GOIajTJ1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m4rz4NkJA1tq6eJPxPhzoX0oDsu/PkPJiXMEBISqYCEU+ZnUlXcbRrGUANqzb7Mcd
	 0K9FGVlkRhoGdqRqs9R9am7PYS2CfPtN9BvgiHSay2VJfoMUh6U/vYrZulcIPKpteN
	 Xlao6KfM7qsSrMWSjKp+uRca83MvxlNePGZWrid0WmPhZBSH0ptwYpvjM7RVFIESwb
	 GbVbA6DVq9k7ov5RwQTDNpqKyn2mVfzA46PzxFh2J/WPjauTqetp8QiRsTJzHO47O9
	 TlNWZJSMu7PUO8EpqyuUhrvXefLpERv+okndeFquwnxEWxmTD8WgQViUoUKTRSthwD
	 ugitRU3PTKkRg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38709888abeso10010791fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 09:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNz9HPWvGD/vmQ1mMgcNosLEuBBF5/0GlBoxYNiV7JgQNcfVqK0ilWdGd73OHzLXOMidY65pjpE51yMdB8svA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUl1z5/yayYiGi2GZ4XpXYuLqDcrZ4Tv5xaz3doKnLslahI61C
	jyU8f12or7EV4/T8USLd7HHNG66mS1pT4h5BDTR3Jif9gXEbg0V/C53GRLniCn33BrrhSwDZ58G
	RrWruyMrAZ0ZOPWDXz8neU3S7hIRCm/o=
X-Received: by 2002:a05:651c:988:b0:389:fd1d:48e9 with SMTP id
 38308e7fff4ca-389ff36f884mr83303431fa.40.1772473578959; Mon, 02 Mar 2026
 09:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org> <DGSH4L653R41.1JXV6RIKG0V4@garyguo.net>
In-Reply-To: <DGSH4L653R41.1JXV6RIKG0V4@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 2 Mar 2026 12:45:41 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9mOq69HHALheyFNc-0TqUTDGb1CEB4zqERXYhK+oMn3PQ@mail.gmail.com>
X-Gm-Features: AaiRm531LE_EvicxT0U8EMnQXWB7T9tGf08YXv-ormO32S9ztsao6bM5SEnkkRY
Message-ID: <CAJ-ks9mOq69HHALheyFNc-0TqUTDGb1CEB4zqERXYhK+oMn3PQ@mail.gmail.com>
Subject: Re: [PATCH] rust: rename `kernel::c_str!` to `str_to_cstr!`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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

On Mon, Mar 2, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Mar 2, 2026 at 5:20 PM GMT, Tamir Duberstein wrote:
> > Now that all literals are C-Strings, rename and update the documentatio=
n
> > of this macro to clarify its intended purpose.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1075
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> Do we really need to perform the rename? I think updating the documentati=
on
> should be good enough?
>
> If the only concern is misuse of the macro then perhaps I can just add a
> lint for this in klint.

That would be better! I'll change v2 to only update the documentation.

>
> > ---
> > This patch completes the work of replacing our custom `CStr` with
> > upstream's.
> > ---
> >  rust/kernel/bug.rs              |  2 +-
> >  rust/kernel/configfs.rs         |  2 +-
> >  rust/kernel/drm/ioctl.rs        |  2 +-
> >  rust/kernel/kunit.rs            |  3 ++-
> >  rust/kernel/str.rs              | 19 ++++++++++++++-----
> >  rust/kernel/sync.rs             |  4 ++--
> >  rust/kernel/sync/lock/global.rs |  3 ++-
> >  rust/kernel/workqueue.rs        |  6 +++---
> >  8 files changed, 26 insertions(+), 15 deletions(-)
> >
> > diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> > index ed943960f851..f7cb673b1766 100644
> > --- a/rust/kernel/bug.rs
> > +++ b/rust/kernel/bug.rs
> > @@ -80,7 +80,7 @@ macro_rules! warn_flags {
> >          // with a valid null-terminated string.
> >          unsafe {
> >              $crate::bindings::warn_slowpath_fmt(
> > -                $crate::c_str!(::core::file!()).as_char_ptr(),
> > +                $crate::str_to_cstr!(::core::file!()).as_char_ptr(),
> >                  line!() as $crate::ffi::c_int,
> >                  $flags as $crate::ffi::c_uint,
> >                  ::core::ptr::null(),
> > diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> > index 2339c6467325..930f17bb2041 100644
> > --- a/rust/kernel/configfs.rs
> > +++ b/rust/kernel/configfs.rs
> > @@ -1000,7 +1000,7 @@ macro_rules! configfs_attrs {
> >                          $crate::configfs::Attribute<$attr, $data, $dat=
a> =3D
> >                              unsafe {
> >                                  $crate::configfs::Attribute::new(
> > -                                    $crate::c_str!(::core::stringify!(=
$name)),
> > +                                    $crate::str_to_cstr!(::core::strin=
gify!($name)),
> >                                  )
> >                              };
> >                  )*
> > diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> > index cf328101dde4..6a87f489dc88 100644
> > --- a/rust/kernel/drm/ioctl.rs
> > +++ b/rust/kernel/drm/ioctl.rs
> > @@ -157,7 +157,7 @@ macro_rules! declare_drm_ioctls {
> >                      },
> >                      flags: $flags,
> >                      name: $crate::str::as_char_ptr_in_const_context(
> > -                        $crate::c_str!(::core::stringify!($cmd)),
> > +                        $crate::str_to_cstr!(::core::stringify!($cmd))=
,
> >                      ),
> >                  }
> >              ),*];
> > diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> > index f93f24a60bdd..5802a3507ecc 100644
> > --- a/rust/kernel/kunit.rs
> > +++ b/rust/kernel/kunit.rs
> > @@ -59,7 +59,8 @@ macro_rules! kunit_assert {
> >
> >              static FILE: &'static $crate::str::CStr =3D $file;
> >              static LINE: i32 =3D ::core::line!() as i32 - $diff;
> > -            static CONDITION: &'static $crate::str::CStr =3D $crate::c=
_str!(stringify!($condition));
> > +            static CONDITION: &'static $crate::str::CStr =3D
> > +                $crate::str_to_cstr!(stringify!($condition));
> >
> >              // SAFETY: FFI call without safety requirements.
> >              let kunit_test =3D unsafe { $crate::bindings::kunit_get_cu=
rrent_test() };
> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > index fa87779d2253..8bb40de007d4 100644
> > --- a/rust/kernel/str.rs
> > +++ b/rust/kernel/str.rs
> > @@ -376,19 +376,28 @@ fn as_ref(&self) -> &BStr {
> >      }
> >  }
> >
> > -/// Creates a new [`CStr`] from a string literal.
> > +/// Creates a new [`CStr`] at compile time.
> >  ///
> > -/// The string literal should not contain any `NUL` bytes.
> > +/// Rust supports C string literals since Rust 1.77, and they should b=
e used instead of this macro
> > +/// where possible. This macro exists to allow static *non-literal* C =
strings to be created at
> > +/// compile time. This is most often used in other macros.
> > +///
> > +/// # Panics
> > +///
> > +/// This macro panics if the operand contains an interior `NUL` byte.
> >  ///
> >  /// # Examples
> >  ///
> >  /// ```
> > -/// # use kernel::c_str;
> > +/// # use kernel::str_to_cstr;
> >  /// # use kernel::str::CStr;
> > -/// const MY_CSTR: &CStr =3D c_str!("My awesome CStr!");
> > +/// const MY_CSTR: &CStr =3D str_to_cstr!(concat!(file!(), ":", line!(=
), ": My CStr!"));
>
> Perhaps keep a copy of the old example and add a comment saying this is a=
llowed
> but c"literal" should be preferred.

Done in v2.

>
> Best,
> Gary

Thanks for having a look!
Tamir
