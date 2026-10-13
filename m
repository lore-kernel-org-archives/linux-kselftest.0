Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A83E1D05
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 02:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857081; cv=none; b=oyixOXRoMRF5nfrj8f+59dlvLv8RfaTMg2TTOZRCQwDw1u1tjE1/yY6P33NvoRtILBbNw/Q3W231Fd6q6jRa6XIQphcIw0imr7Py+Lk/j0fMFwivAPNwi8CQ7DMBegDFe1BWWuAmAqK7l/H+hQ6dIbTqWWKXaxzmCpimWIVS7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857081; c=relaxed/simple;
	bh=oATe/xxxHzH49/OQqmRsmMYhqHwx9MSd6ebsr9VOjqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVlHanfQtbgf8AT4ow515IvuqEbOlhe7UvPIVrXzuaK1zBNCqhabNs+HB6AoRZuHmFNtLRZ1lHppfe4PFm1a2O0z9WFfeYzzlZP5NzHa0xfvrLPq2z/Ov637GCT5VGOzzcy/KyqD8WwFJ7YmBCMnv20F3x9MjfGPJ63Ewvv4MQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3l0JufC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3l0JufC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so2673421a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 19:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791857080; x=1792461880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UKeflbCZ+vlTZlszfvtV7zcKynCF0qJdVDrDvGRXCc=;
        b=M3l0JufC0pIt1aBGeAFZ3NUfc0uQsj3qO/TnKDAF9tQb21bckvHtNnpPpYB/a4WEFG
         DgQSyaHfAK/guAkzKRrRbQKjeupwGoC5cOV6hAlHvYKLYHkoH39EnY/ciAXEAriNAqyD
         TB+iiyG4cewE4fh+qfCziXN35z1fEzRyKuesgo+SolKO0h1CMpXOnleaChNhTdoyytFR
         3GpjH5Kw4cRheD0xk9X+p7l7j3khnYX85xwS6nU8MmqYmBAFEFofjk/Bw1fRSiZhlFfZ
         3JHq1HjYu64fRvzpyPok4DQOjsF/ECdfgBhufrAfUtHOxYlaZV1RxaHTMs9YKGbWaDXg
         Y0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791857080; x=1792461880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UKeflbCZ+vlTZlszfvtV7zcKynCF0qJdVDrDvGRXCc=;
        b=XKfVSKDSlURaaJ9Ie7ozsUsIuSV3bnEf3Xu+H85pgOm/P6OdVgi2//m6/8OX7Sx9hC
         x7V1ZnWhDO7N6ThEV/FtEbDOHyTrgeFRP+GQ/PQ+B5OyFlR9MeqVBUA1kqYv8gJfBNfM
         1G1gW2XJTXeN3h1N3O35x8wrcJBDBhWC+OeOFPurpXlQK4ih9bSfkKyPy+gZPtfpC8yr
         ubShp90f3mwPNHycSYCXrev/QcRwVpH1TSVDJn8GGqtW0zgQ9yqrn6bF+/H6EnBdQ0F7
         9Vw7/QzTAQKq2qzRJHDgIQuHssoeQQGjg5VItP4eGeAeNLPTO8WgtoSUZ073QYc0HXk6
         +i6A==
X-Forwarded-Encrypted: i=1; AKwUvBydf+QUbHOfP0GPdeROPlrzDflP6C+5SFJmVcVXNYvlbMBbaIudYNYSAoH3yw0ZN8oYUZKuBu9kuTRkMwkaFf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1x11s62y8Cpz0as7elitl2H/E98IKiBw0tNAtZpImbBSGajKV
	Zgc1XHSuJZUN1Cq2IGmgxpVAzXwrCYd/a6uxAx+J11ch5h1d/m+8c1YHCuHPKw==
X-Gm-Gg: AYBFou30c1j8rxMLpgN/5UfDPRyWri6EPkmjpGnLjC6HGFEkezj+eHpGS7cbruBVejr
	PayLF6b4uNkH/O8iHlc9HmnEoNE+kUUUrIKVmRHnsPhcTtoqJxxw220rjyLng+Elby7PjS3SGEZ
	QkoK58GFyzkaqSdnwBPbccRCJOiZEMJKncdKvmrD5FtSuzsvGogFAwFzW8qBf4HRpUES57UPyT+
	/dR9ATy7n1cnuqeCs80yzxGVqVXEhvOdgSHUnwsKfJ3XNLiW0lJdtAFXf2lvtJv6EFt86ZuYfmR
	9rlHZGgvhsWxSBE4CK5c9QoJTRlqndQPaEaFhhbiU48P1qu/Wl6hikYhDEjEQdUpwggTgZELHT6
	eP6a3RAwo+buigU4SxotbImdHtZfs45Nm0bXUABdONTLmrhw369PmB2EWMzQlBzCbt2lDmBts6Y
	NAuX7kcXqWDmaZGgUo797c+J9vN95M/+SaQ5/9FkXAVqUgfi+YIntqSoYE8ezN2YWEcf7CRAgLV
	oCEeR8DV0cu5IY2STzQfSXvzqWphxNFG9iEW1DE
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr2979609a91.27.1791857079794;
        Mon, 12 Oct 2026 19:04:39 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:bf57:67b8:4e15:46a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm18450258a91.8.2026.10.12.19.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:04:38 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v7 00/10] trace: stack trace deduplication for ftrace ring buffer
Date: Tue, 13 Oct 2026 10:03:21 +0800
Message-Id: <20261013020321.1898006-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912083753.3426176-1-lipengfei28@xiaomi.com>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Steven, Masami,

Open question 2 in the v7 cover letter was whether the map generation
should be part of the ABI. I think it has to be, and I would rather
settle the record format with you before sending a v8.

The problem is that reset clears the map and resets the element cursor to
zero, so a new stack takes slot 42 immediately afterwards. A stack_id 42
recorded before the reset is still sitting in the ring buffer, and
resolving it now yields the new occupant of that slot. Userspace cannot
tell that apart from a correct lookup - it gets a plausible stack, not an
error.

I first tried to fix it in the table, storing the generation per slot and
comparing it with the current one on lookup. That does not work: the
comparison tells you which generation the slot now holds, not which
generation the caller's id came from, and the case that matters is
exactly when those differ and the slot has already been refilled. The
identity has to travel with the record.

So for v8:

	struct stack_id_entry {
		struct trace_entry	ent;
		u64			stack_cookie;	/* gen << 32 | id */
	};

A single opaque 64-bit cookie, high half generation, low half slot. An id
is still only valid within its own generation; the cookie makes crossing
that boundary detectable.

stack_map_bin reports the generation of the dump in the header word that
is currently reserved (ABI version 1 -> 2), so a dump and a record can be
paired. Text output splits the cookie rather than printing it raw:

	<stack_id 42 gen 3>

Cost, against the workload measured in the v7 cover letter:

	full stack, ~20 frames   trace_entry + size + 8*20 = 172 B
	v7, 4-byte id            trace_entry + 4           =  12 B
	v8, 8-byte cookie        trace_entry + 8           =  16 B

Retention on that workload drops from about 2.17x to about 2.0x. I will
re-measure rather than quote that from arithmetic.

Two alternatives I rejected, in case you would have picked one:

Packing the generation into the existing 32-bit id keeps the record at 4
bytes, but with FTRACE_STACKMAP_BITS_MAX at 18 the slot index needs 19
bits, leaving 12 bits of generation in a signed field. 4096 resets wrap,
and a wrapped generation passes the check - the same failure, only
rarer. It also ties the id layout to the capacity limit.

Two separate u32 fields come to the same 16 bytes and would make the
format file self-describing, so an event filter could match the slot
directly. I went with the cookie because an opaque value says the whole
thing is the identifier - two fields invite userspace to read the slot
number on its own, which is exactly what is not meaningful without its
generation. If the filtering matters more, that is an easy change.

One consequence I had not expected. If a trace spans several resets,
dumping stack_map_bin before each one keeps the whole timeline resolvable
afterwards: every record says which generation it belongs to and every
dump header says which generation it is. Without the tag, saving several
dumps is pointless, since nothing says which dump a given record should
be read against.

Does that format look right?

v7 split the series into 10 focused patches following Masami's review of
v6, and the design is otherwise unchanged.

Thanks,
Pengfei
