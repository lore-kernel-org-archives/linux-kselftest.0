Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F552C3256
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919390; cv=none; b=q21JUTRAX9r1Yi7e80QvNyr3pPLQZdc75CodEEMB/kXSajS08PGfH5iCX+5QJ0xUtN+Ki5Nr8XLdkIKgjQosr/NTtSAyCM9IVKPaFCXKJsczWGdvDv3ivQtSVSCWYIssCYwKFwS/NlhAOvi91LT3gzKLjm4mS3PWwd1RVuE1cmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919390; c=relaxed/simple;
	bh=S1AMswh1lQbv6HKMYTWuP/EFtpAZzTkpPRr5/NqjPXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eiQrJpLRiCY8E7AZN+LpX0bw3RXYUO1STQxUvjiL0cO9Tls8SKYgsOGHfGelI3uQViaJJnqU0Pg1TfOzykP9b6OrpMNX8NnqDldUas4jzhjeYyhTQr0fCYGBE0/NTaYsusCgx6fo0p4oDnyHHmdl1EVBo4p1ldOb6ZGaaY4iabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KdSDC853; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KdSDC853"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8fa51ade75so554435566b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 23:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771919386; x=1772524186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Hi1B2QR1arEGlsvfgWO32ZZtaRVb/wfgOh/rBlJpc=;
        b=KdSDC85304TK6a9uNt0lP330VpGlHf9ippEhIqB8zcRp3ML6BcNHHOXcmPtX0mazT0
         lhihb2lHBbLmX3QK3GsNaF1KzizJHegBpnRkgOrgZFfkOKn5sKN7qhr6iBlcnUA2s8el
         FMgw8wckw9TLJsovHIHYiUCxeZ26mmXkXa4pmAAeVUUR4BMNgUQqJH4fhzNMemwh4SOZ
         lOoKHc+7ypRCBPsJ9HnmcR2xissbSLlUXENe++xPNRlk9+fTeUmbXst2L6nQVmPW0QLi
         2HDb4IScXukKyXmZJwQCsAV5mMLKTs7pdxcc8jyJxZJ9L9VgHmrQGxT5ydytd9GwPE5s
         QUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919386; x=1772524186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Hi1B2QR1arEGlsvfgWO32ZZtaRVb/wfgOh/rBlJpc=;
        b=Uq43AHmSPXVVaYlw2K/lD60YnnVOgypQmI7Q1aQHTeuEvt8e3jM+x0xowvO0iLABSg
         b3ziZVsojHM46wRX1bF2GdtnQUobKNuXTk9Mrb9vsM+lpcibwx88KxxIpJpPrxYQYe3b
         NJxQHxLBqLk/99MOdwrm0cx7WjthwfXSRrz00z4I8ZsO7mqf0O+GPjBqJg3cSZGF5vlN
         wh+Rtdf/dTyWxBd4Q7r19XKumXGFoNyavXHWTMyMJEGQqzUrPa4/K9MjVQcH6FXPh4Hx
         knE1HpV9zW/CuBsKM7w9C4kOIbKyUCcn/kr1eun6UtEfjKxcJuaOtP+VHgxXrPHUSfBt
         U3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx5ZwjbYOPFI8Ie30aVY7FIlfDBnW0S7QTo2PI9q5JTsw3AFffvGSI3HT8M9RhQppzjwTWmFWNnDlYti6oGe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDF4gi9cK421r7vOqusymiNTS0jbqNWvVGALVf7IRIIiumcoh
	1/upI22/L/t5uERiAO78dCHwMBzM9AR6aQj0y8o+QRCtH0gX35+CGzdjtorAqjnWnKFdG/p+5h/
	9+ay8/EUwgEsBtnqjsg==
X-Received: from ejdce12.prod.google.com ([2002:a17:907:d2cc:b0:b8f:8b56:4a97])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9301:b0:b87:2abc:4a32 with SMTP id a640c23a62f3a-b9081a2cd50mr766450566b.18.1771919385883;
 Mon, 23 Feb 2026 23:49:45 -0800 (PST)
Date: Tue, 24 Feb 2026 07:49:45 +0000
In-Reply-To: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Message-ID: <aZ1YGceMIEwdke96@google.com>
Subject: Re: [PATCH] rust: kunit: fix warning when !CONFIG_PRINTK
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 24, 2026 at 04:45:30PM +0900, Alexandre Courbot wrote:
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>     |
>     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> 
> Fix this by allowing unused variables on these methods for this
> (arguably rare) case.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I think this would be a better fix:

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..dbf3c62ffa09 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -23,6 +23,9 @@ pub fn err(args: fmt::Arguments<'_>) {
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
+
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
 }
 
 /// Prints a KUnit info-level message.
@@ -39,6 +42,9 @@ pub fn info(args: fmt::Arguments<'_>) {
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
+
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
 }
 
 /// Asserts that a boolean expression is `true` at runtime.

