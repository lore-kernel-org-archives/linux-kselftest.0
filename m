Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81731578E
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787030429; cv=none; b=RUSDzNBP4lLU849wWAO3upqaandtFxz7r8/wzZMynKAISLZOAYoWkpi1R+DXLKwuplgnoYXtKc7corFQq3AioToNS64OXo6QPusY81vFZRehRlNMlAnW6XBOPX/e8vKAnApV5ycasYcld7nkDEZ1UKBqykYtISXViO6nJxqanj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787030429; c=relaxed/simple;
	bh=H/zOlGcY83fmIIgH5EXSWiy0LGwiarK4zHNCO9l+iUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDUH8Ne2hgJmj8A/gzZpEmvvNy7Rda2FMHDZGWcqX2/4uL9TUNk7pyuTMKwlRuFIW6OzmklXCoZASG9NkTzxUnYXvmTfIsr0iZXX13ZA6rO1NjGwfHRNvukOHW4vJyECDfogYFPqNsv0BQGtWXegZGPJRnYNwDe6/OEIMG4eDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDUk/LaN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDUk/LaN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84874b52eabso5635765b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 22:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787030427; x=1787635227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guhfkRusufvBWD8H2or6jNYjgUQNUVh/3Ni9l2mmIoM=;
        b=lDUk/LaNP85ZQHPwh3yhZnIyAIK2qwpQDuiwHUi6pPpUBJrI8jlKHZ61Wn1avakq5Y
         syXI/33gY0uPb12SuAQF/Beu7WG3aUUkVFgpdJJJIgiDjAA2J4t4y8RuepBl4jGXUBY/
         FFNbtjzJG0QYl7I6Az9FjsxQ9VvzXm2XynpnM1x/GX9gsvd9ADPSdQ85NSRWXQefCDJ+
         HhKHjuMdiB3g0In4BzzZZeCgauNYkpsSzX6zK7TV47r+do3uxDrG3CoKOa7UjNircvbM
         Iim8bLeG1lIORaNMcxdfy5FXrk5UV1No6t+oJnvhIxl5YixyZtlVXQbL4ZRBU3bhI0Nm
         Iurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787030427; x=1787635227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=guhfkRusufvBWD8H2or6jNYjgUQNUVh/3Ni9l2mmIoM=;
        b=NNfmdaDyngw7pXE5O6js2iDxgx8zLuM26kzbFBBudHOHh2PfBOwe0yije1JdZXfxXT
         3ZwAyUYnK8YG3SUbwKxC6ZAa06hj9c6lbzBAEUqhbwlRKiVY9FwAIJJqnBxVuz0DYKy6
         Zrwb/wgYMf1wHY73f1eyVTi3Y8HjnNl+U/Dcdj6SmXKbiZH9ecyUfJzJX4OtFVkckByJ
         SkQgZleK8j/wD11QVkYAugHIDcR3LpFr0+mVAOKms+1+GHGXYC/DkzYmPYuZIS32Drxl
         RNC3Ql+9bRcH6MyNaNh9ra4HvwG315ef7pcYPa3ohg0RaNU+T5v+MF+FY/h+8N0MtRhH
         sY6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3da/cN3arARq7x95cbLSXVr+OlvLqadEBGZUatqoVX8mpDtlm+A7wi4BRG12R99NTwxFaOtYG31H0/irYIaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWmlxzG/Q3gyY9e2hgSVZNB/qz7Qd1GuhinIhi+FvBRQdYlQk
	tZpkyBEogAGxqNZh/ASRDpILkhKDVERDBEvMBSBO8rNZLEH1HlERk66Q
X-Gm-Gg: AR+sD13ABqkTG1k+BiIsIb237CvdDoQ0tvzwkNP4T0HOYlD1vaouVsTmkbYz+1YOwWa
	LYur4SNQi6mi3lm0OyNS0qhVHyCc9Gxl/2Xvhh58iX1/SaggW7ib2sXzjxbc6Sq+Gr9fptnszcy
	GEkVTsldJz7t7biutWDBqkCvOZvu2UX2u6rhNkhK6MHmAza4BUchBpM5TkZSm7KUeEvkPJxl2s2
	gukWFNjfUYOkO+zg3WR0C64fSmKWOUhv79CFEx539QqiGWlG+vG/8+1YaL4/JTG9tGQpkOf1obq
	rnNt0sq95VaAkB7gxobVBN0DQ/CLrWpYMT+X8O6C9sY8Ks7EhkeGrlOfhpUPRXpjiNCM9PcHoMD
	EpnK9EQzRHeOHlAZbUQRprMPnwAOfkRRLYacdWXn7CZ9eeY9fQNnv7BYfdMRd15kkpZ06Adzjfh
	d/avyr63M1eNwPflXQ1ssI5/umCZk+/9j827QkMOqLEcoe3d9VBAwfbtMWIuVZKas2+SpPkKuoJ
	w==
X-Received: by 2002:a05:6a00:4ac3:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84fde001affmr34125452b3a.13.1787030427076;
        Mon, 17 Aug 2026 22:20:27 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff0e3csm1046621b3a.60.2026.08.17.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:20:26 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Hagen Paul Pfeifer <hagen@jauu.net>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/secretmem: properly account locked pages
Date: Tue, 18 Aug 2026 14:20:06 +0900
Message-ID: <20260818052006.2387242-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814-secretmem-accounting-v1-1-d2f8c677980b@kernel.org>
References: <20260814-secretmem-accounting-v1-1-d2f8c677980b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the patch.

I tested this v1 on its stated base with an x86_64 KASAN kernel. The supplied
selftest passed 6/6 in three boots. Additional fork/unmap and inherited-VMA
mremap tests also passed.

One question: the inode stores the creator's user_struct, but the fault path
uses the current task's RLIMIT_MEMLOCK.

  secretmem_init_inode_priv():
    state->user = get_uid(current_user());
  __secretmem_account_pages():
    page_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;

With A limited to one page and B to four, A created the fd and passed it to B.
B faulted four pages, after which A got SIGBUS faulting one page on a new fd:

  CROSS_PRINCIPAL receiver_pages=4 creator_fresh_page=0

This seems to charge A's locked_vm using B's limit. Is that intended?

Thanks,
Daehyeon
