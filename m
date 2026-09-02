Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74730DD00;
	Wed,  2 Sep 2026 00:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309471; cv=none; b=cwb9N62B8KLhoMuD7KZyyOzOM5ICFtbMzpAz4F7yiPLZUmodCg/C4OmnoPBtWtS40epYG8ZcloGvZRTNcStoTJy++TAYxh6ktTTaaWZRgZbLwYYqhblDxxHKgUd8FMorv6xU8l6gJIO0SnTmyIZmFyPxlmY7jnOhqZxnupzmBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309471; c=relaxed/simple;
	bh=h8/jZq4w+TYJfGVWBUSf8g327jA4og7MhHc6eH8Cohk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gd1DRHrtb7AGKfZVF073vXFYdLtC5TRO1wJ5gX908W/+b6hIMpRuhXKLBgwgOI6SiRg7xhtNyAIwCIn34WkzeJCX81JtIMGAqKYn0BgsdribsNg6UbbTQmwdr6+HexK0su+1AApCTiOQbogCxQHiuHgczQNk6w8a7QrCstmUgNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D18Ag4xO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D18Ag4xO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71E21F000E9;
	Wed,  2 Sep 2026 00:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788309469;
	bh=0OjQTWFjr3g8QuMQZtzxOAtJbr0dNvjLCHbenCSbYbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D18Ag4xO/VPxhMwPPvaK5e//nY7ZnAzaHe2I3hrFc9rIGQdajCtf6uRxkUe0XPIvx
	 UpqTskh2B8T5+rHVvLvdUqMGAT/xmmDg2JyCLr+aGr9m6e2IDRZkZF5/+HbU7PHq7j
	 hcf6v9JEbt6hj4bEDH/OpGoB81Bq4NRJWwLYiO4E=
Date: Tue, 1 Sep 2026 17:37:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Mina Almasry
 <almasrymina@google.com>
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation
 scenarios
Message-Id: <20260901173748.fb7a442941102894a0c42baa@linux-foundation.org>
In-Reply-To: <20260714021630.1063823-1-husong@kylinos.cn>
References: <20260714021630.1063823-1-husong@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 10:16:30 +0800 Song Hu <husong@kylinos.cn> wrote:

> A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made
> the "more than reservation", "more than cgroup limit", and "multiple
> cgroups" scenarios unreachable, so they never ran.
> 
> Remove it so the first two run again.

OK.

> The third,
> run_multiple_cgroup_test(), is separately broken -- a backslash
> line-continuation breaks its local declarations and its hugetlb
> reservation accounting does not charge as expected -- and has never run
> in CI; skip it explicitly with a comment until fixed.

That's reasonable.  This code was added by Mina six years ago.  But
he's still around so let's bug him with a cc ;)

> Also correct two
> `[[ "$method" == 2"" ]]` typos (harmless empty-string concatenation)
> to plain `2`.

OK.



From: Song Hu <husong@kylinos.cn>
Subject: selftests/mm: restore hidden hugetlb reservation scenarios
Date: Tue, 14 Jul 2026 10:16:30 +0800

A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made the
"more than reservation", "more than cgroup limit", and "multiple cgroups"
scenarios unreachable, so they never ran.

Remove it so the first two run again.  The third,
run_multiple_cgroup_test(), is separately broken -- a backslash
line-continuation breaks its local declarations and its hugetlb
reservation accounting does not charge as expected -- and has never run in
CI; skip it explicitly with a comment until fixed.  Also correct two `[[
"$method" == 2"" ]]` typos (harmless empty-string concatenation) to plain
`2`.

Link: https://lore.kernel.org/20260714021630.1063823-1-husong@kylinos.cn
Signed-off-by: Song Hu <husong@kylinos.cn>
Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 tools/testing/selftests/mm/charge_reserved_hugetlb.sh |   14 +++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh~selftests-mm-restore-hidden-hugetlb-reservation-scenarios
+++ a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -439,11 +439,11 @@ for populate in "" "-o"; do
         fi
 
         # Skip populated shmem tests. Doesn't seem to be supported.
-        if [[ "$method" == 2"" ]] && [[ "$populate" == "-o" ]]; then
+        if [[ "$method" == 2 ]] && [[ "$populate" == "-o" ]]; then
           continue
         fi
 
-        if [[ "$method" == 2"" ]] && [[ "$reserve" == "-n" ]]; then
+        if [[ "$method" == 2 ]] && [[ "$reserve" == "-n" ]]; then
           continue
         fi
 
@@ -496,7 +496,6 @@ for populate in "" "-o"; do
         echo 'PASS'
 
         cleanup
-        continue
         echo
         echo
         echo
@@ -530,6 +529,15 @@ for populate in "" "-o"; do
 
         cleanup
 
+        # The "multiple cgroups" scenario (run_multiple_cgroup_test) is
+        # multiply broken and has never run in CI: a backslash
+        # line-continuation breaks its local declarations, it passes
+        # reservation sizes in bytes rather than pages (unlike
+        # run_test), and its assertions compare page counts to byte
+        # values. Skip it until properly rewritten; the two scenarios
+        # above are restored by this change.
+        continue
+
         echo
         echo
         echo
_

