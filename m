Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794594107;
	b=C8vRoXKe44TsPwISh7IbtKVeYPugGqOrHe+7lNb3glF1GbEm96dZZ5fIML9rXPVbblYN
	 4Sba6vxaN6os+BbEYyFSr299f22Bi4Y0Z/a2rTleNooyFzN86479GaK+c+CpJ34nyyP98
	 +2M/a1dCI9tDg2vUsjKJNKn+WI55QqRMGjRZkuKv1YR6OKHTB7sloEWDMsk58SaEgQenO
	 FJ7U1nHG3rafaoacFReO7LlZEDQtonF4iO1tvG0ukIwpgUzqynlhgwE6XuzAbid2h7jHa
	 IqxCukx75UTDTMwvylcG4MX5EV+y7OUgD8O0kOsKoJS3xHo83JRuRWR0SM6NwnZh8fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594107;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=TQ+jdJqwUBw/K5EUQBXP0Hi9PFUGB6ZzlRt20hjbDTA=;
	b=EytwxIYLyqPkzRkqi6FEvThDg31kMV61lziOwsxLI8JuRY6mk/s9cV1sunqZ5N7EH31c
	 57AoiWM+658e2QmSEQjdf0iz/ZEz8G5rOiZdqDTUE0UwyQgp+ju4lPlO4dhDAOCRz+aeJ
	 ZFoMFoa9ZjOxd7OXzteEfSWcKGV+yeHkA36Kgsx3Ph9OrO5ANGDBbItzY6vylA4F7npSA
	 stIdLqAJ6c9+3Z7sLpi1+oI6KlQ24ZGbIFWnIiCOSAPoS8ZaK8l4s2Xo9hdKvkT+Dm8S9
	 6dzW1VeFaijuSPQcsyFr2G7UN4SjBmuShzpmK+ZwK+e/Qp70RCzaxUjJEV2qvJifTsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcvSDg1t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461B606A6C6;
	Fri, 13 Nov 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcvSDg1t
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794594107;
	b=YBnES3Rvg2LyOFFPb9RvS5tnDSFgsAAsF60Mvu07hqAmoS8GxsOgYFERTvIi8F6n33s2
	 tQ81MA3oCv8KNMGJiixfxQ4nd6MnGoQ+biDILXqHq+9qvopBJAnf1T9+MO5r9kPGct41K
	 JEMtx92fsG6sldx+egNBdP8kPDbBct0KutBcQK+479CVE6gGJSpLTGFU6JzpbTKZF59Wx
	 xqHdZIMj++d9YTNgCFzHyJeYDNRK1Ckl/4ns/8upNukCbcE8GgdmC+qt9WmYpGo1m7BCP
	 EmzyJ4myuxp1gq9DXGr7Z4NoHAX8LE10PShMRmk8X57FZvoaBMiHkbBcN6EjULwm29w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794594107;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=TQ+jdJqwUBw/K5EUQBXP0Hi9PFUGB6ZzlRt20hjbDTA=;
	b=0aGyhuZ3751gW5LIIr62wr9q8WItQdasrZmMj3Hn9aihOO3+X/rhmxGgmXZ13mBGb6Pl
	 XlxWk5vUw5YVCoukOx8hCxgQy3nExu8cxlj+e3ksEIwPfBxz/5EmxTAa0+TcRBBLw9V7t
	 3BOLpHvnovW1/IW4w9wwK4AhKNLPreSf0u1455EymAoWBTj4fd1YGNRfNiM22Id4n27T0
	 oigBXH6pHPjFfkaJwknGEaErKGB73Tm1c7q0jOnoi9eZ2LIDoNQfty/myTzvNHNvyQai4
	 GP81AYVL02DOzbxh5M5+aDgS24Z+o/BsNtD/8uVUnKDwhadWVY5LEws2rSeoXEMLGeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD9AF1F000C5;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794594107;
	bh=TQ+jdJqwUBw/K5EUQBXP0Hi9PFUGB6ZzlRt20hjbDTA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=XcvSDg1tbk0wwhfgR9fFwhbdp0oLtrP4jdOtwIKSDf+kgUdPoJLN354AmaA5Q/66A
	 cx8satju99pzFjEDR287pBRkSOS18YQMKRIF1KBZZg5TYAWD68ugpZqE0btAcpT+1Z
	 RGhbDckYYNKjtFPgIguf0j3NdXpT1wtqxR4JaoOJ3qdL0dEwO/TVK8qsK0/PsWoMgG
	 /F75TfgVsolbQoOzcqY4g/ag9RP7O2Qea0OveuNMX0EBp/BVa2jXjZVLZbmH03B5gj
	 5UqKoeVyLoQAhP+Atc0btUqeA2ntw/lYtORzFucmf+pv6hn0IXK25Qygq3llMxPB4O
	 9MTJTq6Fv5egQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1540C49A65;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
Date: Fri, 13 Nov 2026 15:20:54 -0300
Message-Id: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAZV92oC/32NWw6CMBBFt0Lm25o+LBG/3IchhLRTmCiFtKXRE
 PZuZQF+npPcczeIGAgj3KoNAmaKNPsC6lSBGXs/ICNbGCSXteCyYWGNqXuunlKX6y6it8xypZU
 RtdCugTJcAjp6H9FHW3ikmObwOT6y/Nm/uSwZZ9qg1gKduVzxPkw9vc5mnqDd9/0LZr8L7bQAA
 AA=
X-Change-ID: 20261029-rust_kunit_v6_send-d0353c1615f9
To: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7645;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=zmw4ZEYxMtkU8oSXCrqD6/tR6BnBwHq4KByl9D8pjP8=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9b3ULMtAmmcPksmP9aPnz3bNd93S6ZUmvb9OK1sE/nZP
 z4/Yy/vKGVhEONikBVTZJnL+f6zsa15Rbn0piCYOaxMIEMYuDgFYCJXaxn+1/vP370+01QmNEvc
 a+Lsu/Iad7+xv7sR1FHEkv322Sx5PYb/+ZfUhP8ELDPZvfJQwGzbbImwhoSKu0KXGdsPOR+uYOH
 jBAA=
X-Developer-Key: i=nico.antinori.7@gmail.com; a=openpgp;
 fpr=9D09EFF3333D3778771BB252D0254F3848822532
X-Endpoint-Received: by B4 Relay for nico.antinori.7@gmail.com/default with
 auth_id=1086
X-Original-From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Reply-To: nico.antinori.7@gmail.com

This patch series intends to implement two features for KUnit tests
written in Rust. The work is based on a TODO comment made in the
`bitmap.rs` module [1].

Changelog:

v3:

Gone back to the `#[panic_handler]` implementation (original idea from
RFC Patch), after discussing it in the v2 patch thread. This means that
`#[should_panic]` will catch Rust panics only.

The changes are:
- `#[should_panic]` introduction patch (patch 1):
  - Handling panics through a `#[panic_handler]` in
    `rust/kernel/lib.rs`.
  - Added a `kunit_attributes` pointer to the `kunit` struct to be able
    to read the test attributes from the panic handler in Rust.
  - Modified `kunit_init_test` to fill the `kunit_attributes` pointer
    inside the `kunit` struct.
  - Using `extract_if` for detecting `should_panic` attribute instead of
    just checking that it is there.
  - Explicitly using `kunit_assert!` in `macros/kunit.rs`, because now
    the macro overwrite is done inside the function body.
  - Fixed KUnit test initialization in `lib/kunit/kunit-test.c`,
    `lib/kunit/platform-test.c`, `lib/kunit/string-stream-test.c` and
    `drivers/of/overlay_test.c` (passed `kunit_attributes`)
  - Rolled back `kunit_assert!` and `kunit_assert_eq!` modifications
    from v2.
  - Rolled back adding `rust_should_panic` property to `kunit_try_catch`
    C struct
  - Removed test case that called BUG() C binding directly within the
    test.
  - Added `#[should_panic]` to documentation.

- bitmap.rs test (patch 3)
  - Solved some nits pointed out by Miguel.

- General:
  - Carried all Reviewed-by from v2 for patch 2 (this patch did not
    change)
  - Carried Acked-by and Reviewed-by from v2 for patch 3 (changes are
    not functional)

Note: Now that we are using the `#[panic_handler]` I have a draft
implementation of `#[should_panic = "message"]` support, but I think
it'd be better to send it as a separate patch once this is merged to
not add noise to the review of this (the affected patch is the first
one).

Note: I was not sure whether to add the attributes assignment to
`kunit_init_test`, as it is a public function and doing so required
changing its signature to accept an attributes pointer argument. Is this
the right place to do it?

Link to v2: https://lore.kernel.org/rust-for-linux/20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com/

v2:
- Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
  and changes.
- Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
  successful #[should_panic] tests": Solved by adding
  `rust_should_panic` in `kunit_try_catch` C struct to check if the test
  is expected to panic and act accordingly. Dismissed what I first talked
  about in [3].
- Solved Sashiko: "[Medium] kunit: assert! macro in #[should_panic]
  tests causes unexpected failure": Solved by making `kunit_assert`
  macro aware if the test should panic and act accordingly. Dismissed what
  I first talked about in [3]
- Solved Sashiko: "[Low] kunit: missing diagnostic log for
  #[should_panic] tests that fail to panic": Added an error message when
  a test that was expected to panic does not.
- Solved Sashiko: "[Low] kunit: dead_code error for test wrappers with
  inactive cfg": Solved by moving the #[cfg(..)] attributes on top of
  the wrapper functions
- Dismissed Sashiko: "[Medium] rust: bitmap: memory leak in
  owned_bitmap_out_of_bounds() test panic": Not sure if can be done
  anything. If I am not mistaken this is the same issue as stated here [4].

Sashiko report links: https://sashiko.dev/#/patchset/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com?part=1

v1:
- Removed 'stringification' of test names (to avoid clash of names for
  different configurations now a number is appended).
- Added bool `rust_should_panic` attribute to `kunit_attributes` C
  struct
- Removed #[panic_handler] in Rust side, checking for aborts in the C
  side (`kunit_run_case_catch_errors` function). This allows to catch
  panics triggered, for example in a Rust function that called a panicking
  C function.
- Now the tests that have an inactive #[cfg(..)] do not appear in the
  KUnit execution summary as ignored, they just do not run.
Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com/

- RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported yet).

The way it is supported is by adding a new boolean property called
`rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
check in the `#[panic_handler]` whether the test was supposed to panic
or not.

2. Allow same test name with different #[cfg(...)]:

When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
the series) I found that the test that was supposed to panic had the
same name as another one, but they were run on different configurations.
This caused the following compilation error:

ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
   --> ../rust/kernel/bitmap.rs:503:1
    |
503 | #[macros::kunit_tests(rust_kernel_bitmap)]
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
    |
    = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
    = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

Now, only the tests with an active `#[cfg(...)]` will be executed by the
runner. Tests with an inactive `#[cfg(...)]` will not appear in the
report since they are not added to the TEST_CASES array.

[1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
[2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
[3] https://lore.kernel.org/all/DM41PHVITKOG.3I6P2X8048BEP@gmail.com/
[4] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/kunit.rs#L129-L136

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Nicolás Antinori (3):
      rust: kunit: add #[should_panic] support
      rust: kunit: allow same test name with different #[cfg(...)]
      rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 Documentation/rust/testing.rst |   8 ++-
 drivers/of/overlay_test.c      |   6 ++-
 include/kunit/test.h           |   9 +++-
 lib/kunit/attributes.c         |  18 +++++++
 lib/kunit/kunit-test.c         |  36 +++++++++++---
 lib/kunit/platform-test.c      |   6 ++-
 lib/kunit/string-stream-test.c |   9 +++-
 lib/kunit/test.c               |  10 ++--
 rust/kernel/bitmap.rs          |  18 +++----
 rust/kernel/kunit.rs           |  54 ++++++++++++++++++++
 rust/kernel/lib.rs             |  43 +++++++++++++++-
 rust/macros/kunit.rs           | 109 +++++++++++++++++++++++++++--------------
 12 files changed, 264 insertions(+), 62 deletions(-)
---
base-commit: ee83899302a0457a3ba47464a13e8682bd7ba27d
change-id: 20261029-rust_kunit_v6_send-d0353c1615f9

Best regards,
-- 
Nicolás Antinori <nico.antinori.7@gmail.com>


