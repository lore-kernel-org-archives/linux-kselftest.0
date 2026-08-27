Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399883783CC
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793285; cv=none; b=DTdPUGmJaAkTDSNvRjMsvmvOqVKGSw3L5wJ6RpAilVsDoDpKSGEtlArw8gYc70RMUg33bIHvChJFw0B9CWlSnUk9oZSjLoEYwwoezJxYXSsur3kOmvfmull6nzXQPuwCRt/YZ/2f91A3y+2RqwHnnODX6iO8aqXo9qw3QjfnfJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793285; c=relaxed/simple;
	bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5b2GimV9FsHoGcB/dEKtdpBxHDg7ALHahMcg19VbauvtPqC53ELCFBHYL1luYoCVJp/beDaVWwFAiAYp2/cbBTK6LYvZbD7O/3vSodvVAuVgp9A9rSWbvyJD+rZZz/wL5nMXJzMk8aMkujuLcz7Is2wB81azkC0p87EwgZ0laU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3AgovGt; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3AgovGt"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1184340a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 18:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787793283; x=1788398083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
        b=N3AgovGtE9a0FM6k1D9Z0Mqy5BbLhs7cDn9YJaPp/kCN9grQdyxmRfBPsYHnxUSMEw
         LmKE62+YO0t4Nl1MPDeFUVWXF0W2K7frcGLGQqij9ELdNmkpTpD+KdCnjgBFJkmRx6L+
         I93lOezFDNFa8TEHtfJ95tLFCom9TPZoXCbBDvvCHtGf/Et0o7hJbXSILwLWmjHgUwKy
         RXGFj74ahisT41Vr0iehUg1Fslrw9Hd5f9CZjb0cdkasbPOKvWs0TpYPdvPG/ycKiMRg
         SMJj2a+FLtvjUwBCXeiNe6d8gJCihOrr0tBlCSe/bZhks9GAvTdekaqNok8MtQmfrCTG
         ctCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787793283; x=1788398083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
        b=mMGxbq0Lvbh7T/ygP5/Fyp5MeVDzr4zZ5fBqgG/tfscapA6YqwzhxQVVrpGDcVdZzo
         0mtFRNZE7s9dTIJdeFUabR2mQQggVNIfdKWs5G4n7N9VCTVvwJTl2d9DoW2xVTcMPwR1
         c1HGdrVvxdwvdJ5ju1tKfSFaBXgiaP8K9Tw90rNnOQVM53nPxEqwAXZiwml4DVjs70tf
         wPV5a/FThJm/KGTTDPtLhi/WoTv8e9CCFGIobaQODLPbS12bDoujjCXDvj8+uKyaENT6
         KyXof0CCzz8Zv9LShkSHFeL0jT829JVh2tmJ+O9/QFQWcyHDx6KD02PGkbp4bnMcSztf
         TZQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6N9nXBI/tjii9JgrAc9gbOGmxMQASOE1K1sYikJzCNEhf7VOdodL++FIWMhKMLfo8Gtv7YuVmqXzuowpMFlM=@vger.kernel.org
X-Gm-Message-State: AFuF++mq+gU7W0+vJByYqqbDNKlIYrRQtq4sYBBlDeqmzEaa9z2ntWX5
	y1fr5UnNJGW6yOgwlFFmpsZzKpYNip16C0KcYhmPHMy3kNeXQBzcsfBD
X-Gm-Gg: AR+sD10rtMgD0j8pvvwrBEg3/twzBoF7XOF1/Us3Dot9Tk8Zrj4xwzfYE7ukDV8m+QH
	zfzqQAv1H1PBbKnwJxeYmlCdPud8BHtmakvkzp0jys9f6ZUxOozxaNynaOTvEy8I2oKZreI/WzE
	ydJTcRCahIINZ1imVa4jC6uMgEAVxVW7V6C/0CccXzDkdrVR5zkVhfEz5LhwCr09/F5IKarNGlt
	MfTsGxfzyqLYw2+QsOochz2jnqUh3Ane7+i6lc/fQ+m170thhZR6u95KLEBYhvyeNBbSC9030B+
	3+fWefNJ8scOMB7bvRgC66TVuuGLIx1tfWTOCBoB5B0d2x5kwFy7nSPNP6lNUNgdhbmMqinjTQY
	eQf9AS6eCr5/5xNcfXzw6+MiBoW3uJXHJk/yybcnRFQZr2YmAqBPXB7lHTyRdg5x/BqFjDqCiU8
	1RcwQGCgiJ+2lKsS8Bar5o9ndmYEfqNex27w/VoN+jo5D8SGAfvA7ChnaidO5bhkYAyQ/30PNs
X-Received: by 2002:a17:90a:e70f:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3966d4587b7mr23563979a91.12.1787793283407;
        Wed, 26 Aug 2026 18:14:43 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm461051a91.8.2026.08.26.18.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:14:42 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hagen Paul Pfeifer <hagen@jauu.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mm/secretmem: properly account locked pages
Date: Thu, 27 Aug 2026 10:14:29 +0900
Message-ID: <20260827011429.1516473-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826-secretmem-accounting-v3-1-94cb04399510@kernel.org>
References: <20260826-secretmem-accounting-v3-1-94cb04399510@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

I tested the exact v3 from this Message-ID on its stated base with an x86_64
KASAN kernel. The supplied selftest passed 5/5 in three boots. My independent
accounting-boundary and capability/delegation suites also passed in three
boots each, with no patch-attributable KASAN report, warning, Oops, or panic.

The independent suites retain the mlock-limit and fd-delegation coverage
removed from the supplied selftest in v3. This tag applies to the v3 fix; I
will treat the planned separate upstream selftest patch independently.

Tested-by: Daehyeon Ko <4ncienth@gmail.com>

Thanks,
Daehyeon
