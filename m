Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C683BB57
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407295; cv=none; b=W8SsuK+psT7TNMIDHGuu82ELau90QEZIbWHbzP4bYic0KShArmM2KVUGOnnyD/XSDTftZcA4fj8l6wO3m0lbmziRaHD+1jnd9OG/Xbp06ErZM4rwASgShJ9TBUTYPZpyYNUs2wR9+J2mPkBMUYA3+E2WKulUuFBPe9DlFDkzxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407295; c=relaxed/simple;
	bh=afTOjIpKsXbSX2Mz3h184D00clNqY6BiL3/V60TY554=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5a4d+DsojDngsT7JssOIposbFAjsD85IRqdMtTRggQ21a0GxXbrdR9WvrYXDWS52JXvdTnw4ppNq1SEFCaGyNDZCDeoZlaANzawDPnUJzWh6AzGK1jitz4qReu+NKIYI0WItuCxXBH5awviQM53LByNpWjaB6V0Yw/TX7PzjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHx642cy; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHx642cy"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so780573b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790407293; x=1791012093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/ldK4ouh20PCbYhMUe4lvWnC4R67j5o9JpGKQtocEA=;
        b=QHx642cywSwvNhDM98bd35WBJ+UxTmB512DFuK3BbJc7HA/JREBPYk+00ja7klXINJ
         DxECgH5/ygbL16eC4sT6EJzbXO880HR1sz1CZBbRJ/wjRGUh7BCE24zPoJoDBm5g8mju
         vtdB7aaM5z0YJ3xKkAwbVwEpaqB4bxUnJ6aoHLDOMAP4+oqCEIbrNuBcz3h0J31+D/i9
         UwL2GPtK8GdbtyEnLxou7UwpelL39u2bxaHA2Wo3MB6y0Af/wbexUs3MV3FWpBLrCWB2
         Wx3Oz1zmCKxOwCBPbbUbgf573Qis6iSkXUKiBBVcFYjE+2facD41W7VXb734mRReoH+c
         6C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790407293; x=1791012093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/ldK4ouh20PCbYhMUe4lvWnC4R67j5o9JpGKQtocEA=;
        b=cqcYiYCLKwzOJP465ASrZqfE3wea1Ihgti/00PJCHlQk4JuQEgFYqnhRPi165dQ2tV
         AVtaG/KnYa4bXHbF/G5EhnhH2myiSIFWj3z+1oJsm/3JJQMiad12lES+82ylZDRvAcU1
         aDPHhhqiIUSTj6FPvsesuEicP/iRIOiD0jydplArDVskiAuglxixRBQeQZ+zRUDqvqQ2
         dz2AQ2Ow5cXagNc3uJsHKe/bvsJBxrpuyr5yotwPB8Tv6Ej1VeR8IlEB2Rdqr2l3zK4n
         8Q8pch3G4uksBmYXivD0IgE2bKpF61uAObnVghcbsNWGAFnYkN+OTU1FzchS10XcoDSS
         7qqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0nxdB2Fkmym0/Nkl+VyRR0GIh8ZTwa1oNtoPNm29tyX5JXR1DAPucQJRjRhVJaWjC6qL6Y5vnHn+WFENFy9w=@vger.kernel.org
X-Gm-Message-State: AFuF++m7xQwlGRYhdD0DpX8O4BW0t9t2AVW18CR8pwjhXBj8kexFnX6f
	nwu5zQluEaAIJKgl7h5qwZkvB8T8xJ6Xnc2eDh5UeAgKX4TQ4URbREk=
X-Gm-Gg: AYBFou2JA0bTWPNAqdE9iVTtU4PZ8Wyk1d6OYpYhASxS+3b7nUaSTT/9B5cwIxla8aM
	h4G9Ma505EV8hmwbZv5t8GIXkyCz6qqpmjJu48q5WySUumV2GludCo6aZnFS1ksEmiQZ6hhIoxm
	EZwQ/zhcavAMphr1uhTq96t/VujBt/vo+CWrs180atyu8YlciLKz10PFZxpxh4xzLkL7guuark0
	UYI2RQLqcG7ORCEwDXEQW/+jZGkha42qsn6o1W/81iGj0DO8HFf00BNnHRktaDPv2ksgSPasy2x
	zaTYDHYTbgo5F7r8WU+0/1PAZgLPSny1xJPEfMz9ZLRZ1ReZMe22hnXXU7dgrsYAP78ApveojlP
	3ks4Z8+Cv0lVpGdvmxYMIyoZUUw5LkxJvUS6vQ/GcChE1B7FyTwz1UgydgJxC27SJPShWZcNbSw
	CtMN3wRgah4IuSBm7Nsdz2mSlol9vZ+qk/8OMgPj2X6KgJkLgL4riT/4ON+n602Cbb0b4qRPMVu
	MoGgFRqoOfu6InZiwk8G7Gccw==
X-Received: by 2002:a05:6a00:7585:b0:87f:dcc3:62f with SMTP id d2e1a72fcca58-87fdcc35542mr3183334b3a.60.1790407292877;
        Sat, 26 Sep 2026 00:21:32 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea8894d7sm2002115b3a.26.2026.09.26.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:21:32 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap entry
Date: Sat, 26 Sep 2026 16:21:26 +0900
Message-ID: <20260926072126.2870142-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <226ec797-ff8c-4465-a682-21c684a25021@kernel.org>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com> <20260925042907.2330519-3-donggeunyoo.kernel@gmail.com> <226ec797-ff8c-4465-a682-21c684a25021@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 09:41:24 +0200, David Hildenbrand (Arm) wrote:
> Is this loop really required? I thought the page should just be unmapped from
> the page table. It might still be in the swapcache and under writeback, but
> that's irrelevant.

No, one call was enough in every run I did.  v3 calls it once and skips if
the page isn't swapped out.

> Do we also want to check wrp? I'd assume it suffers from the same problem (did
> not check carefully though)

Yes, it does.  v3 adds a move-swap-rwp case, which fails without patch 1
and passes with it.

Thanks,
Donggeun
