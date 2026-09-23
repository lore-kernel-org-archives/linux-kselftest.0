Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F018CC13
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122108; cv=none; b=DF61qwLJhkO2LMl8jyGQAaz7efL895/G3U5/1ZGYAJx4BvC81d5IDz8VxOpJX+yrIsxiYri2A+mDW/4lZJ/CF6/kKG8nsNbe6C5YAM1x6lFf5ueWswp+h6O/o9ukKOaFu+Nnj6H3Xst6ir4nwzU5AkQg7TXcaWtB6cQm5scTArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122108; c=relaxed/simple;
	bh=fsWaJap2Z4snPeSf3DEBaGqtx3ZtQ4arg0Z0hs6TbO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZmb3tP4vtfXH0zvciEAKBQt/n9vtuJyDmazx1PAVs+MNdL8OAaHeJUuYWGrT26rr9BbX8Wof5Q8Kcbl6zTaI5k1lDqUqDebgvLWagm3Ltf+JMQrm1UddrgQKPWM7/QcQhyl42aaksPlOm53+saPg3SFWFLDQ+JzM6QDP3VpzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq2yw6Nt; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq2yw6Nt"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso1746435ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122107; x=1790726907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKmQCvI2wiAQJXN+O58M5/YjmdCMCrm9Tdz8ibDBbpU=;
        b=cq2yw6NtCjOj5tsW3Fow42xuVBtmfqLBQd+bB7gR7tl5wIUu1xfQNzdLixk0ytZiCf
         p+ai/8XVv9RwHk4DvpPoFiY9r0mT1cOXs760+Oywj/Nqn0mPuWG7jf1zJBMxicilaHX7
         kJXC+0JULD8btF76QXkcc9PhsguLyguPLFBCT6pu9Qn8+0LIzXuUWNHxCb3AdNB3nW1/
         StB0/hJM+nXtKrOTE09Gj3CiZdGCWSnvM9Wu4Iyswjw82gjweRM1e/IBiucWHqOQf4QT
         y3YErqU3T/ToEs8fYLLjj5SQisLyJKhADr9kfMwDCrV9uMPgYvDxJkAjR7L0DWqkrHMh
         E3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122107; x=1790726907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKmQCvI2wiAQJXN+O58M5/YjmdCMCrm9Tdz8ibDBbpU=;
        b=qnPS2J29KGJPQCL0NELbhD/vCNSwbI5nywa2G66nrkzEaRcboGTKYMicqSWSH+afML
         /C4ByX+3iIY7flcyiockTrOQIrRh9c92GJwckL8bl4tcK/rLkK7fWS3qvpbx0bgZw7mn
         yPa+tvgMP3gNvxVzAwSRphun0THAgAPX4srjjaMkq4n19K6R3g8uIl+FdO2MQzJ0RKO1
         88EyE2qCy11KPOMgt5EUQKouodXyUzvvrweEf5QA95KuSUmiJEbBqUAjaramN+qCXRGU
         Hfuf6BAKfSHTfqpW2ro3q722DQ0RyWiPIPr4w3QJURmQq/vZcQJjxaPhfObMy8HhZTxM
         eZ5w==
X-Forwarded-Encrypted: i=1; AKwUvBziVm7klgNprpSqHQ0KWV4tPzgLJvaZxsl76VYBXne5c3Ot42zpKf1G9uaRAegcXMc8YbHom5TM28R9rfTNDQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ni+my/Cn8ZxG1LZ0+5RTtkee7BsqIg9Oj9XxBEh0mI7q2MskeG
	+BnX4bq8uGbErrlf+iWuOs001iSuhJseYWt/r6JRps0XE9UtfWZf2TI=
X-Gm-Gg: AYBFou1LAJo1TERW+GP8p3ZJYubx703DSrvfTEL3hAYJv02PLe6MSmUI8qQvWfulzX8
	rLN8zdp+azvao0QRVLucmb94F9oi+lszCprALcwKqwbmggkmfZJNOUTrna5qIydt7tHrQFFMCFI
	lnkOZofx5B6/VbFuMrbzBevKe9KVIFVODqeaVdEFVQ0RH/UiWThr2cpxrATi3KVxNJHujrzSzf0
	pBu1o3OPZvgFYQ8HNiYmE3+SKeJ+uVeztiVeihZzHWZVYfI04SztIEaYeTj248pkDeCqnHXxiVX
	mt7tV7rGcrtA4AxAqdVOZB34BewyFFA/A1ZU8qbKSmN+s5Lky5dkvybQbob4N74U5nsKxBPUptt
	OIZT+IW/ifawJbkWTi0tCxiEbcCW7Ggi+uHq0hkMdwvxBZ/928q85/m5RqI1e7oiXVkQborO2Dj
	5fEXxOrwnpALu3MKn4rwt3m0KnqcX7BlSclwUBWEubTstLYr5TthAbxyT81nhv3u+QJWhCw+3H+
	j7RH+oXPPbg0kdxXfH7tEv3Aw8=
X-Received: by 2002:a17:902:e741:b0:2dd:c053:e0fa with SMTP id d9443c01a7336-2df69e017bdmr8199925ad.41.1790122106661;
        Tue, 22 Sep 2026 17:08:26 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3a3dsm2021425ad.43.2026.09.22.17.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:08:25 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v2 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
Date: Wed, 23 Sep 2026 09:08:00 +0900
Message-ID: <20260923000801.1764758-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_init_value() initializes the per-cpu area of a newly created
[lru_]percpu_hash element.  The area is recycled, so when the value
comes from a BPF program (onallcpus == false) it writes the running
CPU's slot and zeroes the rest.

bpf_percpu_hash_update() passes onallcpus == true, which delegates to
pcpu_copy_value().  Since BPF_F_CPU was added that writes only the CPU
named in map_flags when the flag is set, so on the create path the other
slots keep the recycled element's values:

  update(k1, 0xdeadc0de, BPF_F_ALL_CPUS)  every CPU holds 0xdeadc0de
  delete(k1)                              element back on the freelist
  update(k2, 0xc0ffee, BPF_F_CPU | 0)     creates, writes CPU 0 only
  lookup(k2)                              CPU 0 0xc0ffee, rest 0xdeadc0de

Zero-fill the other CPUs on that arm too.

Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
The merged arm no longer calls bpf_obj_cancel_fields() on the named
CPU.  That call is inert here: it acts only on BPF_TIMER,
BPF_WORKQUEUE and BPF_TASK_WORK, which map_check_btf() rejects for
[lru_]percpu_hash.

v2: name the BPF_F_CPU entry condition in the block comment.

 kernel/bpf/hashtab.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 4f495dcbf670c..f7a9c432d9b76 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1054,14 +1054,16 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
 	/* When not setting the initial value on all cpus, zero-fill element
 	 * values for other cpus. Otherwise, bpf program has no way to ensure
 	 * known initial values for cpus other than current one
-	 * (onallcpus=false always when coming from bpf prog).
+	 * (onallcpus=false always when coming from bpf prog,
+	 *  map_flags & BPF_F_CPU when coming from syscall but setting
+	 *  only one cpu).
 	 */
-	if (!onallcpus) {
-		int current_cpu = raw_smp_processor_id();
+	if (!onallcpus || (map_flags & BPF_F_CPU)) {
+		int init_cpu = onallcpus ? map_flags >> 32 : raw_smp_processor_id();
 		int cpu;
 
 		for_each_possible_cpu(cpu) {
-			if (cpu == current_cpu)
+			if (cpu == init_cpu)
 				copy_map_value(&htab->map, per_cpu_ptr(pptr, cpu), value);
 			else /* Since elem is preallocated, we cannot touch special fields */
 				zero_map_value(&htab->map, per_cpu_ptr(pptr, cpu));
-- 
2.53.0

