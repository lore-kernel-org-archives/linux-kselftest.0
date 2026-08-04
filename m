Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2407329E5D
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841954; cv=none; b=lIAHbpXKd44RMS330F2NxD4swxNza+sUbVRFnNGzKJYTNMPtU+lo9amb6ulLgnOVtr34TmBZfPMVk1mOSI+OYPRC9qD2NYdQLCCenKy3RapRXIUrDGaJVZ+k+B3yg7KzRu6KLvVIFGV1YSpF8M8WGTgBdKT6xE8hgFBqdzqi9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841954; c=relaxed/simple;
	bh=NeJqP5JnpNbdpvBJGleWJbGFU6ewLq0/vwbPQDIm6WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sckml2Ir0ZjpkSjxb0vXNP1vbZQJUo984MFh8cfq6e7+gHZPTL6C5J2euT8zn1D0ibchpsJq+XliVev9v+G5OQFyzwSfydTaIRxV0/Omj6aR/3y6QHZrr3vEi+dUJJXolvUvHHgBryb3uTXtCUHnqtIxPLHqTDUbxZqFZ5ZFNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AdUJba4L; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AdUJba4L"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785841950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uiARcbRk6MclQK5E7+O3uI9pt+i74lOJpNKbmvLF88=;
	b=AdUJba4LXK2UBjpfnKdE2wAg7zw4Cq5VS2dRcP9zFCTD6c7mGt1Da3vGBsyCf6gH34vKHJ
	b94Tfp/sb5XesLIViduzEYuG2KKSY6G5rVg1dm2gWaF/obKemqTjM/q6T99v1wrQRFSsEd
	Em6+TNzR5etVmrtGOrC4WDQ2rArp3GM=
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org
Cc: hongfu.li@linux.dev,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/prctl: Fix non-anonymous VMA mapping in set-anon-vma-name test
Date: Tue,  4 Aug 2026 19:12:18 +0800
Message-ID: <20260804111218.82537-1-hongfu.li@linux.dev>
In-Reply-To: <20260803140924.31bf563743a73653f65e2258@linux-foundation.org>
References: <20260803140924.31bf563743a73653f65e2258@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> AI review found one glitch which I don't think we need to care about:
> 	https://sashiko.dev/#/patchset/20260803103046.14324-1-hongfu.li@linux.dev
> 
> and one possible pre-existing issue which is kinda related and which
> you may choose to address.  Please take a look and let us know?

Thanks for the review. I've carefully considered the AI review's findings.

The /dev/zero case raised by the AI reviewer may be addressed by commit
cc3b846182db ("mm/vma: make MAP_PRIVATE-mapped /dev/zero mappings truly
anonymous"), which makes these mappings truly anonymous (no vm_file, no
vm_ops). So the vma->vm_file checks in madvise.c should not wrongly
reject them.

That said, I agree that vma_is_anonymous(vma) better expresses the intent
than vma->vm_file in these sites. I'm happy to send a separate patch for
that if needed.

Best regards,
Hongfu
