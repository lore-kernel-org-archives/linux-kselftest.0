Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605463;
	b=JmaQB+WPX9XNHsAO7hkTONEtLFqXnxE6NdyGHZ4wbLFAXcXbt68SbkNwlEG8lcsDvbHe
	 rSnu3MukCG/Rzg2tkDrGCNOau6AeG4rSWuiUpzm5YmFhur3TrZK+oE+ZlKfUeUaZzbCqF
	 +Z9WZ9rs8+ZRqMWmLVbNK3D77ScFELF6/Y5bDVdhd/ZYZOxdpBZEHUyqhvpiVpvxixXPD
	 d3PCVxZcycPcWYsPTMOrW4Djj/bUNCHRaiXYqcuhOsjCvbWxv/fIVe4y2t6OHPxUQcmOM
	 qK7nI6m5RSmYe4C7u0WiFezVcsXBN6FdObfZXNqFrkDFDjwm//Dyz1WP64rIyQF8xSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
	b=L7kVeUdUdKryAw/WcjklsBSc6gZwU2XF/8FMsjeuTxDjRoZ1BUJxad4M3FuE9t12HBWQ
	 MaroK/9kVOYlcA9PjxWoZJPonFbPSPKlexanSZDmGDw0m69xeRL9+d6eIhkNWU0J6refY
	 q7JYcS+OmafntKgto8CKTKyvl6CrkF0Ejm1nowQrOCiHl6iGccFx2qjgQe7jvzQ6kMsdW
	 54N4p2Ja2njM5+wiiDfweC34XRuMBWesrgHc7JgF3dmv2rcPGPjJ6sfcjkQKWpwD5yrIs
	 6gd7Sb577grDZswDhPRgCx5LT1ViX3GoWnpXymCnOYvPI97Vztw4bMw3YwPPcIj0Lyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFB606A33C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 07:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDFB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1477435f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605461; x=1794210261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=QeLZFuY6mIhG5rzjWO62mDesKo0jmIC+d12Httjn5kyoXafH5D2vvtFeUt40Vry7WS
         m34GzWAdpIRf8fdu4MqLLqQ4UBO5jbUVcSc5aj6KsNB/tK1vo4ffHQGnPr10MZoMPDiz
         IOmXiiPcmjbGg+rPF4qbqZvL3WqrdHND3PeC8ZQ8XVVIj2Qe8mFARNngJRFbpzkp4DIz
         i3oLbHSVB7/AMa2Q+kixbii2k1XlYcnonfs62EueJka30Y+0vJQsmM2lIUWGYYPWxTIS
         yUY0fqONZh76OqmB2NtlbMiAe+YAQqduPeD3+n5AdqAQb3wDt52BmrOHMkThaZg5S1ac
         uKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605461; x=1794210261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=pvtgBt3odahV5Rir/M1NsuyHEFqzvo6pA9thd+E7fobAC5vejJ/b5Tjx5xeSa/Vxl1
         XTBEjHdT7W+9uRIAGR6Vy9ec79Tu/Vmk1tXfOaHXSORLvn0fsAJN0tbwYpBaSDjaz3t0
         kQ/khP3sL5hg/mGd8zEOgsKHIFtrtS6taQwizDYPdMr/Sp3jnWlogZbqLkijGGmMuEQf
         LqZZ2m0m0Qj/Y02WjqeJ1kxfYTawl1u2n6w1IwxBHTFZDj1dnO0mO3UQyS7BIxz7fea6
         zQfOA/1eu6Ke3dVPA/VuoTBALz/VhiCB53TenHjmcqITmxHDE6yhT+SnP5AWwwFSQGOJ
         9ggA==
X-Forwarded-Encrypted: i=1; AKwUvBwr1SVutUXAr3ewAIegxKODPX/wYQOv659GvuWpE48/vyF71i5xqFLtC4r35p1/MN62JWt5ieQAl9gCW4IJbWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GtjSB1Ag3zxPXCBBkewkOthzrog3aM71Y0iAZZGnpMwUjABS+
	d9rKMey8JZOM668bJlWdkQFS4PZVjbVjrHYkJbgPrtiAX5q0WY6raI3Y
X-Gm-Gg: AYBFou1vM9d2Yy+Ex35SGuV8FoWPU5xMae1Uophrw12m+US8ObN7go7ugtDJN8XelHH
	gn/BN+BwDkDtArzAb3vQqnXQgiSXjPSnGN9UA3XzDbWsGbptx1u+r02HtxhlIQpWBENAsA4yPBB
	7xVf9PQPUIQWJdN+giykiyujGk+kEVE0fw7mxHlRv+fyBAOKqGtsj0Xbtvn8ER/9oiUMAhsDOsO
	NgwtjDuW/Jh+aazhykBW9sr1YZRstcY9P80PFTgogQif4Qv19NbiBYWLDA3Ah3Aewdm6RWfDf/u
	BSPTV29rXKklMX+QsTH5rxWcbnE7JUwUqmIuCZ+5tJQIHnC5yO6Hg5wDVGzY/K56tZZSAgc+FB3
	N/2zabsF/wRmQiJHRb6BxkKp9t7nP1qbY7rP1/+jR/g+4ApMOpXG6Q/wAFFw0jvstMyElCPk3/I
	3T8TlGmCQb+y+bmQMHm+nXDqRXs8MFEarcNdKdsOYyI4o6e+uMBEZA5PdfFSyisIcyHW62mX7jz
	aX+9esC+c2Gg1SitlVs4m4LxwIxkyuCg9h2V6DfwQ6ZdAHC7txwTDJdzbAqLvLcFGX9YA8lM9HJ
	Hb19P+OCLc6Zmg==
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr19528998f8f.1.1793605460880;
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 1/3] mm/mlock: make a zero length request a no-op whatever the alignment
Date: Mon,  2 Nov 2026 08:43:59 +0100
Message-ID: <20261102074412.189554-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

A zero length mlock() or munlock() at an unaligned address is rounded up
to a page, so mlock(addr + 5, 0) locks a page that was never asked for,
and munlock(addr + 5, 0) unlocks one the caller may still rely on.  An
aligned zero length is already a no-op.

Return early for a zero length, before the rounding and before
can_do_mlock().  This is a uapi change: with RLIMIT_MEMLOCK=0 and no
CAP_IPC_LOCK, mlock(addr, 0) returns 0 instead of -EPERM, which is what
munlock(addr, 0) already returns.  man 2 mlock does not say what a zero
length should do, and -EINVAL would break callers that pass one today and
get 0.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Link: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index 1c70a7829394..673a8433a0a9 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -612,6 +612,9 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 
 	start = untagged_addr(start);
 
+	if (!len)
+		return 0;
+
 	if (!can_do_mlock())
 		return -EPERM;
 
@@ -678,6 +681,9 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 
 	start = untagged_addr(start);
 
+	if (!len)
+		return 0;
+
 	len = PAGE_ALIGN(len + (offset_in_page(start)));
 	start &= PAGE_MASK;
 
-- 
2.56.0

