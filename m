Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4835330B07;
	Tue, 16 Jun 2026 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616427; cv=none; b=MOZqVQfPmEAh0QLCRco9vcassqfCcHtHCR5DeA8kfd8MTRoAKzg6SWQO/Xm5YjpoxXTe/2ZPZ8YIYv4+PwrgezFcEtuUUyXvjOcyJ1KresMerzl+bRu2H8uTnDiTl0jq3lg/KdkKdrR/dmCKfGzls60CKNdpZyDpcOPZiAdFyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616427; c=relaxed/simple;
	bh=6c8jQATF+ZGdx7kHT9lNLaL9iqQ9hr5Ypj+MqnbDsGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8CfP3y+z417Y492tegVeEB8KAalt6FZXOukCmlrQbG8UlJ9D/JRsbtKGsdFCdERIXdAaGWEbLqcGL5WF2KzNYYPp+nwcnJpwirDAE9scequQ+VgicO7ZDsXq6TgFyknO8wNX+yVxFJ9qWUWpgHqREetrK1SRrnObrZCyANjICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNRuzIM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNRuzIM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CFA1F00A3A;
	Tue, 16 Jun 2026 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781616425;
	bh=RcrIDgB6rOdXCE+tq9aq14T+vYwUB9pWVtNHZVge/lY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=oNRuzIM0lbnKp1LuBzj6mwQ37xezUN30iZK312zU0Wt5h8zVEeK52X1hbY6vUt4MI
	 KTc42Bof7a9ZQNT2MsD7rW5mBgLvm571w0dTyqAZbawHretF8tfRnhKrCwE4E5zqss
	 16S9OMUfRZPEmzyhXN0Zyc6X5Hjd5KkGji+6pNwBQsmOb9HbW6oBaI0SJnMjwi+D3E
	 baaDyxQRsPQrucqiF2C7YS66bHFEtEEmKLXr6daN2k1TdLcX9xU0ww6RX47/ayC6te
	 Jd3hQeT9F8jJEt15vHib9rq2mZamB9k6PBr1Xxo6bHEACYI6pHEOJb5de/MWs3z72V
	 pnvXPTR6MYlBQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Igor Korotin <igor.korotin@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] rust: doctest: trim function name for reproducbility
Date: Tue, 16 Jun 2026 14:25:57 +0100
Message-ID: <20260616132559.2245814-2-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616132559.2245814-1-gary@kernel.org>
References: <20260616132559.2245814-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently rustdoc will generate function names like
"_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
doctest located at rust/kernel/io.rs:824, when building with separate
outdir using `O=`. This creates overlong symbol names and is also not
reproducible.

Fix it by doing a custom remapping to trim it to something like
`_doctest_main_rust_kernel_io_rs_824_0`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Do an unconditional replacement to cover all cases.
---
 scripts/rustdoc_test_builder.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index 5457679c12f9..79cef75f5af3 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -70,6 +70,11 @@ fn main() {
     // Figure out a smaller test name based on the generated function name.
     let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
 
+    // The rustdoc function name can include the absolute path when building with `O=` which is
+    // undesireable and create overlong symbol names. Remap it to use relative path.
+    let trimmed_function_name = format!("_doctest_main_rust_kernel_{name}");
+    let body = body.replace(&rustdoc_function_name, &trimmed_function_name);
+
     let path = format!("rust/test/doctests/kernel/{name}");
 
     std::fs::write(path, body.as_bytes()).unwrap();
-- 
2.54.0

