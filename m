Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8337417D97;
	Fri, 11 Sep 2026 23:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170978; cv=none; b=MN8Yh68nHJfnpfmY8Gv5tR9F4ExCeaRpE5Zlj7mWuuuXSfK7G2dJL3datn2Rf0A2UDzjvMVndDxQnMusGwOLYhiUWKpMj1VkwJKjSgThCId2Zn9cWniJRC7JSb0KDTQIBDYEM+9v7vzUcJL2UAaWVF5TMIfCikuDNHiOYZ7uAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170978; c=relaxed/simple;
	bh=y8Ee7hKOcTm9Xrce+1JOFBj3QGB/rXkpZB2rdy/1Y8I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SIkEM0ys3OEi6TZ1Ivr/oU7846Y0YlnSNORvq5DMDaHiF8n1wpFcnk+W+reGZ6h4KZ6FJzQ1tVaLTQFIsnaWy8Iy7QkV0ThTMYmYViAw9hoEphdWffN5+bglcwwe1nmOR12rHR1s6Pmto+bqap+H7SAYvnBZlT1do9c+FBDFpL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V7TZybOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V7TZybOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3921F000FF;
	Fri, 11 Sep 2026 23:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789170970;
	bh=wDlrTa5ZZtH4lzzh9UJQLR5eKEupJVTNDkxtOBjcy1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V7TZybOtasBQe1DbZtheFvd5k8G7KLLoawtyEHnlJQBXytmjwN23iPwfu5E8F69yN
	 P5/rkhES4PfwwF5SIoY51aiiekLzMC+JER2JxuYki01VUaRJAIcoLqNss1IeAQM9SV
	 Fustsba/D+c5OOzP3VtwHvyVMS6IJoUq9Ohicf2Y=
Date: Fri, 11 Sep 2026 16:56:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>, shuah@kernel.org,
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is
 unavailable
Message-Id: <20260911165610.e1b1d957e6c73a200b64e546@linux-foundation.org>
In-Reply-To: <aqP7gW98GIiYgL1z@gremlin>
References: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com>
	<aqP7gW98GIiYgL1z@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 14:01:55 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > Assisted-by: claude.ai:claude-opus-5
> 
> Convention is now:
> 
> Assisted-by: LLM
> 
> See https://docs.kernel.org/process/coding-assistants.html

Yeah.  That's so lame.  I like seeing what people are using - it's
interesting.

Also tautological.  What else will we ever place after
"Assisted-by: "?  Dr Watson?

