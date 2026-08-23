Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB83CB559
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488560; cv=none; b=skvqgKtwyNayN9pvaKnODA964Eq8SM6gA9nAFO0PE8kK3KKyKJtivYVeOgMtW2LMQkGRlUC9niUhUSbGsIKyv2gh6kts8PU+kwZBAhxNj+vKfVsuYXXvGiqo7IOzx8LBl4A+oiJRZXUGkVrw8QO02mwf9VfUH0AuVODw1IHKtec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488560; c=relaxed/simple;
	bh=yWZFWInH1rLjyv8+mSonhwyX1ShwC2bCnUBa5J/c4L8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WaUUOKxIxpS+SwmjuqG23644zc0TCprcaLdEx5kJMpgEVbag/B4I1gf51wXl69YxIDJqg/X2S+gYFEm7HdMY9eCiqs0qPwfIQ+f9t43MXjlIuD6FyGV1We9/NVlqLyNz7XyeyL5eI1Ho9oZswF6Gtw9V/PaQTPZnf5aWz2llOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TgK7Bhw7; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TgK7Bhw7"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso37283835ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787488558; x=1788093358; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6pl/FAkhJGdRW7xNY1Vo7P4vt1vAKgIpkL7cBZjl4I=;
        b=TgK7Bhw7L0dLYKOLtqXS928Q5WdXacnro0wu+Pts0iBvvn/b7crp28K1AfrCBgu6HG
         R/vEc2+Up+d7Zwotbt4CRllsoW67Cwd/xMb7uMyjK3GkQ/XkAgl8iugsNoQc4K1yg9Am
         j877Q+3a0LgQSQaeiKGCOUXHe2eYepbQTt4dfKGuHEDQVXmt9sxg7gAuWa/s9i7kktTZ
         NanKuxooawhCp9yiWydnwyEMb02zhKTHbSsdKYset4NE+wVwlwl1eR1MXgP8zAGegi64
         uRk/JJQDqFb1Z/0ddLy+iC7340mSZGl0Z4dmX/xvLqTWDHFSmRL4qvqG5mcofe3buyKK
         d1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787488558; x=1788093358;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6pl/FAkhJGdRW7xNY1Vo7P4vt1vAKgIpkL7cBZjl4I=;
        b=GhvpUPFty/+Url2IxFp4gtG+YISQlftvxeD3qHOUXwOuW2o+HE8rHKiAWoA1JLYQrX
         QPp41x3BT97h2zZiciTSbp391b/IvEImErZ8CCQubyNduoB4a16Q1/dpMJYlzInAeveH
         dvTkbmGmW3W40ChUzqCXQDYDEkdW2hkXaf99nnuTF3s8lk/PppTqx6kjiuGiRGvBsLQm
         7ztLrw7kbEtAh7niXpdYfTCLfs9+1H6iXJuSFcqI/mSDn8l3IfUq0z4ak0cIDs6Wm5vB
         fhXmxtaGkMrJVP3MgCppgVoaDdYW4vrFz6BBX7bXvw352UmS5Hjc1gVpPDRcRSEyHke+
         +L9A==
X-Forwarded-Encrypted: i=1; AHgh+Rob0+3dsZq/WJCMD1UGuj/W9CEIZPa7Eqy7p8zfQOkflNi3C0DjhLBzd96ZFFN/bjCsBUdfmCfxgSycS3V616Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mQMy/VjS0mZOKeHZSk+VaaLroBu7AKUgP1lcPVS2g577o5RmO/
	4FB1ZwzXP7g8BoLuFk4YFC+1DE/eTJW6kgw3h4b1PI/T1DpjqwedXKBsyZ+PC97Mb9B2ABLAIZJ
	j
X-Received: from plhi12.prod.google.com ([2002:a17:903:2ecc:b0:2c7:ebed:f6e8])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:390d:b0:2c9:fb11:1bf4
 with SMTP id d9443c01a7336-2d64af4eea9mr368056955ad.7.1787488558140; Sun, 23
 Aug 2026 05:35:58 -0700 (PDT)
Date: Sun, 23 Aug 2026 12:35:32 +0000
In-Reply-To: <20260823123549.1120133-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260823123549.1120133-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260823123549.1120133-2-morbo@google.com>
Subject: [PATCH 1/2] stacktrace: Add __counted_by_ptr attribute to struct stack_trace
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>, 
	codemender-patching+linux@google.com, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For hardening and catching out-of-bounds accesses to the 'entries'
pointer field in 'struct stack_trace', associate it with its count
field 'max_entries' using the __counted_by_ptr attribute.

An analysis of the codebase reveals that 'struct stack_trace' is
instantiated and initialized across several entry points in
'kernel/stacktrace.c'. In each execution path, 'trace.entries' is
assigned a buffer of size 'size', and 'trace.max_entries' is assigned
'size' concurrently within the structure's initializer block. The
pointer is not accessed before the count is set.

Because 'trace.entries' is always assigned at the same time as
'trace.max_entries' during initialization and is never reallocated
or accessed beforehand, there are no uninitialized access windows.
The 'max_entries' field accurately holds the exact element count
of the buffer allocated for the 'entries' pointer, ensuring that
compiler fortification and KASAN bounds checks using __counted_by_ptr
do not trigger false-positive bounds checks or runtime panics.

Assisted-by: Gemini Next
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>
Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Kir Chou <note351@hotmail.com>
Cc: codemender-patching+linux@google.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Cc: linux-hardening@vger.kernel.org
---
 include/linux/stacktrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
index 97455880ac41..fbb0925d8864 100644
--- a/include/linux/stacktrace.h
+++ b/include/linux/stacktrace.h
@@ -81,7 +81,7 @@ unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
 /* Internal interfaces. Do not use in generic code */
 struct stack_trace {
 	unsigned int nr_entries, max_entries;
-	unsigned long *entries;
+	unsigned long *entries __counted_by_ptr(max_entries);
 	unsigned int skip;	/* input argument: How many entries to skip */
 };
 
-- 
2.55.0.860.g4b6b3295ed-goog

