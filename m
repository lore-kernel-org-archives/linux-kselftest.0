Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082721;
	b=K+IBnY+znUrSYnd1eIeTZgWoLxSAMs/sFUa3xDs+SITs58dOE5uy2uHETaq0eRspN7br
	 Go9wSt7M5kD7uVs16GMHoAolMzIbTRVdmfSdIL88AlklCm6g5gpkbNSxYzTkW9D7Ul1CF
	 C9qJqHQ2+rTmP0Ame+8uoMTsrU09+MoqqcBP+VpJo4EDfR8DQwmJcTEDztWevUAppfpsj
	 jfFSHMzbw2883dcXCUgCo/FNZF+VTIbaAyH+cTQiGIbCI00y7YQHvuai1WYHk+DJ/adHz
	 Tz9L0R/VfvYVfBuD/a9TEOLY7ENztbflrbJD0J//CFYQXFl4NXtzhYYwFo7VH6VxSDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082721;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9R46I09c6+DcOlHsAxDYfz0nx0N48nqQc0jrB8mZTtY=;
	b=YSf7514eMB5y9PJ04apGkbe/36B8LDxfNncmvcebCBPpGcCdXMggj6VGumUWXqYGaqW5
	 vTqo8XWmMw2UYVYSNqSRFxkwfcD02K79YiJLR20mh5uhZnfhhxpZEIKxgKJXxDRZLfEOt
	 JDxqucCYXdArMBXFgv+X5fGQKMdfulEPUnRTTAofZG10QvURZA47nOX30f98jrgQfWfCJ
	 rht8hqDxMjKYQzlMEpw9kDxuXA10QWXk+EpZ3gZ07moDFCaKpTLQDAOr66SXFsrdSab9U
	 HPtk6m/z3yxfczhp+VLG9x7uG1bA1GPuXrn211w6URtA1PE77TPiMv3QzPWA9d833JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSVa4jOB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F04606A31B;
	Tue, 27 Oct 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSVa4jOB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793082720;
	b=YIludV08YzVz8r196HbtjF43hNorVk8MNvQq9xqa1M4gCNOhD9/GxsrNT/mrtB+K3cfP
	 fRTx+bGm1y6btZNJ76TaoRAb9rYLBqlf//ZS+GvRLf5/1/IhTqtz1ymwQU5IEMDcUf99C
	 wcjAHH3xhj9WaJq0r2cZ2UpVh9p8zXGZ5QKpJwvJTsnTVrgkxoEtazoahrX+iPsV5ceRO
	 dKi4JnB2qF6JFkoumjm0weAb3MqGXScvs53gdmfzzeban5c9HA/7LMyeoaVHj7aDi1YRM
	 FINlPhBXfV4oLBrPyXcavWvCXf/2KGp+Jqh8mpRfcYeaOy0uiIxi5KDTzTD9uxhizbA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793082720;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9R46I09c6+DcOlHsAxDYfz0nx0N48nqQc0jrB8mZTtY=;
	b=2ZmtfMfPI2t6WK9kjMPvpk+0lS+WB8F9NZWpZUwyZjLUnl2veH+0BTZGKIGm9C9vswyZ
	 sYLv4rtuwZHpGwEL9Xi24zUjn3lfzAxlGEM63fj5NmVl1GkF0yQjvz5UIAbnIwmxGR33I
	 6fp/NifL/z1xkN0B+fMpH1Lg8wojdIfLIoDc73BAwWV4nFbLVmfF7OmMsLT1Ks9a0ZVN7
	 Bn5BkWVOqOO8bSyiOYJcsRW0OlC6zeE09ehJwvFrtYlWgUsoU26QepZr1YVibTIetLMue
	 HfllmONODL82esUZvXrdd2KZPWp9ZmBt/J3fYStZLroZv9u1ckTAYA4xrtBcSRgg9/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CD671F01828;
	Tue, 27 Oct 2026 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793082720;
	bh=9R46I09c6+DcOlHsAxDYfz0nx0N48nqQc0jrB8mZTtY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lSVa4jOBoBa3XYOPaFcsMSWOKE0Td54n30aU2GyJLC0UwvLcyw2gWur8jIo5xZDEj
	 q/xs3cpZ+mnQiPQ/fNOK5n7ml2jB9i2T7esMlyyJWuNWmtygfc330bXHtt09AnKg4T
	 yZi82eKvL3b9SxUvzORmqLJpEUcWmwNS07UO00obfN1jL9+l4vCj6BQ/ZkChRHPFTN
	 GTwwqbjDfIOyeXJI5QapiyUEi4UaAX9r5+zw1TdIamtg2S1L6B+RyYA1JMRTdINgdk
	 d7XQXum5fpDpvuVttUPcXeARxeemTp6OPW+Dn0U9l8ZQ02WNHLHOmlE3C8sysetKU6
	 h5IG5uO6zUCCg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7485D44FE4;
	Tue, 27 Oct 2026 06:31:58 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 27 Oct 2026 07:31:58 +0100
Subject: [PATCH] rust: doctest: fix line numbers after crate-level
 attributes
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
Message-Id: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMBAEf6XcswdpCin6K+KDTTf2RFLJpaVQ+
 u+e+rTMwsxOiiJQujQ7FayiMmeD9tRQnO75AZbRmLzzoXW+57Jo5XGOFbYvyeAkG8fBpRC64M8
 JZO67wO5f93r7sy7DE7F+Y3QcH39dKBd5AAAA
X-Change-ID: 20261027-rust-doctest-line-fix-cb0f663629fe
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793082718; l=2652;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=ZibAN+j218M4v6xGY3Uc7Usec6aRaCACBYkqr0vExUE=;
 b=nRS2HXLSCcZDH+gtG/ijx+UjOUZy/v7h2EtBHqsRdWpcHtedueiNyv3iKNcZRZHGkqkYyhkFm
 SF0fXLhRw+JB5s5OXbntEKAIan/1w+l+QGDt7BeIybka7jQf13q9Vez
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=TavwxGPDBjl4XGNQyFLKEW7PKSY4qOWusc7yf6hjV0c=
X-Endpoint-Received: by B4 Relay for git@younes.io/20261027 with
 auth_id=1332
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io
Content-Transfer-Encoding: 7bit

From: Younes Akhouayri <git@younes.io>

When a doctest starts with a crate-level attribute such as
`#![expect(...)]`, KUnit reports failures one line too early, and
`line!()` returns a line number that is one too low.

This happens because `rustdoc` moves those attribute lines out of the
test body and puts them above the `main` function it generates. The
generator works out where the body starts by counting the lines above
`main`, but it does not know that some of those lines were moved there
from the body. So every line after a moved attribute is mapped one line
too early (or more, if there are several such attributes).

For example, adding `assert_eq!(36, 0);` as line 36 of
`rust/kernel/init.rs` (inside the doctest that starts with
`# #![expect(clippy::undocumented_unsafe_blocks)]`) gives:

    # rust_doctest_kernel_init_rs_2: ASSERTION FAILED at rust/kernel/init.rs:35

Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
`init.rs` and `std_vendor.rs`.

Fix it by counting the attribute lines that `rustdoc` moved (every
`#![...]` line above `main`, except the `#![allow(unused)]` that
`rustdoc` adds itself) and taking them into account when computing
where the body starts.

With this change, the example above reports `rust/kernel/init.rs:36`,
and doctests without such attributes keep reporting the same lines as
before.

Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 scripts/rustdoc_test_gen.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 754c5aafcce4..c821ec63c32d 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -168,6 +168,17 @@ fn main() {
             .count()
             + 1;
 
+        // `rustdoc` moves the crate-level attributes (`#![...]`) of the test out of its body and
+        // places them before `main`, after its own `#![allow(unused)]`. Subtract the moved lines,
+        // since the rest of the body is shifted by that amount with respect to the original source.
+        let hoisted_lines = body
+            .lines()
+            .take(body_offset - 1)
+            .filter(|line| line.starts_with("#!["))
+            .count()
+            .saturating_sub(1);
+        let body_offset = body_offset - hoisted_lines;
+
         use std::fmt::Write;
         write!(
             tests,

---
base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
change-id: 20261027-rust-doctest-line-fix-cb0f663629fe

Best regards,
--  
Younes Akhouayri <git@younes.io>


