Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94BE48C8A4;
	Wed, 12 Aug 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786569934; cv=none; b=Pix8HFtQ56dyXM5Eht+8YtfaNq5WM+tClFNYscu8Oe29YcrsG2YF0XpY34VPzL8+U2E7YkEQKngkmFrtOw0vS0LXmqVD5KkwSnE3alBEkLcbEnP/oEuOUnld/u8lAPJ/XjlfvZJZEi55w8yq2V1Ekb1Eng0Z1jn1+v1z4rRVp44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786569934; c=relaxed/simple;
	bh=QzkeyXnpUkAIekTSXU/6r/6pi0UtWXF8YXD7+TEPbZ8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NmCguXzt4PC8hpt5I96SWy54/8VYya6DoZcp8/LEbL8EdSq8dlSbYXFMlg3AFdwMin8MlpokwICDF4qabnq8oBh/59RkXcfrwFcoek6SfrF+RvTjzejTeqxqPbFQNC512eWoAkUt11NMHhNI15rJJgilwuDswet4yB16L11PcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=x4k6GA1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="x4k6GA1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2B71F000E9;
	Wed, 12 Aug 2026 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786569921;
	bh=+QFKPbGB63N6oHGMzgsz0Fmo3Q/yItdGRNO9dtOYg4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=x4k6GA1YHz+S9QiqqEMzTHbRXXgdJx5Bt6HDsK0gpveVYaJxXE+/sSQR8LkkpbDRn
	 TbKeAggzxwPLiawYIV3TmIhF0LlpHwSFIMSwpfrqRvjICJdf4R5m+eAwzGwSyUIDWS
	 M1GT4ri0aybhLFXD4ztdj+AqBe+ZbFVatkyXtdXA=
Date: Wed, 12 Aug 2026 14:25:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: maarseveent@gmail.com
Cc: Thomas Maarseveen via B4 Relay
 <devnull+maarseveent.gmail.com@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, David Gow <david@davidgow.net>,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/tests: add KUnit tests for errseq
Message-Id: <20260812142520.0426855213d205cda1608c69@linux-foundation.org>
In-Reply-To: <20260812-errseq-kunit-v1-1-312be4c3aa0d@gmail.com>
References: <20260812-errseq-kunit-v1-1-312be4c3aa0d@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 20:55:33 +0200 Thomas Maarseveen via B4 Relay <devnull+maarseveent.gmail.com@kernel.org> wrote:

> The errseq_t infrastructure (lib/errseq.c) underpins writeback error
> reporting but has no regression tests. Its semantics are subtle enough
> to have needed fixing before: commit b4678df184b3 ("errseq: Always
> report a writeback error once") changed how unseen errors reach new
> samplers.
> 
> Add a KUnit suite covering the documented single-threaded semantics:

Thanks.  I'll set this aside for additional consideration after
7.3-rc1.

