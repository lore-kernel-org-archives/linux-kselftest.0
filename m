Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ED8211A28;
	Tue, 31 Mar 2026 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984144; cv=none; b=d6JbBp6rl/HUie+xCaZCwHcFocRu0iVQCAua9GpJAS4nj2Lc35nsWfmksci8FXBB1ykuzzxsMlNx9lAmdLG6XypypdUwUVtn6BQye6Ft5sfBsAftYPf7EJP8VCVXFfGRJoKc19qpaH6Av///pZYABlULwRONiRDs+5VVuawszSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984144; c=relaxed/simple;
	bh=aT8JOgjONmZzx/QF2zU+F5/Wk2NTNA6XO+QVlZpW9tU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=i6TE8d3XqEczXNZjDuLF3/cWNpTfLZdzcclMqxDwV/8WAI2PXB5yZENh4m16Udfr95PUWbkwzTmXfwH4UU8CMs4EcenFC2ancjwf78h9Eg8wybVyVQN0oiEKFmyGbbuuQcttLrudmSQJBuRcrhqUtABNhB5Bc/EnlMNmwjO0ylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=oTf3JL2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="oTf3JL2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F22C19423;
	Tue, 31 Mar 2026 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774984143;
	bh=aT8JOgjONmZzx/QF2zU+F5/Wk2NTNA6XO+QVlZpW9tU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oTf3JL2gOmrpgvBrkSy9Ej7UnUGGFlem6O+TaHXIwUEjpLU+SnTU2k4MMdPF6Kynk
	 ohedPz218fy+rP/fkvO2pbG8TU+keO0V0x/xEQQp4OAIOp9uIhCP/ACFCMm9VcLi4x
	 EHGARYmtUET/In5hbe9QP157321/mx680mor8jtk=
Date: Tue, 31 Mar 2026 12:09:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-Id: <20260331120902.4612d93efb89f71a0d79bb5b@linux-foundation.org>
In-Reply-To: <acuijiUs81Z7qYSL@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
	<20260330151503.670415-5-chuhu@redhat.com>
	<acuijiUs81Z7qYSL@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 18:31:42 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> > -	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
> > +	va_list args;
> > +	char *buf = NULL;
> > +	int saved_errno = errno;
> > +
> > +	va_start(args, msg);
> > +	if (vasprintf(&buf, msg, args) == -1) {
> 
> kernel test robot reported compile error on this, as the vasprintf
> required _GNU_SOURCE. Looks like it's not appropriate to be used
> in the common header. Looks like it can be replaced with a buf and
> vsnprintf instead.

I like vasprintf()!

"#define _GNU_SOURCE" occurs 402 times in selftests/, so perhaps we can
find a way to keep it?

(err, *why* 402 times?  Can't it be just once?)
