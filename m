Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D8D346E44;
	Sat, 15 Aug 2026 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759153; cv=none; b=FEMA7UNTDzKy4WzZI5h/mCAwsHnERWw/m7TFwbCjao1iRLwOFijBmz0Q+pzsgHH+GdyFQtggatVRle/W5085S6pjv6F6ftbm5JwcsPR82+rprtvPlu37/iRw4r2MVkMoPQkHhPiSgvOf+1acmJlYQk4emwYcY7l09R41JHGixPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759153; c=relaxed/simple;
	bh=OXxNY3EuFFVkH6euR5PM0ctHXZ1HbJ+ey54oO6xSKng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0LCgqQcqE4IVdO2if+iNQtP8kgd4BzEbb+peH9ssvIZ3MMO9XK+lq97z4E+vdCxlNVakaQjfWejg+uBJ8vlyDm6hRBX7Od8BH8wvyfCjlqzMXviZNTrYuVtWtWbcWxvOrt6ZCbEzEKHReA2a+0y60JyJrlgerCIdN5QLyZOYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JLIYuLmt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N6vI9+9M; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JLIYuLmt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N6vI9+9M"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 53490EC021C;
	Fri, 14 Aug 2026 21:59:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 14 Aug 2026 21:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759151; x=
	1786845551; bh=l0UVYTdnMDN95QCW3MAbNL5JjNdjlhisIs8DxT1bDN8=; b=J
	LIYuLmtVX/3gOR7fmDqT1M0k1GthK/F/Fix3+ncbRus2ugay0vTmnRW+rCbwkraB
	pU/Ah7OCaoIqpbdMIIwH7zkh1h5RwG6hB9LIr/pv5HQXPEqEB9ueL0lcGiawuvQk
	l6zW15OxEHGdhdlu0H4VyJS6F0LsD0P25e07OkZA+x1yUqODzzkshRYPfwjnaqod
	RO601aJg8/a73W+vmpeZIYVBJ73op1mO3QyK2tPwDBzudBCsdKDtJ110Jo4ikna6
	T5j5eI52U8Dtupe9XMgZT5U2YXaD5+VYGk2xeyPhoMKwQhfLN6em4nQPGdPYCvVE
	Pv6G9gDVlfmuSd1ADICrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759151; x=1786845551; bh=l
	0UVYTdnMDN95QCW3MAbNL5JjNdjlhisIs8DxT1bDN8=; b=N6vI9+9MbYO6PRqKI
	5txNJZ4S7SFvk39vJFz2bBzr3S50NXDCtnaHHVyIQhrYH0tDeVvucUwpTjl6YCbp
	1LuvLhwMK4OePf053V0E03QMD5z6wqu5PXa9Ji40p3UUc2425Z56uqdnywIpYhE8
	Exv3W3wn2PdC9Rfh64ZgF5/ja8KF5zsAr7DtG8p3SfcIHvaC9//5OGhHitpDbPnK
	4gHecnzKYNCvN6UwdlKU7MVoi/6a7BS6ai0k5WVp33VZt99N85q9L4v9xw/ms1P4
	s/uFfUIxBnI4KRGsNAqYlO8HKrzT0C0gQayv4Jnp2vTrOyeIzrZBEV12bVYw3GSA
	jUCDQ==
X-ME-Sender: <xms:78d_ap-kxa62hpd5hQm1cXlXMe056Xn-eLHfFLzBUm1n4yMyh3LhYg>
    <xme:78d_aho5zG4k8DZEC48Rc8wqcpRJe99b2E08C2j-0HvCXUyrBAtKX13Bo83wFt7Ub
    T7oBlhrbihxHaBngwywPZf_IIPY1Opsywvjx5yPl2WmGodXuuISeQ>
X-ME-Received: <xmr:78d_avjr9iA-Trqt4RefBYy83Xev-ITyvfzqUAFy0Ke_u4XBpiriyppvUY4>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1UAV
    t1ky7+JLBWzuoA0+1UuhthaJDKx/AJ5gC5tRaHE4ASCIDqAo/+HMX4IhequuAa5CReNL6l
    FT6eWS0bgjZ/1y3XwbN5wvPtBBvj9u4Dat0nWRZ+88AiEQvZ0/CGMji3azaLAD5AkwGcsE
    PTycNDqzNLkIUshyvcVXUQlB9T4rQcf6mNQ5fDbD078evTC0lHYGW2tTZzGYM/PJK6M5yT
    68VA2q4x0WRNvSONYwIxcRfoeCilJAQT4wbLtdhaTwUZ9/c7I6vSuCLJwFvgcUaSuy6EMa
    15VpSFvVzkjxYHqqIP+jKjpfyh5Ltfrd2M2n3X7quhkTKwbGW+8liDZabGpg
X-ME-Proxy: <xmx:78d_anBZn-tvLZ2ohygm3dQYh9ERk0j9mEWOq886CbhilYUbNc2JPQ>
    <xmx:78d_alsHPN-EhtQ5EiCGG5fy7qLmq-xuaDT4_5MWKMVFC8VO89nqRQ>
    <xmx:78d_ap71V6ykKg7FNSXPNcW6lPLiPO5SsHqUTkO12PKa0AnVjg9N4Q>
    <xmx:78d_aneuuCn90vj2HALWKpitt6sygsditTpB7BkQotk7PrP6roEbSQ>
    <xmx:78d_auecmpPdqteajCjaytn1mX_HON41OK3eypo2zW4uZD9t8RxXfdde>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:10 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v4 02/19] selftests/mm: skip collapse_compound_extreme() where the PMD is too large
Date: Sat, 15 Aug 2026 02:58:44 +0100
Message-ID: <20260815015901.1236937-3-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
64K base pages -- makes each of those an order-13 allocation, which the
allocator cannot reliably hand out even once, let alone 8192 times.

The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
whole binary stops and every case after it is lost.

Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
still cover PMD-order collapse on those configurations, and 4K and 16K
PMDs are unaffected.

Assisted-by: Claude-Code:claude-opus-5
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 6cfec2b940ac..dd924edd8557 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -940,6 +940,16 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	void *p;
 	int i;
 
+	/*
+	 * The test needs hpage_pmd_nr PMD-order allocations, which is likely to
+	 * fail for large PMD sizes.  Skip if the PMD size is over 32M.
+	 */
+	if (hpage_pmd_size > (32UL << 20)) {
+		ksft_test_result_skip("%s: PMD too large for fault-time THP construction\n",
+				      __func__);
+		return;
+	}
+
 	p = ops->setup_area(1);
 	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pages\n");
 	for (i = 0; i < hpage_pmd_nr; i++) {
-- 
2.54.0

