Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717177;
	b=E3paYOUmE50WpL7uKMRVayzhFo6W8QxjcEFt1PQw4KGtK3HJZ0u36CMJE+z71c5srF+A
	 //JcQEUdpfb2jvukSl1BHEtITdOi2eFY56o0HOEm5gNTWdmGKh2db6PVY6ForiV9isTc9
	 rifkr6Vr+BG3T9rzPcULF4jzUymLno1OSSnx0AWiOvH4i3YBKl0EMTr2pG+NhUTqGNq2P
	 6CYIYt9uN+M7LtF2v9b4e1/9P4JBRlB6ejFWA20HWyS3+JSJzpImiTdGhpR4EKTrYnlQC
	 zU7JQYIa+wTOEJo73K4yEkCa8808wbnVfmwYHoKFHCtbEVrBUgYqq24u/B6Ioejgw0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717177;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=o1NH5W7GpsVvqNSAUFioiQuXndLMjrMDuH+IvnWqYeg=;
	b=mO+EdjuhT3S47fc7vVovls/xl6QQpY9iIpfGWnA3uJHlsJPYEAQ76CfF/nmaOQvXc4EF
	 LCMy0q7J1s0ChCmXXfhG7fWdRpH/PRtAGTcTb6iElEn6I2CF03Bg8rZc5r2Jb+IkQa/rM
	 f0ne4EbUwF8Fotc99b+0bLQ0ixVdCnjabjjaY0V4OcmC/P97eQ/4q+tn31zy6AKQQllaj
	 LruscqJKolN41j01THu32C2NA7E2OBOHIZnQ0mSL0sDpqUfqiZVxUn1QC9DrkW2+YfMY/
	 zSc42XMFH5zkmiQL2YnpOCcTrpWuPLR9cmLR14gnD1tUj+ciEEbtWE6TKiROuo5sSSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F6606A32C;
	Tue,  3 Nov 2026 14:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 6AC75200B17; Tue,  3 Nov 2026 22:46:14 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 279FD200AF4;
	Tue,  3 Nov 2026 22:46:10 +0800 (AWST)
Message-ID: <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
Date: Tue, 3 Nov 2026 22:46:07 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
> From: Nicolás Antinori <nico.antinori.7@gmail.com>
> 
> KUnit tests in Rust are written using user-space like syntax. This patch
> adds support for the `#[should_panic]` attribute, enabling the user to
> test conditions that are expected to cause a panic and report the test
> as successful.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---

Thanks very much.

I'm afraid I'd rather go back to the RFC's design of only triggering on 
Rust panic!(), rather than on failures in C. It's a much simpler 
implementation, and makes more sense for a rust-specific #[should_panic] 
to me.

If we really want to support C panics, then something which works with 
CONFIG_UML would be ideal. The warning suppression implementation here 
does this for WARN(), and exposing that to Rust might make more sense if 
that's something we'd need.

Secondly, I'm not convinced we want to alter the behaviour of 
assertions. At least KUNIT_ASSERT_* should still be useful in a test 
ensuring that the state of the system being tested makes sense before a 
deliberate panic!(), and arbitrarily reversing the meaning of assert!() 
feels confusing to me.

That being said, I understand if we want assert!() from _outside_ the 
test (i.e., an assert!() in the code being tested, not the test itself) 
to be considered a panic!().

A few small notes below, but it's mostly just re-iterating what I've 
just said.

Cheers,
-- David

>   include/kunit/test.h       |  1 +
>   include/kunit/try-catch.h  |  3 +++
>   lib/kunit/attributes.c     | 18 ++++++++++++++++
>   lib/kunit/kunit-test.c     |  3 +++
>   lib/kunit/test.c           |  2 ++
>   lib/kunit/try-catch-impl.h |  2 ++
>   lib/kunit/try-catch.c      | 14 ++++++++-----
>   rust/kernel/kunit.rs       | 51 +++++++++++++++++++++++++++++++++++++++++++---
>   rust/macros/kunit.rs       | 35 ++++++++++++++++++++++++-------
>   9 files changed, 114 insertions(+), 15 deletions(-)
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 31d549578f8ec113bef9b5d72bc9355c07fce3c0..15bd020d83722163bfc3899f64247afb2c4cefa4 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -83,6 +83,7 @@ enum kunit_speed {
>   /* Holds attributes for each test case and suite */
>   struct kunit_attributes {
>   	enum kunit_speed speed;
> +	bool rust_should_panic;
>   };
>   
>   /**
> diff --git a/include/kunit/try-catch.h b/include/kunit/try-catch.h
> index d4e1a5b98ed67e4f71ff1bcc71422d5bada54b75..197029e19d759dfeb2700af13cfc8fc246768bb9 100644
> --- a/include/kunit/try-catch.h
> +++ b/include/kunit/try-catch.h
> @@ -22,6 +22,8 @@ struct kunit;
>    * @try_result: Contains any errno obtained while running test case.
>    * @try: The function, the test case, to attempt to run.
>    * @catch: The function called if @try bails out.
> + * @rust_should_panic: Flag used to avoid printing spurious error logs when a
> + *	Rust test is annotated with #[should_panic].

I don't think this is the right way to check for a panic. If we're only 
checking for Rust panics, a #[panic_handler] is better. If we're trying 
to trap other errors, then something like the warning suppression 
feature is better.

>    * @context: used to pass user data to the try and catch functions.
>    *
>    * kunit_try_catch provides a generic, architecture independent way to execute
> @@ -48,6 +50,7 @@ struct kunit_try_catch {
>   	kunit_try_catch_func_t try;
>   	kunit_try_catch_func_t catch;
>   	unsigned long timeout;
> +	bool rust_should_panic;
>   	void *context;
>   };
>   
> diff --git a/lib/kunit/attributes.c b/lib/kunit/attributes.c
> index 6d7a53af94a9acf3cf336409462059b972efeb22..8a9dc526b3cb2d363d42087f8666a03e9bc2bc4b 100644
> --- a/lib/kunit/attributes.c
> +++ b/lib/kunit/attributes.c
> @@ -246,6 +246,16 @@ static void *attr_is_init_get(void *test_or_suite, bool is_test)
>   		return ((void *) suite->is_init);
>   }
>   
> +static void *attr_rust_should_panic_get(void *test_or_suite, bool is_test)
> +{
> +	struct kunit_case *test = is_test ? test_or_suite : NULL;
> +
> +	if (test)
> +		return ((void *) test->attr.rust_should_panic);
> +	else
> +		return ((void *) NULL);
> +}
> +
>   /* List of all Test Attributes */
>   
>   static struct kunit_attr kunit_attr_list[] = {
> @@ -272,6 +282,14 @@ static struct kunit_attr kunit_attr_list[] = {
>   		.filter = attr_bool_filter,
>   		.attr_default = (void *)false,
>   		.print = PRINT_SUITE,
> +	},
> +	{
> +		.name = "rust_should_panic",
> +		.get_attr = attr_rust_should_panic_get,
> +		.to_string = attr_bool_to_string,
> +		.filter = attr_bool_filter,
> +		.attr_default = (void *)false,
> +		.print = PRINT_NEVER,
>   	}
>   };
>   
> diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> index 126e30879dad652d5b236aeb13d4406a4ddbab00..7cca586767cc711f7a829cc4c3bdec17bd8c7d9c 100644
> --- a/lib/kunit/kunit-test.c
> +++ b/lib/kunit/kunit-test.c
> @@ -45,6 +45,7 @@ static void kunit_test_try_catch_successful_try_no_catch(struct kunit *test)
>   			     test,
>   			     kunit_test_successful_try,
>   			     kunit_test_no_catch,
> +			     false,
>   			     300 * msecs_to_jiffies(MSEC_PER_SEC));
>   	kunit_try_catch_run(try_catch, test);
>   
> @@ -78,6 +79,7 @@ static void kunit_test_try_catch_unsuccessful_try_does_catch(struct kunit *test)
>   			     test,
>   			     kunit_test_unsuccessful_try,
>   			     kunit_test_catch,
> +			     false,
>   			     300 * msecs_to_jiffies(MSEC_PER_SEC));
>   	kunit_try_catch_run(try_catch, test);
>   
> @@ -133,6 +135,7 @@ static void kunit_test_fault_null_dereference(struct kunit *test)
>   			     test,
>   			     kunit_test_null_dereference,
>   			     kunit_test_catch,
> +			     false,
>   			     300 * msecs_to_jiffies(MSEC_PER_SEC));
>   	kunit_try_catch_run(try_catch, test);
>   
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 09e3dabfac0c945b2608feb88c1b1d46fb807edc..8b0072c66e1710c7faa7de2df7ff8c4bf48b8e88 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -584,6 +584,7 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>   			     test,
>   			     kunit_try_run_case,
>   			     kunit_catch_run_case,
> +			     test_case->attr.rust_should_panic,
>   			     kunit_test_timeout(suite, test_case));
>   	context.test = test;
>   	context.suite = suite;
> @@ -595,6 +596,7 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>   			     test,
>   			     kunit_try_run_case_cleanup,
>   			     kunit_catch_run_case_cleanup,
> +			     false,
>   			     kunit_test_timeout(suite, test_case));
>   	kunit_try_catch_run(try_catch, &context);
>   
> diff --git a/lib/kunit/try-catch-impl.h b/lib/kunit/try-catch-impl.h
> index 6f401b97cd0b9842e7533f1b828f72f884450f74..9abe69bb8b396185afb77cb11ca651ba4c9b6a59 100644
> --- a/lib/kunit/try-catch-impl.h
> +++ b/lib/kunit/try-catch-impl.h
> @@ -18,11 +18,13 @@ static inline void kunit_try_catch_init(struct kunit_try_catch *try_catch,
>   					struct kunit *test,
>   					kunit_try_catch_func_t try,
>   					kunit_try_catch_func_t catch,
> +					bool rust_should_panic,
>   					unsigned long timeout)
>   {
>   	try_catch->test = test;
>   	try_catch->try = try;
>   	try_catch->catch = catch;
> +	try_catch->rust_should_panic = rust_should_panic;
>   	try_catch->timeout = timeout;
>   }
>   
> diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> index d84a879f0a789f3625538735644910c84ac80e56..b9e29d4e7dd52d8d82d71a3f138f0313c772ee76 100644
> --- a/lib/kunit/try-catch.c
> +++ b/lib/kunit/try-catch.c
> @@ -76,11 +76,15 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
>   	if (exit_code == -EFAULT)
>   		try_catch->try_result = 0;
>   	else if (exit_code == -EINTR) {
> -		if (test->last_seen.file)
> -			kunit_err(test, "try faulted: last line seen %s:%d\n",
> -				  test->last_seen.file, test->last_seen.line);
> -		else
> -			kunit_err(test, "try faulted\n");
> +		if (try_catch->rust_should_panic) {
> +			try_catch->try_result = 0;
I'd rather us keep the error here, and just handle it if the 
rust_should_panic test attribute is set afterwards.

> +		} else {
> +			if (test->last_seen.file)
> +				kunit_err(test, "try faulted: last line seen %s:%d\n",
> +					  test->last_seen.file, test->last_seen.line);
> +			else
> +				kunit_err(test, "try faulted\n");
> +		}
>   	} else if (exit_code == -ETIMEDOUT)
>   		kunit_err(test, "try timed out\n");
>   	else if (exit_code)
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 25ff272d29b2b3f192a3968481c1d5417df4335b..5e688b743ee2152867e2f99c7f18b86e1b7fbe3d 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -58,7 +58,7 @@ pub fn info(args: fmt::Arguments<'_>) {
>   #[doc(hidden)]
>   #[macro_export]
>   macro_rules! kunit_assert {
> -    ($name:literal, $condition:expr $(,)?) => {
> +    ($name:literal, $test_should_panic:expr, $condition:expr $(,)?) => {
>           'out: {
>               // Do nothing if the condition is `true`.
>               if $condition {
> @@ -93,6 +93,14 @@ macro_rules! kunit_assert {
>                   ));
>                   break 'out;
>               }
> +            // If condition fails but the test should panic, then we just abort.
> +            else if $test_should_panic {
> +                // SAFETY: FFI call. The `kunit_test` pointer is valid because we got it from
> +                // `kunit_get_current_test()` and it was not null.
> +                unsafe {
> +                    $crate::bindings::__kunit_abort(kunit_test);
> +                }
> +            }

I'd rather us keep asserts working as normal: a failed KUnit assertion 
shouldn't be considered a panic. If normal Rust assertions (particularly 
those outside the test-specific code) compile down to a panic, though, 
that's okay.

>   
>               #[repr(transparent)]
>               struct Location($crate::bindings::kunit_loc);
> @@ -166,10 +174,10 @@ unsafe impl Sync for UnaryAssert {}
>   #[doc(hidden)]
>   #[macro_export]
>   macro_rules! kunit_assert_eq {
> -    ($name:literal, $left:expr, $right:expr $(,)?) => {{
> +    ($name:literal, $test_should_panic:expr, $left:expr, $right:expr $(,)?) => {{
>           // For the moment, we just forward to the expression assert because, for binary asserts,
>           // KUnit supports only a few types (e.g. integers).
> -        $crate::kunit_assert!($name, $left == $right);
> +        $crate::kunit_assert!($name, $test_should_panic, $left == $right);
>       }};
>   }
>   
> @@ -209,6 +217,7 @@ pub const fn kunit_case(
>           name: kernel::str::as_char_ptr_in_const_context(name),
>           attr: kernel::bindings::kunit_attributes {
>               speed: kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
> +            rust_should_panic: false,
>           },
>           generate_params: None,
>           status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
> @@ -284,6 +293,7 @@ macro_rules! kunit_unsafe_test_suite {
>                       exit: None,
>                       attr: ::kernel::bindings::kunit_attributes {
>                           speed: ::kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
> +                        rust_should_panic: false,
>                       },
>                       status_comment: [0; 256usize],
>                       debugfs: ::core::ptr::null_mut(),
> @@ -337,6 +347,16 @@ pub fn in_kunit_test() -> bool {
>   mod tests {
>       use super::*;
>   
> +    struct TestStruct;
> +
> +    impl TestStruct {
> +        // This assert does not get replaced with kunit_assert, since this is not a #[test]
> +        // function.
> +        pub(crate) fn escaped_assert() {
> +            assert!(false);
> +        }
> +    }
> +
>       #[test]
>       fn rust_test_kunit_example_test() {
>           assert_eq!(1 + 1, 2);
> @@ -347,6 +367,31 @@ fn rust_test_kunit_in_kunit_test() {
>           assert!(in_kunit_test());
>       }
>   
> +    #[test]
> +    #[should_panic]
> +    fn rust_test_kunit_panic_in_kunit_test() {
> +        panic!("This test should panic and pass");
> +    }
> +
> +    #[test]
> +    #[should_panic]
> +    fn rust_test_kunit_panic_in_kunit_test_bug() {
> +        // The panic is produced in a C call. This should succeed.
> +        unsafe { bindings::BUG() };

I'd rather this not pass: I think if we want to support BUG() here, it 
should be a separate implementation.

> +    }
> +
> +    #[test]
> +    #[should_panic]
> +    fn rust_test_assert_false_success_with_should_panic() {
> +        assert!(false)

I'd rather this not pass, personally. I think that an assert!() within a 
test should work normally (i.e., it's possible to assert that the test 
state is normal, and a failing assert will fail the test).

I could be talked out of this if it's really unpleasantly different from 
non-kernel Rust, but in that case I think we'd want to make sure that 
kunit_assert!() within a test behaves like a normal assert even in a 
should_panic test.

> +    }
> +
> +    #[test]
> +    #[should_panic]
> +    fn rust_test_should_panic_with_escaped_assert() {
> +        TestStruct::escaped_assert();

I'm okay with this passing, though: an assert!() outside the test code 
can be considered a panic.

> +    }
> +
>       #[test]
>       #[cfg(not(all()))]
>       fn rust_test_kunit_always_disabled_test() {
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index e9152b9d51f9450b7e549e2e1629b5fc5f485a28..288b53d21c4e7c8d9b5148d50c1a833f73e53015 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -106,6 +106,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>               .cloned()
>               .collect();
>   
> +        let should_panic = f
> +            .attrs
> +            .iter()
> +            .any(|attr| attr.path().is_ident("should_panic"));
> +
>           // Before the test, override usual `assert!` and `assert_eq!` macros with ones that call
>           // KUnit instead.
>           let test_str = test.to_string();
> @@ -113,7 +118,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>               #[allow(unused)]
>               macro_rules! assert {
>                   ($cond:expr $(,)?) => {{
> -                    kernel::kunit_assert!(#test_str, $cond);
> +                    kernel::kunit_assert!(#test_str, #should_panic, $cond);
>                   }}
>               }
>           });
> @@ -121,7 +126,7 @@ macro_rules! assert {
>               #[allow(unused)]
>               macro_rules! assert_eq {
>                   ($left:expr, $right:expr $(,)?) => {{
> -                    kernel::kunit_assert_eq!(#test_str, $left, $right);
> +                    kernel::kunit_assert_eq!(#test_str, #should_panic, $left, $right);
>                   }}
>               }
>           });
> @@ -134,25 +139,41 @@ macro_rules! assert_eq {
>               &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
>               test.span(),
>           );
> +        let assertion = if should_panic {
> +            quote!(
> +                let _ = #test();
> +                ::kernel::kunit::err(::kernel::prelude::fmt!(
> +                    "    Expected {} to panic\n", #test_str
> +                ));
> +                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_FAILURE;
> +            )
> +        } else {
> +            quote!(
> +                use ::kernel::kunit::is_test_result_ok;
> +                assert!(is_test_result_ok(#test()));
> +            )
> +        };

Again, I'd prefer assert!() not take should_panic into account, 
personally. It'd clean the patch up a lot to not pass it through each time.

>           processed_items.push(parse_quote! {
>               unsafe extern "C" fn #kunit_wrapper_fn_name(_test: *mut ::kernel::bindings::kunit) {
>                   (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SKIPPED;
>   
> +
>                   // Append any `cfg` attributes the user might have written on their tests so we
>                   // don't attempt to call them when they are `cfg`'d out. An extra `use` is used
>                   // here to reduce the length of the assert message.
>                   #(#cfg_attrs)*
>                   {
>                       (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
> -                    use ::kernel::kunit::is_test_result_ok;
> -                    assert!(is_test_result_ok(#test()));
> +                    #assertion
>                   }
>               }
>           });
>   
> -        test_cases.push(quote!(
> -            ::kernel::kunit::kunit_case(#test_cstr, #kunit_wrapper_fn_name)
> -        ));
> +        test_cases.push(quote!({
> +            let mut case = ::kernel::kunit::kunit_case(#test_cstr, #kunit_wrapper_fn_name);
> +            case.attr.rust_should_panic = #should_panic;
> +            case
> +        }));
>       }
>   
>       let num_tests_plus_1 = test_cases.len() + 1;
> 

