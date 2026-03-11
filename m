Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B43E0C4C;
	Wed, 11 Mar 2026 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249300; cv=none; b=eCugzpvm2l2JLLdEpU3Z+G+bIT7v8p8FuGmVjDiYKMNgFBfdg9kiVtoZya7OAxkjo9zKfhF3dprf1ayU3meBAnAYRWpbOU+zOxLamQYnuEDXbJwgp6t9hn4S3P4onXDZBkQuF82NtrnviT1WqcPCj4jX64sR4teGqtd8pWUgIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249300; c=relaxed/simple;
	bh=yoRZO61FYITNlEYi1rmYjn/e5Esq8zl2cbKF9CxZzaA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YNS7EyHirQmbbPIVYAmBABLN5/tB921eyMJyg8aTa/n9yML3V4ik/CIuO57u7TTMff768phnw1icPALrBelpbbhdHM3JEZqcJTMliMf9uSJjWMID8PTEjhvv7XNR4WElm1UbtO2GFU+hr1av5Oq1vzFXCkA3MqsSrC78MR1buiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iZ2l1fMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iZ2l1fMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A9CC4CEF7;
	Wed, 11 Mar 2026 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773249300;
	bh=yoRZO61FYITNlEYi1rmYjn/e5Esq8zl2cbKF9CxZzaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iZ2l1fMlCwqeuncltoGQxLM8zeEP5xQ9ZIO5MmUwnucMxgHRGb2O1WBpG3o6+pTqs
	 mWQBtpHZ3wcg33XIloQA5Pg+dnmujKmP6KwEtNB2HdhT8BO+PnYpLZHlYA3xyI/QD4
	 /h6M9IOKWSdRB3ofk32bpwfyO1EL3Z1G/QNSQ8X0=
Date: Wed, 11 Mar 2026 10:14:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, jannh@google.com,
 pfalcato@suse.de, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 1/2] mm: prevent droppable mappings from being locked
Message-Id: <20260311101459.4484214454999fbcffb361ad@linux-foundation.org>
In-Reply-To: <269b1a31-20d1-4451-b4ba-f55a67f27d96@lucifer.local>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
	<269b1a31-20d1-4451-b4ba-f55a67f27d96@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Mar 2026 10:36:26 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> On Tue, Mar 10, 2026 at 08:58:20AM -0700, Anthony Yznaga wrote:
> > Droppable mappings must not be lockable. There is a check for VMAs with
> > VM_DROPPABLE set in mlock_fixup() along with checks for other types of
> > unlockable VMAs which ensures this when calling mlock()/mlock2().
> >
> > For mlockall(MCL_FUTURE), the check for unlockable VMAs is different.
> > In apply_mlockall_flags(), if the flags parameter has MCL_FUTURE set, the
> > current task's mm's default VMA flag field mm->def_flags has VM_LOCKED
> > applied to it. VM_LOCKONFAULT is also applied if MCL_ONFAULT is also set.
> > When these flags are set as default in this manner they are cleared in
> > __mmap_complete() for new mappings that do not support mlock. A check for
> > VM_DROPPABLE in __mmap_complete() is missing resulting in droppable
> > mappings created with VM_LOCKED set. To fix this and reduce that chance of
> > similar bugs in the future, introduce and use vma_supports_mlock().
> >
> > Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> 
> We should definitely cc: stable I think.

You know what I'm going to ask ;)

Why backport this?  What effect does/might the bug have upon our users?
