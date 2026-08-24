Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323930D3FE
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578361; cv=none; b=UbEqGkd8N12LZXFy1vpKUd/Sx9xGK/xrZA6x2IrKcxXpaPt0kbAyDotN3WrsX5caJp3Do7wEe8UHn78UThauFKqupqr0Uqa6I7dJpibM5L8rvZcaLglEyB8dS9vNHtDzyH5J6z5jhrfd3kxl/BkPtSiX3+Q5Jknok/APt7aVy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578361; c=relaxed/simple;
	bh=/wYoKbWA/rb5RPFSav1i6crHP4PmpHlCGKtzSsdb670=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GLjZSfcj81Kt6N38kxL7ALlWmQ03fortdp3MhWwJNLBazWp0srW/opo5AYrXvEG2QzOBDyc6G4SNy7ntt6TkYUZ+Ss35JaYFaBzgMZvkM50oykoyfOQmLiFgcC+BMqO/RF3iiH7gBzQ+xzPEIDPag9o7PQa17KiYWbukXfqoKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TryS5n+4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TryS5n+4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so522913866b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578354; x=1788183154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9jFDMZuaDQUMNyu/XaA5I+VmGrlffknt/pjl8VjQLdA=;
        b=TryS5n+4WTwOaCtge3dJJJstpOc98EE4yWjq3bpBG09B/PVZP3/J3wBPzauymS9qsA
         tiZSJM1UFN5V+0tZHZnlpYTVwyjneZe6FwD9R3lMGf+FCigXEIqFwclKaqPM569g4Yu6
         C35bNbUeO7EObdy33K0EwiHsxwfkxWEY9+pKTo2Rz+dsnwZfqvIKeivJyE7W2mDaanwK
         rsEakrcQwc4StGrwSzxCJmR+awjO5TDuSSdtyUW63B3tFKqLgzED4jwAorv9MPRw8O7E
         rymFH0mCEz4EvhfDmwqw8AnlQhIYJ6q7iEycvQqwZN5s1VaWGV3xLg5+PdT/QiDUAgUO
         L8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578354; x=1788183154;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9jFDMZuaDQUMNyu/XaA5I+VmGrlffknt/pjl8VjQLdA=;
        b=EmaSqoJH5HBpYFMtw2p5tgkYMwHEtFy0KYYYgRRJ1tkLfHjG1cBTgpAn2dURRaDc2q
         nDm2je8rYtcamUzfGFuhaoQ0Bq9Fl9TAlo1l8RLBwBgjb+w5c6y6mz0CKObSqIOdcWsO
         yi6ETQOYG8+NrqXWL8P/SzrbkNsukqWbLK+T+k7hrzgr/131eo7TtxNH9ytAcDtHUMK5
         clKJ+LpidzNJwJScVK6UPMHC0PU7Wzs7ab8meeNMirREt7AxaYLrHzwWd9TP8RJhaSOa
         cMAp9vaf/M4e4GP7/qSQyis4Z8fc3ad/YHXEKjIA59CmXpU5iTNBL6ZJy09CMj8f2Jl5
         /2SQ==
X-Gm-Message-State: AFuF++kWStGg9OufZ/sVh/rwXjLIM3dcv200y3CjZ5jKthCRJmXlhNrK
	9VE8NTRgH0ZQyJQYpvinX1knTs2vqPtqI2oEoIWNLvJBawUOTDV067yR
X-Gm-Gg: AR+sD11F2Cki4gpq6eVohIqV29ARk73+3iavHZjVokarZ7TPo4yAp1eCylypXm7FHtI
	vojEU4nEhoaC66GsqpMSs/hhkWnMORygrT0XIlOn93AaDtkmsRWq70jURoQr09LnCw6pxXetCCC
	EjIgns2vCzd+9qx9wv3lbWxjzi46DlikqxusOn9+HKhGpjekjwwja6ShedLUnrVQzFNxYMz3BAH
	9fKv21jo2WU3fjXGuIKzSPWJQPoznF8q5xDAGMfOB72cGfeXvgJZ5bRLcEuxshPvkZCNdYpT36N
	pF/T0V6sOoTMSQ4rswS5kwtz1vD7r5rDE2dfZecNpQ1mVbz2jxvbot35fEMG0TdDmic3mEKIZXN
	xGt5DpQiE8GZCq6ZjGNCCKQsPl90tZfVjxjgm00rL61f7n4LCTSAsCRKylmjt59OsBvC/BWU1y+
	VLte1/NENVoNNn3Upk/th9JCGaYBlDseYPoDTGhDsC18ecmXeduS0DMeJdKPi2ukxdWpY9pIKUE
	wOj1IGwTzVc5cyka7mGiRo4
X-Received: by 2002:a17:907:a0c9:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c24925e3909mr1796510266b.12.1787578354028;
        Mon, 24 Aug 2026 06:32:34 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f2asm1313492266b.36.2026.08.24.06.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:32:33 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Subject: [PATCH v2 0/2] kunit: add optional assertions to catch taint and
 lockdep warnings
Date: Mon, 24 Aug 2026 15:32:29 +0200
Message-Id: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO1HjGoC/12Nyw6CMBBFf4XM2pp2NBVc8R+GRSkDjDxKWiAaw
 r8LGDcuT3LuuQsE8kwB7tECnmYO7PoN8BSBrU1fkeBiY0CJWsYKRetsU9AgmqnnUSQa4/KaW1M
 kErbN4Knk19F7ZF8OU/4kO+6R3ag5jM6/j8NZ7d6vHf+1ZyWk0NpSrgzekC5p1Rluz9Z1kK3r+
 gHtL2wSvAAAAA==
X-Change-ID: 20260812-lockdep-kunit-9628f4bcad90
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787578351; l=2380;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=/wYoKbWA/rb5RPFSav1i6crHP4PmpHlCGKtzSsdb670=;
 b=Bo/DH7IPG8N81PqdvRSLkHlgp3Sr9uTslIVwWx/ZG1GyeQMkoYwK0XBxPGDX23QkYC+pp8U3B
 v6pq3XARUk3Dco9UNncf/ZsyuFsSlRhQyrC44TAzvrJlbVSCDniE3Xd
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

this patch tries to expand KUnit by using existing kernel diagnostics to
catch certain locking related bugs. Specifically this adds assertions for
`debug_locks` from `lockdep` and the `TAINT_WARN` flag from `panic`.
This tries to prevent bugs as: circular locking dependency and sleeping
function called from invalid context. 

Add config CONFIG_KUNIT_EXTRA_ASSERTS that enables extra assertions
to be emitted: First, before _any_ KUnit test suite is ran, this is to ensure
that the extra assertions are triggered by a KUnit test and not prior.
Secondly, assertions a made for each test case, failing them if the
assertions fail, even if the KUnit test is marked as passed.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Changes in v2:
- Implement changes directly in C KUnit instead of Rust KUnit wrapper
- Remove rust specific configs and add general CONFIG_KUNIT_EXTRA_ASSERTS config
- Link to v1: https://patch.msgid.link/20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com

To: Brendan Higgins <brendan.higgins@linux.dev>
To: David Gow <david@davidgow.net>
To: Rae Moar <raemoar63@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Onur Özkan <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org

---
Malte Wechter (2):
      kunit: add extra assertions to KUnit test cases
      kunit: add KUnit test to assert kernel state before KUnit suites are run

 lib/kunit/Kconfig     | 12 ++++++++++++
 lib/kunit/executor.c  |  8 +++++++-
 lib/kunit/test.c      | 30 ++++++++++++++++++++++++++++++
 lib/kunit/try-catch.c | 23 ++++++++++++++++++++++-
 4 files changed, 71 insertions(+), 2 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260812-lockdep-kunit-9628f4bcad90

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

