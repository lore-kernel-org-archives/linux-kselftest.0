Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295B2236FA;
	Mon, 18 May 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779146234; cv=none; b=clxJSh2pSa5fuQoLBfNAd+ClqSH7y0if6IKg0CXFFs5Qzh1ckx3QTkfKRpWoPyKmF67yv9aa+Y+FNfobkbKVGlLVn/xArWgqFCpwwXK+smjL/FyVsKSa/JFINvtBZ3b0c+zbw6R4SevVCcx4DWx/PwUuZJ52UzBB2DcbWxEvJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779146234; c=relaxed/simple;
	bh=LfjxQXsQ3tcPz6MkAwaKoNJ0VzmTQVXgyQEeFsvcg8M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dfEumMqXzja9Z7ak5u1okygeubBMeCDSHXq0G02dBP8l4Pv5xOaphavSSbYw3UaoPVUK6kQ6KUenW7nM1VsOs+gUfjVuHLzVqcz+oVknVwVseXYZfK7PtZ8oBDCpaiZqdGE7Vyy+XL0AOru2vDv3zLXMwJgKrrV6Ts10oiLen2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kLHw4xjo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kLHw4xjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D98C2BCB7;
	Mon, 18 May 2026 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779146233;
	bh=LfjxQXsQ3tcPz6MkAwaKoNJ0VzmTQVXgyQEeFsvcg8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kLHw4xjoWRm/Do7/qKgwnmTiG3OfAulM00ODyxOJQxkZM7OejP8q0McchBsBAutTN
	 abE2X6JkcLGFCmTkd41kPm+CKoToqO1vk+ohbdQDOZgUQlb7WvWr+LN6weNM7uE3p9
	 G4mFB9rnSgOlg3hwJ1MJDsYhpNq4xArVIi1RsX34=
Date: Mon, 18 May 2026 16:17:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alban Crequy <alban.crequy@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Alban
 Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, Willy
 Tarreau <w@1wt.eu>, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 Usama Arif <usama.arif@linux.dev>, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH v4 0/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
Message-Id: <20260518161712.ab28a5cf65764b3538ac9609@linux-foundation.org>
In-Reply-To: <20260515143335.739511-1-alban.crequy@gmail.com>
References: <20260515143335.739511-1-alban.crequy@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 16:33:33 +0200 Alban Crequy <alban.crequy@gmail.com> wrote:

> This adds two flags to process_vm_readv/writev:
> 
> - PROCESS_VM_PIDFD: refer to the remote process via PID file descriptor
>   instead of PID.
> - PROCESS_VM_NOWAIT: do not block on IO if the memory access causes a
>   page fault.

Thanks, I'll await further reviewer input before doing anything with
this.

> v3: https://lore.kernel.org/lkml/20260428122826.339550-1-alban.crequy@gmail.com/
> v2: https://lore.kernel.org/lkml/20260408145436.843538-1-alban.crequy@gmail.com/
> v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/
> Sashiko review of v3: https://sashiko.dev/#/patchset/20260428122826.339550-1-alban.crequy@gmail.com
> Sashiko review of v2: https://sashiko.dev/#/patchset/20260408145436.843538-1-alban.crequy@gmail.com

Sashiko found a bunch of new things to say:
	https://sashiko.dev/#/patchset/20260428122826.339550-1-alban.crequy@gmail.com
