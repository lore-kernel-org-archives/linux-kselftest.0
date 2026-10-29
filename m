Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293193;
	b=ldJErl2+Mx2Fbuq5xNxZNbPRPHlQf/9T2QC6+zusLrifvlix1M49bTC5L7Ga/4oKOeCI
	 rY+Icvs9nbDZ9pxUMkl8fOtDXsLma4gEt05u6a5ANyl+oKtLI4B16WEYjjoKNlHjOwSQb
	 b1gjE24+qR1OWa0QG6fDlMGIxDSTt4QAFEWKdRIbZWLR/thYOUHxmTHaYbuYBgkvPKB5g
	 O1Dt6MTwChuIbTX5zuDK/zUOUVJWxTdTMAniFzvsGjILhlNNyLH7ArxAp2Y+g/7tZSMF+
	 sBI+3o9OO/xAMHvfNos/wVEfmSKXzLPrPOIMSMCAg3ad4ATMGplAYLEWdSa9HkyhpyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293193;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YHVa+8E3twtVMw1FZ3XwHX19OXl3xIFjKnZNfhJISFU=;
	b=4BzNYFqcEVxGtaBR77nbgqNkP6T/3AdVRet69DL1o4DLkeOTtBx76NTUxVo8SJj+Sm+P
	 sD1qBXW9URtOZrvXlb8NUBuS5yVaIc8WgbMjcbHpXvWWI64Z4LKOR0WOSkbOG5DXZkgi+
	 BTPyogYBqxD0JMfECUa0d5TcA7OTgfj8rt+NG0GGh9eNmnS9MnOgdbh1LggftLpMSUG57
	 zAsUYrNL8JtSvYIjBx/KAvSIOXvtFfDdNpZAVMKS3ZqrmWwqFtpZzbh/Mr4Q9JhuPFn2e
	 lOl5zken4WsnT5c+z6lOYVWZ5NKnwoYbpDgceu8x/F5Lq11RN6BZvnMWouHy/jOAajA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FT3cDMFT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8E606A32E;
	Thu, 29 Oct 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FT3cDMFT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793293192;
	b=sXUAvBADO4Sm8NtWUglCClZSXiZqJv7lwv4pzyjWbUQp1O9vJHsXQdgQaWRriQtcuCMV
	 egUjLFrh6Y217lbvbudE17z63h2opW6UKcU5VERyheLVzJaXg1VImxZn96BRkOm1yVHM2
	 UGyypVzqGXYuwaR2xXPihDw/jR/Ahrin/JfrhIoLVIpmMDNcPhLAIIxOuscceX8+jWH0O
	 okwRJhm0ws2GpUq7WfwP2k6AAw4wnFjQHb4iaK3a056HANYio+N0Y+PNZlXVKI+KYASdK
	 fkWmyvw2fkC13hpK9+QPsrwkR5zAwnQtOzwWv0BvpFP4CIAwHlH0HLkd0hoXmnNy2CQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793293192;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YHVa+8E3twtVMw1FZ3XwHX19OXl3xIFjKnZNfhJISFU=;
	b=uLUwCRAfPD05iFvIU/bMcVq/QTBjzyCohdKeAB/vkqYn9BUZ1/KhXAyv8jyj7WWL3GDQ
	 vTkwCpdMqbiDf5Vz2UVeOBCd9QQVbyfiSXcPPzaFY6MQpBKiOZKVRhK9dlDpqJ3f7jOlH
	 xCzq0VqQ5tBBF6jFJBOCcxsvJPg/RfIg36yG1/145wWAOeB6pPqKo5voKqo4jJDfqS+iv
	 foJk52uZT9AS3l/um7KOcNHdCYddfy1JyfGt6oa87F14RvRs8sQywZ34vRyJzaUFu0GO4
	 wxrao/P3Ip3h4Qnu1f8kx3MUNb6LO5UAW6gsEtMwrTup3jgv2JavCca1FicJk+Ytk+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B963B1F031E5;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793293192;
	bh=YHVa+8E3twtVMw1FZ3XwHX19OXl3xIFjKnZNfhJISFU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FT3cDMFTwNc5NfpnkAsLZzL5ZxiccspZgjpN9doP3Ms/WrEuTczkhrrtUidssMu+A
	 CB4/GLpwYyxuros1lIz7yOf20uH8o9zshyO1U9RaNOXw48/YxxY4Ha7ivl12qcNGlW
	 jB1ffjWqP4Q4YSOyZHlcbpCf3Sc/I16WOvYef7n24h1wXX+dbUOZmYftCojZ1xOAM+
	 O1QQhlVbiqh0hHkS9BKoxa+Le/yiwJQg04M+K7g1IBQ0IznKlJd9sQra+GRlsvtmVl
	 rsjNHR2PFfNPQHi70JmFaysBPChEZz+aPVN0d9XiZLYJMxDyaKsqK0W7mEdUEFU4qw
	 KNyCJHRD6JHSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1372145909;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
Date: Thu, 29 Oct 2026 13:59:00 -0300
Message-Id: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFR742oC/x3MQQqAIBBA0avErBPUSKirREjoVENgMVMRSHdPW
 r7F/xkEmVCgrzIw3iS0pwJbVxDWKS2oKBaD1dYZbTvFl5x+uxKd/nZeMEUVddM2wTjTzh2U8GC
 c6fmnw/i+H03elpBkAAAA
X-Change-ID: 20261029-rust_kunit_v6_send-d0353c1615f9
To: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5381;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=qbLPq7lD1HdTSfI9ix8eOoU9492wccTuMFu99cmlC/g=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9bj6uaWjphP06byffzN93TVjpLm5rcFvJV+na3lsz1/h
 u8VFJPtKGVhEONikBVTZJnL+f6zsa15Rbn0piCYOaxMIEMYuDgFYCJpBYwMu9JyemMO5Oo+feyQ
 f/i8VV1zcpqtmMvsk3/f/zjNoPmqheE3G6NjiyDPd2kBoxzTFQWT1875paOZ69jUeTi+o9p7Vxk
 PAA==
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
  a test that was expected to panic do not
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
  side (`kunit_run_case_catch_errors` function). This allow to catch
  panics triggered, for example in a Rust function that called a panicking
  C function.
- Now the tests that have an inactive #[cfg(..)] do not appear un the
  KUnit execution summary as ignored, they just do not run.
Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com/

- RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported yet).

The way it is supported is by adding a new boolean property called
`rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
`kunit_attributes` in kunit/try-catch.h and check for the
`try_catch->try_result` code and the named flag to detect if there was a
panic in `kunit_try_catch_run` function.

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

 include/kunit/test.h       |  1 +
 include/kunit/try-catch.h  |  3 ++
 lib/kunit/attributes.c     | 18 ++++++++++++
 lib/kunit/kunit-test.c     |  3 ++
 lib/kunit/test.c           |  2 ++
 lib/kunit/try-catch-impl.h |  2 ++
 lib/kunit/try-catch.c      | 14 +++++----
 rust/kernel/bitmap.rs      | 21 +++++++------
 rust/kernel/kunit.rs       | 73 ++++++++++++++++++++++++++++++++++++++++++++--
 rust/macros/kunit.rs       | 67 +++++++++++++++++++++++++++++-------------
 10 files changed, 164 insertions(+), 40 deletions(-)
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261029-rust_kunit_v6_send-d0353c1615f9

Best regards,
-- 
Nicolás Antinori <nico.antinori.7@gmail.com>


