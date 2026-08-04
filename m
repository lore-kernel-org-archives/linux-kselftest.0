Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907654854F2
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875964; cv=none; b=tbq4VpoNffyDI98NdagxoB3i9J0t60tKFjUWwqpP8nHycKVEfcetsRehqft5xvTtdAXOHPUGc5U/jfPAR+Tds83E9TnUpN0RMroxgKd+nMy5EMdLer105J0eL6ljr2T7JjqN2612jnive9jrW2T4QCuF4FvxdVSHMv13mNIU7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875964; c=relaxed/simple;
	bh=SyznV1hlVYfFGw/6Rrfr6rsvHZqqEgRDzn28fQHI2Wo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LAHZibgtY+yTfIJ9E8PxivpI8mYFuyoZ5gvbQCz5qKBVUzaDLUt6ZN3vlovPd7KA7bKv5lcPxHY+UUSLPoOc7jSz0LyeEJAF227mMfILLtQ49giz2dQfwu3W2a74mXuOza2go+iuWXac1o/lh6kvcnyE0xqvlM8FiZfITMdNXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=euCW8157; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="euCW8157"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785875960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDbKl5sN3zXJvqM7Ow15pU9blcxmowwVHWM0164VX7w=;
	b=euCW8157Phlxbjq2kMmBkksO1LKLxex4ud9vsGDKP5AMZjD/yvtDuIZjOhZQuwikKVgDSE
	Kj/QEJROAFmwWB0KqQG37PhwwsEvObd09rGtPQWHcnPdWufFeezHL1Qo2JQhhjeroKfkUM
	/PmqbxCKZKAgPW3c3dsuRuSiOeS27aw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/4] selftests: mm: move
 gather_after_split_folio_orders() into vm_util.c file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cb0697506337320d438bce15cdd3c4caccb914a1.1785564857.git.baolin.wang@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <cb0697506337320d438bce15cdd3c4caccb914a1.1785564857.git.baolin.wang@linux.alibaba.com>
Date: Tue, 04 Aug 2026 14:38:43 -0600
Message-Id: <178587592371.79283.4345132864382617741.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

> Move gather_after_split_folio_orders() to vm_util.c as a helper function
> in preparation for implementing checks for mTHP collapse. While we are
> at it, rename this function to indicate that it is not only used for
> large folio splits.
> 
> No functional changes.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM!

Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

-- 
Nico Pache (Red Hat) <nico.pache@linux.dev>
