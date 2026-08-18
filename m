Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BD93D8903
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031515; cv=none; b=QXiz+7vVYgBelYW8eE6kN1f9x/5SasF8PWyhJJ+LDoIs110fROqjQ84QJt/ZYvCEvuLwifYodQhooMoH6rFY6Qlx4R2AyY9fcCtstJ2SziP1w1S6h3kWY15MEL+MH5SfWMoreCL9W6IcN/s38sStENUbvQNnguJkpljcNjRUbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031515; c=relaxed/simple;
	bh=lr+lR4+IO3r0vpe8umZ7mEEDDFGJCtdsk10I1pkYKWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOaWIZAMQu6tBGDnsTl4Yd9SWhH++I6ANDreSYMJteoRXS/uTFZb1Y/zyU3pzQmgfJLjNZKfs9kZmrzsb0G3HHBloHq6d3XImzowWVhgFn8g7or3AHJsg7hdG3d1buKgRWTxdfNraNlZLROeRR17qhAoke9uQ+NAIx4qhw3pFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Oq0/dXq5; arc=none smtp.client-ip=91.218.175.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Oq0/dXq5"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lr+lR4+IO3r0vpe8umZ7mEEDDFGJCtdsk10I1pkYKWU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787031506; v=1; x=1787636306;
 b=Oq0/dXq5AgM/vsloyI8PrDBDjTLahh5MYgId55iCf5LAoFcIpiAeoB7CSM9Omb4RMzWpdNPP
 W2EPS/9JcT7uu9yX0zCxHAElO1wrrPTypFuyjtyMN17r3TZU5SOJyEVIyarujyy2RAErqzSO2KD
 xnDvsIn3YQw/rRZAobtu+KlQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 591b174a047f5b98;
	Tue, 18 Aug 2026 05:38:26 +0000
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: hongfu.li@linux.dev
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lihongfu@kylinos.cn,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] selftests/mm: khugepaged: consolidate error exits via kselftest helpers
Date: Tue, 18 Aug 2026 13:38:16 +0800
Message-Id: <20260818053816.27502-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260817061955.45454-1-hongfu.li@linux.dev>
References: <20260817061955.45454-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Aug 17, 2026 at 02:19:55PM +0800, Hongfu Li wrote:
>From: Hongfu Li <lihongfu@kylinos.cn>
>
>Replace the perror()+exit(EXIT_FAILURE) pattern with
>ksft_exit_fail_perror() so failures are reported through the
>kselftest framework, consistent with the rest of the file.
>
>Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
