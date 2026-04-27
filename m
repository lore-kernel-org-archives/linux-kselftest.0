Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979C348898;
	Mon, 27 Apr 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306371; cv=none; b=le4s6qILO10Dpgih4hS1AU36gYa/kr0WjSJ4v09TTd7gdKlezDcewHOStDJimpsY17wfC+O9hi/xBGvUkn3rInMYBAYdIHmvLtIlCId4aE0Vqf8ZGU7g0cOuM8Of0WZlS1msdsiU4OpOR/KjCDMMvLa9cJu5MtZe6s/9Cu6+Z1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306371; c=relaxed/simple;
	bh=qEsDFDfusdHG0mACmWHWon8MxNYBaBJkB3Crw97mjaw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Tf7+P6udsAxa4i3iSWdkk67DJLb2ppYk7iF3+rH/av+y3+t2J4dmC7DRANvJwskUFAVMnN4AoZo4zygfmmBc7l2Bw192QXTmM6XmawTcipeCpSDMJ7UZHjKvatmOsktpVqUpUzco1GQWVHky9pMXChY2u4qzB/W1PgLf5BUDmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0ap8FJvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0ap8FJvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481C3C2BCB5;
	Mon, 27 Apr 2026 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777306371;
	bh=qEsDFDfusdHG0mACmWHWon8MxNYBaBJkB3Crw97mjaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0ap8FJvkHAVJmehqs2aymcc67N4HrgEJ6QnmNug+rjwvx/lPgO7UmxzpaZHeitALE
	 +4oCGOivun09JtdK1STyj5JX9hj2Y3P3EoCVCQfBJXhVK9S3z1P+q02IXU5sors6eY
	 3zYAPrjVO3k4/VeZj+r2+aSY0tYdWBIFqFXIXjd0=
Date: Mon, 27 Apr 2026 09:12:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Linux Memory Management List <linux-mm@kvack.org>, Mike Rapoport
 <rppt@kernel.org>, "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests
 invocation
Message-Id: <20260427091250.61316471db20dfb0852141c1@linux-foundation.org>
In-Reply-To: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
References: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Apr 2026 12:03:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> Destructive tests should be invocated with -d command-line option, but
> this won't work today since 'd' is missing in getopts command-line. This
> commit fixes it.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
> Mike,
> 
> Maybe it's a good idea to add this patch to your series since the
> hugetlb-read-hwpoison selftest won't work without your fix.

Or I can scoot it into mainline as a hotfix and Mike will pick it up
via Linus, soon?

It'd be good to have a Fixes:.  It looks like a3c5cc5129ef5 or
2bc4813622459?

>   tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index d8468451b3a3..c17b133a81d2 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -103,7 +103,7 @@ RUN_ALL=false
>   RUN_DESTRUCTIVE=false
>   TAP_PREFIX="# "
>   
> -while getopts "aht:n" OPT; do
> +while getopts "aht:nd" OPT; do
>   	case ${OPT} in
>   		"a") RUN_ALL=true ;;
>   		"h") usage ;;
> -- 
> 2.53.0
