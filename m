Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2A367B8C;
	Fri, 21 Aug 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321949; cv=none; b=blV85IZhGIoPk94eiv0XCooAIqmu/ncmWKrYZuu/f5nL/Xu+sU14s5Rdm8UC4tK4fLoiQCItn7PjRhAWmspoJ7mYqLqa2Qhx+OsL9s2qJNLPU2/4U0Yk/kLrx9ojFPrqqzCDu3etmwpM9X9IH85q41g1Ku32DGXjoQZLy5DyDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321949; c=relaxed/simple;
	bh=/VhH0uQ/d/H1hVdJWe1x68Rb6OkAXGMyk2U5DO1Bde0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ss1jmV7S3Cz0vpYowc+WElbGk23DcWaCasI1WnD3uWamfEv/VE/D5cVc843qQO9CuABziYzuYUclEMR2Lax5ZIcSmBaqKju0zb9T3DDTw4F4cJWwCaPeutLdZHerJMOuwqepky86yKxjtdwvAhtZjHURzAzfD/oz+X0VJ42Zbmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM5zUvTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM5zUvTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D591F00A3A;
	Fri, 21 Aug 2026 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787321948;
	bh=iZN3fQETOzM8QMZdeq9l1GD6dRqDhSLNC8Cp1Uflg2Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=bM5zUvTMQ3pKcq2915HpCteZs6V/p2vqc0s9U7Aso0hK8pYRkK78K4NxMLMy3Ztyl
	 Mips5Ir7vyKtHKB5wG+gg9xzuy4ii4PaAWK5g2vsJlrP1YRvwpK8q0S4qXzCK+gSDp
	 KYSG1vwjW8lf2xN4M4dCDx/lTxtP4eySUGV3LPzka+5TOMuVyC8koDFdHtK2k0BkW8
	 ELDGGhsV/fn26+u6B5dAh77ODPsWFneoMLd66qtcRElaPFgba4A4ctItIB7eu/MXzi
	 23PNUtG8PAz0uDFNfHfg2WsPckc5ZnOyM/KoGk6OkdRR1JBqxCX5fYGHB4HtUd3DbH
	 NBq8rUlabwKkg==
Message-ID: <7bb2d581-924e-4a59-9955-b8afa2b51268@kernel.org>
Date: Fri, 21 Aug 2026 16:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] selftests/mm: check strdup() and fix buf leak in
 parse_test_type()
To: Anshuman <anshumantewari123@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821114416.12255-1-anshumantewari123@gmail.com>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260821114416.12255-1-anshumantewari123@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 13:44, Anshuman wrote:
> The return value of strdup() is never checked before being passed to
> strsep() and strcmp(). If strdup() fails and returns NULL, strsep()
> returns NULL as well, and the subsequent strcmp(NULL, "all") is
> undefined behavior, likely causing a crash.

In practice this is extraordinarily unlikely to ever fail. :)

So I don't think we would ever experience this.

> 
> Additionally, buf is never freed. strsep() advances the buf pointer
> past the first token, so by the time buf would normally be freed,
> the original pointer returned by strdup() has already been
> overwritten and is no longer available.

Given that parse_test_type() is called only once, nobody cares.

> 
> Check strdup()'s return value and fail cleanly on allocation failure.
> Keep a separate pointer to the original allocation so it can be
> freed once buf is done being used, after all parsing has completed
> successfully.
> 
> Signed-off-by: Anshuman <anshumantewari123@gmail.com>
> ---

[...]
That's too much churn for something that is irrelevant in practice and
makes the code more complicated.

So the following is better I think:

From 36d525409eb16f56e667b2f979f2c6ef112ff235 Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 21 Aug 2026 15:57:57 +0200
Subject: [PATCH] selftests/mm: khugepaged: remove str_dup() usage

We don't check str_dup() return value and never free it. While both
things are irrelevant in practice, let's just work on argv[0] directly
and avoid the str_dup().

Nobody after us needs these parts of the argv[0] string.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c
b/tools/testing/selftests/mm/khugepaged.c
index d3a53673e1f9..7520fc0483ac 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1226,7 +1226,7 @@ static void parse_test_type(int argc, char **argv)
 		return;
 	}
 -	buf = strdup(argv[0]);
+	buf = argv[0];
 	token = strsep(&buf, ":");
  	if (!strcmp(token, "all")) {
-- 
2.43.0


-- 
Cheers,

David

