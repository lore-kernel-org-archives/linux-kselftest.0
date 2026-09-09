Received: from mail-qv2-f2.google.com (mail-qv2-f2.google.com [74.125.230.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9757C734
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965670; cv=pass; b=VDVvNJcP88vF1fuXa/qk3lALvhBa0IRRIhTJumAdn653orM1SJl/1rtJHkwBclcHtEbyAy3ToAylLRvil9wvagwcgyujT4ouxzUUq/G9GldEjVIm6BP6H4FncGYbPMsRtyEhHevlhtRp7cFJDtOU+Q0OVGsw0VM81XRNDNY/DmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965670; c=relaxed/simple;
	bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+O4g1f9jGpCFs7uVooqqsudbiFZCNLMlqKKvTKif9FTpunaWWcS862Mf1AY7pQziIZxJM8LnXfByRry1+lJ9jpex4tL6rU8TP2D5nIKiXgBv5+NQZakQ1ZQti9WY2I4WjS+a3swH5LLtaZ09XYjQ145DSKcRwWX25j0rKvPag8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppprXH5h; arc=pass smtp.client-ip=74.125.230.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppprXH5h"
Received: by mail-qv2-f2.google.com with SMTP id 6a1803df08f44-90cbfa89a42so39380576d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965668; cv=none;
        d=google.com; s=arc-20260327;
        b=lgoFlfocvyHGPRJ6CjKHOsM45SvHkRpp4s1u5a3nLIYAtohcy54eotWo2QXxAi08hr
         uBmQ3J4mU5WCUg9v42F9QQ0lV012Ax/5gqCkp5eR/sZdqn+XyPynMDX9cbuOJ9e+o9mo
         MdXepHF2yu+8PV/CMO/BWTnm8YXTHFYqtXVjllgGLU2Lt7yPLuQJwWblmFMt1JKrSxq0
         Gs2P2ARS3ZfgJOR/N4Qy8hOI4WYizzEp4XN2IJz6WgJmoWehlEflxIXigilyGEfMmKJb
         EiAUq1svBrBPwA64XyK0fQr3uasXLQvrJg/0fMe6j6GSseIzdVOr//AHdd/YtbBAwP+G
         aCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        fh=lQPcdPRdbS53yhUvug/bDKbDwAYTtYTXZtu6e9oC9m4=;
        b=XObZzpalsh2uOOQ+7nu5o0i5ph6Sl2AmIU42a9KEOHA9/EW70EZXBo4rUswUFt2PRZ
         0hDcYby3MM9522GMEcKUj/1+hNnpeYkIR6x8iVyGNLkjWy0zE0sUDPa5AacybVg7ZDVt
         z95a+yN6XqK1H7SasNi+V99jA0LHWjH3b3edrBZPl9Ivywi/0L+hj0bzIi/5Ej38gZtc
         guuAogOTuck559PVBZFnJab6fL56unRK1RWxJ8HEZUrJhZqfss1FxVr8Y602GtAk7sYV
         WoDkWV69vRPZc+OJRZ3E3vIQejh3N1piFUF7Y8Tt+h+1A1AXZwluOojamNxcuAtu8zIM
         UEtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965668; x=1789570468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        b=ppprXH5hfRqpNoZGQiKzysntKpnrNSb7w14BRw+QnOkLiwU6uRhsbF5P4pRUn2lMho
         G2/ZBsNMDBEB2W4LPPB87Vs7VJ8CPvVXa0Di2/RafxZCT38YA8Sz3ko59V6d13RF4T1v
         RTlP0pvENfzAZKvDBABSCFlq8tJ43nVlJAWwBSDgM8V2rKIpN9IPRkccDDJ/hXX15nAl
         NZ+ECg+p9tu14dC2AZxCB6auA5yuW1A7IFDQfE9/xh0xq08w6dejuiD8iEYsL+dvi1NM
         5HPVj43e6oaqiIubdN3vCqMhiNAFO0UqWQzaSFTS/9wuqA6AKcw0mvtjjWaI+rtGIplg
         4lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965668; x=1789570468;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        b=iDpUgXUPNbYUlSq49LmTZWzyEpzy0DnQdPT1+xuKXCTrbv8QBP4o9ZUs998TpHIExZ
         ahPm7EdVnbLeQRD5P3ICvsSF6297B2OntKMC+Z7LwJbonwZUmSMZaLJtfvDFFno3KAsq
         L98Dh0QyM9L/FIA3gR9Z7nrAFb+vHKqy0q7jLEE8t+tKBkOM8xr2ZQjWGChcszdcrOdB
         akCjjxLDdfyuHPNl0BEILBMQH1CJ/pA+lS/+lmP4rChzCKa91Q/uU2XOBsdh/qzIKXnz
         V1xe2Q1ZNNUUAHFPtbALJMi3Q4ImhPyKDtSkyxOTg8k6UV/DQAoJzmkwezi30gM5aFIM
         eweQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcJe04cgDRzCPKkB/scrn7GQEZXaR10tAnFnECgGmvJa05rwfB7j091oOCi/9sMkoSeilsOirZeieOUNuZqJE=@vger.kernel.org
X-Gm-Message-State: AFuF++lzkNyT9fGMLYGtYyk+Y79/UB7sUI00O1Rh3rIuXoZgyFZO07zI
	Rbwzx1ErOi8/SWtdlLTIG6VtzCBEkGpYWctN8ql77gqxdgvPKZXKJPptxL3Xr1fjXDHzHku+OVS
	g0Igl4a6UingQ/e7eI3g/guuYa2ldf+c=
X-Gm-Gg: AYBFou3wm0A5p3ThQPEIkbQuMTjRbFZMmdg/EzzscS78ssMWQ1SS+dPD2hQAtNQ9uKX
	GQyjiGU3OL/uNxmqHux2FqaIePzgmRYZCwy9ycBPOEU3pfYNkosS5W5yJW68WVYp1bg5e7uGiEi
	V4uaWsTmrXGm1bAiKG1UMk9p21OCF/XOgVnhqHFC0P7FRKS6LpEyA9LreAyuOty0NAICuoE5/WA
	4s6Dx0GmbxSKHc9RLH7szbsXyrfc/toGYD+qNfXUnM9Ehb2AQf3W4g7nlRyuVFZgH9rbX232ECQ
	LlN0Feng27Y4aZirJKRmfUVdnvWj7/MK1+L3U+0cm8nSBKOxUEnSSQ==
X-Received: by 2002:a05:6214:4e82:b0:90c:4422:84d1 with SMTP id
 6a1803df08f44-9103f043439mr445579496d6.30.1788965668174; Wed, 09 Sep 2026
 07:54:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:26 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:26 -0700
X-Gm-Features: AcwNN1UWv2D_GKiUaOtOtW1R2NBCj6J4Tg_MXEtj1RtMJ4y8_q8aYCl2gqilq0A
Message-ID: <CACGbirTZFsyQhOszpfiHhrd7Red-L_Z_=ke7DbRDe5SQfzi9Pw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

Following up on your review:
https://lore.kernel.org/r/d6ca7f47-39bb-43b4-92d6-63ccc148ebdd@kernel.org

> Who would set it at this point?
> Can't this just be
> VM_SELFTEST_ITEMS="default"

V3 makes that change: the default is initialized before getopts, and only
-t changes the selection. An explicit empty -t still fails validation.
Both patches use Assisted-by: LLM, and patch 2 carries your Acked-by.

I have resent v3 at the start of this new thread from my Gmail address
after delivery problems with my previous address. The patches are rebased
onto current mm-unstable without changes, and the focused parser and VM
selection tests passed again.

Thanks for the review and the ack.

Tianyi
