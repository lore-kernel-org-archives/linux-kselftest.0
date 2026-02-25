Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1174E30CD81
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 20:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051260; cv=none; b=eMMNgP/wOdfMziLirxR8+y3Er3DJAK5QEYsuRK1/Oj28kRQZ1sZaqR+zAOtMUsgwCdAGtLPm+IiNHz/5ggQoWZmEexbmVjXUe/WkC1RmrX45yDw+2rzVkNioioxjVvKK7sAzgpVNxM9YWOzeiYjJsN9Z4hkWvMqnM4LA76w0gwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051260; c=relaxed/simple;
	bh=4pxi89J046Ry0F5N40XuKlm7AFLZaBk8R66uc7hjU2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMr0rnljbwCXbSDRz1/G2U6TQU7pYFlLJXegpIg77dBZXmjvFYHjzzL+696tv+KbWlViJXKxtFRH9dR3hijqQ0EtPiQqFSzvn+4FyIIz2gqNUNk8YOGzl4+Q2jIn/hlFMbyOGENlcdvqdMjNBnN/77UgPlW7kr2ZpSZ44gM9KUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZQpL9h2; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZQpL9h2"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5675d609621so170781e0c.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 12:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772051258; x=1772656058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkAL447cMjwpbNMUZPRcn5nC3K8eD1ntT/xllRD0ohc=;
        b=PZQpL9h2b3uzNAidtS1RQO/HTrytJz0QqFiKlAPE22WYd9dkPNa6z45Yg+uMfATk+a
         KP/BdfAodsYJ7KnV9uG4rghteG46m+8u61u9cPJmnXcaAH5VzFzbAcXYVDfQVvrC7Oo0
         nf0ht9UQSOIxybPk//duYNRAV0/Ua4qvVV85u9+om2lvfpzNyEBeM8k9/LBDWD6wvXLP
         Y3MUDSMPlyhGujcJJH2vVX8TuKXWp+ZTRCqk7C1XsJ6bjKx+KZFXE7WXOphEubgcVuhT
         LuxytcqKRoWKSIukE3KYcsjNTKs7wseb+5I6USAjN4OqxpV5qZE5k4xCALxnfmvrsb3P
         u8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772051258; x=1772656058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkAL447cMjwpbNMUZPRcn5nC3K8eD1ntT/xllRD0ohc=;
        b=S+JJ+mbt4DYAzrZpTZfjU7T556MoA21uZPKjp4T1sR1zp1SZP+2+dKfZ4+2CUx0862
         hkP+9ioQ1Gx44E5DJrFA4lrCRKTI58JSFlD7Qslx6pqNUhYsGs3vMyazB9BAuDkd1Pt7
         kzOW49Jo7Ck8w+nZ0qEz/ROuVIjbqVDp8DGafnT5w0gdxcOicyPnp27tQrbvYhLML9E0
         le9xJe8MIDQDWJtj8VcwDEN4gWpTUVFPhe8hPeuWoMuZ8BnV5qAVQU57LBdV9EvTNRz8
         l+i3xXXAczTXZIdBnl5y6a7+kj/57QlloLxQJFW65xj7keMck5O7p5hntHZN4qtsekXl
         VaCg==
X-Forwarded-Encrypted: i=1; AJvYcCXdkUJbvYskWwLdsVXsRCkRII1a2yFufkvT4kFJELdFKFRH7pvHdLt6s5ISHpKBKY259k7xMDCl4VCoOgbKZqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLar76A/9K/97gfzQljdCGBm3jElZhNaairXszk7RYNsUsqBn
	Evp2PMPHv+2rFu/ioQXbiD+BdhNQy7N2JVwqRFj2HLTVBJ2P9ANXvK0C
X-Gm-Gg: ATEYQzyMPTTUNx1y8TQ+bc/PwRGfiMd5gzKM2NbYvN/YkW0TEz0b11yIXl2jv3g+BH0
	8TwmYXuTNZf7NvxMFS8CRSctDTiPnBSl3czIBm4n6iTQXhpmhRyNX4lgwVG3FVTHS/MP9agakJ7
	/II5CCK1NnwgEOePA/8Ayz0T5sRIvOMmiM1G6zETUEuntv0ReuI0Bru6BIZAT6gT25nnYVPX9bO
	xOWBulZnU6HTwUvssp/lEag3emmx0ViqOWaMN5twMj0M4hiRdDP0WNFyysSTjlbJJtQ5K+OCC3F
	qEUts2zNlZ4HkzLuhGClMLi4YLQ0PbZQBLLApIuVYL/CBULeYqd8MbKW7tYrpveB1EU7/SEjq+Q
	7SUhE32ogTeze+Q5hkHe6nWTWJYjz9XhqtZEfr9hJzL23wTx76XlFhF0bRq7B7qypfAnkJ1xbag
	zi/k+gKzYsmYe1yNYlctOTFst2g+79b9Jb8x4SqtN/QHf5zfirnksVfCj9bchF
X-Received: by 2002:a05:6122:1d0f:b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-568e48681efmr7890477e0c.12.1772051257828;
        Wed, 25 Feb 2026 12:27:37 -0800 (PST)
Received: from fedora ([190.142.206.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91659421sm226372e0c.0.2026.02.25.12.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:27:37 -0800 (PST)
From: Elsanti <santiagojoseleal27@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	ojeda@kernel.org
Cc: raemoar63@gmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elsanti <santiagojoseleal27@gmail.com>
Subject: [PATCH] rust: kunit: avoid retain_mut for test attr filtering
Date: Wed, 25 Feb 2026 16:27:28 -0400
Message-ID: <20260225202728.2160793-1-santiagojoseleal27@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary mutable borrow when stripping #[test] attributes:
retain() is sufficient to drop test markers while tracking their presence.
This keeps the logic compatible with the current MSRV and avoids extra
mutability.

Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
---
 rust/macros/kunit.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index e064419bfc10..083b8fe39e6c 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -88,7 +88,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
         };
 
         let mut had_test_attr = false;
-        f.attrs.retain_mut(|attr| {
+        f.attrs.retain(|attr| {
             let is_test = attr.path().is_ident("test");
             if is_test {
                 had_test_attr = true;
-- 
2.53.0

