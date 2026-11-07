Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070641;
	b=twt1Ll0JSssE6KgcVaLNf1412ZEIF6m8lVvTD0VVeSCl7tKd7ldTbbBcwkj/FLape7np
	 lYmL3Ebg/PJwTOFW/ALBxpeNPRnN1gmSUs7n7Bcfdq35jQHIPpDpp2jt4NjXzsPr+wI6c
	 4Ov06fng7yZ/t6ApgxseDk+qemt4jJb25StM6rBP0i39B9M03efmFE40EnE048ws/EM2Y
	 +CueJG6l8Mwr66npilEzuvmgn8Hfvb/AH9QQ7ZYXKQAFphqBvZo6rayNW1UtYv3SS8ivQ
	 Ii36IgSgUVWq8Yet41i7QTnWh8TLQoUsve+mnq8sW4c6HiDk1qVXdcbUV8SWcE0WyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
	b=wNKm8zCXaPFBX0FtLgEM/NhhQr83kFQ9mpcVVq49v23U5Wv8nokcWaPfPAIXwEPb/RHY
	 ZTDm1G73AmwFAl7ctvL6OS8hLYIuOd/2/aTy9k7bFne+LNg10O67X0uavp26yFI3HcF+8
	 ovI6ApUqLuZAWFy2BuRIFywTfrOM/1839QYR5cye+VL2WUiXuTUj5EtFRaM6x7ppuYYu2
	 WopbuD2y06aytlc/pXIFl8ERq0F//UqvDs0cAei+8smYTLdhJPcNGpal7Rxb7+mm/x8Y5
	 dPsduF9iIRJSUZzHWeeHJLzD9Kk9S3Nxcr5kePT+uAymor+E9PZcW/30RXjISGymCFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FD5606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FD5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso487015c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070640; x=1794675440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=FVbx9nZ2ZQU/Elz+giW71b2m0Bac3qeomfVqTX0WiyIt4mAJdLaKsWVhSGk2pUiUpy
         cpzvDvXBUBsmrsfeQuJ+D7gsbcQK8ztdetkr06L53bMUL4YkCCkC0Z70DqQY5tK83ehs
         x8kQS562yWqhZ7zMv3AQYRkKC3IzyAYzzljvPmJmA6RIE/f5lzFm/puQvZDX5KFVzcC7
         QYH2kyHHjXJGksKwIjGlUtHpmAdZne9UdiaTWs7xx5MOwQboahwUbuG9lskgNAVngZUP
         YpnCQej80VTWKfth5/o8/BUtIDUJmsylsOtEDA3GTYHp15Tion5NtJt6Gr3KLf3pppci
         PC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070640; x=1794675440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=e+2rK73lmJeyKJnmD/332sdMUhTV/EtkRJyRjvYOl0j9cdKU8HIJLZz4KXiHhmFy4M
         SuNMMh75gBjbcg5pYi0nY9/TaAJJTJCCpALu7PKeiqpPtS8jSEDOr6ZlkufDdJfyWHiC
         NtVrMvRICAjNK80EZLkpGw2VWrQsrG5Dcswoi1ITt1LcDmVerXCvjSQDUYgKDEiImi6B
         WRQTRUoV7f/ssHjsdQRUw/L02x0l+39hh4BbLyrBuwbrGTGsUiKpa5O81e85ZeflO3mN
         yu56CvBdStdMiLhQNUpojfxxE8isLejXGbWPPx3XWK/PTjwo9Dl9Yw9bHLoATpEg/eBQ
         ftbw==
X-Forwarded-Encrypted: i=1; AKwUvBxDlbtFqryEOQ0BX2w0kDTErq/i2iZx7NarzZ6J5Z5dpnoKQY4+yOmalN+Cbo8Y90rAR7O02dPqa5zjCEiAaok=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGRe6GK/UE+LXBYP6suf4H4pPrpkjcxXpBaMb2AwcTinlsGj4
	z0VWqi82WQAxCJ/Z5gEvdDgja0N1rNjV6J+6Qvi+k2WO51cSw8gdUj0L
X-Gm-Gg: AYBFou3uQKmUwVyBYP6AdQs2jxDtzYZqFyaPX3WpIadKkMXZcgz9kGq0lUVtrGCnLds
	fck2/ZaZ1JM+qEfEFjJKUUJwXRbw0doPpVmY137CSd/nhrkaUM0iEI9rIgaz7/Qrr1WuLVBr/7N
	u3nRO/ZdrqIPRnrpUmdxd/TTVMEmlmSmxZLh4r9aHygMkTVlFdCrDVtBVBlmKl/jjcx01m3xsr5
	KUVamfpV+91vtySp5P9+7gLbEge2oosrluozDHNrqGSvGhyYRcGMlZ4KisJZ5K88ukkr105zI0L
	Rbczqs1Pv5OWG29CAuRYeBHlpeWZVdXSSqVo8+MLAKtxF3QkUzZWxhD5/plPICa65BC7YU7J0Nu
	p+6zb/T4tc2lvQ8NaPiPcPhf9PJJpjM4GIGxwKlojcBzwUwNGJWWnaCE94k/Md6PcXH/uWOPgu9
	10juHY/vd+ZPp9qVmJCiJy7joU1/tyYgc4NBwzvd3uby759WdE9mG865XqYW0WqHkLEURM0ZFU7
	Oa1Jy1TNDwBdyMN5snbK9uQDBRzzNSWY62FAutTsJKK8EPZa7Xjzim0adBnxFKK1wPP/G2+dQQA
	PyW0kVL8FNdvx6CAFfeuNn5h
X-Received: by 2002:a05:7022:5e09:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b25d36f9dfmr7314191c88.40.1794070639786;
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:01 -0500
Subject: [PATCH v3 2/4] docs/mm: ksm: describe how smart scan picks the
 scans to skip
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-2-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
pages KSM has failed to merge before.

Neither says how often an unmerged page is looked at, or that the scans
are picked by the global scan number so that identical pages of
different ages still meet in some scan, which merging through the
unstable tree depends on.

Add a section on smart scan that describes both.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 Documentation/mm/ksm.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 5a80573162def..f954d221e8017 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
 The frequency of such scans is defined by
 ``stable_node_chains_prune_millisecs`` sysfs tunable.
 
+Smart scan
+----------
+With ``smart_scan`` enabled, ksmd skips pages that it has already tried
+to merge without success. The ``age`` of a page's ksm_rmap_item counts
+the scans that went by while the page stayed unmerged. A page younger
+than three scans is looked at on every scan; after that it is looked at
+every second scan up to an age of five, every fourth scan up to an age
+of eight, and every eighth scan from then on.
+
+The scans that look at a page are picked by the global scan number
+``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
+on every scan, so two identical pages can only be merged in a scan that
+looks at both. As the periods are powers of two, every page is looked
+at on each scan whose number is a multiple of eight, so two identical
+pages meet at least every eighth scan whatever their ages.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c

-- 
2.43.0

