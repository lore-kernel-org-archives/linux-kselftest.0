Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356661;
	b=PIxJRFDZqUPdzj1GeFgovons5mWBAqNeh+xIp0wa08fRO1YhkiG1tyTe2Nt65ruXagXw
	 qQPqfTngFrKrb39oEmFGoOpOmB5FiwI03RNLnTzEVm6x678unw76A9NL8y1ico/K0virV
	 RPxKongdDMvpmQ7Clofxd8bioGU5YxcyJVtLlOM4GY+bUNf06Op2wVzTIPLdac7I2nFBq
	 tRKEwEv7TQnlCn2sSr3x4t66o1lw7rC5Dm0shyRiWjvH8AoB10DuANLCYPbBuiHuqzqjP
	 Czf62yYgYXA/lgTgs9J0CCq71Smvsy1mAe6SUSw29/QWmmdOynFB5AFFnX7xI+lVskw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
	b=TXxqYmjfifxvSxQd3eHWGMIjm4e8BVDwIEMrXa7MpUwqVm6Zqpp5DnMTm3/bdiC5vHti
	 EKfU1EdMO1LqT4tt84MVCuN17Fr/MA6q6rSwI9Z0JewPMTYo4HyQ60img+bOAg+tHm/2P
	 RrnxtHOmzvg8U5kVw6V5jQa0LARIrWQyU8LD6lBNTRHZk5UC5IcFDdOW2PlqLfRXz6M/Y
	 4Cx3gLaGXUyF2/s0Jt8HjzmdAobwKu6vozlYI6R/zXds/3g0hOgTAtMzW2zVBUZsqGzRB
	 bbsFtKr2kWo2VzX49Cv52crdx4XJVFnsa1Yj6ZMQbBiYCfLvHRBHU5NL7jv3reEiFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C33C60A5BDA
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C33C60A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so5227976a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356660; x=1794961460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=ktF0P4T4IydsOsl2xKIG1UXcZe/yOkI/JJICUYtlWGIBVwTWWO7o2nZ5KvH9j8kTYG
         GfxgLbXlsJYm+M3TNZ5Cqt3ZaV2NjCvE+mocIarmHq5R3wvo2nhGbpSJlwGp7TLZKsWt
         715AvaUxCYdXyJYti6WlxqKA/OSG5pKuEgJBSPxxivofhIHT+6VfCiUZygZBnmSrbG08
         trzQFkw7qExOlUqbIY+Oniq7qiUlzPYi+UPaNqL5Pn/3pRaQGe3xFQ5J6W8xcd7P+A82
         pOvFO8tM6AKrqQTj/ny/ItiVySKg1BC838ht51HntBFxK7leytHsWbv5KO7HHM1pBvH7
         2fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356660; x=1794961460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=vChBHOLvBaZnTxwXrDGdXHaE1uTNAw5Udu0DqILG0kw1D7U3hdLtvQDhrTZl0ZdlJ7
         PDQ4kjRXfd/Y7CfXf/hO4IKKd/FC1s3+KGmSDI3NGMq/RkFgShpm5bJdyjRh6mwnqp3f
         7dUaiYf3ZfHlW6ZTEnoqy8nBz7K05U4PT1+GrqVcjvId06U+ApnFuUozRImSsN2Ez9Tb
         m/DNmqXiAMAnjSPT+kmBOWNwV5VHIQgK8mApWmQ8XG0O7NwaNCfemJC7yaGGcsykEia+
         2Flifxog6iGQ/Dv2C8J6KeXrKbvHllQ3RrJw1vIEL1lJzQM8ehHoXN4mYX7qx2ZMij1w
         ezYg==
X-Forwarded-Encrypted: i=1; AL+hErGH6YD8//j2o1/JcuIQYGRpyYzCa+Tkqqfxb2MzUoOWSbJac/P5zCswOaaJLNO1al7rcMyuJ5jbearHBS1aK+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n1889or9dqYpPDSOkzNBT8FfVUUcOjQ+PYkMNEZQ0LOZSM6I2
	AP+Y1ES4D4AJJ+FZjb6m2ObDQ9P0o7ATMdVhAc2KVzw8VICkQO6pNXl7b2lyUCAet3pARqN/luW
	FcRvJr0c80rT9pw==
X-Received: from iobgl21.prod.google.com ([2002:a05:6602:4f15:b0:9c7:70d7:1521])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1581:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-56b98727e41mr556110b6e.58.1794356660168;
 Tue, 10 Nov 2026 16:24:20 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:48 +0000
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
Message-ID: <20261111002358.1842967-11-dmatlack@google.com>
Subject: [PATCH v4 10/19] mm/shmem_luo: Don't make early retrieve failures permanent
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

Mark failures in shmem_luo_retrieve() before it starts restoring the
folios as retryable. If no retrieve succeeds, finish() frees the
preserved state, like it does for a file that was never retrieved.

Until the folios are restored, nothing has consumed the preserved state.
Leave it for another retrieve, which may succeed, e.g. if
memfd_alloc_file() failed with -ENOMEM.

The exception is a preserved file that this kernel can't restore, e.g.
because it has seals that this kernel doesn't support. Retrying can't
help, so keep that failure permanent, so that every later retrieve
returns the same error.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b48d7f460493..dc6ede528822 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -552,6 +552,14 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
 		return -EOPNOTSUPP;
 
+	/*
+	 * Nothing consumes the preserved state until the folios are restored
+	 * below. If the retrieve fails before that, leave the state for another
+	 * retrieve, or for finish() to free. The checks above can't succeed on
+	 * a retry, so they fail permanently.
+	 */
+	args->retryable = true;
+
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
 	 * later.
@@ -571,6 +579,9 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	err = shmem_luo_restore_folios(file, ser);
 	if (err)
 		goto put_file;
-- 
2.56.0.542.g3ef89b7020-goog

