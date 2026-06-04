Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908D47CC62;
	Thu,  4 Jun 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577394; cv=none; b=MwoZjhIfpk0v/Mc1LP3j1mFTOe5QCTdRhtWvtrm4Yk+KIxbQcSaGOV9EAlov+e2Z2M00LcYy0Vno478k6K9Qe8hQWCjEIWJzBT6EqZTECeqOXLkQOYcCp+39u9wvNE/v+F2VEiV3r2GYcaXWNPnN0YLJgX13bjwU5TWLK2qnD5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577394; c=relaxed/simple;
	bh=oHSYB+oD4hXjFnZRLLSBQY0UEHAn287ySYBd4bpRJmc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YfolumlL9G4OCQFIsjDY9rzhSqeJkiY3DMLA8RR7kUXMyZq4rNctFMSJUiitSYwYdn6tm92TXut2fc9P9Ax6bQe/LjgbaaHMf6ifVdVvI+PedUQZramBVycklmGqE60qyjt+nyA8TpWie1AcoRM20dkMzHs4506qreR60+TxzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsuML8MA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsuML8MA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EEE1F00893;
	Thu,  4 Jun 2026 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577391;
	bh=CPt7WmdqXc8TmefIma0e17PhXj7+J8IItu6xxPYhLBY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IsuML8MADwjAXf0QeYiq6ebS0Vo8GAiunm2wQqhXcztfHwRGwIoOMfeeJ5yONUzG1
	 TYo6cP+vGu0uzrAzwTMy3IZ9ZJL138OcLbLJhehdvOmn9UKekHZrydojGZJi9kNps1
	 RHjGLzvdJtOggWmZi2OC3DD/oh9LcEdfvHgamjbrJvF8YXzZ2OA/0BKRXZfKYNcus6
	 shiKG1hjjRaVwXvDu7Yo2yDpe1TFwod5QqOMMBOOOUQGi97yN7bNqpdgzk0qLq/Tmn
	 41MUFBnQV/ZQy1HAdYNOHkyKFtm2mSWxmgJOVliqLtTs13IiM07nENRiT4Jz8/cHuc
	 i84ZWA5e4BJAw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 1/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
From: Christian Brauner <brauner@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alban Crequy <alban.crequy@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christian Brauner <brauner@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Alban Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, 
 Willy Tarreau <w@1wt.eu>, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
 Usama Arif <usama.arif@linux.dev>, 
 David Laight <david.laight.linux@gmail.com>
In-Reply-To: <8e738cc8-dce8-4043-9b93-2bb867c43028@kernel.org>
References: <20260602100917.3641359-1-alban.crequy@gmail.com>
 <20260602100917.3641359-2-alban.crequy@gmail.com>
 <20260603082707.3831525-1-alban.crequy@gmail.com>
 <8e738cc8-dce8-4043-9b93-2bb867c43028@kernel.org>
Date: Thu, 04 Jun 2026 14:49:44 +0200
Message-Id: <20260604-ornament-sparen-biegung-e9930ee7444e@brauner>
X-Mailer: b4 0.16-dev-f5839
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=brauner@kernel.org;
 h=from:subject:message-id; bh=oHSYB+oD4hXjFnZRLLSBQY0UEHAn287ySYBd4bpRJmc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQplmQVWnNyhukcytGNM/Dl96g8EptptzBYcfWfd8vO1
 l7cm+7WUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJH4w4wM376ze4nnHuX5wb66
 sX359Q25W1njX5752hOrc8L/hV9gDyPD969fQlMdOwLZPl4QjtjncqHH++2r/vtW/39XHVsvcvg
 yNwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-06-03 15:54 +0200, David Hildenbrand (Arm) wrote:
> > However, the exited-leader case is a real limitation for profilers.
> > OpenTelemetry eBPF Profiler wants to profile a process where the main thread
> > has exited but secondary threads are still running [2].
> > [2] https://github.com/open-telemetry/opentelemetry-ebpf-profiler/pull/376
> > 
> > Using plain TIDs (flags=0) would work, but it means users cannot use
> > PROCESS_VM_PIDFD in this scenario.
> > 
> > What do you think this patch should do? I see two options:
> >  - Address this limitation in a separate future patch that fixes
> >    pidfd_get_task() to use PIDTYPE_PID when PIDFD_THREAD is detected in
> >    f_flags, benefiting all callers (process_vm_readv, process_madvise,
> >    and any future users).
> 
> Extending it consistently for that scenario seems like the right thing to do?
> @Christian?

Yes, but I cannot vouch whether the mm operations deal correctively with
subthreads.

