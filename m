Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356656;
	b=vGVUxg60EeqP5XUY2ybCLM1BJWuvhyhdMTtUh8yIZoa55VC9/NHzYlZ6VXelrzaf1pUA
	 JQjZ9mTDyJSLyGOSi4kP6hiD8zYHFiQ20bNXWOhbvFnA7ya7FhSFuGE3kEmYOtnQuLO/2
	 UNpa7OySEQDRbwTOD0IHAYFNXd/vId+wl1b7H06ZKDH8xQ9xGDLR37KRmT2386KgcRUMX
	 gOTKy6ft+bOeeJFtLmqk0dwjdELxxS276HPRCyJtc4CBw0HSN6WqtAVMYDIgxQ4GHQYTC
	 ICr9a4DNex2udFZzJA2pNU7ru6MPa0inF+MTxrJYbEW3V+N9wsvn1K33qh2Sdjpxb4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
	b=KAf84EWJW1rIRWukub4pVFxNhofOuyL71Lu8zNZn0IvCCnfFkmryE8vdTz6CSv7xi1Id
	 vIl9cBRIFUbZblTb5JOY/b83qlfPpEVUbLI53AIIgcoXcK4FnXKvgLKwjW/e3577voVHg
	 Pj/VqoIOVvyn194aiOeH/nTVbysVuWbSyRzP2JPYhI9fQzgPT7W6ZzJqYyk6Gm3njtAsp
	 kaSW3UfPx8DNMb7W0id0KgN6pn8CGf0szUJ8FwGUqHBHCT4H73YhWNHydOKOncdf7zx+5
	 nkev7oAZQrUC9LQZOjHQypkZs70ikCUJ8fD5PHRYfziqFxT6rIzETZP5dzA1gi6YLRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XCJJCbMl;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF760A3813
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABF760A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XCJJCbMl
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-821de0b7baaso3476100a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356655; x=1794961455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
        b=XCJJCbMlXUal3ePEpojPrIAVDW8H4WcSwjtVolZOUXJNDapNSgxHjOVdWdWjlQZM6I
         oLlcwW6yPVilSNsDwxFshSn9nW2tW1g+oZe/Op/8a6+qtoUEP9yI2JnQfB4c+V00+7tG
         L2+q25E9PEVxD7j9X0HpSHXJjj54/ZtpFYni4eZEBGe/AFtYVWoWrtabpwCLXGHtxRHE
         3eZIKtW4DyWrypharbA64hYUWNOAD5I5vCIqjeMgyOUHlC+wV0dBv4seintMiSHznEGh
         YO3mjhQuJ25ifhx5QtJoMEUfJ0X7KaG6xHu38XJcOxBNcvT8ESWbgGTI9DwvMe+mycB+
         tiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356655; x=1794961455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
        b=xl0UDIdpkF7vSH+kF2EpMhjEQbgC/DpZfzc9EiS5243yLSU/7S4AFgI7VvKeoCloHu
         zo2qbN3mvImSwvJKeK/YK6bdL8GhEffAEJ56jwkpSiskcjpk0HwEGPiZubnNRT91kzO+
         eKlyhDt5mP0ELrK2Qrep9mozgAGG2BqGIuNdslawyzoNgR5zaeQRcReviwfjVbKOfcKC
         GY6gETyJ0E/TfGLq38cw8I+2uf3eQe/v8MZmeqFRO2uC+8+8kHeKLJXqJaqQbWRPhaE5
         REDW8a4vu9ocH/9rJ5faa7RQ9FN+2LOSkTFS5W3TaNQLoiJ8KWe4fUL91ADBeflTP60s
         mT2w==
X-Forwarded-Encrypted: i=1; AL+hErGN5jZiphuVu8DpcdhhUaOqPrM/iKbXVBFbRlIK5adjO4+tD/d7efJEkWOrEMp8nWFWs/KLlUCNR1LLWX9eaxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OKNgZHFDLazUJ55GIGANqtNWHbPjFtW3yoSvFRx4cY+ByGymg
	ejMKprlGy1H3Xu480OAWLNx9xUO0khreVgei1okSyRcfRvUEOJAimqT3bs2oIRvYS3LBa3cS1Xn
	CfbmB6Otuw2IMUA==
X-Received: from ilbec1.prod.google.com ([2002:a05:6e02:4701:b0:523:5388:be99])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4443:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-56b9771429emr677558b6e.36.1794356655005;
 Tue, 10 Nov 2026 16:24:15 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:44 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-7-dmatlack@google.com>
Subject: [PATCH v4 06/19] liveupdate: Don't WARN if tracking a retrieved file fails
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). Make the failure permanent, and keep the file
until the file set is finished, like any other retrieved file. Only warn
if the file is already tracked (-EBUSY), which would be a kernel bug,
since a retrieved file is always a new file.

xa_insert() can fail with -ENOMEM, and userspace can trigger that with
LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so the retrieve can't be retried. Keeping the file ensures that its
resources are not released before the file set is finished. Finishing
the file set then erases the file from luo_preserved_files, which does
nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 0c9a3b6921d1..e5d333649f76 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -668,14 +668,28 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/* A retrieved file is new, so it can't be tracked already. */
+		WARN_ON_ONCE(err == -EBUSY);
+
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
-- 
2.56.0.542.g3ef89b7020-goog

