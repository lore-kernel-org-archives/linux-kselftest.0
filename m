Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447990;
	b=o03xkARnULqsOccsHaMNOC1wZQBkvKBaL/L2x3Lw+iSl2QOztqBdhK016Zmif2YU/DMj
	 ynSlGRGgigDY01UvpWOXqQsgYv+6IU6oALEf6NtKGzSSqWCzsn9jDkmJkJ7UxrHMqpmG9
	 GH3lFgXmTJAQ14v0nSfJo5pO4POQzD4XCF9wmtkSM7/kOKrn74M9TzMZKxHJXS4BQX01l
	 cEeMsYVTyfvhbtHLM3E5PazPxOimVWnmVb/cloJjoiXDiXtFEsgAz1A8l8n1dzUglk0KO
	 OraCTj/aMEKuPu78/uTUhXdO8areVWEWR97d2ywfuywjvK4xdICSn7Vzthb10giYyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
	b=lZ/sIQymbIcy7b1vMx9Zno/5vwTvNnKRKOzKfuJ84R49mgKvUDSF0xJQZ1f4O0zeH6Aj
	 EraWG06mxKmCUPztBK7LDOjbydp3pT/I9OLD1k5SoZ5pevEV8bgVRpBqhQHnmDXZ9xpIU
	 B4KK5UKk9CHxSLVJEUwKqtlIziyujfMfKn3qSdYLqvO+itrQkxS0Vy7Yy4TUvykuudJak
	 +hoZt1QcQOC69YBlpofYrBPKeTwTqHoudsNCEvwiDaMtH5s+RAJ2sOfwiF9PCrOlEl8UK
	 K4Y17jr1LIBee/kcfkkgK+pD0HWryQvnspcdFG3QLIDFuSIsUyLmvKG+oGoVoj11bew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=PDpaJYuZ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE42606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE42606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=PDpaJYuZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38699cf08dfso3307667eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795447989; x=1796052789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
        b=PDpaJYuZb+DORPk4kwRe6ZpuRcQHMCKRWIbtR2XvtYy7GdBAgIH2GezVfCd2rGjJ/m
         5rT5z5RSWLl+ftMa7vlJPFotH8mJMWu2CrcEm5RMDRWU8d2bkS+Z3C/phqgJUa9eWb2u
         vRZOgjAG6HY0Xg+nGeLndPrxNDTdJNzCO1jsRN/vPHvTTilRiRPPmku299ZIt+FF22Bd
         4abR9gbzYe4ZB04LCtHIb+foAkU33R8OGQJJIpvfjuM3CDKzXR0fSQh6EeOtL7Hd4L53
         VvQl9Ol7LHDS12NQB5k2i9m531Q4Z8bTahV/i+OEi1Rtd2o3zIiMS65VwcYGnbPMARGb
         juDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447989; x=1796052789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
        b=NlM8JxLrw7Jy81BQLJ1sYb8WaUrRaKqKxqBOWnWmBKW0M0YrTmhBkJrQgzCPCoeVQG
         4a/02uqfZ/FxiRBeg5IXshc5VUOgYaafx3aoiSHzHnmc0ZJLw6vMYiRGNK7OInJTKKLy
         L+EkbF9salQL2dCaWNkmSAwksOKfKlVVFF8mRjdhH92ZbZ7ou2QM5BT0GQhVPVZnRu9L
         qY0SBfOOqFENtWCBoPqFyZfPohG3WIqG1rqv9Saqj0W705WnCWzX5Mfa9OM6UwutOOit
         yYUL65zSHv3XfnQazc6GxQpz+duhnCHYOMg0cHS4fHZEyVEZUJs1myLPTThYhwJgjhQv
         8iAQ==
X-Forwarded-Encrypted: i=1; AL+hErEi4jRqqWmTE1L03OKwA2JcfMVcT1xX5drUDeKlk0tasuG2UKL287TPuj6t6kkPWBtAFIX4Gcuu2UVBJtBz4wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RNuhX/BdxkaqEnhn+p0BHEOWgYDS5fcozsL3nj4wkqb/lU1JM
	Zx19riFv2/7WFAyImU8wXgQmq7K2Tpe2Wby+7wa6JRcex5AlHqxQUCYZ8ZESVfmNXA==
X-Gm-Gg: AZFdTZf+V+0TaVUlsacCe1sLaRsnYAVXre8m1Ki2hpDAEIpTvcFm6zIFYBBXUpSZJ9F
	8WlZLkqL/63P860cGwgbuwf8OrhCGUR7rOI1RxThZQmUSqtfvl1ALrryooecoCIY5caUFrmPd+Y
	5cVBeGmLqmXp7y+h2DSRhYZnoNeTXYtGen3Cxz1u9NsZCX79Qr0gGSe7GlCTLeceKwdpurOhLgl
	TDQTiLuVen2a29ExLHmTqZjly+UgqzgmPdjENSC+liJsGrbPFtcNU0V4M3cEie0JscsXoTvCDGV
	XfHvduUZkZH8gkinXKQRzwDhknjP/z6ACvRW6ezSwwLQYCNxkuIETw2rAsJQ8bzbtR2V7Cl5EBc
	tfTsP/d0sVlRVywHri7cJvFpJdY/FtW3hw2gC12GQ/sBMEEmYTE8oUurFh5fgP1VLomUuoa4Lk0
	THhjSHLH/QNaeBGTdy55TdbhgLGYs4DtE7P3texv1hrcgWu2Rb7v3rL2LW3rUyNa4ZeVvW0LKsy
	h1jo4KaqtJwNikCmDfLOr6Gs8tcWr1b0saprEYCo3yAkIhTmEhIZ/SJotIMLrOR9x1THsMD2fQn
	b5cKqm9BgxDA7/y57P+6Yt3hU4uHbAMJ7cO7KNgBKg==
X-Received: by 2002:a05:693c:8947:20b0:386:9ef2:8e01 with SMTP id 5a478bee46e88-3869ef28fe2mr6486341eec.0.1795447989335;
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:3391:10c3:1717:1522])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34601237eec.16.2026.11.23.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] KVM: Disable preemption while pushing to the dirty ring
Date: Mon, 23 Nov 2026 08:32:37 -0700
Message-ID: <20261123153238.1036972-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123153238.1036972-1-smish149@asu.edu>
References: <20261123153238.1036972-1-smish149@asu.edu>
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

Disable preemption in kvm_dirty_ring_push() so that another push to the
same dirty ring cannot run in the middle of it.

kvm_dirty_ring_push() selects an entry with dirty_index, fills the entry,
and only then increments dirty_index, all with preemption enabled, e.g.
when vmx_flush_pml_buffer() pushes the logged GPAs on VM-Exit.  If the
vCPU task is preempted in that window, kvm_sched_out() calls
kvm_arch_vcpu_put() while kvm_running_vcpu still points at the vCPU, and
kvm_steal_time_set_preempted() or kvm_xen_runstate_set_preempted() marks
a page dirty, which pushes to the same ring.  That push fills the
selected entry and increments dirty_index, then the interrupted push
overwrites the entry and increments dirty_index again.  The entry after
it is never written, its flags stay zero, and the entries after that one
are dirty.

Userspace harvests the ring in order and stops at the first entry that
is not dirty, so it never harvests any later entry, and the GFN of the
overwritten push is lost.  A VMM that tracks dirty memory with the dirty
ring, e.g. for live migration or to restore a snapshot, then misses every
page that the vCPU dirties afterwards.

Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory tracking")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 virt/kvm/dirty_ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 572b854edf74..1ed8b8771c3e 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -221,6 +221,8 @@ void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 	struct kvm_dirty_ring *ring = &vcpu->dirty_ring;
 	struct kvm_dirty_gfn *entry;
 
+	guard(preempt)();
+
 	/* It should never get full */
 	WARN_ON_ONCE(kvm_dirty_ring_full(ring));
 
-- 
2.54.0

