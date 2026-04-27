Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FA3D646C;
	Mon, 27 Apr 2026 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309102; cv=none; b=ss1cPzYK2RCw6iFKTpAnJZobmOC+j13CJEqnmZtvKRRuCWNyBMXlZmLPww9yfNbn24vpKm9gpDSFI/5Krhd9/GUKacKmjY+b9suL94J+cAhU2NpZ4Qt4p1a+TA8Lx7vCItYuPQJiK+f9GKpmoYqpC4tv5lSTLKWiAVshs31v+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309102; c=relaxed/simple;
	bh=gF0/KqE2r1s/rHh37xnH1iq1RSWy7/8b/0idZTppFi4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p5te/wmbsDNwnl0/s1BTbzXTVSKEtT1iOc4K6vyHD4JD1Q3Ut/30sVYMRZZBAPcHA52TEnj83sdiLJmJBSVPKOjFAG8ez6+GxbKO5MRVuMMnB28PosvNdVD0lAWUcT9s5rnnUwgwenQhZn6l2xM3/d/0jkQ1nq8Ep1W9VZSslAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TgR87r/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TgR87r/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFCDC19425;
	Mon, 27 Apr 2026 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777309102;
	bh=gF0/KqE2r1s/rHh37xnH1iq1RSWy7/8b/0idZTppFi4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TgR87r/tAsqffUdshHCL+xOVugvkbtl37982ubKyKahtqP+6u80aKTyIN90MOzS1p
	 32Xr6wc0f60VvHsrLxoe49cUpvWcaPcKoT9ATaOVTPW60FVLqnIVTzyYcXafF307vF
	 VXWw3Cg5uqEYYE5fRxwUmZhnv6nyKBXyQc8EAez0=
Date: Mon, 27 Apr 2026 09:58:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests
 invocation
Message-Id: <20260427095821.b9ec5644c83ebf0ff5b9a80c@linux-foundation.org>
In-Reply-To: <6e105a9f-e335-469d-92a0-9bd0aa806706@redhat.com>
References: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
	<20260427091250.61316471db20dfb0852141c1@linux-foundation.org>
	<ae-TlsIq_YkQcCUY@kernel.org>
	<6e105a9f-e335-469d-92a0-9bd0aa806706@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Apr 2026 12:55:34 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> Andrew, do you need a v2 or can you edit the patch description for me?
> 

All done, thanks.

From: Luiz Capitulino <luizcap@redhat.com>
Subject: selftests/mm: run_vmtests.sh: fix destructive tests invocation
Date: Mon, 27 Apr 2026 12:03:51 -0400

Destructive tests should be invoked with -d command-line option, but
this won't work today since 'd' is missing in getopts command-line.  This
commit fixes it.

Link: https://lore.kernel.org/214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com
Fixes: f16ff3b692ad ("selftests/mm: run_vmtests.sh: add missing tests")
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 tools/testing/selftests/mm/run_vmtests.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/mm/run_vmtests.sh~selftests-mm-run_vmtestssh-fix-destructive-tests-invocation
+++ a/tools/testing/selftests/mm/run_vmtests.sh
@@ -103,7 +103,7 @@ RUN_ALL=false
 RUN_DESTRUCTIVE=false
 TAP_PREFIX="# "
 
-while getopts "aht:n" OPT; do
+while getopts "aht:nd" OPT; do
 	case ${OPT} in
 		"a") RUN_ALL=true ;;
 		"h") usage ;;
_

