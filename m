Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9026E173
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483782; cv=none; b=oGzKu8lyerRzTZj8rIeFFshRnYURpHIXlJCk4N/iSmnyWfd3+xdW6YkY3bw13TyWuC2+aO07tP52xZjq5IYQGRWN7q7XBl8yKCH933fwKlQr6Sf8fnVGKz5AOMPbkzkE3/vUTWNzjGpQHw59KyHHafm3j2HEGtB0KHco/gfX0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483782; c=relaxed/simple;
	bh=hLmOJpxvk4ryAkBCtrVBgXsL8rxo5fZK8cu+U/4yX/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rx6P4FRh4IzukyVJs1KtNppxkQxb13oeSHL8EnYhZLWw7xCOObMzSO4SaFb0ptkX/m54kTjRxTN++2WK0ukTrPSR5Lc2ia1NvyuYtGFjAB+OxAWAD7rJLOFTaL0PgXRYzEKwLpUZK/g3hs1oxcigl4x4WDudakgBw23DsnyU+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FQMq0X5x; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FQMq0X5x"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778483777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLmOJpxvk4ryAkBCtrVBgXsL8rxo5fZK8cu+U/4yX/4=;
	b=FQMq0X5xrfT80StzUjWtt0oClo+roZ7fhAIf+kT1X6hiMVe0Itow+9sXHbjtdKiWaeH01r
	uXKHYSxyMMppsI1AZjmZBejBtgQNhQCmXhsq/Hd5/sBt8//5UgigK+CAFXVgtEIV1wzr+o
	NS+rfAII62UAXUC5MNO6xXBkwOzHHo8=
From: Lance Yang <lance.yang@linux.dev>
To: ziy@nvidia.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	willy@infradead.org,
	songliubraving@fb.com,
	clm@fb.com,
	dsterba@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 04/14] mm/khugepaged: remove READ_ONLY_THP_FOR_FS check in hugepage_enabled()
Date: Mon, 11 May 2026 15:15:48 +0800
Message-Id: <20260511071548.13941-1-lance.yang@linux.dev>
In-Reply-To: <20260429152924.727124-5-ziy@nvidia.com>
References: <20260429152924.727124-5-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Apr 29, 2026 at 11:29:14AM -0400, Zi Yan wrote:
>Remove the READ_ONLY_THP_FOR_FS gate and khugepaged for file-backed
>pmd-sized hugepages are enabled by the global transparent hugepage control.
>khugepaged can still be enabled by per-size control for anon and shmem when
>the global control is off.
>
>Add shmem_hpage_pmd_enabled() stub for !CONFIG_SHMEM to remove
>IS_ENABLED(SHMEM) in hugepage_enabled().
>
>Clean up hugepage_enabled() by moving anon code to anon_hpage_enabled().
>
>Signed-off-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>---

LGTM. Somehow missed this one earlier :P
Reviewed-by: Lance Yang <lance.yang@linux.dev>
