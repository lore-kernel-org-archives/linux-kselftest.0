Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0583B8BC4
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747623; cv=none; b=cEOexW8UNvMHroirTtNAAttlCq/TCvy54fl45fC6Mx7z69nQxmP8RO4XSDzSxP2Uf0hygId1nwZJ0RfwlRrNtORdsL+s1tDzb8qEgDmj/WUwtNpcUA+iWH/MQ4+HkEp3MQ/K/URBlBVzdlY5TEFeHzsCz+Z5alKO/bgjN3f1vXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747623; c=relaxed/simple;
	bh=0zlJd9Yr6UpKiQThq/l7IWb1Lcot2jQVu687ixt9vMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/au6N/AOGBS926qCeJIJIYqepwkZYTk2yipqG6FgvD+gmVOJDrFznsgXttS+6Q89Uj+ZtpwUBLEQSvr72AjOSfuIS10TU0QqraAOi62CqzFeTHfNkhTE6WobnmvuYC2EoAVbfszr1T1X+0/Z3r4gCFBzdXWe6ONPUTjPkjhJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XW+D8Fvw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XW+D8Fvw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1800322f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785747617; x=1786352417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MEAqomLnokyVR9AqA64rl9ZYCVmUcv5C80fBRfsQys=;
        b=XW+D8FvwjzgcjUDkSi+A0ELSC7rPA4P4Ejct47bLSvBqMC/dKAeDev+KeubJawbkIO
         YUIRwVBy8ZwXNlMQLOfjugsDUMJFyfFjXr6xDxx4qD8IwdBU8RLho57NNV0Ein9y7KFg
         CqwpaZuViPwTNglZCGKO5O30o03nWWAfDNi3WFF9coTY/hj0BGCC4ia3CFTnDrUnMbv5
         2lRJpiysPJoQRHepKyIHFwlgrZlqxzjuC/Z/YrxR3oJRNMad27PGC1x2NOl7rDe4zIr/
         3cGo0QNob2p2wmths/Y9UXh/yvOMBumGDQ3my3J/P5hqq6HS0NO/LjVccTtFmO9JPOSx
         X/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747617; x=1786352417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MEAqomLnokyVR9AqA64rl9ZYCVmUcv5C80fBRfsQys=;
        b=bfAbU1+ZPNqjzK0d5+rfo+xjwyojo/UE2R1vG6HZB+xVI7iVZGixxuelBUzWal1318
         CO0jPnLSs/9cjKwtIPSRSmzv35K9d1L+AIs+Rt96vInLyYZPxzT9rmkrJHmSbqRFsU5V
         inZLra2jtbEDvjXVXbZztibAQMqYvVbtGyw4q+Sjlkr2+Z14NXLm/+4lcv0Rg6EaMgOw
         ViJtIPfWBZ+TviwBmgVctN0x/4qhQ8D03ti/puo8N8UN9TBchGTm8AOAU53ntdm/9kUx
         r1RU6/XD/3m18AWQVbGp+ryfEPoExTUEYeMnM/hIWSzrZ4VYgyYjWrUvmKRTScGrGFvI
         ttaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuujYkNlU+38f77VkQPRoX5uolgGBIVf2uWg+4qH9WkHcHdql9V3kSkEl/MPyQsAyp3i4/BjYQplJNfGL8c1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5/Ogh3WDj9tDpSGTvZ0lQhLrmFI+/zzNyPuU37lUiynguX9H
	gLAznSin5szmwdCgRdKGguRtPHvhbtuuRw4b5UmiPY8LWGKOK46PbqpzQM5KarsC/9M=
X-Gm-Gg: AR+sD11ImVx2Ty938p+2KazaVIbCUvITM5h2K9OKXCq4jH/a8VX/ULBNQQt5raddpsN
	A5khbdw22UqL9R2J3lKWHk+uMUEAyXa+xu+R0XXKJNDXG/19aYC+sbMmJx9N0Ncc48GfWT6wq0O
	helcH20eIKdtdGiIwIVaxYW596TOsGKscMyU3NRhH1Oxq4fnexDw1HS1nBN0Jl4aBN1jCFyP5dN
	mJg00pL2ZbUquzSzLbIUCpRrvU8BaBFmveGVAbdvuOUHa3ky+d5Qkvu7624A1SxgpLvbDBO4k/E
	+A/DhclSRkRWQSLUy9DVbx+Lenq2gMwRZ+x6FNtGeqEBJazTjdBnNOpQ3Rov1T3EcoG+BvH6+M6
	7K8p6VQNDQkd4I1GfJZo7LqM+VFA/j5zDLFyFddogrBTXVvIHI6wmiPMWKJ2rkHmhu3G1aWmtZO
	qVU8qaHJHNb3cWdSp32EJhjnd/mEHLqiXlznwAPgIL4hvRDheeO2QYnsTD8U3gFI30c3X176yDY
	BnarreTooFD09KYNWF7Zbi6ncHbavEUwc5tyh0fVbGFBctcgRD7mLbs8UvkjkJE7UbounNf6FxT
	nUZj9ae9MSKE4DvhQI0KIhyTg4st9sl0UPs2YSWtVw==
X-Received: by 2002:a05:600c:871a:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4980c66c991mr237479075e9.8.1785747617287;
        Mon, 03 Aug 2026 02:00:17 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba13e9sm314596535e9.13.2026.08.03.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:00:16 -0700 (PDT)
Message-ID: <6e9e8189-e27b-4279-9fed-b7da5da62419@suse.com>
Date: Mon, 3 Aug 2026 11:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] rust: module: add `THIS_MODULE` const to
 `ModuleMetadata` trait
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <20260723-fix-fops-owner-v9-2-c1c3af7f7bcb@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260723-fix-fops-owner-v9-2-c1c3af7f7bcb@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 4:10 AM, Alvin Sun wrote:
> Since `const_refs_to_static` has been stable as of the MSRV bump, a
> `ThisModule` pointer can now be used in const contexts.
> 
> Add a `THIS_MODULE` const to the `ModuleMetadata` trait so that modules
> can provide their `ThisModule` pointer in const contexts such as static
> `file_operations`.
> 
> Add a `this_module()` helper to retrieve the `THIS_MODULE` pointer of a
> given module type, and update `__init` to use it instead of the
> `THIS_MODULE` static generated by the `module!` macro.
> 
> The `static THIS_MODULE` generated by the `module!` macro is retained
> for backwards compatibility with existing users and removed in a later
> patch once all references have been migrated.
> 
> Assisted-by: opencode:glm-5.2
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

> ---
>  rust/kernel/module.rs |  9 +++++++++
>  rust/macros/module.rs | 18 +++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/module.rs b/rust/kernel/module.rs
> index be242a82e86d2..d713705984477 100644
> --- a/rust/kernel/module.rs
> +++ b/rust/kernel/module.rs
> @@ -42,6 +42,15 @@ fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, crate::erro
>  pub trait ModuleMetadata {
>      /// The name of the module as specified in the `module!` macro.
>      const NAME: &'static crate::str::CStr;
> +
> +    /// The module's `THIS_MODULE` pointer.
> +    const THIS_MODULE: ThisModule;
> +}
> +
> +/// Returns a reference to the `THIS_MODULE` of the given module type.
> +#[inline]
> +pub const fn this_module<M: ModuleMetadata>() -> &'static ThisModule {
> +    &M::THIS_MODULE
>  }
>  
>  /// Equivalent to `THIS_MODULE` in the C API.
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 06c18e2075083..aa9a618d5d19e 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -519,6 +519,22 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>  
>          impl ::kernel::ModuleMetadata for #type_ {
>              const NAME: &'static ::kernel::str::CStr = #name_cstr;
> +
> +            #[cfg(MODULE)]
> +            const THIS_MODULE: ::kernel::ThisModule = {
> +                extern "C" {
> +                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
> +                }
> +
> +                // SAFETY: `__this_module` is constructed by the kernel at load time
> +                // and lives until the module is unloaded.
> +                unsafe { ::kernel::ThisModule::from_ptr(__this_module.get()) }
> +            };
> +
> +            #[cfg(not(MODULE))]
> +            const THIS_MODULE: ::kernel::ThisModule = unsafe {
> +                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> +            };
>          }
>  
>          // Double nested modules, since then nobody can access the public items inside.
> @@ -616,7 +632,7 @@ pub extern "C" fn #ident_exit() {
>                  /// This function must only be called once.
>                  unsafe fn __init() -> ::kernel::ffi::c_int {
>                      let initer = <super::super::LocalModule as ::kernel::InPlaceModule>::init(
> -                        &super::super::THIS_MODULE
> +                        ::kernel::module::this_module::<super::super::LocalModule>()
>                      );
>                      // SAFETY: No data race, since `__MOD` can only be accessed by this module
>                      // and there only `__init` and `__exit` access it. These functions are only
> 

