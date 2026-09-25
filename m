Received: from mail-pz2-f14.google.com (mail-pz2-f14.google.com [74.125.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42A3B059D
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311063; cv=none; b=LLyfIDoc+74+Mzb02FEQ283UY7h3iujxLH2DCNti5oav33ZLacChq69FbHg13a8UGd/csx33b+PDI3TDIf8ByHtxfs9mCr8m312btbzPF1tRGYUjIOVzluUmFvlpYOIEBp9qjfVLoU3oOyM0BLoeZsLR8lE1FIOdM6AJUJoKL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311063; c=relaxed/simple;
	bh=0w14uU0L9w0RSlhqe4EwjyDn82UdTnD62jvdVeDf4M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKiTLTEfwQeaVLKqxRy8z8KSyvfdLuQofNkN76AM+ptpvCxNyy5SsFDKUbsDzfjzsyWF7aFSYaZPyUNcU+NIJF0gvjI3Slil+r1YBxiqj7lZ9bqEOCfvs6/hfRuywVElelmETHEUnLmA4lvPUTmsaPmqTESd3LrJaICp2Rbp9lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaeaI3mA; arc=none smtp.client-ip=74.125.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaeaI3mA"
Received: by mail-pz2-f14.google.com with SMTP id 41be03b00d2f7-cc78e1a94b8so42413a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311056; x=1790915856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+A2Ge7yyIYJgtfX/fpz/xgx25zdYkH52+JvJO6nACg=;
        b=kaeaI3mAZKymGZcxNam+2NKedngnmH0yPYv7fgSPOxsV8adI8oQb83XupdT7so2DjW
         U1z4qbamrGEIlEVthoURC6SfVua6SgSJmaw8BOPdnCUS5NTOA3YWkG5ulX7hF1KHKrTC
         lpF/bF+9uVkuhCHBYdfPrxI0oyz3A2oGbRK2zeCIee1bM7jrVohuZabWOEh28b0FmmkO
         GoLxckTWwY3s5rZO4jLNz6yWu3PcqWp2IegZAaeiQ5FbMDlHHBmdpuT/FZL+osNquioz
         xJatnqNf8BGEdQprTAbURZrlLap9cjM584+Tz0VFMqr5h7/HURLE8OYEu1oIpBmNT0pI
         u94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311056; x=1790915856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+A2Ge7yyIYJgtfX/fpz/xgx25zdYkH52+JvJO6nACg=;
        b=U9Bwk1FV2r7v8RplUCkYPj8T+AJUAXMloiyq7KAfhJuFKN9VMpYB+YYS7d44rG4HNS
         rdU3fU+Ik2FrzdYMwMgSumfwTjJKHtO3u2kXDw+u6neHo9j+noguyQUzREtNvZ+a/lA4
         PRyv+UvlL+6ykJ5xqRJWJCsQ5DLxnAxdwc0zzkYkBUix4uWoG9JjC0atlT41d1ib/1Ji
         0QEEUaSyQn07cMjQzbDM6In9MUgraZXUg883yDS7n17Rip4xHA6Rso/0y9giCvFVXlkh
         iTO+DsQc/QMneIuHBzC4uZkP2ZGVLbu0YQZGE5xCKhINVT/Vb06+KAgcbZCgqjlHaMS6
         LLzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy42YS7p569S4I/WzNRDspgianoHf1SjI/SwK8HxxDIFvLaxZ1ps+8X/HkaSnqeq8BFO11kEv4nbchp+b+K/pE=@vger.kernel.org
X-Gm-Message-State: AFuF++mSzdrlYrfqsR1KSbQLohCsTQ1UKMXSsfo3ts2h2VrgaR5eY1CS
	MTmEtdMYRglShheTY+6Qjll0JqsjBrVxdve7JitLbQPvnj2oKU3i4mw=
X-Gm-Gg: AYBFou0H+ZBV9d7ZvSpZOr2/f9RcHCYANVU5OcQDAqBSneG7sZZ7HJEbqY9sInU5dJs
	YEh4PdyaRtzk1xzFnuNLbmPsvIiGKbQsHhg/BHxSbBywH+vkjcNJ+1oAmKOD8MFFUXNkD6BQCIE
	lExTyQeaWGBKQ1KBogkYocZXhIy1K6hnCL33ZoxNtoAs7Xvj1d4ju3pr1XNHdAiTgPybJ8qs42X
	fHKB83ApEFGeIA77meb1h7dWg7HGqkm90AQgimYNo0sQnebVjeRVZWjdAJ+fLgAmxjgBVsCQVN1
	CxEzsPbAu89tPkrodCR7UOch92Nub/zUDYmfQgBdSvv+7Q30DD3FUkYJA1fi3zskouMc4wJVAEd
	MeMvsgIDIbO3Zcdh7BerNTWL9AxWdXfhhBhVx3rbxkISZmJxkjebu4FFtLC3jOLBXcoJYsMrkMf
	mRa65fVnWE+T7LWp8SE+54ArZqwTri14/RO2jzYtQCktUSQFkmJekx5lQWvfH/yNmaTpnLTKkhY
	2nE/OpVuNMgAEqOhhuAUkC+
X-Received: by 2002:a17:90b:3e82:b0:39e:6c68:c779 with SMTP id 98e67ed59e1d1-3a098e054bemr4230964a91.47.1790311056420;
        Thu, 24 Sep 2026 21:37:36 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9357f64sm2006727a91.3.2026.09.24.21.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:37:36 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Fri, 25 Sep 2026 13:37:29 +0900
Message-ID: <20260925043729.2362287-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arO0a3CU_idyVsqQ@thinkstation>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com> <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com> <arO0a3CU_idyVsqQ@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 12:18:30PM +0100, Kiryl Shutsemau wrote:
> Putting it in the 'else' is wrong. Clear uffd on the source
> unconditionally and re-arm based on the target VMA:
>
> 	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
> 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
> 	if (userfaultfd_rwp(dst_vma))
> 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
>
> That is what move_pages_huge_pmd() does with clear_uffd_wp_pmd() before
> its own re-arm, and it is the logically correct way to do this: the
> source's state is gone, the destination decides.

Done in v2:
https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/

Thanks,
Donggeun
