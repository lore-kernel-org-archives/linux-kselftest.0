Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794594107;
	b=Op3uI6AuUiQZyUV9xFwQdnDk95UIzL54UBIeeWBajbA8h+HTsHdliTiZ6p/lfV9s+EDy
	 IHXMjPxpPuHKU3FjzL/pTfkcMwQc5A0mNkxCdpBMZPa6CvEZ4v2llTKQF8oBZsJZw6Puz
	 3AtHywDKIUdV/CKy/ei0YNnqBCwPEj7EPFu9Xifr1yM4a95/ncF1FrXVl71KyKCNKA3JG
	 1o8ouo3PU9NSehxWYngNC8ewlN/TyVSVszNRIJ3KYT6k/J8uNcG+j8yQCXLx54lHL0ufx
	 Op22tHqeeBKQfyGWiIvtVwOGY43llLQ2awpjUGwEzdzqyVKnGj6Z2ixL99bXO5JSEHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594107;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GTN3yzgJ0KPrEl/OzvX9U7/hg+t1kaBpSk6Ua76ka94=;
	b=IOnUhXHWw79zTpH19Y+E5UrMl4IBAQIFVHsDblz/s1aUsZACIBNQJ80wncMWsqMLfU52
	 t91w3+OqmttXiAoRkl79dMI+MMdvU8BSTeewRTNYg4cl/kofuWe8ly80+4uqfDCRmc8G7
	 hOixm3RW+Y4HAf75LWi5odUqGT7kWM0OfMnEqg7HOptFaFNVjvVGr2cVxPPzN9DJsfxmo
	 Fpvv31k0Xo3GBt00KEQKNch0Nm5KJymREbvfuBFccSvOOg7i2o0okpdyCcKasyRiKaXDu
	 6CugQNOivuZ0wv4bMdsSw3qp7me09MXkClLHoE6g4qX+n3eY7EvyGifymkkuyB3vrwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADNL6erg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E5606A333;
	Fri, 13 Nov 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADNL6erg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794594107;
	b=Sh2t9j0+Kn+7SuUTBC5k6kW+y1NHjde1NKH2bHR+bixRAggUDahgOrH69jlsdGsBXE29
	 uS/e0tivt51BqI7Vu/UmIc8c2HX9XZoxhrVe1Tj9NgNNPD7hkcwrkcTvYdSqP4J067ACV
	 n8z6urXjLA355tj99D2j/LSMvJ6vUOh63SdhdKexYad1oXdyrgXRWNSUENkac3kKzN0cG
	 0Qfl2QW0mqAcS5SZQOD3jPhgvroT+DwrqeurlNouFpAL+ffKBCb0jfqNNSaSjuxZq0sty
	 d8Hjt8FfRZ6DK+A3blrvKIvwBWAXY8q94/Bg7Ejfz49rAVC781H490GcUzVFii/1zxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794594107;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GTN3yzgJ0KPrEl/OzvX9U7/hg+t1kaBpSk6Ua76ka94=;
	b=Inepqnhy/LuGGZ2q6sOBoz1bAu9Ugj/DE9lF8vnvasjptepLiJ2IHkzhpnku/L76TfFu
	 yGOJlFZqFv3z9mZTRClySQe8igaQvorzLops34qxN+mVXkDo0fUnX0BOhYgpzIQA2DBP3
	 Y72iDh/oHhbaH+prSr8Mlx6VdmxquDzRFORUl8OGQErT2x4yxazLnjQTRWVQ8VkYWhosb
	 1zbyccTXPbO+sH3yFVu5cSJc4FqLslLfBS495jlreYBsDM5swngHfl09c+Rvhz74mqhxf
	 ZJv43DRzh6pKJtpA1BnMo3vqg3Z+sWUUDadRwpnQVyGZXT4xeeKWcLtL3BLh15Rv43Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D399B1F000C7;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794594107;
	bh=GTN3yzgJ0KPrEl/OzvX9U7/hg+t1kaBpSk6Ua76ka94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ADNL6ergDk4l8WWvlbbNVGA9K0pAuiJ+zZzik4OKEmHlA43G3kVEejoK7PMQHYojA
	 er8KqFI15oBxJvzba5Sw7FNHP6K+ji0CppLb2gCGtR1S5O282hE/7PLxdNPtoKcdZ4
	 Oa2MUOOvBJ+fFD1U3XcI8hMoFdprWhdv3hr4QDI14MY8q7B57FwPMXxKiqIV9/Xaab
	 jHn0WA0WyHjF6lnZcS12ZIKmf9ivf2ERpoQwPa5V32au8y80C894r6M0dIieACBkI6
	 0RfptkWzafrb1PRiRCL/DuBNEWnzxRUzgYXl0a5LYUqwcxc7WEqmod2DGOcsp52JG6
	 lJk7zglDuVcFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60CE249A6D;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 15:20:57 -0300
Subject: [PATCH v3 3/3] rust: bitmap: kunit: uncomment
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
Message-Id: <20261113-rust_kunit_v6_send-v3-3-0d7832c07166@gmail.com>
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
In-Reply-To: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=tmjPblT/cEvVX5DBd0p9G+nF43mFr4W8rW5Nta9eEJ4=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9b3UPPdbpouHCf/1n+S3LdV+9nR1lTFLVe26kX+UdB03
 DrTw/ldRykLgxgXg6yYIstczvefjW3NK8qlNwXBzGFlAhnCwMUpABPpNWb4xTTnTmId0+RNbSpr
 yxe2+UUmltUq3Mvc/6TOac+574++hTIy9J5x+vCs93iZtFlzXYrk64Z+8YtFvgfzLmyWSSpMsNj
 ACAA=
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

Also, move the #[test] attribute above other attributes to match
existing tests.

Acked-by: David Gow <david@davidgow.net>
Reviewed-by: Burak Emir <burak.emir@gmail.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 610d565535ccfba6af8f2ca4ac4028fa027a9644..942c0cbc994b80d71bc4b3de67e5730c914e4a7f 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -777,15 +777,15 @@ fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
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
+    #[test]
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
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


