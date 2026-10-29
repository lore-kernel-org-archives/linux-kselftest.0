Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293193;
	b=sNR4mj5kz4BM7LdLHOtUtXvk+dx+uLpD4RWpgQ0qM5RVQH6m4BveOODkgO+Go1oWImJX
	 H4jdnppgwSr1dqVDnfg52y1lySMXTQbNRTIKk4sSbzu48bsGk7b5N9St+yRooAENrfqnS
	 vsYsHUlfUiQtQjtJubqV1mSHNao8UUx1dlXzUUWK9bj3pnqyh1HKviK++RgkHKjnIagCd
	 oH01pQ3CcIuaZieQnuamjr7Hu1V0tbwOPr0ef/ZidVcUkZfpp2AR6ctBKRi6aUMzKq3MQ
	 1rVFtKDgG5QrsDkWn1YaERCrX5IJYCQRsUEolcPJr+Xkl1ubWR8verY/9QL4Cwa47mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293193;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QcHkXM7CY5zEWSkFQQtVHfgUOaI4B/5h1BoKNthPEmM=;
	b=OmlkPB0vpgfT5YgmUasfaQmPaKlqXuPkQTyrucVODcnbTN6vWiDp/ggVVNATWxe3wOOC
	 wMaSRqKU+1b+wkwqHANRfZDgsYoXJYE0ji+MN8AJnJiFdP8yRxyR+QDzk8teq78gmm5HL
	 sjBzCstJSWGdW0/Y7PheMgVwgomu3mM/8Ph7FBYNKihgdwCRSSUo1KdM3NoxrIupJGCbR
	 CA6G2mRA/MollBMC2o2vDZ78MXKpPY4iCnT/xSn5zJQ82Z+ZrWYp2ftmmjVleUPJoayTD
	 rhbbxSWvIBZPJ5JKHTtG7f/RczLaL9b96Xt9yC+7y+KYAkj07SAKsn9JI2qlx0ROEUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DMVvEsbk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA4606A324;
	Thu, 29 Oct 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DMVvEsbk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793293192;
	b=cRaFksPpkYnr5xBKsswJCgw/R6PPLcv5cWR90eDwX5If2LwSm0wF/7fqqVY1aXaMy88R
	 ExOs/+EMfKjBkJhXQdRIL+ZZJEDehoMERGknKxG/n+cWanj8Gpfp5R0Qu3WaRYPl0JFok
	 +hxVf2G8+/jNTKLKzrne4JUUsZNlYXvPHQgDmTXmDAO+zFoJpsgOQEyZP51wNTh4RzVMR
	 cFVLpZ0plq9n1GlOjTNLjIfOyAl0L7lR3NYD8qzWT6Z6k0scJGp3NXAS6RDdaqXkrAc1k
	 BtAwH4Tu8+f+zXDG3OxZhOEBjX4b53Qlla3rZPS+VX2fAYdrt+hy3RLXUFPkC326lNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793293192;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QcHkXM7CY5zEWSkFQQtVHfgUOaI4B/5h1BoKNthPEmM=;
	b=mlC4QDNSqnw6RqWBx8+YfayBhMCD+buus6Pdl9m93oiioe7Ass1c2yERnOzaKofaG5QF
	 GOUG3yeTPNPvrPcxXK3N7nKSxvWUlKCwXfxsEO5FrpKlRUkKJsxWPflssKSJSE6+ZkqyB
	 NfBJdqo0XSsjvXsSUjwtZXiAusRVTGWpKcPPHnbG+eRm2Yi0gyQ/XNWmy30gVM3YBTMUe
	 Vq78ihWXNZQzKvY220WK/nM0JCSneK3QEWKFW/lZcSzy+AOyAOd+GpKe2KQ2ppRta1zIv
	 +dsYd3w0lf838l/P0vuXrU/THdFT5rDkUB/lad7FwwLZKgp+perfwooab5kBv8zJgMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8CA01F031E3;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793293192;
	bh=QcHkXM7CY5zEWSkFQQtVHfgUOaI4B/5h1BoKNthPEmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DMVvEsbkyBmNhxdcNo/0+oJuvivPjx1M1r8SOiRdzyaBsMPvGmlZDM0KuqaAEotgF
	 KtGO9VOau/KixpQVbH+xIgDKSku3vQ1LopgCVPNibhjgTxtJ1nbGBNqmdfl718WoNA
	 5XRhPEEXMfG5uUQllj/RMTiZ+T3Cy+d4JlFqM0RW4GNzEj9dq9Fi6D/Qnp8Q+ICQPy
	 PHzEwc8AyeX9n4v/HNA+ownoCIjOXHi5yXZjCnBMA2M0cOPEggHmDBCHsVe4ZY7mpA
	 Cngamu2KxyLfI7qgdS29nMmqQ9vR+xlRCcsPy/LKp8NAyPnpj8UAZzRQ4+4tqwqb5E
	 qsunliIP8iaMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3ADB745911;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Date: Thu, 29 Oct 2026 13:59:03 -0300
Subject: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
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
Message-Id: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=iW+hZzmPpgHRkmWIVOTZYWfmFaZ6Ey/DgBI3aRQTyEA=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9bj6hbHjPKMLy90TIL5mWVTEuyrU/R92/XEhQuYmiRPf
 p4jGNtRysIgxsUgK6bIMpfz/WdjW/OKculNQTBzWJlAhjBwcQrAROYFMfxTi4qPPL91z/1oJeGE
 E9JezTy8bqWyIjt2Kvn6yxcWL3jB8E9/wsRvqVPdLYKF97V+z5nEVLX18qw/3d/WczBfsmxsE2A
 DAA==
X-Developer-Key: i=nico.antinori.7@gmail.com; a=openpgp;
 fpr=9D09EFF3333D3778771BB252D0254F3848822532
X-Endpoint-Received: by B4 Relay for nico.antinori.7@gmail.com/default with
 auth_id=1086
X-Original-From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Reply-To: nico.antinori.7@gmail.com
Content-Transfer-Encoding: 8bit

From: Nicolás Antinori <nico.antinori.7@gmail.com>

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 610d565535ccfba6af8f2ca4ac4028fa027a9644..8eecd669096713fc7f21431188959a921a1d5ca0 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -762,11 +762,10 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }
 
-    #[test]
     #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
+    #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
         let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-
         b.set_bit(2048);
         b.set_bit_atomic(2048);
         b.clear_bit(2048);
@@ -777,15 +776,15 @@ fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
         Ok(())
     }
 
-    // TODO: uncomment once kunit supports `#[should_panic]`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }
 
     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {

-- 
2.47.3


