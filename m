Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811570;
	b=z5c/wMX29pDyj0EUCN0W6Gyw8NyOSlgGIEEpOTiMizCtlpnMlbRTKbL6Z5/pjZs8HlnB
	 DhQh6U+JhrQPEwuxAdAgHsFjBVZoGc4X6cAh/O+7+Z4shjP7tFr6yBHn8L9cwRfdUAJYj
	 iiEeUTfMbBNoG7OYHaiG7Rnsk+z/XtgUZosELH0NMr9MrakU9srgWuNUz6nZjYtFu30ye
	 9RaJshGcib+FprJxMYnZFSBKrnc366nQdLJ7rdLf2pTngx35/VXE9EDDNOMyXXj2maGj8
	 +HGDKADFX1mdQAweBVHF0CbUnsZ5KH3zRrXe1MriXJJtvzicA6Yw/9HW6+ENt1ACpyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
	b=gDMJTVWGbld8axZXv/Mr7+Py9szT+zfRpBcluqBulFuGBsuELEoErm9NngvN++cY3RQi
	 aVJ7AZMYssuEOiEgdBfL2/wf9NDXcJ9JX9JU1OLYqBmVloRbzlZ9GtCZKVgGTRosvFnhp
	 xAjPC9nr7iPHdTiwFIESE0O0SYphCPu8/tu9b0zRKeXquFBDw8Kk7elKbQvmnZWc3Yk+Q
	 q7o+3FX/ME8q2/nD0ZjXX6EqdATvHBNdhvfjhIqXCeaNQ/4v94/RP4yE3n9nvx+g2DjxO
	 ZVWy0ZZaDI5SmfPxEUY9Tgj7NeuCvnoRDphQ3wspadmaqhTSIVX8jiFthnEwdM6dQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C4606D81C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09C4606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso1211490eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811569; x=1794416369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=ZdVTN83cZuFdJy3X+OheFWasrMSC6JUzg+o9axzkpEXkzy3ZcJgs+O7DUe4iW541rM
         8Qa2TjnoF/4+YdE0R4punsPO6vNtDfrsofSpoxTEi7f5bCWNJPqqWSvkmuXPdrUHiJBF
         zHJpQH0jKZN96FKPNP9q6mQpAjU5e0ltO8u+rTtLxq2Z2hd5g1rQMrg3MJFl9Jy9mcK3
         NE8JAvD7FJP/h9XT4k2XM+PHLse6YhNUNfTfxUbkt2g1ne0TSB51Z19KCLpaedla1UdG
         9rCjI5d6khFh/7SQHcVjcXGACkqIWV49AFM6/oYgeoFc2FAZ8l2/2021b2Ogs6DcC6V5
         GaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811569; x=1794416369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=v6uetnE45aeAVmUINHpSBNe63a4OUR398k3QKZ4IyZ3RiDXo+97+5iVd9i5GUgsAaM
         Davty/ysnwoKwhTwwo0GT3Z8AFifpdvRgftUuK2xYxpiW34FgV2/M+Bj7MPDE1Hsu5c0
         jHYZmJ0aO8GMW9zOU4qWRYOQKjd1ta29hM7Gfv3oyhLYpmPM/vL/DEC72k0b1qnTGff2
         EMB8qngLt8whnJo1pWaHDkDRm7VQxLSDbQh7kvekF6iEV/jFNSYKrQFzg7BPubZQwr7H
         QlubXGGo7f75jC795/VyDbMSpD9tTTqj5YBsyL7Btl6A6Dzo3hbHAvIoN/fb5czi5fEx
         CNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxEapUVSOuUXpPCOcwycnx9GBQtOSBSLbZ77/1wGDtj/d3qxIX1O7Ww4ijs7/Y40LjI5s4VeVN2PZFcK3IqSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z84D30vI/ftIi+mQ8y1zlZ0AVb8v4V2n3TbV0SY1o4+qr4s1CDo
	1jSI5vZxyQYs2rd4yocuLspve/MQomzOz1NzhuF/XTANt8/U8K2PODaG
X-Gm-Gg: AYBFou3SA42OeQAtxMZpJMev5gh0z7ZkKPQcwILYChYKYSSZeFPYW/KL5A8Gpyyj44H
	Kyk4bcIxVbRxQzG6H0wuw6c2G14L4oKdyEjhyLeY4lEBHmJrdCL5MG07+DB8dfEA5DiNJURN7vj
	vpCbNlBUVT9YH1eqH4PXSd3y4mOfx2DdJNrnZayWArb/jZYwAB/Whpj3u2fISrC2DrB+P8koBEg
	qeTX7+Vl6wTzZPDmoHJ4GUCz4XIzm2vJJwk21xFRDt5dXWXNt9C+DEi5coHjTC9wivXydwD6hZq
	WPtMpAtlOWYRHJItswAU5FNEleck+/mrfoN7y8XBd7RDaM09hi8pO90lBoz367jhqjjItfH0zf4
	mUJ12NQwhNm9AaXBFMMFhWH4t2wRSN+mfeVDUXgpIb7wKgPt71ICFe5nr+daZnkmXd+5oocKZGu
	jvwYeGxyWCXCC+YRJqQS+tyTFXOuEIiE+pWdCgzmSNj8voZF78uxCD3O7YOVvoViPhNXmxGDABG
	17SH3k65zT7s87NTqYgI8fPXx+9HN90YT0h+2URxsXm7IL15iwMnFCCSY4wggbFWAveqT56twDI
	XsHKmML5X90vJF+//1jcO54iBxPgd/b8J0rDRrA=
X-Received: by 2002:a05:7301:1a15:b0:369:a113:756f with SMTP id 5a478bee46e88-36a423f980emr22997970eec.34.1793811568303;
        Wed, 04 Nov 2026 08:59:28 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:27 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 27/28] hazptr: Add Bloom false-positive exact-match fallback
Date: Thu,  5 Nov 2026 00:54:45 +0800
Message-ID: <20261104165504.2430480-28-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After 200+ scan cycles without progress, do an exact-match
per-address walk to determine whether the address is truly
present in any per-CPU or overflow-list slot.  If absent,
complete the waiter immediately.  A wildcard counts as present.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 66954251c332..13ae9eb26a8b 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -407,6 +407,7 @@ struct hazptr_waiter {
 #endif
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
 	unsigned int drain_cycles;
+	unsigned int bloom_cycles;	/* cycles since last exact match */
 #endif
 };
 
@@ -852,6 +853,18 @@ static void hazptr_scan_do_cycle(void)
 
 	mutex_unlock(&hazptr_phase_lock);
 
+	/* Bloom-false-positive fallback */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		w->bloom_cycles++;
+		if (w->bloom_cycles > 200) {
+			if (!hazptr_scan_walk(w->addr, NULL, NULL)) {
+				list_move(&w->node, &done);
+			} else {
+				w->bloom_cycles = 0;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

