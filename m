Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477172;
	b=a8OjVmW4vwoewmJOYbMwi7MI2d0P5c12nDpwHaPKWtVC8nr8XAa1EJVc6ul9oY3uOPi1
	 EPthsOCoV0lEF2iqFqKfcA6JRkN2sEO9CW0PLCV8O1pde5yFoh+qCgccJ+dKugKLpZEWi
	 nE2yyN4fxmE4nVStjoBUgRDquVcmXrkb1GKFehReYg2fYEFPUmYByCGmt+Jiqe5GAiBEE
	 oVtRJ8tUs2/uStt6r/+cu/1N5E5XXQbJDJaAn8XoeKZQhu0AG12MR465VIxtdyABdat5L
	 3fKzzNXeGj73XxasnVL3vU07gGAMeqSMQr6fSUP/IyqkledHCoBU2rwGDchxXPD0nKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
	b=U9Yf4Ihk2HPdY3vleURzqzqA6Ho3H1aHCzXffwoX8wXGmohGR6ITFJDC0bBtJGJkEyd2
	 Qd0XN8vzPuNbJDzM1YaWKMC/2t6kpf8WXSKxj9tMrXiVDw+oxSTQ3BhSOALrmIX8eYfW9
	 QWER0FNkYUbYk4Yu+iiAe7CCFHTxLewbxfx5E6ukHxTcVdp+ongs1Mjls3QFtXGRypz5b
	 O4vv4HzdKOgj9m32/iMT27JJqUb1VC/okG3mcQrAMPLmbhxQs131LAj75wsLg7PT1I+et
	 isQpE5g3LAxJEtQWQ6uec2LYigafLcbEwaCywWpBza04g2TKUOtjUG347bTni8fMIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nl5Sf5CJ;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480C606A334
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C480C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nl5Sf5CJ
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso4364203b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477171; x=1796081971; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
        b=Nl5Sf5CJkUm3W9+jcd7iU6B9Cs+k4BUqPo8Wy8+bdX5qmWn6w6hnUYpzOWkGkpqu03
         iy4AI3elPN7Q93LX2/SdhiXUpzt7B+LSiLuFL7xGN0OYIuws+2K5qAUvIi7xOe5i58YY
         1hOiYCX5Tb5ghmTPkQ1PGBTmHdM6SU60uxVtr45Ol7tonZ/g5eyts6S2qm/W+8I2mkyj
         9fxXTrijZyy6nRC9f3MnGormjsekuNctZe2jU5kXqr+MitAmFcIgnNS25ow0vbcwep08
         TnWtcpCuGa9PEYsywjWSoCbEstgQCoozUXC5P7WLRx5tRH1DYqc+1OCn+6UUvJzKAHcH
         PurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477171; x=1796081971;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
        b=uRcbGCQMcM3/ZhWjmrPYPsxMxNv2LyTj2y1cPWqyGusCFQ1qLfXrnGX15W6ke92UcN
         MeiFOvRWK/uBWbcgoESB08SAkhqm/agJiggJQRRyoVIl9FrrU0y0EIlu6hYE4c5mfdac
         1Oz7TMhFbjAYdT10bDAfWAXX0dD0Lrml6tDzIjEJNfyG++DW4n3ETleWLBAV4hDwv/2Y
         B9eP/8CHLdO8ks2PJLyXQxj7w8/d8cDjwFhUOsl6N1Ifgv0UIAkE42S6O+N0+cNRjKmP
         fNo8vUlIL8W+K7qSrNC+pXvI85ToPoecyHnmg8d+HbzsP9scWSwUAFfdSNiD79dGOr5E
         xdlg==
X-Forwarded-Encrypted: i=1; AL+hErHQirelPy9rxJCNMoJjIrcPV+dnfu1C+D5D/Hpu/J1eXAqRzpd9cL4D6FDAyFnaf9fF4VjBxE9/XqdnH1Mq4eY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XRrZr+moy+WyTwqwMbkP2xahBjOmJ/bd4YOpGs6Nxgjyce1bX
	PWziYcRnbENbqL29XmWc5Urgp5dFRfLKI01QjvrnlGaQoB5OAd3w25FUHbDjETHeSOikiiq9TSH
	g/d9bpg5WZ8mYLA==
X-Received: from iobdo25.prod.google.com ([2002:a05:6602:4619:b0:9ca:bcca:dd8b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6615:b0:573:1dfa:f0cf with SMTP id 5614622812f47-57a0a404865mr13656920b6e.51.1795477170400;
 Mon, 23 Nov 2026 15:39:30 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:06 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-2-dmatlack@google.com>
Subject: [PATCH v5 01/18] liveupdate: Remove the list of steps from
 luo_preserve_file()'s comment
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the numbered list of steps from the kernel-doc comment of
luo_preserve_file(), along with the sentence that introduces it, which
repeats the first sentence of the previous paragraph.

The list only restates what the code does, and goes stale whenever the
code changes.

Suggested-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 kernel/liveupdate/luo_file.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..a42b60356d52 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -214,18 +214,6 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * unpreserved or successfully finished in the next kernel, preventing the file
  * from being prematurely destroyed.
  *
- * This function orchestrates the first phase of preserving a file. It performs
- * the following steps:
- *
- * 1. Validates that the @token is not already in use within the file_set.
- * 2. Ensures the file_set's memory for files serialization is allocated
- *    (allocates if needed).
- * 3. Iterates through registered handlers, calling can_preserve() to find one
- *    compatible with the given @fd.
- * 4. Calls the handler's .preserve() operation, which saves the file's state
- *    and returns an opaque private data handle.
- * 5. Adds the new instance to the file_set's internal list.
- *
  * On success, LUO takes a reference to the 'struct file' and considers it
  * under its management until it is unpreserved or finished.
  *
-- 
2.56.1.809.ga0b61035b5-goog

