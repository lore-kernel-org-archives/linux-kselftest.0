Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FB3B42DE
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528201; cv=none; b=YegNtbpArUKDPOmByHL1YXm5/PRfAchKqCJKQQ8U9YLn96vRePwJ5qhVgB6lgu+R4Ajp6I1pPb2mocxfgC3N2Lu8eQQHaqnNqKj4GXJdAOIYs4t6Hh1FzsOq2/ZjdcOfnNWRyEeJ0d2SQyTsLwDjB0mfq3rY/CfrOXpZcsdT++U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528201; c=relaxed/simple;
	bh=s3onKEyrT+0WHtiaDzpK2XQ5j/0XZyztY0aypjYq4dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=el7U9m5CXI6R8I9Wp20Fv2+fHUAiSyCBF1GDQurDJr4mpJF1XZwGupfvv/vGYw/POgkXdopihQe/wtLZm9J4kG+iuxZx9yvYfDzD1dVZS7rdaPdUUBsm2AnkYuwPYFRX59/W56tknLJ2cj2ipv3qJOfW79ogvYJ/EsxoJqBl/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTuSBm/W; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTuSBm/W"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so308803a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 20:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528199; x=1790132999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xo/F38+zAwDZOYgaXngSmzbr3sc8wNw9Tr/i8NiK348=;
        b=JTuSBm/WipSCDtIsyDkAXXnr4lekbxN0M/G0OXJAq2pQx6qoLk/QEFCBpsFbfESfNU
         nGdL9umXrre0dDHQWnmrJzQXQw69/74CkqzB38gGf+riHLFcf02mcx+A+sWByGJ0PqIb
         FeM61oI5hLLwiMF6DiWjafX1Q396Y8v0n+1p0g+mxYGfLQ1Xui/L91UhrEd4W9XMtpQ+
         warOOBaKdz+V/0ncqm8CxhchItw2B4ndN1a4Wyl71bjXfbB8J1ZmsH8Ge0diVp5UHrIl
         PekM+6NaV3Ohn85DZH2ns6++euHQl2Lm2YLNLKoJT/lAKhX8hKml9N+Io/sEmaOVHpPV
         /Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528199; x=1790132999;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo/F38+zAwDZOYgaXngSmzbr3sc8wNw9Tr/i8NiK348=;
        b=0sL20t5X1NS6gb3q2IA57qcp6DjfgKkoOqgBfMGwpq5ZT8unlgSYyTpic8gDS2MknH
         4jAjDJBRFckH4fvNI5nw+/42pq65kGXYGvk/jaaPGRfA9zNSJB+o1p/cJP8TBw8LhAQD
         lsAfF8T1kqR3tcnhqxhBhFq2LXNA3Z00R13k/9IL9YpVQjcQFrvxI+bLQGgLR9y9DZg+
         qoqRDalRKvCFhoHyzMQ2CnvVeAZ46XIcHcKJujtJOTT/SWmHUqkTF5CzgwwskwdOZHJf
         6gx3TMfKIpobn7KNlqAWfKBRE4h0z+af4tKZOLAlw0uK0BdHeMJjpFej/VPSuXzAs/IU
         UlDw==
X-Forwarded-Encrypted: i=1; AKwUvBxhHhghX+cyRp0tfjH095kRqPQ+Mo40wpm72jyfJQjkNq91C0rtpROmHtgmrr0AX/dCvm1UGJ64D34NjxTpjJY=@vger.kernel.org
X-Gm-Message-State: AFuF++nSPf2wnRQ/YaT+trR6ze27skR3Nkl1WFyipRk4LZ6bCb5spTqT
	PQ+3GYEL1hIX1cKZZAq3jpRlDqphKC9qD96p1zFcWQkNKISegbe/viZe
X-Gm-Gg: AYBFou1dnAzgVtx0Fh1pW1fW6k2yZmlsgaqLqxRRF9iToF1cOYNsaqAPxWPvik33PhV
	mqhsw1JfR5utfWuMq3lXtuV3s9ayUuidV0w2+rw7WTM1gGOZhTh/v1kfeXKZe2W7o17Ix9OpDGn
	RCPlJNmafA1S8sI8nhTS9ksESgv8IG1+O/UcdQ9G8C3XzOZqqj0jJ83l7dXhQTfET5XZj0IAW/o
	b4koxBJMzu47a9OI4z7EpEaZhOm+oUwkZKP40Kvcgr0D+MPcvYHe1Q9G+2Ta/8ZWz0Rzx35Mdw4
	/rZtnSKJBji0NuW+iiT6mRHQ/KKr1lJffO6sygSE4A0A+iCaEUNq6bPhPYDeChK2XHc4p8GI1+M
	U7RiSbdQtEU4LdTUm0jMp2VAMhE36I5/wRk7tHWwp/8riu9nk+Wwp8AVTrQm+FhhqLNajwyjhoj
	y8cERqRM1GRqvO8N7Lcx7grcfa6013M2y3KUVsCJgx5RcsWAYggdkjoF030Y7oX1IrzaxBFpPqP
	fsM5iA5mAKIo68ErkWaQHSZSHraXcWKWUAJt4AcJIuzEQH+L2Zb9hcaa28Onz02KXOAcXaujbP9
	jw==
X-Received: by 2002:a17:90b:2744:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39e1e5770b9mr2371994a91.25.1789528198934;
        Tue, 15 Sep 2026 20:09:58 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:13da:4baf:148d:4ebb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14397197dc8sm1984591c88.3.2026.09.15.20.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:09:58 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v5 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Wed, 16 Sep 2026 08:39:50 +0530
Message-Id: <20260916030950.6667-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904231758.4082471-1-kuba@kernel.org>
References: <20260904231758.4082471-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi @Jakub,

Thank you for the review. Replies are inline below.

> Should the vendored copy in tools/include/uapi/linux/pkt_sched.h be
> updated in the same patch? [...] So after this change the two in-tree
> copies of the same structure describe the same field with different
> units. [...] Would a resync of tools/include/uapi/linux/pkt_sched.h,
> or at least of the tc_pie_xstats comments, be appropriate so the stale
> documentation the commit message aims to eliminate is actually gone
> from the tree?

We would prefer to leave this out of v6. The v4 review asked us to drop
that, and we did; adding it back now would undo that. The copy is
stale well beyond this one comment (u32 prob, no dq_rate_estimating, no
FQ-PIE additions at all), so fixing a single unit comment there would
not help much. A proper resync feels like its own patch.

> This isn't a bug introduced by this patch, but does the exported value
> always match the newly documented microsecond unit? [...] a qdelay
> whose nanosecond value exceeds 2^32-1 (roughly 4.295 s) wraps modulo
> 2^32 ns and then gets divided, reporting a small microsecond number
> for a large delay. [...] Would moving the cast after the division in
> both sch_pie.c and sch_fq_pie.c be worth a follow-up, so the code
> matches the microsecond contract this comment now states?

Thank you for catching this; the bug is real, and you already flagged
the same issue for sch_fq_pie.c on patch 1 — we will fix it there with
div_u64(). No code change is needed for this patch itself; it is 
comment-only and correct as posted. We will send the sch_pie.c fix as 
a follow-up after this series.




One more query: I see that the counterpart iproute2 v5 patches are currently
marked as "Awaiting Upstream". In that case, is it necessary to post a v6 of 
the iproute2 series, or can we wait for the v5 patch to be reviewed?



Thanks,
Hemendra


